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

### Running on Docker
#### Debugging
> If you need to figure out what package to install, or what documents is in a default location, or test certain actions, you can use nix on a docker container for isolated testing

- Information
    - Images
        + nixos/nix : Official NixOS image; used BusyBox
        + nixpkgs/nix{-unstable} : Community-managed nix package manager docker image; Uses default Nix rootfs instead of BusyBox
- (Optional) Pull latest image
    - nixos/nix
        ```bash
        docker pull nixos/nix
        ```
    - nixpkgs/nix{-unstable} (Recommended)
        ```bash
        docker pull nixpkgs/nix{-unstable}
        ```
- Startup
    - nixos/nix
        ```bash
        docker run -itd --name [container-name] nixos/nix
        ```
    - nixpkgs/nix{-unstable} (Recommended)
        ```bash
        docker run -itd --name [container-name] nixpkgs/nix-unstable
        ```
- Post-Startup
    - Execute and run pre-requisite setup commands
        - Explanation
            + Add the default 'nixpkgs-unstable' nixos channel
            + Update the nix package manager repositories with the channel
            + Install findutils and other essential debugging tools to use
        ```bash
        docker exec -it [container-name] /bin/bash -c "\
            nix-channel --add https://nixos.org/channels/nixpkgs-unstable \
            && nix-channel --update \
            && nix-env -iA \
                nixpkgs.findutils \
                nixpkgs.nix-index
        "
        ```
    - Chroot and enter the shell
        ```bash
        docker exec -it [container-name] /bin/bash
        ```
    - Append the user's binary directory to path for usage
        ```bash
        export PATH+=:$HOME/.nix-profile/bin/:
        ```
- Clean-up
    - Once you are done with the container
        - Stop the container
            ```bash
            docker stop [container-name]
            ```
        - Remove the container
            ```bash
            docker rm [container-name]
            ```
    - (Optional) If the image is no longer necessary
        - Prune the image list
            - Notes
                + Parse the '-a' flag to prune/remove all unused images (not used by a container)
            ```bash
            docker image prune -a
            ```

#### Things to note
- NixOS (or Nix-related system operations) wont run properly on docker (without --privileged or the likes) because it requires systemd
    - So functionalities like
        + Base/Root Filesystem Bootstrap Installation via nixos-install
    + will not work properly without '--privileged' passed into 'docker run', or 'privileged: true' set in docker-compose.yaml

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

