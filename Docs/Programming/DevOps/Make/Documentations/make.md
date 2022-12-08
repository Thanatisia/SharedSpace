# Make command

## Information
### DESCRIPTION
```
make is an essential tool/utility in DevOps that automates and streamlines the Software Development process as well as providing consistency in the build processes during testing.

make is also commonly known as a Build system.
```

## Setup
### Pre-Requisites
+ An existing *Makefile* in the current directory

### Dependencies
+ make

### Installing

## Documentation
### Synopsis/Syntaxes
```console
make {options} [arguments...]
```

### Parameters
+ -c [target] : Execute the specified target/command directly instead of the whole Makefile.
+ -j[X] : Compile the source code using 'X' number of cores/processes/threads; Perform multithreading/multiprocessing compilation.
+ -s : Silent Mode; Run Makefile without the comments.

### Usage
- Run Makefile without the comments
    ```console
    make -s
    ```
- Multithreaded Compilation
    ```console
    make -jX {rules|targets}
    ```

