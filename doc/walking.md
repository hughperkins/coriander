# Walking

## Meta

This document is going to be very stream-of-consciousny :-)  It is mostly to help me think through the problem, rather than to present things to other people. But, it might be useful, or you might be able to prod it into a useful form :-)  Anyway, I am keeping it with the repo for now.

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

But:
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

### Undirected graph

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

### Graph use-cases

We have the following graph use-cases (list to be populated over time):
- address space propagation: undirected graph of pools of nodes sharing an address space
- variable declaration: variables must be declared before they are used
- struct declaration: structs must be declared before they are used, and only once contained structs have been declared
- ~~function declaration: functions must be declared or defined before they are used.~~ Removed, since we can declare in any order, prior to definition
- scratch propagation: which functions need scratch space provided to them?
- vmem table propagation: which functions need vmem table propagated to them?

### Address-space propagation

For address-space propagation, we need:
- an undirected graph of 'pool's of address spaces: each pool is two or more values, that obligatorily share an address space

Note that pointer relationships can preserve address spaces, just with a level of indirection added/removed. However, we can maybe propagate this via links between two pools? And just walk over this.

Values which are not pointer types have no address space (just default 0 perhaps), and cannot propagate address spaces (?).  Thinking this through, eg:

```
global float *a; // global
float b = *a;  // no address space. not a pointer. 0 perhaps
[unk] float *c = &b;  // [unk] must be 'private', since it is a pointer to b, and b is private.
```

Thinking about this, it's not true that `b` doesnt have an address space: it is a private variable, as are all our variables, and in address space 0. Writing numerically now, for generality:

```
float<1> *a; // global, address space 1, using <> to denote address space
float<0> b = *a;
float<0> *c = &b;
```
Let's write out all address spaces, explicitly, including for scalars, and for the pointers themselves.  Eg, descriptively, 'a private pointer to global float'. Let's find a notation to depict 'private pointer to global float'. Let's write down some possibilities. These all are attempst to depict the same variable type:

```
float<1>:*<0> a;
float<1>:*<0> a;
float<1>*<0> a;
float<1:0> a;
float<1*0> a;
float<1,0> a;
```

The last syntax looks nice-ish, but we should be able to depict pointers that go through tstructs, eg:
```
struct MyStruct {
    global float *floats;
}

struct MyStruct somevar;
```
In this case, `somevar` points to different things, at different levels, though thinking this through, ultimately, it is:
- a struct, held in private memory

However, `somevar.floats` is:
- a private pointer to floats in global memory

What if we have:
```
struct MyStructL1 {
    global float *floats;
}

struct MyStructL2 {
    struct MyStructL1 l1;
}

struct MyStructL2 myStructL2;
```
So, now `mystructL2` is a struct, held in prviate memory, by value. `myStructL2.l1` is also a struct, held in private memory, by value. No change. In fact, `mystructL2.l1` is simply embedded in part of the memory held by `myStructL2`.  And so `myStructL2.l1.floats` is simply a private pointer to global float.

Ok, what if we have:

```
struct MyStructL1 {
    global float *floats;
}

struct MyStructL2 {
    struct MyStructL1 l1;
}

local myStructsL2[3];

[unk] struct MyStructL2 *pMyStruct2 = &myStructsL2[0];
```

Soo... now, `pMyStruct2` is a private pointer, which points to ... well... thinking this through:
- the declaration `local myStructsL2[3]` is an array of structs, in shared memory, address space 3
- `myStructsL2[0]` is one of these structs, by value. If we do anything with this, it is copied by value, eg if we use it in a function call:
```
myfn(myStructsL2[0]);
```
The function would not assign an address space to the parameter, its just by value:
```
void myfn(struct MyStructL2 arg1);
```

However, if we take the address, now it's a private pointer to shared memory. ie `&myStructsL2[0]` is a private pointer to shared memory, ie `pMyStruct2`, above, is of this type.

We should be able to depict this. Technically, this is probably covered by C99 syntax, something like maybe:

```
local struct MyStructL2 *pMyStruct2 = &myStructsL2[0];
```

However, personally I find this insanely hard to read, parse, understand, reason about.  I want something easier for me to read. Something that corresponds more intuitively to me to the description 'a private pointer to a local struct'.  Let's try some ways of writing this:

```
local struct MyStructL2 *pMyStruct2 = &myStructsL2[0];
struct MyStructL2<3:0> pMyStruct2 = ...;
<3:struct MyStructL2><0> pMyStruct2 = ...;
struct MyStructL2<3*0> ...;
<struct MyStructL2:3,0> ...;
```

I kind of like the last syntax.  It's not ideal, but it is at least easy for me to parse personally, without figuring out where to put the 'local' and '*'s and so on, as in c99 syntax.  Is it complete? Can it represent all scenarios? Let's try some more scenarios. The earlier float is:

```
<float:1,0> a;  // private pointer to global float
```
A scalar is:

```
<float:0> b = *a;   // a private float primitive
```

But ... what if we have values in a struct. Does it make sense to label these? eg we have the following struct:
```
struct Foo {
    float somefloat;
};
```
The physical space used to store `somefloat` depends on where `struct Foo` is stored. We cannot say a priorae what is the address space of `somefloat`, without knowing the address space of a specific instance of `struct Foo`:
```
struct Foo privateFoo[1]; // privateFoo[0].somefloat is in private memory
local struct Foo sharedFoo[1]; // sharedFoo[0].somefloat is in local memory
```

So, whilst we can write down the address space for privateFoo.somefloat and sharedFoo.somefloat, in the abvove notation, ie:
```
<float:0> v1 = privateFoo[0].somefloat;
<float:3> v2 = sharedFoo[1].somefloat;
// no: this is an implicit/explicit `load`, and even though `sharedFoo[0].somefloat` is in shared memory,
// v2 is not...
```
But we can write:
```
<float:0> v1 = <float:0> privateFoo[0].somefloat;
<float:0> v2 = <float:3> sharedFoo[1].somefloat; // correct, and the load is fairly explicit/obvious. maybe?
```

Perhaps we can use a `*` in struct delcarations? :
```
struct Foo {
    <float:*> somefloat;
};
```

And for pointers in said structs, eg:
```
struct Foo {
    <float:1,*> pointerToLocal;
};
```

So, now, this makes me think: what is actually allowed in the OpenCL 1.2 standard?  Looking at the standard 1.2, https://www.khronos.org/registry/OpenCL/specs/opencl-1.2.pdf , we have:
- all kernel parameters, and all function parameters in general, must be in private address space (6.5 p3). reasonable. kernel parameters can be private pointers into global, local or constant address space though (6.5 p4). again reasaonble.
- function return types cannot be assigned an address space (6.5p6). Prsumably they are implicitly private (?)

Importantly, section 6.9o "Elements of a struct or union must belong to the same address space. Declaring a struct or union whose elements are in different address spaces is illegal.".  Thats interesting. New information for me :-P However, it doesnt say antyhing about, do they have to be private. Nor does it say they cannot point into other address spaces, and potentially into different address spaces.

So, at this point, I started drafting an email/post, to put in some Khronos-type forum, to ask about this. But then it occurred to me that, it's basically exaclty as above, and entirely general:

- everything in a struct will all itself be in the same address space, corresponding to wherever the struct is stored, which can be in any of the address spaces, without needing a new struct declaration for each address space
- however, any pointers in the struct will have a concrete address space (I assume?)
- therefore I think the `*` syntax is not entirely unacceptable.  or maybe `s` (for struct).  As `s` it would look like:

```
struct Foo {
    <float:1,s> pointerToLocal;
};
```

I prefer `*` though, since it makes it clear we need to populate it. or posisbly `.` or `?` . How would `.` or `?` look? 

```
struct Foo {
    <float:1,.> pointerToLocal;
}
```

```
struct Foo {
    <float:1,?> pointerToLocal;
}
```

I quite like the `.` notation.  `*` makes it sound like it can be any address space, which is not true: must match the struct emplacement address space. `?` makes it sound like we dont know, which is not strictly true either: it's defined by the struct's physical emplacement, as an instance.

So, I'm going to use `.`, provisionally ,for now.

So, here is the syntax, some examples:

```
<float:0>  someScalarFloat;
<float:3,0> privatePointerToGlobalFloat;
<float:3,1,0> privatePointerToLocalPointerToGlobalFloat;

struct Foo {
    <float:.> someFloat;
    <float:3,.> pointerToGlobalFloat;
    <float:3,1,.> pointerToLocalPointerToGlobalFloat
}
```

Nuance: we can modify the notation very slightly, so it is compilable in C99, or at least, ignored, by C99. By using the notation `__space__(3:1:0)`, we can create a macro, so the compiler ignores it:

```
#include <stdio.h>

#define __space__(a)

struct MyStruct {
    __space__(3:.) float *pFloat;
};

int main(int argc, char *argv[]) {
    __space__(0) float a;
    __space__(3;0) float *pa;
    __space__(3:0) float *pb;
    __space__(3:0:0) float **ppb;
    __space__(3:0:0) float **ppc;
    __space__(0) struct MyStruct myStruct;
    __space__(3:0) float *pFloat = myStruct.pFloat;
    return 0;
}
```

### Possible walks/connections

We might be interested in the following types of connections, between Values etc:

- which values share an address space (undirected address space mapping, to)

### Links which change space depth?

Let us first define space depth:

__Definition__:

Given a space `__space(s1,s2,...,sn)`, where `s1`, `s2`, .... `sn` are integers indicating address spaces, the "space depth" is the value of "n".

Let us also define "pointer depth", for clarity

__Definition__:

```
pointer_depth = space_depth - 1
```

__Links which change space depth__

Consider an alloca followed by a load:
```
%0 = alloca float*
%1 = load float*, float ** %0
```

Type of `%0` is: `float **`. The type of `%1` is: `float *`.   However, there is an address space relationship between these two values.  If the address space of `%0` is:

```
__spaceof__(%0) == __space__(s1,s2,...sn)
```
Then, we know that the address space of `%1` is:

```
__spaceof__(%1) == __space__(s2,...sn)
```

We could simply leave the alloca etc in the graph, but I think it will be cleaner and easier to separate out such links as a generic link. So, we can create links like:

```
__spaceof__(%1) == __reducedepth__(__spaceof__(%0), 1)
```

We can express this relationship with `PartialDepth` nodes:

```
class PartialDepthLink {
public:
    SpaceNode *deeper; // %0;
    SpaceNode *shallower; // %1;
    int depthChange = 1
}
```

Or ... maybe we can imagine that `PartialDepthLink` inherits from `SpaceNode`, and we can change it to `IncreaseDepth`:

```
class IncreaseDepth : public SpaceNode {
    int depthIncrease;
    int addedSpaces[MAX_DEPTH];
};
```

Well, something like:
<img src="img/spacelinks.png?raw=true" />

(or maybe we can drop the `truncate=1` attribute, since the information is readily available by comparing the pools on either side, and avoids redundancy)

Should the non-pool nodes be simply `Value`s, or should they be leaf nodes? Presumably, we want to be able to traverse from a leaf node to the pool node? So, using our own leaf nodes, that hold the leaf values, mgiht make this easier?  But one option coudl be to create a global map from values to pools, and if we merge two pools, we can just update this map.

And maybe we can make the pools be the nodes on either side of the depth cahnge?

Observation: when decreasing depth, the mapping is onto, surjective: there is only one possible resulting address space, given the original, untruncated, address space, and the number of spaces to truncate. However, when increasing depth, there are multiple possible resulting address spaces, corresponding to each possibility for the new, additional, spaces.

Therefore there can be multiple deeper pools connected to one shallower pool, even if the deeper pools all have the same space depth.

So:
- we can have one attribute on the deeper node, pointing to the shallower node
- and a set on the shallower node, pointing to the deeper nodes

<img src="img/pools_no_separate_links.png?raw=true" />

Actually, a deeper node can be connected to multiple shallower nodes, as long as they each have a different depth. otherwise they could be merged.  However, if a deeper does point to two 