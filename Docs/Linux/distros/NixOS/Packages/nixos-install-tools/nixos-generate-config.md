# nixos-generate-config

```
Part of the NixOS Installation Toolset, nixos-generate-config is the NixOS Root/Base Filesystem Configuration File Generator
```

## Information
### Description
- This command writes two NixOS configuration modules:
    - /etc/nixos/hardware-configuration.nix : This module sets NixOS configuration options based on your current hardware configuration. 
        - If this file already exists, it is overwritten. 
            + Thus, you should not modify it manually. Rather, you should include it from your /etc/nixos/configuration.nix, and re-run nixos-generate-config to update it whenever your hardware configuration changes.

    - /etc/nixos/configuration.nix : This is the main NixOS system configuration module. 
        - If it already exists, it’s left unchanged. 
            + Otherwise, nixos-generate-config will write a template for you to customise.

### Package
+ Package Name: nixos-install-tools
- Related
    + [nixos-enter](nixos-enter.md)
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
#### Host
- Disk Management
    - Format disk label
        ```bash
        sudo parted [disk-label] mklabel [msdos|gpt]
        ```

- Partition Management
    - Create new partitions
        - MSDOS/MBR
            - Boot Partition
                ```bash
                sudo parted [disk-label] mkpart primary ext4 0% 1024MiB
                ```
            - Root Partition
                ```bash
                sudo parted [disk-label] mkpart primary ext4 1024MiB 50%
                ```
            - (Optional) Home Partition
                ```bash
                sudo parted [disk-label] mkpart primary ext4 50% 100%
                ```
        - GPT (UEFI)
            - Boot Partition
                ```bash
                sudo parted [disk-label] mkpart [partition-label|name] ext4 0% 1024MiB
                ```
            - Root Partition
                ```bash
                sudo parted [disk-label] mkpart [partition-label|name] ext4 1024MiB 50%
                ```
            - (Optional) Home Partition
                ```bash
                sudo parted [disk-label] mkpart [partition-label|name] ext4 50% 100%
                ```

    - Format partitions
        - Boot Partition
            ```bash
            sudo mkfs.ext4 [disk-label]{boot-partition-number}
            ```
        - Root Partition
            ```bash
            sudo mkfs.ext4 [disk-label]{root-partition-number}
            ```
        - (Optional) Home Partition
            ```bash
            sudo mkfs.ext4 [disk-label]{home-partition-number}
            ```

    - Set boot partition as bootable
        - MSDOS (MBR)
            ```bash
            sudo parted [disk-label] set [boot-partition-number] boot on
            ```
        - GPT (UEFI)
            ```bash
            sudo parted [disk-label] set [boot-partition-number] esp on
            ```

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
    nixos-generate-config {options} <arguments>
    ```

### Parameters
- Positionals

- Optionals
    - With Arguments
        + `--dir [destination-directory]` : Explicitly specify which directory to write the configuration to; Default: /etc/nixos
        + `--root [root-partition-mount-point]` : Explicitly specify the root partition mount point/directory to generate the configuration for
    - Flags

### Usage
- Generate initial configuration modules before the base/root filesystem installation
    ```bash
    nixos-generate-config --root [root-partition-mount-point]
    ```

## Wiki

## Resources

## References

## Remarks

