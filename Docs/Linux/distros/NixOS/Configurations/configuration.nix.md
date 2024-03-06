# NixOS Configurations - configuration.nix schematics and design

## Information
### Summary
- Explanation and detailed documentation of the NixOS configuration file and
    + What each setting means, as well as
    + Usage, snippets and best practices

## Filesystem Structure
### Files
- /etc/ : System miscellenous files for references such as Configurations
    - nixos/ : NixOS-related Configuration files

### Folders
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
    - boot : Boot-related settings
        - .loader : General system bootloader settings and configurations
            - .efi  : (U)EFI Motherboard (BIOS) Bootloader settings
                + `.efiSysMountPoint = "/boot/efi"` : Explicitly specify the EFI boot mount point/directory; Default: /boot/efi
            - .grub : GRUB(2) Bootloader settings; These settings will define the 'grub-install' settings
                + `.device = "[disk-label]:` : Specify the disk label of your boot partition's device (i.e. SATA|AHCI => /dev/sdX, NVME => /dev/nvme[disk-number], Loopback => /dev/loop[disk-number]); Input 'nodev' for EFI only
                + `.enable = [true|false]` : Enable/Disable GRUB bootloader
                + `.efiSupport = [true|false]` : Enable/Disable (U)EFI Support

- System Network Management settings
    - networking : Network Management settings
        - .firewall : Manage system network firewall settings
            - `.allowedTCPPorts = [ ... ];` : Specify a list of allowed (whitelisted) TCP Ports (aka Open Ports)
            - `.allowedUDPPorts = [ ... ];` : Specify a list of allowed (whitelisted) UDP Ports (aka Open Ports)
            - `.enable = true|false` : Enable/Disable Firewall altogether
        - `.hostName = "your-hostname"` : Specify your system hostname; This will update/modify the '/etc/hostname' file
        - .networkmanager : Manage networking using the network service 'NetworkManager'; You can only pick 1 between this and '.wireless'
            + `.enable = [true|false]` : Enable/Disable NetworkManager on your system
        - .wireless : Handle Wireless Networking (Wi-Fi/WLAN) settings and configurations; You can only pick 1 between this and '.networkmanager'
            + `.enable = [true|false]` : Enable/Disable Wireless Networking (Wi-Fi/WLAN) on your system via wpa_supplicant
        - .proxy : Configure Network Proxy (if necessary)
            + `.default = [proxy-url (http://[username]:[password]@[proxy-server-ip|domain]:[proxy-server-port]/)]` : Specify the default network proxy to connect to using the format: 'http://[username]:[password]@[proxy-server-ip|domain]:[proxy-server-port]/'
            + `.noProxy = [localhost-domains,...]` : Specify localhost domains if no proxy is connected; Please separate all domains with a ',' delimiter. Recommended: 127.0.0.1,localhost,internal.domain

- System Time Zone settings
    - time : Set system time settings
        - `.timeZone = "Region/City"` : Specify your system's timezone. Format: Region/City. This will create a symlink 'ln -s /usr/share/zoneinfo/[Region]/[City] /etc/localtime'. You can find your region using 'ls /usr/share/zoneinfo/' and find your city using 'ls /usr/share/zoneinfo/[Region]/'

- System Locales
    - i18n : Internationalisation Properties
        - `.defaultLocale = "[locale]"` : Specify the system locale; Format: [language-code].[encoding-scheme]; Examples: en_US.UTF-8
    - `console = { settings = values; ... };` : Specify console (Keyboard/Terminal/TTY) input settings
        - Settings
            + `font = "foreground/text font"` : Set the system text font and size; Format: `Font[size]`
            + `keyMap = "keymap-country"` : Set the Keyboard Mapping (i.e. us)
            + `useXkbConfig = [true|false]` : Enable/Disable usage of xkbOptions in tty

- System Services
    - services : System Services
        - .openssh : Handle OpenSSH daemon service
            + `.enable = true|false` : Enable/Disable the OpenSSH daemon
        - .printing : Handle the printer (and printing) system service using CUPS
            + `.enable = [true|false]` : Enable/Disable CUPS to print on boot-time
        - .xserver : Handle the Xorg/X11 windowing system service
            + `.enable = [true|false]` : Enable/Disable Xorg/X11 Display Server startup on boot-time
            + `.layout = [keyboard-mapping]` : Configure the Keyboard Mapping Layout in X11 (i.e. "us")
            - .libinput : Handle Touchpad input support 
                + `.enable = [true|false]` : Enable/Disable Touchpad input support
            + `.xkbOptions = [options:...]` : Configure the X Keyboard options; Separate all options with a ':' delimiter; Examples: "eurosign:e,caps:escape"

- System Sound Management
    - sound : Handle System Audio/Sound
        + `.enable = [true|false]` : Enable/Disable sound

- Hardware Settings
    - hardware : Handle hardware driver settings
        - pulseaudio : PulseAudio Audio Driver settings
            - `.enable = [true|false]` : Enable/Disable PulseAudio

- User Management
    - users : Defines a user account; Dont forget to set a password with 'passwd'
        - .groups : Handle groups (/etc/groups)
            - `.[username] = {}` : Create a default group for the current user to be set as the primary group
        - .users : Handle users (/etc/users, /etc/passwd)
            - `.[username] = { properties = values; }` : Define your user and its properties; You can set multiple users by specifying 'users.users.[username] = {properties; ...}'
                - Properties
                    + `initialPassword = "your-password"` : Specify your user's initial password (same as 'passwd [username]')
                    + `isNormalUser = true|false` : Enable/Disable superuser/admin user role for the user
                    + `description = your-description` : Specify a description to set to your user
                    + `extraGroups = [];` : Specify all secondary (extra) groups to assign to the current user; 'wheel' = sudo
                    + `packages = with [modules ...]; [ packages ... ];` : Specify all packages to install for the user using nix; Please separate all list elements with a space/newline delimiter; You can indicate module prefix to packages in the 'with' keyword
                - `.group = "primary-group"` : Set the primary group for the user; Full structure: users.users.[username].group

- System Package Management
    - environment : Manage system environment settings
        - `.systemPackages = with [modules ...]; [ packages ... ];` : Specify all system packages to be installed on a system-level using nix; Please separate all list elements with a space/newline delimiter; You can indicate module prefix to packages in the 'with' keyword; Note: Run 'nix search [package-name]' to search for packages

- Applications/programs
    - programs : Manage individual program settings
        - .mtr : MTR; Some programs need SUID wrappers, these can be configured further or are started in user sessions
            - `.enable = true|false` : Enable/Disable MTR
        - .gnupg : Manage GNU GPG password manager settings
            - `.agent = { properties = values };` : Specify GPG's agent settings
                - Properties
                    + `enable = true|false` : Enable/Disable GNU GPG agent
                    + `enableSSHSupport = true|false` : Enable/Disable SSH support for GNU GPG agent

- NixOS system-related settings
    - nix : Manage nix package management settings
        - `.gc = { attributes = values; ...};` : Manage Nix Package Manager Garbage Collection
            - Garbage Collection Attributes
                + `automatic = {true|false}` : Enable/Disable automatic garbage collection
                - `dates = "[period]"` : Specify the period of time to perform the Garbage collection
                    - Periods
                        + weekly : Remove garbage packages weekly
                - `options = "{options} <arguments>"` : Specify additional options to parse into the garbage collector; Format: `{options} <arguments>`
                    - Options
                        + `--delete-older-than {N}d` : Delete unnecessary files that are older than the specified period (i.e. {N}d = N days; 7d = Older than 7 Days)
            - Examples
                ```nix
                {
                    ...
                    # Automatic garbage collection
                    nix.gc = {
                        automatic = {true|false};
                        dates = "[period]";
                        options = "{options} <arguments>";
                    };
                }
                ```
    - system : Manage NixOS system settings and operations
        - `.autoUpgrade = { attributes = values; ... };` : Manage NixOS system auto-updating
            - Attributes
                + `enable = [true|false]` : Enable/Disable NixOS Auto-update and Auto-upgrading
        - `.copySystemConfiguration = true|false;` : Enable/Disable copying of the NixOS configuration file and link it from the resulting system (/run/current-system/configuration.nix); This is useful in case you accidentally deleted '/etc/nixos/configuration.nix'
        - `.stateVersion = "X.Y"` : Specify the NixOS system state version; Format: X = Major, Y = Minor; This value determines the NixOS release from which the default settings for stateful data (like file locations and database versions) on your system were taken. TLDR: Its the built version

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
            +

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
### configuration.nix
#### Default
```nix
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "[disk-label (SATA|AHCI => /dev/sdX, NVME => /dev/nvme[disk-number], Loopback => /dev/loop[disk-number])]";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "your-hostname"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Region/City";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8 (locale)";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.asura = {
    isNormalUser = true;
    description = "user-description-here";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "[nixos-version (major.minor)]"; # Did you read the comment?
}
```

## Resources

## References

## Resources

