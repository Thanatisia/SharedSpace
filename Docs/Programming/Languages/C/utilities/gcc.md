# C Compiler Manual: gcc

## Introduction
```
The GNU C Compiler for GNU/Linux systems, within MinGW(-w64) for Windows systems
```

## Documentations
### Synopsis/Syntax
- Compile to object files
    ```console
    gcc -c [source-files ...] -o [object-file-name] {other-options}
    ```

- Compile object file to binary
    ```console
    gcc [object-files ...] -o [output-binary-executable] {other-options}
    ```

- Compile source files and output binary directly
    ```console
    gcc [source-files ...] -o [output-binary-executable] {other-options}
    ```

### Parameters
- With Arguments
    - source-codes : Specify all source files that you wish to compile together into an executable binary
        - Notes
            + Compilable file types includes: [.c (C source file), .o (Object Files)]
            + You can include as many source files as you require as this a variable-length input
- Optionals
    - With Arguments
        + -D[definitions]  : Explicitly specify definitions defined in the source files (using `#define [definitions]`)
        - -f[]             : Explicitly specify
            - f
                + no-strict-aliasing
                + PIC
        + -I[library-path] : Explicitly specify libraries to include with the compilation
        + -L[linker]       : Explicitly specify linker objects (.o, .lib, .dll, link etc etc) to compile with
        - -O[level]        : Explicitly specify the priority levels (1-4)
        + -o [output-file-name] : Explicitly specify the output file name
        - -std=[version]   : Explicitly specify the C-lang version standards to follow
            - Versions
                + c99 : C version 99
        - -W[with-options] : Specify options to compile the source codes with; Consists of either compile-time optimization options, or instruction additions
            - Options
                + all : Compile the source codes with all debug messages
                + no-missing-braces : Enforce checks on missing braces
                - error=[error-types] : Explicitly specify error types to look out for
                    - Error types
                        + implicit-function-declaration
                        + pointer-arith
    - Flags
        + -c : Compile as object (.o) files for reusage and distribution

### Usage
- Compile source files with includes only to object file
    ```console
    gcc -c [source-files ...] -o [object-file-name] -I [SDK_INCLUDE_PATH] {other-options}
    ```

- Compile object files into binary file with linker libraries
    ```console
    gcc [object-files ...] -o [output-binary-executable] -L [SDK_LINKER_LIB] {other-options}
    ```

- Compile source files into binary executable directly with includes and linkers
    ```console
    gcc [source-files ...] -o [output-binary-executable] -I [SDL_INCLUDE_PATH] -L [SDK_LINKER_LIB] {other-options}
    ```

- Compile source files with additional options
    ```console
    gcc [source-files ...] -o [output-binary-executable] -I [SDL_INCLUDE_PATH] -L [SDK_LINKER_LIB] -Wall {other-options}
    ```

## Wiki

## Resources

## References

## Remarks
