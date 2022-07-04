# DevOps - Patching

## Table of Contents
- [Information](#information)
- [Patching Tools](#patching-tools)
- [Type of Patches](#type-of-patches)

## Patching Tools
+ diff : To compare a new file and a old file, and outputs as a patch file containing the differences
+ patch : To take a patch file as input and applies the differences to one or more original files, producing patched versions

## Type of Patches
- Terminal Utilities

## Patching
- To create patches (Simple)
    - using 'diff'
        ```sh
        # Syntax : diff -u [old_file] [new_file] > patch-file.{patch|dif}
        ```
        
- To apply patches to a file (Simple)
    - using 'patch'
        + Specify specific file
            ```console 
            patch [options] [original-file] [patch-file]
            ```
        + Patch several files
            ```console
            patch -p[number_of_files] < patch-file
            ```


