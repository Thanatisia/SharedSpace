# Python Library - ctypes

## Table of Contents
* [Documentation](#documentation)
* [Pre-Requisites](#pre-requisites)
* [Setup](#setup)

## Information
### DESCRIPTION
```
ctypes is a built-in python library used to implement the C programming API in python, essentially letting you use C-lang in python
```

## Documentation

### Packages
- ctypes

### Modules
- ctypes
    - `.util`

### Classes
- ctypes
    - `.CDLL(dll_name, mode=DEFAULT_MODE, handle=None, use_errno=False, use_last_error=False, winmode=None)` : Initializes and loads C DLL shared libraries into the python process
        - Parameter Signature/Header
            - dll_name : Specify the DLL shared library you wish to load into the python process
                + Type: String
                - Notes
                    + You can use `ctypes.util.find_library("library-name")` to automatically find and load the library
        - Return
            - libc : Returns an initialized DLL instance with the specified shared library loaded into the python process
                + Type: ctypes.CDLL

### Data Types/Classes

### Functions
- ctypes
    - `.get_errno()` : Returns an error number if an error is detected
        - Return
            - errno : The detected error number
                + Type: Integer

- ctypes.util
    - `.find_library(library_name)` : Finds the specified C-DLL shared library and returns the path to the caller
        - Parameter Signature/Header
            - library_name : Specify the target library you wish to find
                + Type: String
                - Example library names
                    + 'c' : C programming language shared standard library
        - Return
            - libpath : Returns the path of the library
                + Type: String

### Attributes/Variables

### Usage
- Imports package/dependencies
    ```python
    import ctypes
    import ctypes.util
    ```

- Initialize and loads the C DLL shared library file into the python process
    ```python
    # Initialize glibc and C programming language
    libc = ctypes.CDLL(ctypes.util.find_library('c'), use_errno=True)
    ```

> Disk Management and Mounting

- Set the C-DLL mount options
    - argument types
        ```python
        # Specify a tuple of mount argument types
        self.libc.mount.argtypes = (ctypes.c_char_p, ctypes.c_char_p, ctypes.c_char_p, ctypes.c_ulong, ctypes.c_char_p)
        ```

- Mount
    ```python
    ret = self.libc.mount(source.encode(), target.encode(), fs.encode(), 0, options.encode())
    if ret < 0:
        errno = ctypes.get_errno()
        raise OSError(errno, f"Error mounting {source} ({fs}) on {target} with options '{options}': {os.strerror(errno)}")
    ```

## Wiki

## References

## Resources
+ [Python Docs - ctypes](https://docs.python.org/3/library/ctypes.html)
+ [StackOverflow - Questions - 1667257 - How do I mount a filesystem using python](https://stackoverflow.com/questions/1667257/how-do-i-mount-a-filesystem-using-python)

## Remarks

