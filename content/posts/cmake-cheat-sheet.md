---
title: Notes on CMake
date: 2020-03-31
---

How to setup a project using modern CMake features - build, manage dependencies, run tests.

<!--more-->

## Useful Resources

- [Professional CMake](https://crascit.com/professional-cmake/) Book
- CMake [official documentation](https://cmake.org/cmake/help/latest/)
- CTest [Wiki](https://gitlab.kitware.com/cmake/community/-/wikis/doc/ctest/Testing-With-CTest)

## Getting Started

The simplest `CMakeLists.txt` contains:

```bash
cmake_minimum_required(VERSION 3.2)

# `VERSION` and `LANGUAGES` are optional
project(myProject VERSION 0.0.1 LANGUAGES CXX)
add_executable(example main.cpp)
```

We can generate build files for the current platform, then build an executable:

```sh
mkdir build && cd build  # Out-of-source build
cmake ..                 # Generate build files
cmake --build .          # Run build
./Debug/example.exe      # Run the resulting binary
```

## Installing Dependencies That Use Other Build Systems

This will create build steps at configure time, and download/extract/build/etc. at build time. We then need to declare the dependencies in the right order. This incomplete example shows the gist of it:

```bash
include(ExternalProject)

ExternalProject_Add(boost
    PREFIX boost
    URL https://dl.bintray.com/boostorg/release/1.72.0/source/boost_1_72_0.zip
    URL_HASH SHA256=8c20440aaba21dd963c0f7149517445f50c62ce4eb689df2b5544cc89e6e621e
    CONFIGURE_COMMAND ${_BOOTSTRAP_COMMAND}
    BUILD_COMMAND ${_B2_COMMAND}
    BUILD_IN_SOURCE 1
    INSTALL_COMMAND ""
)
```

Resources:

- [Installing Boost](https://github.com/apache/geode-native/blob/develop/dependencies/boost/CMakeLists.txt)

## Installing Dependencies That Use CMake

We can use `CMake` to download and install dependencies.

The following setup will clone GitHub repos, and install the libraries using their CMake files during the build step:

```bash
cmake_minimum_required(VERSION 3.8)

include(FetchContent)

FetchContent_Declare(googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG release-1.10.0
)

FetchContent_Declare(fmt
  GIT_REPOSITORY https://github.com/fmtlib/fmt.git
  GIT_TAG 6.1.2
)

FetchContent_Declare(benchmark
  GIT_REPOSITORY https://github.com/google/benchmark
)

# Fix for googletest, otherwise we get LNK2038 errors on Windows
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)

# Clone repos and install libraries
FetchContent_MakeAvailable(googletest fmt benchmark)
```

Resources:

- [Installing github.com/nlohmann/json](https://cmake.org/pipermail/cmake/2019-March/069206.html) <1>
- [Installing github.com/nlohmann/json](https://github.com/nlohmann/json/issues/1634) <2>

## Running Tests

In the root `CMakeLists.txt`:

```bash
enable_testing()
include(GoogleTest)

# This directory contains its own CMakeLists.txt
add_subdirectory(test_directory)
```

Using the following example test:

```cpp
#include "gtest/gtest.h"

TEST(Example, TestNothing) {
    EXPECT_EQ(1, 1);
}
```

We have a `CMakeLists.txt` in `test_directory` to builds the test(s):

```bash
add_executable(myTests test.cpp)
target_link_libraries(myTests gtest_main)
gtest_discover_tests(myTests)
```

Build, then run using `CTest`:

```sh
cmake ..         # Generate build files
cmake --build .  # Build test executable
ctest            # Run tests
```

With the following example output:

```sh
PS C:\Users\damien\project\build> ctest
Test project C:\Users\damien\project\build
    Start 1: Example.TestNothing
1/1 Test #1: Example.TestNothing .......   Passed    0.01 sec

100% tests passed, 0 tests failed out of 1

Total Test time (real) =   0.03 sec
```

**! Caveat:** After installing dependencies using `FetchContent_Declare`, `CTest` also picks up their tests.

I have found 2 workarounds so far:

- filter tests using `ctest -R <MyTests>` (run only tests with names containing `<MyTests>`)
- when possible, set options to not build tests before the call to `FetchContent_MakeAvailable`, for example `set(BENCHMARK_ENABLE_TESTING OFF)`

## Build type

- Release
- Debug
- RelWithDebInfo
- MinSizeRel

On some platforms, we can set the build type from the configuration generation phase:

```sh
cmake -G Ninja -DCMAKE_BUILD_TYPE:STRING=Release ../source
cmake --build .
```

On other platforms eg. Windows, it has to be done at the build phase:

```sh
cmake ../source
cmake --build . --config Release
```

## Project Structure

I like to use what seems to be called a "Superbuild" in CMake parlance:

> Where dependencies do not use CMake as their build system, a superbuild tends to be the preferred structure. This treats each dependency as its own separate build, with the main project directing the overall sequence and the way details are passed from one dependency’s build to another. Each separate build is added to the main build using `ExternalProject`. Such an arrangement allows CMake to look at what each build produces and automatically detect information that can then be passed on to other dependencies, thereby avoiding having to manually hard code that information in the main build.

*- Professional CMake 5th Edition*

When necessary we can use `ExternalProject`, and when we can there is the simpler `FetchContent` to install dependencies. Most projects already provide knobs to tweak builds, tests, and make it convenient to integrate their projects into ours.

```
+------------------+-----------------+
| ExternalProjects |                 |
+------------------+                 |
|                                    +------+
|     Boost                          |      |
|                                    |      |
+------------------------------------+      |
                                            |
                                            |
+--------------+---------------------+      |
| FetchContent |                     |      |
+--------------+      fmt            |      |
|                                    <------+
|    googletest                      |
|               google/benchmark     |
|       re2                          +------+
|            nlohmann/json           |      |
|                                    |      |
+------------------------------------+      |
                                            |
                                            |
+---------------+--------------------+      |
| Local Project |                    |      |
+---------------+                    |      |
|                                    <------+
|     main.cpp     main.hpp          |
|                                    |
+------------------------------------+
```

## Custom Targets

As part of our workflow, we may need to call external commands or binaries. For example, if we build a benchmark suite:


```bash
add_executable(order_book_bench bench.cpp)

target_link_libraries(order_book_bench PRIVATE benchmark::benchmark order_book)

add_custom_target(runbench COMMAND order_book_bench)
```

We can then call the target as follows:

```sh
cd build && cmake --build . --target runbench
```