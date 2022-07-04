# Documentation - Commands : diff

To compare a new file and a old file, and outputs as a patch file containing the differences

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Resources](#resources)
- [References](#references)
- [Remarks](#remarks)

## Information

### Special Symbols in changes/differences
+ a : Add (+)
+ c : Change (~)
+ d : Delete (-)
+ < : Removed/Deleted
+ > : Added

## Setup

## Documentation

### Synopsis/Syntax

```sh
diff {options} [old_file] [new_file] > patch-file.{patch|dif}
```

### Parameters

+ -a : 
+ -c : Output in Context mode; Displays verbose information
+ -I : To make command case in-sensitive (Default : Case-sensitive)
+ -N : 
+ -r : Recursively find differences
+ -u : Output in Unified mode; similar to Context mode but it doesnt display any redundant information (more concise)
+ --help : Display this help message
+ --version : Display the version of diff

### Usage

 - Compare differences of 2 files
    ```sh
    diff [old_file] [new_file]
    ```
 
 - Generate patch files
    ```sh
    diff {options} [old_file] [new_file] > patch-file.{patch|dif}
    ```

### Notes

## Resources

## References

## Remarks

