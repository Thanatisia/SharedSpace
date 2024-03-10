# Nix Packages

```
Collection of Nix package groups and its package repositories

Initially was just a collection of essential packages so as to avoid package overcrowding, eventually it feels like there's quite a number of packages I really like to use, and felt like a waste to just keep this list as a specialty list
    - Hence, I am now putting important packages that are used widely, not just packages that the Nix community recommends
```

## Information
### Files
+ /etc/nixos/configuration.nix : NixOS Software configuration
+ /etc/nixos/hardware-configuration.nix : NixOS Hardware configuration

### Folders
- /etc/ : System configuration and settings directory
    - nixos : Primary NixOS configurations and settings directory 

## Packages
### Table of Contents
- Development
    - git : The git Version Control System; a base essential for software development/programming
    - Python
        - python3Packages : Package group; contains all python3 packages
            + pip
            + python
            + websockify
        - python311Packages : Package group; contains all python3.11 packages
            + pip
            + python
            + websockify
- Networking
    - networkmanager : Network configuration and management tool
- Nix-related
    - nixos-install-tools : The essential commands from the NixOS installer as a package
        - tools of note
            + nixos-generate-config : NixOS's root filesystem bootstrapper CLI utility
    - nixos-rebuild : Rebuild your NixOS configuration and switch to it, on local hosts and remote.
- System Utilities
    - findutils : The GNU Find Utilities, basic directory searching utilities by GNU
        - tools
            + find : Search for files in a directory hierarchy/filesystem
            + xargs : Build and perform command line execution from a given standard input
            + locate : list files in databases that match a pattern;
            + updatedb : update a file name database;
- Text Editors
    - neovim : Fork of vim that has lua integrated into the codebase
    - vim : Vi-Improved Modal Text Editor
- Display Server
    - Xorg-related
        - xorgserver : Installs the Xorg server components; Includes Xvfb (X Virtual Framebuffer)
            - tools of note
                + Xvfb : X Virtual Framebuffer; Used to run GUI applications and Display Server utilities headlessly (as a background process)
        - xauth : X Authority Authentication and Authorization manager
- VNC Servers
    - x11vnc : Xorg-based VNC server

### Development
- git
    - Using nix-env
        - On NixOS
            ```bash
            nix-env -iA nixos.git
            ```
        - On Non-NixOS
            ```bash
            nix-env -iA nixpkgs.git
            ```
    - Using the NixOS Configuration
        ```
        environment.systemPackages = [
            pkgs.git
        ];
        ```
    - Using nix-shell
        ```bash
        nix-shell -p git
        ```

- python3{version}Packages
    - pip
        - Using nix-env
            - On NixOS
                ```bash
                nix-env -iA nixos.python3Packages.pip
                ```
            - On Non-NixOS
                ```bash
                nix-env -iA nixpkgs.python3Packages.pip
                ```
        - Using the NixOS Configuration
            ```
            environment.systemPackages = [
                pkgs.python3Packages.pip
            ];
            ```
        - Using nix-shell
            ```bash
            nix-shell -p python3Packages.pip
            ```
    - python
        - Using nix-env
            - On NixOS
                ```bash
                nix-env -iA nixos.python3Packages.python
                ```
            - On Non-NixOS
                ```bash
                nix-env -iA nixpkgs.python3Packages.python
                ```
        - Using the NixOS Configuration
            ```
            environment.systemPackages = [
                pkgs.python3Packages.python
            ];
            ```
        - Using nix-shell
            ```bash
            nix-shell -p python3Packages.python
            ```
    - websockify
        - Using nix-env
            - On NixOS
                ```bash
                nix-env -iA nixos.python3Packages.websockify
                ```
            - On Non-NixOS
                ```bash
                nix-env -iA nixpkgs.python3Packages.websockify
                ```
        - Using the NixOS Configuration
            ```
            environment.systemPackages = [
                pkgs.python3Packages.websockify
            ];
            ```
        - Using nix-shell
            ```bash
            nix-shell -p python3Packages.websockify
            ```

### Networking
- networkmanager
    - Using nix-env
        - On NixOS
            ```bash
            nix-env -iA nixos.networkmanager
            ```
        - On Non-NixOS
            ```bash
            nix-env -iA nixpkgs.networkmanager
            ```
    - Using the NixOS Configuration
        ```
        environment.systemPackages = [
            pkgs.networkmanager
        ];
        ```
    - Using nix-shell
        ```bash
        nix-shell -p networkmanager
        ```

### Nix-related
- nixos-install-tools
    - Using nix-env
        - On NixOS
            ```bash
            nix-env -iA nixos.nixos-install-tools
            ```
        - On Non-NixOS
            ```bash
            nix-env -iA nixpkgs.nixos-install-tools
            ```
    - Using the NixOS Configuration
        ```
        environment.systemPackages = [
            pkgs.nixos-install-tools
        ];
        ```
    - Using nix-shell
        ```bash
        nix-shell -p nixos-install-tools
        ```

- nixos-rebuild
    - Using nix-env
        - On NixOS
            ```bash
            nix-env -iA nixos.nixos-rebuild
            ```
        - On Non-NixOS
            ```bash
            nix-env -iA nixpkgs.nixos-rebuild
            ```
    - Using the NixOS Configuration
        ```
        environment.systemPackages = [
            pkgs.nixos-rebuild
        ];
        ```
    - Using nix-shell
        ```bash
        nix-shell -p nixos-rebuild
        ```

### System Utilities
- findutils
    - Using nix-env
        - On NixOS
            ```bash
            nix-env -iA nixos.findutils
            ```
        - On Non-NixOS
            ```bash
            nix-env -iA nixpkgs.findutils
            ```
    - Using the NixOS Configuration
        ```
        environment.systemPackages = [
            pkgs.findutils
        ];
        ```
    - Using nix-shell
        ```bash
        nix-shell -p findutils
        ```

### Text Editors
- neovim
    - Using nix-env
        - On NixOS
            ```bash
            nix-env -iA nixos.neovim
            ```
        - On Non-NixOS
            ```bash
            nix-env -iA nixpkgs.neovim
            ```
    - Using the NixOS Configuration
        ```
        environment.systemPackages = [
            pkgs.neovim
        ];
        ```
    - Using nix-shell
        ```bash
        nix-shell -p neovim
        ```

- vim
    - Using nix-env
        - On NixOS
            ```bash
            nix-env -iA nixos.vim
            ```
        - On Non-NixOS
            ```bash
            nix-env -iA nixpkgs.vim
            ```
    - Using the NixOS Configuration
        ```
        environment.systemPackages = [
            pkgs.vim
        ];
        ```
    - Using nix-shell
        ```bash
        nix-shell -p vim
        ```

### Display Server
- xorg
    - xauth
        - Using nix-env
            - On NixOS
                ```bash
                nix-env -iA nixos.xorg.xauth
                ```
            - On Non-NixOS
                ```bash
                nix-env -iA nixpkgs.xorg.xauth
                ```
        - Using the NixOS Configuration
            ```
            environment.systemPackages = [
                pkgs.xorg.xauth
            ];
            ```
        - Using nix-shell
            ```bash
            nix-shell -p xorg.xauth
            ```
    - xorgserver
        - Using nix-env
            - On NixOS
                ```bash
                nix-env -iA nixos.xorg.xorgserver
                ```
            - On Non-NixOS
                ```bash
                nix-env -iA nixpkgs.xorg.xorgserver
                ```
        - Using the NixOS Configuration
            ```
            environment.systemPackages = [
                pkgs.xorg.xorgserver
            ];
            ```
        - Using nix-shell
            ```bash
            nix-shell -p xorg.xorgsrver
            ```

### VNC Servers
- x11vnc
    - Using nix-env
        - On NixOS
            ```bash
            nix-env -iA nixos.x11vnc
            ```
        - On Non-NixOS
            ```bash
            nix-env -iA nixpkgs.x11vnc
            ```
    - Using the NixOS Configuration
        ```
        environment.systemPackages = [
            pkgs.x11vnc
        ];
        ```
    - Using nix-shell
        ```bash
        nix-shell -p x11vnc
        ```

## Resources

## References
+ [NixOS packages](https://search.nixos.org/)
+ [NixOS Wiki - nixos-rebuild](https://nixos.wiki/wiki/Nixos-rebuild)
+ [TheGeekDiary - nixos-rebuild command examples in linux](https://www.thegeekdiary.com/nixos-rebuild-command-examples-in-linux/)

## Remarks

