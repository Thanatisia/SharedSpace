Termux PRoot wrapper/CLI utility: proot-distro
==============================================

## Information
### Package 
- Repositories
    - GitHub
        + [termux/proot-distro](https://github.com/termux/proot-distro) : A Bash script wrapper for utility proot for easy management of chroot-based Linux distribution installations. It does not require root or any special ROM, kernel, etc. Everything you need to get started is the latest version of Termux application

## Setup
### Dependencies
+ bash
+ bzip2
+ coreutils
+ curl
+ findutils
+ gzip
+ ncurses-utils
+ proot
+ sed
+ tar
+ xz-utils

### Pre-Requisites
- (Optionals) If you want command line autocompletion
    + Install the 'bash-completion' package
    ```bash
    pkg install bash-completion
    ```

### Installation
- Using package manager
    ```bash
    pkg install proot-distro
    ```
- Using git
    - Git clone the source repository
        ```bash
        git clone https://github.com/termux/proot-distro
        ```
    - Change directory into repository
        ```bash
        cd proot-distro
        ```
    - Begin installation using install script
        ```bash
        ./install.sh
        ```

## Wiki
- Notes
    - On installation,
        + proot-distro will be installed to '$PREFIX/bin'
        + The default proot base distributions will be installed to '$PREFIX/etc/proot-distro'

## Resources

## References

## Remarks

