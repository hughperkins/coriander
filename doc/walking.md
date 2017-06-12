# Walking

## Current

Walking is in two passes:
- in the first pass, we walk the tree:
  - propagating address spaces
  - preparing per-value expressions, without writing them out yet
  - create names
- in the second pass:
  - walk through, writing out the expressions prepared earlier, and handling things like:
    - function declarations
    - writing out shims
    - writing out struct declarations
    - writing out per-function variable declarations

In the first pass, there is some restart-logic added, so if we are walking a function, that calls another function, we can walk that second fucntion, get the return type, then carry on walking the first function. Basically, we push the second function onto a set of needed functions, then stop processing the current function. At a higher level, we iterate over the list of needed functions, until they have all been processed.

There are restarts at multiple levels, eg blocks within a function.

What works:
- sufficient to build eigen, tensorflow, ...
- a bunch of hacks with respect to struct address spaces, and address spaces in general
- not easy to maintain, or understand

## Proposed

Break the walk into several passes.  Each one will handle something more specific, eg:
- figuring out which values connect to others, and in which direction
- another pass, to propagate address spaces

One challenge with this is that rewriting address spaces in llvm StructType is non-trivial.  Each type is unique, so we need to create new types, for the struct, and for all the structs that contain it. These then have to be propagated over all values, which is non-trivial.

Therefore, in the proposed version, the address-spaces will be not be stored onto the llvm Values and structs themsevles, but stored in a separate data structure, which is mutable. This means taht we can update the address space of struct members without needing to replace all the values. As I write, it occurs to me that the values will need to be updated, however we can make this task easier in a couple of ways:
- our own struct info objects can contain a pointer to all values that have that struct type, making it easy to update them
- we can leave values pointing at a generic struct info, with undefined address spaces, and then just swap it to an address-space mapped struct info later on
