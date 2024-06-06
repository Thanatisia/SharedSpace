# Python - Chrooting into another root filesystem

## Information
### Basics
+ Chroot is more of a Linux concept, as windows does not use 'root' but instead - 'Top-level' directories and lettered drives
- On Linux and other Unix-like systems, 
    + it's common to use os.open to obtain a file descriptor (fd) for a directory, which can then be used with os.fchdir to change the current working directory. 
    + This is due to the underlying POSIX system calls supporting this behavior.
- On Windows, the behavior of os.open with directories is less consistent and can lead to PermissionError or other issues. 
    + Therefore, the recommended and more straightforward approach on Windows is to use `os.chdir` to directly change the current working directory without needing to open a file descriptor.

## Setup
### Depedencies
> System

+ python

> Python Packages

### Pre-Requisites
- Import packages and dependencies
    ```python
    import os
    import sys
    ```

> Perform pre-initialization sanity check

- Print current working directory
    - Using os.system()
        ```python
        os.system("pwd")
        ```
    - Using os
        ```python
        os.getcwd()
        ```

- Print out all items in your current home directory (for consistency)
    ```python
    os.system("ls -l /home")
    ```

## Documentations
### Steps
#### Preparation
- Keep track of your current root directory
    - Explanation
        + This is used for moving back to your original root filesystem
    ```python
    real_root = os.open("/", os.O_RDONLY)
    ```

#### Changing root directory and jumping into it
- Change to a new root
    - Explanation
        + Basically, the system will treat this directory/path as the root directory in the filesystem
    ```python
    os.chroot("/path/to/new/root")
    ```

- Change directory to the new root directory to jump into it
    ```python
    os.chdir("/path/to/new/root")
    ```

#### Traversing/Working in the new root directory
- Print current working directory
    - Notes
        - Note that after changing the root directory
            + The current working directory should point to the new directory
    - Using os.system()
        ```python
        os.system("pwd")
        ```
    - Using os
        ```python
        os.getcwd()
        ```

- Print out all items in your current home directory (for consistency)
    - Notes
        - Note that after changing the root directory
            + The contents of the home directory should be that of the new root filesystem, not your original root/base filesystem
    ```python
    os.system("ls -l /home")
    ```

- Perform system command execution in the new root filesystem
    - Using `os.system()`
        - Get user input
            ```python
            user_input = input(PROMPT)
            ```
        - Execute command and return the return/result/status code (dubbed 'rc')
            ```python
            rc:int = os.system(user_input)
            ```
        - Process result
            ```python
            if (rc == 0):
                # Success
            else:
                # Error
                print("Error executing command. Exit Code [{}]".format(rc))
            ```
    - Using subprocess pipes
        - Import libraries/dependencies
            ```python
            from subprocess import Popen, PIPE, DEVNULL
            ```
        - Get user input
            ```python
            user_input = input(PROMPT)
            ```
        - Open the (sub)process Pipe socket connection
            ```python
            proc = Popen(user_input.split(), stdin=PIPE, stdout=PIPE, stderr=PIPE)
            ```
        - Execute command and return the standard streams as result
            ```python
            stdout, stderr = proc.communicate()
            ```
        - Get result/exit/status of command
            ```python
            rc:int = proc.returncode
            ```
        - Process result
            ```python
            if (rc == 0):
                # Success
            else:
                # Error
                print("Error executing command. Exit Code [{}]".format(rc))
            ```

#### Cleanup
- Information
    + When you are ready to go back to your original root filesystem

- Change directory back up to the real root filesystem
    - Explanation
        + This is why the step in [Preparation](#Preparation) is necessary
        + Well, or you can just close the terminal or exit
    ```python
    os.fchdir(real_root)
    ```

- Chroot back up to the real root filesystem
    ```python
    os.chroot(".")
    ```

- Change directory back up to a directory in the real root filesystem
    - Notes
        + For testing and consistency, consider changing to '/home' 
        - Note that after changing the root directory
            + The contents of the home directory should be back in your original root filesystem
    ```python
    os.chdir("/path/to/old/root")
    ```

#### Verification
- Print current working directory
    - Notes
        + You should now be back in a top-level root filesystem directory
    - Using os.system()
        ```python
        os.system("pwd")
        ```
    - Using os
        ```python
        os.getcwd()
        ```

- Print out all items in your current home directory (for consistency)
    - Notes
        + You should now be back in a top-level root filesystem directory
    ```python
    os.system("ls -l /home")
    ```

### Snippet

## Resources

## References
+ [nessy.info - 2013-12-05 - Python chroot and exit chroot](https://nessy.info/post/2013-12-05-python-chroot-and-exit-chroot/)

## Remarks

