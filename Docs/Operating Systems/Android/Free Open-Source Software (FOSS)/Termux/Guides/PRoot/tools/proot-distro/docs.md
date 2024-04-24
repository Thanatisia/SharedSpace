Termux PRoot wrapper/CLI utility: proot-distro - Documentations
===============================================================

## Information
### Package 
- Repositories
    - GitHub
        + [termux/proot-distro](https://github.com/termux/proot-distro) : A Bash script wrapper for utility proot for easy management of chroot-based Linux distribution installations. It does not require root or any special ROM, kernel, etc. Everything you need to get started is the latest version of Termux application

### Supported Distributions
> Please refer to [termux/proot-distro](https://github.com/termux/proot-distro) for the latest updates and list

+ alpine: Alpine Linux (edge)
+ archlinux: Arch Linux ARM
+ artix: Artix Linux (AArch64 only)
+ debian: Debian (stable)
+ debian-oldstable: Debian (old stable)
+ deepin: Deepin (beige)
+ fedora: Fedora 39 (AArch64 only)
+ manjaro: Manjaro (AArch64 only)
+ openkylin: OpenKylin (Yangtze)
+ opensuse: OpenSUSE (Tumbleweed)
+ pardus: Pardus (yirmibir)
+ ubuntu: Ubuntu (23.10)
+ ubuntu-lts: Ubuntu (22.04)
+ ubuntu-oldlts: Ubuntu (20.04)
+ void: Void Linux

## proot-distro
### Synopsis/Syntaxes
```bash
{proot-distro|pd} [action] {options} <arguments>
```

### Parameters
- Positionals
    - action : Specify the action to execute
        - Actions
            - `{backup|bak|bkp} {options} <arguments> [installed-distribution-name]` : Backup the specified distribution and its plug-in into a tarball archive; The contents of backup can be either printed to stdout for further processing or written to a file
                - Options
                    + `--output [output-tarball-file-name]` : Output the tarball to the specified filename
            + `{clear|cl}` : Clear downloads cache
            + `{install|i} {options} <arguments> [distribution-name]` : Install a base distribution
                - Options
                    + `--override-alias [new-distribtuion-name]` : Rename the distribution during installation time; This will create a copy of the distribution plug-in; Copied plug-in has following name format <name>.override.sh and is stored in directory with others ($PREFIX/etc/proot-distro).
            + `{list|li|ls}` : List all distributions
            + `{login|sh} {options} <arguments> [installed-distribution-name]` : Login/Chroot into the installed chroot environment
                - Options
                    - With Arguments
                        + `--bind [host-system-volume]:[chroot-container-volume]`: Mount volumes from host system into the chroot container; Similar to docker's `-v [host-system-volume]:[container-volume]`; This takes priority over `--isolated`
                        + `--kernel [kernel-release-and-compatibility-level]` : Set the kernel release and compatibility level to the given value
                        + `--user [username]` : Login/Chroot into the distribution as the specified user
                    - Flags
                        + --fix-low-ports : Force redirect low networking ports to a high port (2000 + low-port); Use this with software requiring low ports which are not possible without real root permissions
                        - --isolated : Disables mounting of host system volumes into the chroot environment
                            - Note
                                - If this option was given, the following mount points will not be accessible from within the chroot environment
                                    + /apex (only Android 10+)
                                    + /data/dalvik-cache
                                    + /data/data/com.termux
                                    + /sdcard
                                    + /storage
                                    + /system
                                    + /vendor
                        + --no-link2symlink : Disables PRoot link2symlink extension; This will dsiable hard link emulation. You can only use this option if SELinux is disabled or is in permissive mode
                        + --no-sysvipc : Disables PRoot SystemV (SysV) IPC emulation. Try this option if you experience crashes
                        + --no-kill-on-exit : Do not kill processes when the shell session is terminated. Typically will cause sessions to hang if you have any background processes running
                        + --shared-tmp : Share Termux's tmp (temporary) directory in the host system with the chroot environment's tmp directory; This takes priority over `--isolated`
                        + --termux-home : Mount the termux home directory in the host system as the user's home directory in the chroot environment; This takes priority over `--isolated`
            + `{remove|rm} [distribution-name]` : Uninstall a distribution
            + `{rename|mv} [installed-distribution-name] [new-distribtuion-name]` : Rename an installed distribution
            + `reset [installed-distribution-name]` : Reinstall an installed distribution; This is a shortcut for `proot-distro remove [distribution-name] && proot-distro install [distribution-name]`
            + `restore [rootfs-tarball-archive]` : Restore a distribution from the provided system root filesystem tarball archive (.tar.xz)
- Optionals
    - With Arguments
    - Flags
        + --help : Display help message

### Usage
- List all distributions
    ```bash
    proot-distro {list|ls}
    ```

- Install distribution
    ```bash
    proot-distro {install|i} [distribution-name]
    ```

- Login/Chroot into the installed chroot environment
    - Login and execute a shell within the specified distribution
        ```bash
        proot-distro {login|sh} [installed-distribution-name]
        ```
    - Login as a specified user and chroot into the distribution
        ```bash
        proot-distro {login|sh} --user {username} [installed-distribution-name]
        ```
    - Chroot and execute a custom command
        ```bash
        proot-distro {login|sh} [installed-distribution-name] -- [custom-command-to-execute] {custom-options} <custom-arguments>
        ```

- Uninstall distribution
    ```bash
    proot-distro {remove|rm} [installed-distribution-name]
    ```

- Rename distribution
    ```bash
    proot-distro {rename|mv} [installed-distribution-name] [new-distribtuion-name]
    ```

- Reinstall distribution
    ```bash
    proot-distro reset [installed-distribution-name]
    ```

- Backup the specified distribution and its plug-in into a tarball archive
    - Notes
        + The contents of backup can be either printed to stdout for further processing or written to a file
    - Backup to a remote destination via SSH
        ```bash
        proot-distro {backup|bak|bkp} [installed-distribution-name] | gzip | ssh [username]@[server-ip|domain|hostname] 'cat > /backups/pd-backup.tar.gz'
        ```
    - Backup locally
        ```bash
        proot-distro {backup|bak|bkp} --output backup.tar.gz [installed-distribution-name]
        ```

- Restore distribution
    ```bash
    proot-distro restore [rootfs-tarball-archive]
    ```

- Clear downloads cache
    ```bash
    proot-distro {clear|cl}
    ```

## Customization
### Adding Distribution
- Create a new distribution definition plug-in script in '$PREFIX/etc/proot-distro' named '<your-distribution-alias.sh>'
    - Explanation
        + This will contains variables with metadata about your image's root filesystem tarball archive
        - Plug-in variables reference
            - DISTRO_ARCH: specifies which CPU architecture variant of distribution to install.
                - Notes
                    + Normally this variable is determined automatically, and you should not set it. 
                    + Typical use case is to set a custom architecture to run the distribution under QEMU emulator (user mode).
                - Supported architectures are: 
                    + aarch64 : ARM 64-bit CPU
                    + arm     : ARM 32-bit CPU
                    + i686    : i686 CPU
                    + x86_64  : x86-64 CPU
            + DISTRO_NAME: a name of distribution, something like "Alpine Linux (3.14.1)".
            - DISTRO_COMMENT: comments for current distribution.
                - Notes
                    - Normally this variable is not needed. 
                        + Use it to notify user that something is not working or additional steps required to get started with this distribution.
            + TARBALL_STRIP_OPT: how many leading path components should be stripped when extracting rootfs archive. The default value is 1 because all default rootfs tarballs store contents in a subdirectory.
            - TARBALL_URL: a Bash associative array of root file system tarballs URLs.
                - Notes
                    + Should be defined at least for your CPU architecture. 
                    + Valid architecture names are same as for DISTRO_ARCH.
            - TARBALL_SHA256: a Bash associative array of SHA-256 checksums for each rootfs variant.
                - Notes
                    + Must be defined for each tarball set in TARBALL_URL.
    - Example plug-in script
        ```bash
        DISTRO_NAME="<your-distribution-name>"
        TARBALL_URL['aarch64']="domain-containing-your-image-rootfs-gz-tarball-archive"
        TARBALL_SHA256['aarch64']="<tarball-archive-sha256-hash>"
        ```
    - Running additional installation steps
        - Explanation
            + Plug-in can be configured to execute specified commands after installing the distribution. 
            + This is done through function distro_setup.
        - Notes 
            + run_proot_cmd is used when command should be executed inside the rootfs.
        ```bash
        distro_setup() {
            run_proot_cmd apt update
            run_proot_cmd apt upgrade -yq
        }
        ```

## Wiki
- Notes
    - On installation,
        + distribution chroot environment containers will be installed to '$PREFIX/var/lib/proot-distro'
    - When logging in,
        + proot-distro will 'jump' into the installation's root filesystem in '$PREFIX/var/lib/proot-distro/installed-rootfs/[installed-distribution-name]'

## Resources

## References
+ [GitHub - termux/proot-distro - Adding distribution](https://github.com/termux/proot-distro#adding-distribution)

## Remarks

