# Linux Kernel

## Information
+ Application Title: Linux Kernel
+ Package Name: Linux
+ Package Author: Linus Torvalds
- Package Sources
    + [GitHub - Latest Version](https://github.com/torvalds/linux)
    - Mirrors

## Setup
### Pre-Requisites
- Obtain the source code
    - From GitHub (latest version)
        - Clone the repository from GitHub
            ```console
            git clone https://github.com/torvalds/linux
            ```

    - From Linux Kernel Mirrors
        - Download kernel tarball
            ```console
            wget
            ```

        - Extract the source code from tarball
            ```console
            tar -xvf [tarball file]
            ```

- Change directory into package folder
    ```console
    cd [Package Name]
    ```

- Time : Alot of time, approximately 7 hours by testing. Estimates are adjusted depending on CPU capabilities.

### Dependencies

## Documentation
### Compilation/Build Process
- Configure the kernel
    ```console
    make {options} menuconfig
    ```

- Build/Compile the kernel
    ```console
    make {options}
    ```

### Installations
- Install the kernel modules to boot partition
    ```console
    sudo make {options} kernel_modules
    ```

- Install to bootloader
    ```console
    sudo make {options} install
    ```

## Wiki

### Tips n Tricks
- Use flag '-j'
    + Parse the flag '-jX' to the make options
    - where X = number of cores/processors to use
        + To perform multithreading/multiprocessing, speeding up the compilation process
