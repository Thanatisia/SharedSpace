# GNU build utilities: g++

## Information

### Background
```
The GNU C++ Compiler for GNU/Linux systems, within MinGW(-w64) for Windows systems
```

## Documentations
### Synopsis/Syntax
- Compile to object files
    ```console
    g++ -c [source-files ...] -o [object-file-name] {other-options}
    ```

- Compile object file to binary
    ```console
    g++ [object-files ...] -o [output-binary-executable] {other-options}
    ```

- Compile source files and output binary directly
    ```console
    g++ [source-files ...] -o [output-binary-executable] {other-options}
    ```

### Parameters
- Positionals
- Optionals
    - With Arguments
        - -o [output-file-name] : Specifies a custom file name to output as
        - -I [includes] : Includes; Link a directory to include in the compilation
        - -L [linker] : Linker; Link a library to compile with
        - -W[option] : Compile/Build/Make with Additional Link Options (with; Append to -W)
            - Additional Link Options
                + -Wall : Give warnings about possible errors in the source code
        - -std=[c/c++ version] : Set the C/C++ version standard to compile with
            - Syntax/Structure
                - C   standards : c[version-number]
                - C++ standards : c++[version-number]
            - Versions
                - 98 : Version 1998
    - Flags
        + -c : Compile source files into object files only

### Usage
- Compile source files with includes only to object file
    ```console
    g++ -c [source-files ...] -o [object-file-name] -I [SDK_INCLUDE_PATH] {other-options}
    ```

- Compile object files into binary file with linker libraries
    ```console
    g++ [object-files ...] -o [output-binary-executable] -L [SDK_LINKER_LIB] {other-options}
    ```

- Compile source files into binary executable directly with includes and linkers
    ```console
    g++ [source-files ...] -o [output-binary-executable] -I [SDL_INCLUDE_PATH] -L [SDK_LINKER_LIB] {other-options}
    ```

- Compile source files with additional options
    ```console
    g++ [source-files ...] -o [output-binary-executable] -I [SDL_INCLUDE_PATH] -L [SDK_LINKER_LIB] -Wall {other-options}
    ```

## Wiki

### Resources

### References

## Remarks