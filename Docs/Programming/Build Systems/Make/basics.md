# Makefile : Basics

Documentation for basics of Makefile and 'make'.

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Resources](#resources)
- [References](#references)
- [Remarks](#remarks)

## Information

## Setup

### Dependencies

+ build-devels
+ make

### Pre-Requisites

+ Create a file named 'Makefile'

## Documentation

### Synopsis/Syntax

+ Target recipe
    ```Makefile
    target: dependencies
        # Comments
        recipe/commands
    ``` 

### Components
- General components of a Makefile
    - ingredients: Variables and other ingredients required to make the target/recipe
    - target/recipe: The instructions to build/make the product
        - Typical target/recipes
            + build     : To make/compile/build the source code into a binary locally
            + install   : To install and copy the binary as well as other required files to the system level
            + uninstall : To remove the installed binary as well as other required files from the system level
            + clean     : To remove all temporary files generated from the build/compilation process.
    
### Usage

+ Run a target
    ```
    {sudo} make [target]
    ```

## Wiki

### Template Skeletons
+ [Installer and Build System (Recommended)](Skeleton/installer.Makefile)
+ [CPP Build](Skeleton/cpp.Makefile)
+ [General Building](Skeleton/general.Makefile)
+ [Python Build](Skeleton/python.Makefile)
    
## Resources

## References

## Remarks
