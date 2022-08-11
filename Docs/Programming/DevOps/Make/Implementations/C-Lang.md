# Implementations - C Lang

```
Implementation of Make/Makefile in a C Programming Language Codebase 
within a typical Development Environment
```

## Components

### Variables
> the following are typical variables found in most Makefiles
+ CC : Your primary Cross Compiler to Compile the source codes
+ CFLAG : Your Compiler flags to Parse/pass into the compiler
+ SRC : Your source files
+ OBJ : Your object files
+ EXE : Your executable/output file

### Targets
> the following are typical targets found in most Makefiles
- setup : Preparation of all Dependencies and requirement checking prior to running
- build : Build the source code and compiles the source codes into an executable
- clean : Deletes all temporary files as well as created files - returning it back to pre-compilation state for rebuilding 
- install : The main installation process after building the source
    + To distribute the executables and other files (such as the config files) to their respective directories
    + Distribute to user-local if used without sudo
    + Distribute to system-wide if used with sudo
- uninstall : Remove/Delete all files distributed by *(sudo) make install* 

## Pseudocode
```console
CC = gcc
CFLAG = 
SRC = main.cpp
OBJ = 
EXE = main.exe

### Building
*.obj: $(OBJ)
    ## Generate

### Actions
setup: 
    ## The Setup and Preparation processes
    ## - Checking of Dependencies and 
    ## - Checking of Requirements

build: 
    ## Build the source code and 
    ## compiles the source codes into an executable
    @make -s setup
    $(CC) $(CFLAGS) $(SRC)

install: 
    ## The main installation process after building the source
    ## - To distribute the executables and other files (such as the config files) to their respective directories
    ## - Distribute to user-local if used without sudo
    ## - Distribute to system-wide if used with sudo 
    @make -s setup
```
