# Void Linux xbps

## Information

### Background
```
The X Binary Package System (in short XBPS) is a binary package system designed and implemented from scratch. 
Its goal is to be fast, easy to use, bug-free, featureful and portable as much as possible.

xbps is used as the primary package manager for Void Linux containing various system functionalities such as
    - Handling of system packages
    - Bootstrapper similar to pacstrap (for ArchLinux) or debootstrap (for Debian) to bootstrap install the base filesystem to a mount point's root
```

### Package
+ Package Type: Framework
+ Package Name: xbps
+ Package Author: void-linux
- Package Sources
    + [GitHub - Latest Version](https://github.com/void-linux/xbps)
    - Mirrors
        + NIL

## Setup
### Dependencies
- Requirements
    + git
    - If distribution is
        - Debian-based: build-essential
        - Arch-based: base-devel
    - make
    - pkgconf
    - zlib
    - openssl | libressl
    - libarchive with lz4 and zstd support (>=3.3.3)

- Optionals
    - graphviz and doxygen (--enable-api-docs) to build API documentation
    - atf >= 0.15 (--enable-tests) to build the Kyua test suite
                    
### Pre-Requisites
- Obtain the source code
    - From GitHub (latest version)
        - Clone the repository from GitHub
            ```console
            git clone https://github.com/void-linux/xbps
            ```

- Change directory into package folder
    ```console
    cd [Package Name]
    ```

### Compilation/Build Process
- Standard/Default Build/Compilation
    - Notes
        + This is not generated by GNU autoconf
    - Configure the make
        - Notes
            - By default, the PREFIX is set to '/usr/local'
                + this can be changed by setting '--prefix' in the configure script
        ```console
        ./configure {options} {--prefix=/usr}
        ```
    - Compile/Build packages
        ```console
        make -j[number-of-cores|threads|processors]
        ```

- Custom Build
    + Configure the make
        - Notes
            - Thanks to '--enable-rpath', you can install it anywhere and it will still use the libxbps shared library library at $ORIGIN/../lib,
                - That means that if xbps is installed to '$HOME/xbps-git/usr
                    + The executables will use '$HOME/xbps-git/usr/lib' to locate libxbps
        ```console
        ./configure {options} --enable-rpath --prefix=/usr --sysconfdir=/etc
        ```
    + Compile/Build packages
        ```console
        make -j$(nproc)
        ```

### Installations
- Standard/Default Build/Compilation
    - Install compiled binaries and documentations to the system according to the maintainer's instructions
        - Notes
            - The 'DESTDIR' variable is also supported at the install stage
        ```console
        sudo make {options} install
        ```

- Custom Build
    - Make destination directory and install compiled binaries into system
        - Notes
            - Replace 'directory' with the destination directory you want to install to; Recommended: /usr/local/bin
                + You can also put '~/xbps-git', and it will create '~/xbps-git/usr/bin'
        ```console
        make dest_dir=[directory] install clean
        ```
    + Add git directory to path
        ```console
        PATH+=:[directory]
        ```

### Uninstallations
- Standard uninstallation using Make rule
    ```console
    sudo make uninstall
    ```

## Documentation

### Package Contents/Binaries
- Binaries/Executables
    - Paths
        + Executable bin (PREFIX) : /usr/local/bin
    - Files
        + xbps-create      : XBPS utility to create binary packages
        + xbps-dgraph      : XBPS utility to generate dot(1) graphs
        + xbps-install     : XBPS utility to install and update packages
        + xbps-pkgdb       : XBPS utility to report and fix issues in pkgdb
        + xbps-query       : XBPS utility to query for package and repository information
        + xbps-reconfigure : XBPS utility to configure installed packages
        + xbps-remove      : XBPS utility to remove packages
        + xbps-rindex      : XBPS utility to handle local binary package repositories

- Documentations/Manuals
    - Paths:
        + man folder : /usr/share/local/man/man8/

## Wiki

### Tips n Tricks
- Use flag '-j'
    + Parse the flag '-jX' to the make options
    - where X = number of cores/processors to use
        + To perform multithreading/multiprocessing, speeding up the compilation process

## Resources

## References

## Remarks

