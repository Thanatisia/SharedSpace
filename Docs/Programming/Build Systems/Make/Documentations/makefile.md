# Make - Makefile

```
Documentation and Write-up of the Makefile's basics, Syntax, Structure of the makefile config
```

## Basics
### Operators
+ @ : Execute the command without the shell interface
+ $(var) : To use/invoke a variable

## Components

### Variables
> the following are typical variables found in most Makefiles
#### Compiled Languages 
+ CC : Your primary Cross Compiler to Compile the source codes
+ CFLAG : Your Compiler flags to Parse/pass into the compiler
+ SRC : Your source files
+ OBJ : Your object files
+ EXE : Your executable/output file
#### Interpreted Languages 
+ INT : Your primary interpreter
+ IFLAG : Your interpreter flags to Parse/pass into the interpreter

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

## Structure

```console
target: [your-dependencies]
    # rules...
```

## Syntaxes
- Target
    + The rules when called, will call all Dependencies in order before executing the rules/statements
- Dependencies 
    + All targets, variables, rules required to build/perform the target

## Pseudocode
```console
CC = 
CFLAG = 

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
