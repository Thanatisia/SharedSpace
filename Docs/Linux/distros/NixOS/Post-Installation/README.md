# NixOS - Post-Installation Tasks

```
Collection of tasks/things to do in post-installation (after base installation)
```

## Tasks
### Table of Contents
+ [Update Nix package repository channels](#update-nix-package-repository-channels)

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
- Edit configuration file '/etc/nixos/configuration.nix'
    ```bash
    $EDITOR /etc/nixos/configuration.nix
    ```

- Enable services
    ```nix
    services.[service-name].enable = true;
    ```

### Rebuild system configuration
- Perform configuration rebuild
    ```bash
    sudo nixos-rebuild switch
    ```

## Wiki

## Resources

## References

## Remarks

