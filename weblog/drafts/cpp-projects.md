---
title: Big Projects in C++
---

# Large projects in C++ (Draft)

## In short
  
I believe there is a very high variance in terms of code quality from one C++ code base to another.
It's hard to know what to expect when joining a team that's writing C++ because it can fall anywhere
from `C with classes` to policy-based generic code that takes 45 minutes to build.
The language, tooling, and community have improved a lot since C++11, however I believe that C++ is not
a good tool for large projects in that it doesn't help users avoid mistakes and manage complexity.

## I like

### Performance
  
I feel like we get 80% of the performance for 20% of the effort.
We can just write simple code using the STL, and modern compilers will find amazing ways to opimize it
to a level of performance far superior to what we'd get from the equivalent python/ruby/etc.
It's easy enough to measure and control memory allocations,
or use a different allocator -
either at the container level with the STL's allocator API,
or replacing the libc malloc with something like jemalloc.
[add an asciinema of valgrind]
[add a code sample of a C++17-style STL allocator that logs allocations]
  

### Libraries
  
The STL has a good selection of containers, algorithms, and type traits.


There are old, stable, and documented libraries like
- Boost
- QuickFIX
- googletest


There are new, good quality libraries for a number of common tasks, like
- JSON
- fmt
- spdlog
- Catch2
- pyBind11

[add a boost::asio echo server example, with logging and python binding]

### Tools
  
Compilers have improved warnings a lot, and sanitizers are very good at catching a number of bugs early on.
A simple CI setup can now help produce programs of a much higher quality than just a few years ago.
  
  
```cpp      
#include 
#include 
#include 

void print(int f) {
    printf("%i", f);
}

int main() {
    print(.2f);
}
```

Compiler output:

```
file.cpp: In function 'int main()':
file.cpp:12:11: warning: conversion from 'float' to 'int' changes value from '2.00000003e-1f' to '0' [-Wfloat-conversion]
     print(.2f);
           ^~~
``` 

[add an example of a sanitizer finding an error]

### Best practices

[add something about the GSL]
[books by Meyers, Alexandrescu, Sutter...]

## I don't like

### Old habits die hard

Things I've heard from senior managers and tech leads:

- New compilers have bugs
- Modern C++ is juste more complex for no benefit
- Clang is slow and doesn't optimize well
- GCC generates the best output with `-march=nocona`

There are still large C++ projects stuck on whatever comes with RHEL 5 or 6 (gcc 4.4.X).
Anything below 4.8 is painful to use since it won't even implement most of C++11.
It would be nice to have a clear governance when it comes to language/implementation versions.

### Cargo cults

- Build with `-O2`, `-O3` will introduce bugs.
- `-Wall` turns on all warnings.


### Unsafe defaults

- Implicit type conversions
- Mutable by default
- Need to expliitely activate warnings
- Unsafe strcpy/memcpy/etc.

### Distribution

- It's not easy to distribute a C++ library, in particular across platforms.

### Build tools

### Debugging

Debugging C++ can mean stepping through a large amount of boilerplate generic code and/or macros, espcially when using libraries like the STL and Boost.

The famous John Carmack's tweet summarizes this:

> Modern C++ constructs like `for (auto& x : xs)` look pretty, but they destroy the ability to single step in debug mode without template hell

[@ID_AA_Carmack](https://twitter.com/ID_AA_Carmack/status/715293178249629696?ref_src=twsrc%5Etfw)
  

[Add an asciinema of stepping through a range-based for loop]


## Stealthy complexity

There are many things that look simple but have hidden complexity or traps.

For example, see this presentation on type deduction by Scott Meyers.

[cppreference.com/implicit_conversion](https://en.cppreference.com/w/cpp/language/implicit_conversion)

Let's not even start talking about templates.

## Concurrency/parallelism
