# Linux Command Documentation: tar

## Table of Contents:
- [Information](#information)
    + [Background](#background)
- [Documentation](#documentation)
    + [Syntax](#syntax)
    + [Parameters](#parameters)
    + [Usage](#usage)
- [Remarks](#remarks)
- [References](#references)
- [Resources](#resources)
    
## Information

### Background

+ Command Name: tar
+ Abbreviation: 
+ Command Summary: A compression utility - like zip and rar - that compresses a folder or file into a 'tar file' for backup and recovery
+ General Syntax: tar [options] [output-file-name] [targets]

## Documentation

### Syntax
+ Backup (Compress into tar file)
    ```console
    tar -cvzf [output-path] -owner=0 -group=0 [folders]
    ```
+ Recovery (Extract from tar file)
    ```console
    tar -xvzf [tar-file]
    ```
    
### Parameters
+ -c : Compress to tar file
+ -f : Files to add into archive
+ -v : Verbose (with message)
+ -x : Extract from tar file
+ -z : Compress with gzip
+ -owner : Set owner ID (Default: 0 for no owner)
+ -group : Set group ID (Default: 0 for no group)
+ -exclude : Exclude certain file(s)

### Usage




## Remarks

## References

## Resources

