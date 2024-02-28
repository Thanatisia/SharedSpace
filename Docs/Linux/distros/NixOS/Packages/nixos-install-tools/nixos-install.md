# nixos-install

```
Part of the NixOS Installation Toolset, 
nixos-install is the NixOS Bootstrap Command Line (CLI) Root/Base Filesystem installer using the generated configuration file
    - Similar to ArchLinux's pacstrap and Debian's debootstrap
```

## Information
### Description
- This command installs NixOS in the file system mounted on /mnt, 
    + based on the NixOS configuration specified in '[root-mount-point]/etc/nixos/configuration.nix'
    - It performs the following steps:
       1. It copies Nix and its dependencies to /mnt/nix/store.
       2. It runs Nix in /mnt to build the NixOS configuration specified in /mnt/etc/nixos/configuration.nix.
       3. It installs the current channel “nixos” in the target channel profile (unless --no-channel-copy is specified).
       4. It installs the GRUB boot loader on the device specified in the  option  boot.loader.grub.device  (unless --no-bootloader is specified), 
            + and generates a GRUB configuration file that boots into the NixOS configuration just installed.
       5. It prompts you for a password for the root account (unless --no-root-password is specified).
    - This command is idempotent: 
        + if it is interrupted or fails due to a temporary problem (e.g. a network issue), you can safely re-run it.

### Package
+ Package Name: nixos-install-tools
- Related
    + [nixos-generate-config](nixos-generate-config.md)

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
    nixos-install {options} <arguments>
    ```

### Parameters
- Positionals

- Optionals
    - With Arguments
        + `-I [path]` : Add/Include the specified path to the Nix expression search path; Print the '$NIX_PATH' environment variable to see the current paths
        + `--root [root-partition-mount-point]` : Explicitly specify the root partition mount point/directory to install to
        + `--system [custom-config-file-directory]` : Explicitly specify the directory/path of a custom 'configuration.nix' file to use; Default: [root-partition-mount-point]/etc/nixos/configuration.nix
    - Flags
        + -v | --verbose : Display with increasing level of verbosity

### Usage
- Generate initial configuration modules before the base/root filesystem installation
    - Explanation
        - This will bootstrap the distribution's base filesystem into the mount point's root directory
            + as well as the configuration file containing NixOS's recipe/installing configs
    ```bash
    nixos-generate-config --root [root-partition-mount-point]
    ```

- Edit the generated configuration file
    - Explanation
        + Uncomment all settings you want in your system
    ```console
    $EDITOR [root-partition-mount-point]/etc/nixos/configuration.nix
    ```

- Install and Bootstrap NixOS into your base filesystem according to the configuration you edited
    - Explanation
        + The system will detect the mount point containing your NixOS configuration file and partition and 
        + install the base filesystem into the mount point's root directory
    - Options
    ```console
    nixos-install
    ```

## Wiki

### Environment Variables
+ NIX_PATH :  Contains the Nix expression search path

### Things to note
- NixOS (or Nix-related system operations) wont run properly on docker (without --privileged or the likes) because it requires systemd
    - So functionalities like
        + Base/Root Filesystem Bootstrap Installation via 'nixos-install'
    + will not work properly without '--privileged' passed into 'docker run', or 'privileged: true' set in docker-compose.yaml

## Resources

## References

## Remarks

