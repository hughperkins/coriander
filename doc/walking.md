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

## Walks

1. Find which values link where
1. Propagate address spaces, splitting fucntions and structs where necessary
1. Generate opencl

## Connections walk

### Functions

We want to store connections between values whose address space should be linked in some way. This includes we need to know, given a funciton, what values will be used as arguments to it. Concretely which actual values, scattered throughout the program. We also need to know
which fucntions a concrete value be passed into.

However, a function can be called from many places. How to handle this?

One point to think about is, what should be connected to what?  Should we have a structure like, a value => the call instruction => the function value => the arg value?

But, the address space of a call doesnt really exist. Maybe the return type perhaps.  Or the entire function type perhaps.  So, maybe it does exist actually. But for thinking about one speific value, we cant do a simple one-line comparison between function types. Easier to connect the actual value passed int to a single arg, and that specific function arg value.

In fact, for address space mapping, we dont necessarily have or need a dag, but an undirected graph.  For example, if we have:

```
float *a;
float *b;
b = a;
```
In terms of data flow, the value of the a pointer flows into the value of the b pointer. It's a DAG. Or perhaps just a directed graph, not a DAG.  However, in terms of address space propagation, if we have:
```
[unknown] float *a;
global float *b;
b = a;
```
... then the global address space of b will propagate to the address space of a, even though the data values are flowing in the other direction.

So, in terms of address space walking, we have some kind of undirected graph, where each node has a single address space assignment, shared by all the other nodes.  So, thinking this through, if we have:

```
float *a;
float *b;
float *c;
b = a;
c = b;
```
In fact, for address space purposes, these all have obligatorily the same address space.

The same for:

```
float *a;
float *b;
float *c;
b = a;
b = somefunc();
c = b;
c = somefun();
```
Even though the value of b is overwritten before it is assigned to c, since C++ types are static, cannot change during assignment, then we know that the address space of c must equal that of a.

Therefore, to reduce confusion, for the connections walking, what we will walk is: address space connections, and we will make this explicit. To avoid any ambiguity of what is 'flowing throuhg' the connections.
