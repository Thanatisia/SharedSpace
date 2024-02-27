# nixos-enter

```
Part of the NixOS Installation Toolset, 
nixos-enter allows you to run a command in a NixOS chroot environment (aka root filesystem)
```

## Information
### Description
- This command runs a command in a specified NixOS chroot environment
    - Which is in a root/base filesystem hierarchy installed via bootstrap using [nixos-install](nixos-install.md)

### Package
+ Package Name: nixos-install-tools
- Related
    + [nixos-generate-config](nixos-generate-config.md)
    + [nixos-install](nixos-install.md)

## Setup
### Dependencies
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
    - Using the NixOS configuration
        - Append the following Nix code to your NixOS configuration in '/etc/nixos/configuration.nix'
            ```nix
            environment.systemPackages = [
                pkgs.nixos-install-tools
            ];
            ```
    - Using nix-shell
        ```bash
        nix-shell -p nixos-install-tools
        ```

### Pre-Requisites
#### Disk Mounting
- Create root partition mount point
    ```bash
    mkdir -pv /mnt
    ```

- Mount root partition to mount point
    ```bash
    mount [disk-label]{root-partition-number} [root-mount-point]
    ```

- Create boot and home partition mount point
    ```bash
    mkdir -pv /mnt/{boot,home}
    ```

- Mount remaining partitions partition to mount point
    ```bash
    mount [disk-label]{boot-partition-number} /mnt/[boot-mount-point]
    mount [disk-label]{home-partition-number} /mnt/[home-mount-point]
    ```

## Documentations
### Synopsis/Syntax
- Base
    ```bash
    nixos-enter {options} <arguments>
    ```

### Parameters
- Positionals

- Optionals
    - With Arguments
        + `-c | --command [shell-command]` : Specify the command string you want to execute within the chroot environment
        + `--root [root-partition-mount-point]` : Explicitly specify the root partition mount point/directory you want to enter; Default: /mnt
        + `--system [custom-config-file-directory]` : Explicitly specify the directory/path of a custom 'configuration.nix' file to use; Default: /nix/var/nix/profiles/system
    - Flags
        + -- : Interpret the remaining arguments as the program name and arguments to be invoked; The program is not executed in a shell
        + --silent : Suppresses all standard output from the activation script of the target system

### Usage
- Chroot into the root filesystem
    ```bash
    nixos-enter --root [root-partition-mount-point]
    ```

- Run a shell command in a root filesystem
    ```bash
    nixos-enter -c 'ls -l; cat /proc/mounts'
    ```

- Run a non-shell command in a root filesystem
    ```bash
    nixos-enter -- cat /proc/mounts
    ```

## Wiki

### Environment Variables
+ NIX_PATH :  Contains the Nix expression search path

## Resources

## References

## Remarks
