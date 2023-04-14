# OpenCL API Environment Setup

## Setup
### Pre-Requisites
- Ensure is installed
    - C++ (if using C++)
        + MinGW w64 (g++, gcc)
    - OpenCL API v1.2 SDK
        - Download AMD APP SDK
        - Copy AMD APP SDK
            - Paste in C drive
+ Download GPU Caps

## Documentation
### Synopsis/Syntax
- To compile from command line
    - Using gcc (.c)
        - Generate object file
            ```console
            gcc -c -I [SDK include path] [source-file] -o [output-file]
            ```
        - Compile object file to binary
            ```console
            gcc [object-file] -o [output-binary-file] -L "[SDK-lib]\x86_64" -l OpenCL
            ```
    - Using g++ (.cpp)
        - Generate object file
            ```console
            g++ -c -I [SDK include path] [source-file] -o [output-file]
            ```
        - Compile object file to binary
            ```console
            g++ [object-file] -o [output-binary-file] -L "[SDK-lib]\x86_64" -l OpenCL
            ```

### Snippets and Examples
- To compile from command line
    - Using gcc (.c)
        - Generate object file
            ```console
            gcc -c -I "C:\\AMD APP SDK\3.0\include" main.c -o main.o
            ```
        - Compile object file to binary
            ```console
            gcc main.o -o main.exe -L "C:\\AMD APP SDK\3.0\lib\x86_64" -l OpenCL
            ```
    - Using g++ (.cpp)
        - Generate object file
            ```console
            g++ -c -I "C:\\AMD APP SDK\3.0\include" main.cpp -o main.o
            ```
        - Compile object file to binary
            ```console
            g++ main.o -o main.exe -L "C:\\AMD APP SDK\3.0\lib\x86_64" -l OpenCL
            ```

## Wiki
### Workflow
- on runtime
    1. Start compiling only the .c file
    2. Program will try to read .cl file

## Resources
+ [VS Code - cpp](https://code.visualstudio.com/docs/languages/cpp)
+ [StackOverflow - GCC: Compiling an OpenCL host on Windows](https://stackoverflow.com/questions/12437776/gcc-compiling-an-opencl-host-on-windows)

## References

## Remarks
