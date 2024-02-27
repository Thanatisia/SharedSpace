# NixOS

## Information

### Project

### Background
```
NixOS is a free and open-source Linux distribution based on the purely functional Nix package manager. 

NixOS is composed using modules and packages defined in the nixpkgs project and uses an immutable design and an atomic update model. 
    - Its use of a declarative configuration allows reproducibility and portability.

By just importing any configuration file(s) you wish to reproduce,
    - You will be able to convert your system into that configuration
```

### Repositories
- Github:
    + Nix Package Manager: https://github.com/NixOS/nix
    + Nix Packages: https://github.com/NixOS/nixpkgs
    + NixOS Hardware Repository: https://github.com/NixOS/nixos-hardware
    + NixOS Installation Tools: github.com/NixOS/nixos-install-tools

## Documentations

### NixOS System Layout

## Wiki
### Important Packages
- NixOS Installation
    - [nixos install tools](github.com/NixOS/nixos-install-tools)
        + nixos-generate-config : NixOS Base System Bootstrapper (like pacstrap for ArchLinux and debootstrap for Debian)

### Files
+ /etc/nixos/configuration.nix : NixOS configuration

### Folders
- /etc/ : System configuration and settings directory
    - nixos : Primary NixOS configurations and settings directory 
- $HOME : User's Home Directory
    - .nix-profile : User's nix profile and files
        - bin/ : User's nix installed binaries
        - manifest.nix : User's custom nix installation configuration
        - share/ : User's nix shared resources

## Resources

## References
+ [ArchWiki - Nix](https://wiki.archlinux.org/title/Nix)
+ [NixOS - Download](https://nixos.org/download)
+ [NixOS - Download - Docker](https://nixos.org/download#nix-install-docker)
+ [NixOS - Wiki - Bootstrap utility](https://nixos.wiki/wiki/Nixos-generate-config)
+ [NixOS - Wiki - Docker](https://nixos.wiki/wiki/Docker)
+ [NixOS - Manual - Nix - Stable - Installation - Multi-user](https://nixos.org/manual/nix/stable/installation/multi-user)
+ [NixOS - Manual - Nix - Stable - Installation - Single-user](https://nixos.org/manual/nix/stable/installation/single-user)
+ [Nix Packages Search](https://search.nixos.org/)

## Remarks

