# nixos-rebuild

## Information
### Description
- “nixos-rebuild” is a command-line tool for reconfiguring a NixOS machine. 
    + NixOS is a Linux distribution that uses the Nix package manager, and “nixos-rebuild” allows users to make changes to the configuration of their NixOS system.

- The tool provides a simple and convenient way to update and modify the configuration of a NixOS machine, 
    + and it allows users to make changes to system services, networking, security, and other settings. 
    + The tool also provides support for rolling back to previous configurations if necessary.

- “nixos-rebuild” is an essential tool for NixOS users, and 
    + it provides a convenient and reliable way to manage the configuration of their system. 
    - The tool allows users to easily make changes to their system, and 
        + it provides a simple and intuitive interface for updating the configuration.

### Package
+ Package Name: nixos-rebuild

## Setup
### Dependencies

### Installation
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
    - Using the NixOS configuration
        - Append the following Nix code to your NixOS configuration in '/etc/nixos/configuration.nix'
            ```nix
            environment.systemPackages = [
                pkgs.nixos-rebuild
            ];
            ```
    - Using nix-shell
        ```bash
        nix-shell -p nixos-rebuild
        ```

### Pre-Requisites

## Documentations
### Synopsis/Syntax
- Base
    ```bash
    nixos-rebuild [action] {options} <arguments>
    ```

### Parameters
- Positionals
    - action : Specify the action you want the system to do when rebuilding the system
        + boot : Build the new configuration and make it the default boot configuration without switching to it
        + build-vm : Build the configuration and open it in a virtual machine
        + edit : Open configuration.nix in the default editor; Change the default editor by modifying your '$EDITOR'
        + switch : Build and Switch to a new configuration, making it the default boot configuration
        + test : Build and activate the new configuration, but dont make a boot entry in the system (for testing purposes)

- Optionals
    - With Arguments
        + `-p | --profile-name {profile-name}` : Explicitly specify a custom name of the profile to switch to; Use with '-I nixos-config=/path/to/custom-configuration-file.nix' to build with a custom configuration file
        - `-I setting=value` : Include the key-value settings mapping into the build process
            - Settings 
                + `nixos-config=/path/to/custom-configuration-file.nix` : to build with a custom configuration file
        + `--target-host [host-ip|domain]` : Explicitly specify a target remote host to rebuild to; If not specified, building will be local.

    - Flags
        + --install-bootloader : Causes the bootloader to be reinstalled on the device specified by the new configuration
        + --rollback : Rollback changes to the configuration, switching to the previous generation
        + --upgrade : Install updates and upgrade the system when rebuilding 

### Usage
- Rollback to a previous working version
    ```bash
    nixos-rebuild switch --rollback
    ```

- Rebuild system and upgrade
    ```bash
    nixos-rebuild switch --upgrade
    ```

- Rebuild system with a custom *.nix configuration file
    ```bash
    nixos-rebuild switch --profile-name new-profile -I 'nixos-config=/path/to/custom-configuration-file.nix'
    ```

## Wiki

### Files
- /etc/nixos/flake.nix : If this file exists, then nixos-rebuild will use it as if the --flake option was given. 
    + This file may be a symlink to a flake.nix in an actual flake; thus /etc/nixos need not be a flake.
- /run/current-system : A symlink to the currently active system configuration in the Nix store.
- /nix/var/nix/profiles/system : The Nix profile that contains the current and previous system configurations. 
    + Used to generate the GRUB boot menu.

### Environment Variables
+ NIXOS_CONFIG : Path to the main NixOS configuration module. Defaults to /etc/nixos/configuration.nix.
- NIX_PATH : A colon-separated list of directories used to look up Nix expressions enclosed in angle brackets (e.g. <nixpkgs>). 
    - Example: nixpkgs=./my-nixpkgs
+ NIX_SSHOPTS : Additional options to be passed to ssh on the command line.

### Things to note
- NixOS (or Nix-related system operations) wont run properly on docker (without --privileged or the likes) because it requires systemd
    - So functionalities like
        + Base/Root Filesystem Bootstrap Installation via 'nixos-install'
    + will not work properly without '--privileged' passed into 'docker run', or 'privileged: true' set in docker-compose.yaml

## Resources

## References
+ [TheGeekDiary - nixos-rebuild command examples in Linux](https://www.thegeekdiary.com/nixos-rebuild-command-examples-in-linux/)

## Remarks

