# NixOS Configurations - hardware-configuration.nix schematics and design

## Information
### Summary
- Explanation and detailed documentation of the NixOS hardware configuration file and
    + What each setting means, as well as
    + Usage, snippets and best practices

## Filesystem Structure
### Folders
- /etc/ : System miscellenous files for references such as Configurations
    - nixos/ : NixOS-related Configuration files

### Files
- /etc/nixos/configuration.nix
    - For Software-related system configurations, such as
        + Bootloader
        + Default Packages
        + Disk Label
        + User Management
        + Package Management
        + Firewall
        + System Version
- /etc/nixos/hardware-configuration.nix
    - For Hardware-related system configurations, such as
        + Boot devices
        + Kernel Modules
        + Disk and Partition Management
        + Filesystems table (/etc/fstab) configurations
        + Devices
        + Host system
        + Interfaces
        + Platforms

## Configuration Settings and Values
### Configuration File Information
+ File Type: flake

### Synopsis/Syntax
- Rules
    + Please separate all elements in a list with a space or newline delimiter (as long as there is a separation)

- Importing of modules are made in '{}:'
    - Typical imports
        + config
        + pkgs
        + ... (others)
    ```
    { configurations, files, modules, package-names, ... }:
    ```

- Configuration Settings and Value Mappings are defined in '{}'
    ```
    {
        # List Values
        key = 
            [
                List 
                values 
                here 
                ...
            ];

        # Boolean
        key.settings = true|false;

        # String
        key.settings = "value";

        # Dictionary/Associative Arrays (Key-Value Mappings)
        key1.settings = {
            key2 = value2;
            key3 = value3;
            key4 = value4;
        };

        # Inheritance using the 'with' keyword
        # - basically, this allows you to import the specified packages so that you do not need to prefix the packages with the package family (i.e. with pkgs => [package-name] instead of pkgs.[package-name])
        key = with [modules ...]; [
            Element-1
            Element-2
            Element-3
            Element-4
        ];
    }
    ```

### Configuration Settings
- imports : Import external nix configuration settings files 
    ```
    {
        imports = 
          [ 
            ./config-files.nix
          ];
    }
    ```

- Bootloader settings
    - boot : Boot-related hardware settings
        - .initrd : Initial Boot Resource Directory settings
            - `.availableKernelModules = [ ... ];` : Specify a list of available kernel modules on startup
                - Example Kernel Modules
                    + ata_piix
                    + ohci_pci
                    + ehci_pci
                    + ahci
                    + sd_mod
                    + sr_mod
            - `.kernelModules = [ ... ];` : Specify a list of kernel modules to initialize on startup
        + `.kernelModules = [ ... ];` : Specify a list of Boot-related Kernel Modules
        + `.extraModulePackages = [ ... ];` : Specify a list of extra boot-related module packages

- Filesystem settings
    - fileSystems : Disk Filesystem-related settings
        - `."[your-filesystem-mount-points]" = { attributes = values; ... };` : Specify the attributes and key-value mappings for the specified filesystem mount point/path
            - Parameters
                - your-filesystem-mount-points : Specify the filesystem partition's mount point/directory (i.e. "/", "/boot", "/home")
                    + Type: String
            - Attributes
                - `device = "[static-partition-path|UUID]"` : Specify the device location
                    - Device/Disk Paths
                        + Using static partition : "/dev/disk/[filesystem-disk{partition-number}"
                        - Using UUID : "/dev/disk/by-uuid/[your-disk-uuid]"
                            + You can find your UUID using 'blkid [disk-label]{partition-number}'
                - `fsType = "filesystem-type"` : Specify the device/partition's filesystem type
                    - Filesystem Examples
                        + ext4

- Swap file settings
    - `swapDevices = [ ... ];` : Specify a list of swapfile/devices

- System Network Management settings
    - networking : Network Management settings
        - `.useDHCP = [dhcp-library] [true|false];` : (Default) Enable/Disable the use of DHCP on a system level
            - DHCP Libraries
                + lib.mkDefault
        - .interfaces : Manage system Network Interfaces
            - .[interface-name] : Manage the target network interface
                - `.useDHCP = [dhcp-library] [true|false];` : Enable/Disable the use of DHCP for this particular network interface
                    - DHCP Libraries
                        + lib.mkDefault

- Nix packages
    - nixpkgs : Manage Nix package management settings
        - `.hostPlatform = [library] "architecture/platform";` : Specify the Host system's architecture/platform
            - Libraries
                + lib.mkDefault
            - Host System Platform/Architectures
                + x86_64-linux : Linux 64-bit CPU

- Virtualisation Machine settings
    - virtualisation : Manage Virtualisation and Hypervisor settings
        - .virtualbox : Manage VirtualBox settings
            - .guest : Manage VirtualBox Guest-related settings
                + `.enable = [true|false];` : Enable/Disables VirtualBox Virtual Machine guest usage

## Re-build Steps
- Edit 
    - /etc/nixos/configuration.nix
        - For Software-related system configurations, such as
            + Bootloader
            + Default Packages
            + Disk Label
    - /etc/nixos/hardware-configuration.nix
        - For Hardware-related system configurations, such as
            + Filesystems table (/etc/fstab) configurations

- Rebuild updated configuration file
    ```bash
    sudo nixos-rebuild switch
    ```

## Wiki

### Generating Configuration File
- Generate initial configuration modules before the base/root filesystem installation
    - Explanation
        - This will generate the NixOS system configuration files (containing NixOS's recipe/installing configs) for you to edit 
            + before you run 'nixos-install' to bootstrap the distribution's base filesystem into the mount point's root directory
        - 2 Files
            + configuration.nix : Software configuration and specifications
            + hardware-configuration.nix : Hardware configuration and specifications
    ```bash
    nixos-generate-config --root [root-partition-mount-point]
    ```

- Edit the generated configuration file
    - Explanation
        + Uncomment all settings you want in your system
    ```bash
    $EDITOR [root-partition-mount-point]/etc/nixos/configuration.nix
    ```

- Perform initial bootstrap base installation
    - Explanation
        + This is only performed once at the start
        + This will bootstrap install the base/root filesystem structure into the mounted root filesystem partition
    - Defaults
        - The default root partition mount point is '/mnt'
            + Set '--root [root-partition-mount-point]' to explicitly specify the root mount point
    ```bash
    nixos-install --root [root-partition-mount-point]
    ```

## Templates
### hardware-configuration.nix
#### Default
```nix
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ ];

  boot.initrd.availableKernelModules = [ "ata_piix" "ohci_pci" "ehci_pci" "ahci" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."[partition-mount-path]" =
    { 
      device = "/dev/disk/by-uuid/[partition-uuid]";
      fsType = "[filesystem-type]";
    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s3.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # (Optional) VirtualBox-related settings
  virtualisation.virtualbox.guest.enable = true;
}
```

## Resources

## References

## Resources

