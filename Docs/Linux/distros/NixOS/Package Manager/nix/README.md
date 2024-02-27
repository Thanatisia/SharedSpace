# NixOS - Nix Package Manager

## Information
### Introduction
```
The Nix Package Manager is a standalone package manager that uses declarative configuration and containerization to create reproducibility and portability.
```

### Project
- Github: 
    + Main repository: https://github.com/NixOS/nix
    + Nix Packages: https://github.com/NixOS/nixpkgs
    + NixOS Hardware Repository: https://github.com/NixOS/nixos-hardware
    + NixOS Installation Tools: github.com/NixOS/nixos-install-tools

## Setup
### Installation via Bare Metal (Host Machine)
#### Dependencies
- Build Essentials
    + apt : build-essential
    + pacman : base-devel

#### Pre-Requisites

#### Build from Source

#### Installation
- Using package manager
    - apt-based
        ```bash
        apt install nix
        ```
    - pacman-based
        ```bash
        pacman -S nix
        ```

- Multi-user Installation (Recommended)
    - Explanation
        - Pros
            + Better build isolation (and that is what Nix is all about)
            + Better security (a build can not write somewhere in your home)
            + Sharing builds between users
        - Cons
            + Requires root to run the daemon
            + More involved installation (creation of nixbld* users, installing a systemd unit, ...
            + Harder to uninstall
    - Multi-step (Recommended)
        - Download install script
            ```bash
            curl -L https://nixos.org/nix/install
            ```
        - (Optional - Recommended) Read the install script
            ```bash
            cat install
            ```
        - Install as daemon
            ```bash
            sh install --daemon
            ```
    - All-in-One
        ```bash
        sh <(curl -L https://nixos.org/nix/install) --daemon
        ```

- Single-user Installation
    - Explanation
        - This will perform a single-user installation of Nix, meaning that /nix is owned by the invoking user. 
            + You should run this under your usual user account, not as root. 
            + The script will invoke sudo to create /nix if it doesn’t already exist.
    - Multi-step 
        - Download install script
            ```bash
            curl -L https://nixos.org/nix/install
            ```
        - (Optional - Recommended) Read the install script
            ```bash
            cat install
            ```
        - Install as daemon
            ```bash
            sh install --no-daemon
            ```
    - All-in-One
        ```bash
        sh <(curl -L https://nixos.org/nix/install) --no-daemon
        ```

#### Setup System Development Environment
> Note: This section is option.

- User Management
    - Create a dedicated user for nix packaging and add the user to the group 'nix-users'
        + To access the daemon socket
        ```bash
        useradd -g nix-users nixuser
        ```
    - Set password
        ```bash
        passwd nixuser
        ```

- Enable and start service 'nix-daemon'
    - Enable service
        ```bash
        service nix-daemon enable
        ```
    - Start service
        ```bash
        service nix-daemon start
        ```

- Restart system
    ```bash
    sudo reboot now
    ```

- Add nix channel
    ```bash
    nix-channel --add https://nixos.org/channels/nixpkgs-unstable
    ```

- Verify channel
    ```bash
    nix-channel --list
    ```

- Update channel
    ```bash
    nix-channel --update
    ```

- Append the '~/.nix-profile/bin' directory into your system environment variable '$PATH'
    ```bash
    echo -e "$PATH+=~/.nix-profile/bin:" >> ~/.bashrc
    ```

### Installation via Docker
#### Container
- Docker Repository:
    + Docker Hub: https://hub.docker.com/r/nixos/nix/

#### Dependencies
+ docker
+ docker-compose

#### Pre-Requisites
- Obtaining source code repository
    - Clone repository
        ```bash
        git clone --depth=1 github.com/NixOS/nixpkgs.git
        ```

    - Change directory into repository
        ```bash
        cd nixpkgs
        ```

#### Using docker run
- Starting up
    - Nix
        ```console
        docker run -itd --name=nix \
            --restart=unless-stopped \
            -v /path/to/nixpkgs:/nixpkgs \
            -v /path/to/workdir:/workdir \
            nixos/nix:[tag]
        ```

- Teardown/Shutdown
    ```console
    docker container stop nix && docker container rm nix
    ```

- Start a stopped container
    ```console
    docker container start nix
    ```

- Stop a running container
    ```console
    docker container stop nix
    ```

- Restart a running container
    ```console
    docker container restart nix
    ```

#### Using docker-compose
- Prepare
    + Please refer to [Template - docker compose](#docker-compose) for more information

- Starting up
    ```console
    docker-compose up -d
    ```

- Teardown/Shutdown
    ```console
    docker-compose down
    ```

- Start a stopped container
    ```console
    docker-compose start nix
    ```

- Stop a running container
    ```console
    docker-compose stop nix
    ```

- Restart a running container
    ```console
    docker-compose restart nix
    ```

- To execute a command in the container
    ```console
    docker exec -it nix [command] {options} <arguments>
    ```

### Accessing
- Enter the Nix container shell
    ```console
    docker exec -it nix /bin/sh {options} <arguments>
    ```

## Documentations
### Tools
- nix : Nix Package Manager CLI utility
- nix-channel : Nix package repository channel handler
- nix-env : Nix package installer for the host system
- nix-shell : Nix package installer in a containerized virtual environment (similar to python's virtualenv)

### Synopsis/Syntax
- nix
    - Default
        ```bash
        nix {options} <arguments>
        ```

- nix-channel
    - Default
        ```bash
        nix-channel {options} <arguments>
        ```

- nix-env
    - Default
        ```bash
        nix-env {options} <arguments>
        ```

- nix-shell
    - Default
        ```bash
        nix-shell {options} <arguments>
        ```

### Parameters
#### nix
- Positionals
- Optionals
    - With Arguments
    - Flags

#### nix-channel
- Positionals
- Optionals
    - With Arguments
        + `--add [nix-channel-url]` : Add a new Nix package repository channel
    - Flags
        + --list : List all added nix package repository channel
        + --update : Update the Nix package repository channel list

#### nix-env
- Positionals
    + package-name : Specify the name of the package to install
- Optionals
    - With Arguments
    - Flags
        + -A : 
        + -i : Install the specified package

#### nix-shell
- Positionals
- Optionals
    - With Arguments
        + `--command [command-to-execute]` : Execute the specified command in the virtual environment
        + `-p [package-name]` : Specify package to install into a virtual environment and source into it
    - Flags

### Usage
- List all available nix-channels
    ```bash
    nix-channel --list
    ```

- Add nix-channel
    ```bash
    nix-channel --add https://nix.org/channels/[channel-name]
    ```

- Update all channels
    ```bash
    nix-channel --update
    ```

- Startup a virtual environment and install a nix package
    ```bash
    nix-shell -p [package-name]
    ```

- Startup a virtual environment and install a nix package and execute a command in-line
    ```bash
    nix-shell -p [package-name] --command "command-to-execute"
    ```

- Installing 'nixos-install-tools' in nix docker container
    ```bash
    docker exec -it nix /bin/sh -c "nix-env -iA nixpkgs.nixos-install-tools"
    ```

- Generate NixOS root/base filesystem configuration file in newly-formatted root partition in nix docker container
    ```bash
    docker exec -it nix /bin/sh -c "nixos-generate-config
    ```

- Install NixOS root/base filesystem based on the edited configuration file in the root partition in nix docker container
    ```bash
    docker exec -it nix /bin/sh -c "nixos-install
    ```

## Wiki
### Environment Variables

### Networking
#### Port Forwarding/Translation/Mapping

### Filesystem Structure
#### Folders
- Docker
    + /nixpkgs : Nix Package Development directory
    + /workdir : General working directory

- Host
    - /etc/ : System configuration and settings directory
        - nixos : Primary NixOS configurations and settings directory 
    - $HOME : User's Home Directory
        - .nix-profile : User's nix profile and files
            - bin/ : User's nix installed binaries
            - manifest.nix : User's custom nix installation configuration
            - share/ : User's nix shared resources

#### Files

### Docker mappings
#### Default Volumes
+ /path/to/nixpkgs:/nixpkgs : Nix Package Development directory
+ /path/to/workdir:/workdir : General working directory

### Templates
#### docker compose
- Nix Package Manager
    ```yaml
    version: "3.7"
    services:
      nix:
        image: nixos/nix:latest
        container_name: nix
        restart: unless-stopped
        tty: true
        stdin_open: true
        volumes:
          ## Mount volumes from host system into container
          ## [host-system-volume]:[container-volume]:[permissions]
          - ${PWD}/workdir:/workdir
    ```

### Notes and Findings
#### Error Messages


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

