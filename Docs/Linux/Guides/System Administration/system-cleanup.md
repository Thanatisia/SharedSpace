# Linux - System Cleanup

## Table of Contents
- [Information](#information)
    + [Filesystem Structure and Hierarchy](#filesystem-structure-and-hierarchy)
- [Packages and Package Management](#packages)
    - [Package Manager](#package-managers)
        + [apt](#apt)
        + [pacman](#pacman)
    - [Build from Source](#build-from-source)

## Information
### Filesystem Structure and Hierarchy
- Common directories
    + /usr/bin : The system binary folder; Contains packages installed via a Package Manager
    + /usr/share : The system shared folder; Contains shared libraries/documentations installed via a Package Manager
    + /usr/share/man/man1/[package-name] : Contains the manual for the package; Used by 'man'
    + /usr/local/bin/ : The binary folder; Contains the built from source application/scripts/executables installed to the system
    + /usr/local/share/[package-name] : Contains additional shared libraries/documentations related to the package

## Packages
### Package Managers
#### apt
- Uninstall packages
    - Remove the executable/application only
        + Doesnt remove dependencies, configuration files
        ```console
        sudo apt remove [package-name]
        ```

    - Remove all programs (including the program itself), system-wide files, configuration files
        + Doesnt automatically remove the dependencies
        + Doesnt remove user-space configuration file
        ```console
        sudo apt purge [package-name]
        ```

- Remove orphan packages and unnecessary dependencies
    + Do this after removing packages
    ```console
    sudo apt autoremove
    ```

#### pacman
- Uninstall packages
    - Remove the executable/application only
        + Doesnt remove dependencies, configuration files
        ```console
        sudo pacman -R [package-name]
        ```

    - Remove all programs (including the program itself), system-wide files, configuration files
        + Doesnt automatically remove dependencies
        + Doesnt remove user-space configuration file
        ```console
        sudo pacman -Rsu [package-name]
        ```

    - Remove all programs (including the program itself), system-wide files, configuration files and dependencies
        + Doesnt remove user-space configuration file
        ```console
        sudo pacman -Rns [package-name]
        ```

### Build from Source
- Uninstall packages
    - Delete files manually
        - Pre-Requisites
            - Search for the application's install path
                ```console
                which [application-name]
                ```
        - Binary (Application)
            - Common directories
                + /usr/local/bin
            ```console
            sudo rm $PREFIX/bin/application-name
            ```
        - Libraries/Documentations
            - Common directories
                + /usr/local/share
            ```console
            sudo rm -r $PREFIX/share/package-name
            ```
        - Manual
            - Common directories
                + /usr/local/share/man/man1/[package-name]
            ```console
            sudo rm -r $PREFIX/share/man/man1/package-name.tar.gz
            ```

    - Using Makefile
        - Note
            - This is only usable if the maintainer has made an uninstall target/rule/function 
                + Please refer to the above step 'Delete files manually'
        - Pre-Requisites
            - Clone git repository
                ```console
                git clone [package-source-repository-url]
                ```
            - Change directory into git repository
                ```console
                cd [package-name]
                ```
        - Uninstall
            ```console
            sudo make uninstall
            ```

## Wiki
### Terminologies
+ PREFIX : This is commonly the installation path where the application is installed to on a system level (i.e. /usr/bin, /usr/local/bin etc)
+ user-space : The user's personal home environment

## Resources

## References
+ YouTube - DistroTube - How to COMPLETELY Remove Applications on Linux

## Remarks


