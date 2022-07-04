# Documentation - Command : patch

To take a patch file as input and applies the differences to one or more original files, producing patched versions

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Resources](#resources)
- [References](#references)
- [Remarks](#remarks)

## Information

## Setup

## Documentation

### Synopsis/Syntax

+ Specify specific file
    ```console 
    patch [options] [original-file] [patch-file]
    ```

+ Patch several files
    ```console
    patch -p[number_of_files] < patch-file
    ```

### Parameters

+ -b : Take a backup of the original file before applying the patch command
+ -p[number_of_files] : Specify number of files to patch
+ -R : Reverse/Undo a patch which is applied already
+ -V [backup-filename] : Explicitly specify backup filename 
+ --dry-run : Test and check (aka 'dry run') the patch command to see if you are getting any errors

### Usage

- Patch specific files
    ```console
    patch target_file patch-file.patch
    ```

- Patch all files specified in [patch-file].patch
    ```console
    patch < patch-file.patch
    ```
 
- Backup the original file before applying the patch
    ```console
    patch -b < patch-file.patch
    ```
    
- Backup the original file with a new name before applying the patch
    ```console
    patch -b -V new_backup_name < patch-file.patch
    ```
    
- Test the patch
    ```console
    patch --dry-run < patch_file.patch
    ```

- Undo patch
    ```console
    patch -R < applied_patch_file.patch
    ```
    
### Notes

## Resources

## References

## Remarks

