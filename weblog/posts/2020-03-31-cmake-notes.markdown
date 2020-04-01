---
title: Notes on CMake
withtoc: true
---

## Useful Resources

- [Professional CMake](https://crascit.com/professional-cmake/) Book
- CMake [official documentation](https://cmake.org/cmake/help/latest/)
- CTest [Wiki](https://gitlab.kitware.com/cmake/community/-/wikis/doc/ctest/Testing-With-CTest)

## Getting Started

The simplest `CMakeLists.txt` contains:

```cmake
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

## Fetching and Installing Dependencies

We can use `CMake` to download and install dependencies.

The following setup will clone GitHub repos, and install the libraries using their CMake files during the build step:

```cmake
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

## Running Tests

In the root `CMakeLists.txt`:

```cmake
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

```cmake
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

**! Caveat:** After installing dependencies using `FetchContent_Declare`, `CTest` also picks up their tests, and I end up having to filter what I want using `ctest -R <MyTests>` (run only tests that contain `<MyTests>`).

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