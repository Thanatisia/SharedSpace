Termux - Quickstart - Things to do after installation
=====================================================

```
Collection of things to do Out-of-the-Box after installation
```

*Task List*
-----------
- Select/Change Repository List
    - Explanation
        + Select your mirrors
    ```bash
    termux-change-repo
    ```

- Update Package Repository list
    - Explanation
        - Parameters
            + `pkg update` : Update the package manager repository list
    ```bash
    pkg update
    ```

- Upgrade local packages
    - Explanation
        - Parameters
            + `pkg upgrade` : Upgrade local packages
    ```bash
    pkg upgrade
    ```

- Install essential packages
    - Packages
        - Development
            + git : Version Control and obtaining of packages
            + vim : Terminal Text Editor
            + tmux : Terminal Multiplexer
            + build-essential : Essential tools for building/development
            + jq : JSON Parser/Processor
            + yq : YAML Parser/Processor
        - Linux/System Administration
            + man : Linux manual
            + iproute2 : For IP/Networking-related tools
        - Termux-related
            + termux-api : Termux API; Access Android and Chrome hardware features.
            + termux-tools: Basic system tools for Termux
            + termux-services : contains a set of scripts for controlling services
    - Notes
        - To find other termux CLI packages, you can search using the pkg package manager
            ```bash
            pkg search termux-
            ```
    ```bash
    pkg {install|add} termux-api termux-tools termux-services man iproute2 git vim tmux build-essential jq yq
    ```

- Setup mapping of your Host System's Internal Storage filesystem into Termux's filesystem in the directory '~/storage'
    - Notes
        + termux-setup-storage: Gives Termux permissions to access your files in the Internal Storage
        + The mounted host system's filesystem is mounted as read-only for security purposes
    ```bash
    termux-setup-storage
    ```

- Edit/Configure Termux Configuration File
    - Explanation
    - Termux Filesystem Structure
        - $HOME/
            - .termux : this is the termux emulator application configuration directory
                + termux.properties : This is the main configuration file; This is where the keybinding/keymappings, settings are all set
    - Notes
        + Please refer to [Termux Wiki - Terminal Settings](https://wiki.termux.com/wiki/Terminal_Settings) for a full list
    - Edit '.termux/termux.properties'
        ```bash
        $EDITOR .termux/termux.properties
        ```
    - '.termux/termux.properties' Configuration settings and options Quickstart
        - Setting Key and Values
            - `extra-keys = [ keys... ]` : Set the keymapping/keybinding of the Terminal emulator (the quick-touch buttons above the keyboard)
                - Format:
                    ```
                    extra-keys = [
                        [ row-1, keys ], \
                        [ row-2, keys ], \
                        [ ... ], \
                        [ row-N, keys ] \
                    ]
                    ```
                - Notes
                    - Every list in the master list represents 1 row
                        + Each row list has to be separated by a comma
                        + If a row is in a new row, you need to separate with a '\' delimiter
                + Default Keys: `[ [ESC, TAB, CTRL, ALT, {key: '-', popup: '|'}, DOWN, UP] ]`
                - Supported Key characters
                    + ESC : Escape
                    + TAB : Tab
                    + CTRL : Control
                    + ALT : Alternate
                    + Custom : You can put whatever you want, what you type will be printed if pressed
                - Recommended Examples
                    - Base
                        ```
                        extra-keys = [
                            ['ESC', '/', '-', 'HOME', 'UP', 'END', 'PGUP'], \
                            ['TAB', 'CTRL', 'ALT', 'LEFT', 'DOWN', 'RIGHT', 'PGDN'] \
                        ]
                        ```
                    - Vim Key 3rd Row
                        ```
                        extra-keys = [
                            ['ESC', '/', '-', 'HOME', 'UP', 'END', 'PGUP'], \
                            ['TAB', 'CTRL', 'ALT', 'LEFT', 'DOWN', 'RIGHT', 'PGDN'], \
                            [':wq'] \
                        ]
                        ```

- Remote SSH server setup
    - Information
        + Purpose: Setting up SSH lets you remotely connect to the phone's termux session for easy management between PC and phone
        - Dependencies
            + openssh
    - Install dependencies
        ```bash
        pkg {add|install} openssh
        ```
    - User Management
        - Create new user
            ```bash
            useradd -m -g wheel -G users -d [custom-home-directory] [username]
            ```
        - Setup password for user
            ```bash
            passwd [username]
            ```
    - Find your device's IP address
        ```bash
        ip a s
        ```
    - Find your username
        ```bash
        whoami
        ```
    - Startup the SSH server on Termux
        - Information
            + The SSH server on Termux is using the custom port number 8022 instead of the default (22)
        ```bash
        sshd
        ```
    - Verify that SSH server/daemon is running
        ```bash
        logcat -s 'ssh:*'
        ```
    - To remotely connect from a PC to your termux session using SSH
        ```bash
        ssh -p 8022 [username]@[ssh-host-ip|domain]
        ```

- Setup PRoot Containers to access other distributions
    - Notes
        - PRoot in Termux are Virtual chroot envrionments of various other distributions and package managers
            - i.e.
                + TermuxArch : PRoot of ArchLinux in Termux
    - Setup
        - Dependencies
            + termux
            + git
            + wget
        - Pre-Requisites
            + Setup storage support using 'termux-setup-storage'
    - PRoot Distributions and Tools
        - proot-distro
            - Information
                - Repositories
                    + [GitHub - termux/proot-distro](https://github.com/termux/proot-distro) : A Bash script wrapper for utility proot for easy management of chroot-based Linux distribution installations. It does not require root or any special ROM, kernel, etc. Everything you need to get started is the latest version of Termux application
            - Dependencies
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
            - Pre-Requisites
                - (Optionals) If you want command line autocompletion
                    + Install the 'bash-completion' package
                    ```bash
                    pkg install bash-completion
                    ```
            - Installation
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
    - PRoot Containers
        - TermuxArch : PRoot virtual environment for ArchLinux in Termux
            - Information
                - Repositories
                    + [GitHub - TermuxArch/TermuxArch](https://github.com/TermuxArch/TermuxArch)
                    + [GitHub - sdrausty/TermuxArch](https://github.com/sdrausty/TermuxArch)
                - Source Files
                    + setupTermuxArch.sh : https://raw.githubusercontent.com/sdrausty/TermuxArch/master/setupTermuxArch.sh
            - Pre-Requisites
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
            - Installation
                - Startup the script 'setupTermuxArch.sh'
                    ```bash
                    ./setupTermuxArch.sh
                    ```
            - Post-Installation
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


## Wiki
- Backup Termux files
    - Pre-Requisites
        - Ensure that storage permission is granted
            ```bash
            termux-setup-storage
            ```
    - Using tar
        - Explanation
            - Tar archive compress the following directories into the output tarball archive file in the host system
                + /data/data/com.termux/files : Termux files
                + ./home : Termux Home directory
                + ./usr : Termux User directory
        - Warning: 
            - never store your backups in Termux private directories
                + Once you clear Termux's data from the host system's settings, these directories are erased too
        ```bash
        tar -cvzf /sdcard/output-file.tar.gz -C /data/data/com.termux/files ./home ./usr
        ```

- Restoring Termux files
    - Pre-Requisites
        - Ensure that storage permission is granted
            ```bash
            termux-setup-storage
            ```
    - Using tar
        - Explanation
            - Tar archive compress the following directories into the output tarball archive file in the host system
                + /data/data/com.termux/files : Termux files
                + ./home : Termux Home directory
                + ./usr : Termux User directory
            - Extract home and usr with overwriting everything. 
                + Pass --recursive-unlink to remove any junk and orphaned files. 
                + Pass --preserve-permissions to set file permissions as in archive, ignoring the umask value. 
                + By combining these extra options you will get installation state exactly as was in archive
        ```bash
        tar -xvzf /sdcard/output-file.tar.gz -C /data/data/com.termux/files --recursive-unlink --preserve-permissions
        ```
    + Exit Termux and reopen

- Add-Ons
    + Termux Boot : Run script(s) when your device boots
    + Termux Float : Run Termux in a floating window.
    + Termux Styling : Have color schemes and powerline-ready fonts customize the appearance of the Termux terminal.
    + Termux Tasker : An easy way to call Termux executables from Tasker and compatible apps.
    + Termux Widget : Start small scriptlets from the home screen.



## Resources

## References
+ [TermuxArch Documentations - Installation](https://termuxarch.github.io/docsTermuxArch/install)
+ [Termux Wiki - Backing up Termux](https://wiki.termux.com/wiki/Backing_up_Termux)
+ [Termux Wiki - Getting Started](https://wiki.termux.com/wiki/Getting_started)
+ [Termux Wiki - termux-setup-storage](https://wiki.termux.com/wiki/Termux-setup-storage)
+ [Termux Wiki - Termux API](https://wiki.termux.com/wiki/Termux:API)
+ [Termux Wiki - Termux Boot](https://wiki.termux.com/wiki/Termux:Boot)
+ [Termux Wiki - Termux Float](https://wiki.termux.com/wiki/Termux:Float)
+ [Termux Wiki - Termux Styling](https://wiki.termux.com/wiki/Termux:Styling)
+ [Termux Wiki - Termux Tasker](https://wiki.termux.com/wiki/Termux:Tasker)
+ [Termux Wiki - Termux Widget](https://wiki.termux.com/wiki/Termux:Widget)
+ [joeprevite - SSH into Termux from your computer](https://joeprevite.com/ssh-termux-from-computer/)

## Remarks

