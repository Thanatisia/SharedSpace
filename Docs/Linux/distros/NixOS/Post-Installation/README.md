# NixOS - Post-Installation Tasks

```
Collection of tasks/things to do in post-installation (after base installation)
```

## Tasks
### Table of Contents
+ [Update Nix package repository channels](#update-nix-package-repository-channels)
+ [Install essential packages](#install-essential-packages)
- [Edit configuration file](#edit-configuration-file)
    + [System Services](#system-services)
    + [System Network Management](#system-network-management)
    + [Nix Package Manager Settings](#nix-package-manager-settings)
    + [NixOS-related settings](#nixos-related-settings)
+ [Rebuild system configuration](#rebuild-system-configuration)

### Update Nix package repository channels
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
- Upgrade packages
    ```bash
    sudo nix-rebuild switch --upgrade
    ```

### Install essential packages
> Note: You can also add these packages into your '/etc/nixos/configuration.nix' file, and perform 'nix-rebuild switch' to refresh the configuration and install the newly-added packages

- Nix system packages
    - nix-rebuild
        ```bash
        nix-env -iA nixos.nixos-rebuild
        ```

- Networking
    - ssh
        ```bash
        nix-env -iA nixos.openssh
        ```

- Text Editors
    - neovim
        ```bash
        nix-env -iA nixos.neovim
        ```
    - vim
        ```bash
        nix-env -iA nixos.vim
        ```

### Edit configuration file
- Edit the system configuration file '/etc/nixos/configuration.nix'
    ```bash
    $EDITOR /etc/nixos/configuration.nix
    ```

#### System Services
- Enable services
    ```nix
    services.[service-name].enable = true;
    ```

#### System Network Management
- Change hostname
    - Traditional
        ```bash
        hostnamectl set-hostname [new-hostname]
        ```
    - Overwrite '/etc/hostname'
        ```bash
        echo -e "new-hostname" | tee /etc/hostname
        ```
    - Change the line 'networking.hostName' to your target hostname
        ```nix
        networking.hostname = "your-hostname";
        ```

#### Nix Package Manager Settings
- Enable garbage collection
    - Add the following line at the end of the configuration file before closing the configuration
        - Garbage Collection Attributes
            + `automatic = {true|false}` : Enable/Disable automatic garbage collection
            - `dates = "[period]"` : Specify the period of time to perform the Garbage collection
                - Periods
                    + weekly : Remove garbage packages weekly
            - `options = "{options} <arguments>"` : Specify additional options to parse into the garbage collector; Format: `{options} <arguments>`
                - Options
                    + `--delete-older-than {N}d` : Delete unnecessary files that are older than the specified period (i.e. {N}d = N days; 7d = Older than 7 Days)
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

    - Validate garbage collector by listing active timers
        ```bash
        systemctl list-timers
        ```

#### NixOS-related settings
- Enable auto-update
    - Add the following line at the end of the configuration file before closing the configuration
        ```nix
        {
            ...
            # Automatic system update
            system.autoUpgrade = {
                enable = true;
            };
        }
        ```

### Rebuild system configuration
- Perform configuration rebuild
    ```bash
    sudo nixos-rebuild switch
    ```

## Wiki

## Resources

## References
+ [ItsFoss - Things to do after installing NixOS](https://itsfoss.com/things-to-do-after-installing-nixos/)

## Remarks

