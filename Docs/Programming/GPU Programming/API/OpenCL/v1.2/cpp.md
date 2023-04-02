# OpenCL C++ Documentation and Write-up

## Package Information

## Setup
### Pre-Requisites

### Dependencies
- OpenCL v1.2
    + opencl-headers : For OpenCL C++ header files

### Compilation/Build/Make
- Compile C code
    - Notes
        + -l is a small 'L'
    ```console
    gcc main.c -o main.out -lOpenCL
    ```

- Compile C++ code
    - Notes
        + -l is a small 'L'
    ```console
    g++ --std=c++0x main.cpp -o main.out -lOpenCL
    ```

### Installation

### Importing
- OpenCL for Apple
    ```cpp
    #include <OpenCL/library-name.hpp>
    ```
- Generic
    ```cpp
    #include <CL/library-name.hpp>
    ```

## Documentation
### Libraries
+ cl.hpp : General OpenCL standard library

### Classes
- cl::Platform : Work with platforms

### Attributes/Variables

### Functions
- cl::Platform::
    + get(vector) : Get all platforms in a vector

## Snippets and Examples
### Importing
```cpp
#ifdef __APPLE__
    #include <OpenCL/cl.hpp>
#else
    #include <CL/cl.hpp>
#endif
```

