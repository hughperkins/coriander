# GEP

GetElementPtr

Sounds simple, but lots of edge-cases

This doc is mostly to help me to think through, and document, the edge cases.

Excellent introduction to GEP: http://llvm.org/docs/GetElementPtr.html

The following is mostly stream-of-consciousness brain-dumping of edge-cases for now.  I'm going to gradually add to it over time.

Firstly, quick introduction to how we are dumping:

- first we will often take the address of the incoming value:
```
&vin
```
- then we will walk down the struct/array indices, like:
```
(&vin)[0].f0.f3[2].f1
```
- finally we take the address of this:
```
&((&vin)[0].f0.f3[2].f1)
```

There are two conflicting issues:
- edge-cases, if we try to take short-cuts, by ditching parantheses, or `[0]` or `&`
- edge-cases, where the `&` takes us into undefined territory, or means we need to know which address space we are in, which is often tricky

## Trying to ditch `&( ...[0])`

It's tempting to look at expressions like:
```
(&v1)[0]
```
... and think we can ditch the `&` and the `[0]`. However, a potential edge-case is:
```
(&v1)[3]
```
or:
```
(&v1)[v2]
```
Having said that, if we are certain the index is 0, this might be possible. Maybe. Unless we find a new edge-case
