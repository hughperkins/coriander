# Notation

## Structs

Each struct can be declared in three different places/use-cases:
- hostside
- marshalling
- deviceside

A 'hostside' struct, is the original struct, as sent by hostside code, into the Coriander runtime.

A 'marshalling' struct is a struct type/declaration, used for sending a struct into a kernel, and eg has all pointers
removed, or transformed somehow.

A 'deviceside' struct is the struct, used inside the gpu kernel, plausibly after transformation from a passed-in 'marshalling' struct.
For example, pointers might probably be present in a 'deviceside' struct, passed in separately from the marshalling struct, and spliced in
by boilerplate code, at the start of the gpu kernel.
