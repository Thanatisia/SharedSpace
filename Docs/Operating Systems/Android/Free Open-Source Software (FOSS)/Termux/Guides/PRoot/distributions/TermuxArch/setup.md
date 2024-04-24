# Termux PRoot distribution: TermuxArch - Setup and Installation

## Information

### Description
+ PRoot virtual environment for ArchLinux in Termux

### Information
- Repositories
    + [GitHub - TermuxArch/TermuxArch](https://github.com/TermuxArch/TermuxArch)
    + [GitHub - sdrausty/TermuxArch](https://github.com/sdrausty/TermuxArch)
- Source Files
    + setupTermuxArch.sh : https://raw.githubusercontent.com/sdrausty/TermuxArch/master/setupTermuxArch.sh

### Notes
- PRoot in Termux are Virtual chroot envrionments of various other distributions and package managers
    - i.e.
        + TermuxArch : PRoot of ArchLinux in Termux

## Host System Setup
### Dependencies
+ termux
+ git

### Pre-Requisites
+ Setup storage support using 'termux-setup-storage'

## TermuxArch

### Setup
#### Dependencies
+ git
+ wget
+ curl

#### Pre-Requisites
- Obtain installation script 'setupTermuxArch' from 'sdrausty/TermuxArch'
    - Using git repository
        - Clone TermuxArch repository
            ```bash
            git clone https://github.com/sdrausty/TermuxArch
            ```
        - Change directory to source code
            ```bash
            cd TermuxArch
            ```
    - Using curl
        ```bash
        curl -L -O https://raw.githubusercontent.com/sdrausty/TermuxArch/master/setupTermuxArch.sh
        ```
    - Using wget
        ```bash
        wget https://sdrausty.github.io/TermuxArch/setupTermuxArch.sh
        ```

#### Installation
- Startup the script 'setupTermuxArch.sh'
    - Explanation
        + Use this script to update, install or uninstall the PRoot
    ```bash
    ./setupTermuxArch.sh
    ```

#### Post-Installation
- User Management
    - Add new user
        ```bash
        useradd -m -g wheel -G users -d [custom-home-directory] [username]
        ```
    - Set password to new user
        ```bash
        passwd [username]
        ```
    - Enable sudo in '/etc/sudoers'
        ```bash
        EDITOR=[your-editor] sudo visudo
        ```
    - Change user to the new user
        ```bash
        su - [username]
        ```
    - Verify that user exists and can is permitted to use sudo
        ```bash
        sudo whoami
        ```

- To add mirrors for other distributions
    - Edit your pacman ('/etc/pacman.conf') configuration file
        - ArchStrike
            - Add the following mirrors to your pacman configuration file
                ```
                [archstrike]
                Server = https://mirror.archstrike.org/$arch/$repo
                ```
        - BlackArch
            - Add the following mirrors to your pacman configuration file
                ```
                [blackarch]
                Server = http://blackarch.org/blackarch/$repo/os/$arch
                ```
    - Update your package manager's repository database and Upgrade all installed packages
        ```bash
        pacman -Syu
        ```
    - Install the distribution as necessary
        - ArchStrike
            ```bash
            pacman -S archstrike --needed
            ```
        - BlackArch
            ```bash
            pacman -S blackarch --needed
            ```


## Resources

## References
+ [ArchWiki - PRoot](https://wiki.archlinux.org/title/PRoot)
+ [TermuxArch Documentations - Installation](https://termuxarch.github.io/docsTermuxArch/install)
+ [Termux Wiki - PRoot](https://wiki.termux.com/wiki/PRoot)
+ [Termux Wiki - termux-setup-storage](https://wiki.termux.com/wiki/Termux-setup-storage)
+ [rust-lang/rustup - Issues - 2872: Can not install on android - target 'aarch64-linux-android' not found in channel](https://github.com/rust-lang/rustup/issues/2872)

## Remarks

