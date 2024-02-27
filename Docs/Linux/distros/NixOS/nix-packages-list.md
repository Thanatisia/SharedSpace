# Nix Packages

## Information
### Files
+ /etc/nixos/configuration.nix : NixOS configuration

### Folders
- /etc/ : System configuration and settings directory
    - nixos : Primary NixOS configurations and settings directory 

## Packages
### Table of Contents
- Networking
    - networkmanager : Network configuration and management tool
- Nix-related
    - nixos-install-tools : The essential commands from the NixOS installer as a package
        - tools of note
            + nixos-generate-config : NixOS's root filesystem bootstrapper CLI utility
- Text Editors
    - neovim : Fork of vim that has lua integrated into the codebase
    - vim : Vi-Improved Modal Text Editor

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

## Resources

## References
+ [NixOS packages](https://search.nixos.org/)

## Remarks
