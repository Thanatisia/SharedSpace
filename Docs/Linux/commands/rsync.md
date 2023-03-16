# Documentation - Command : rsync

## Table of Contents
+ [Information](#information)
+ [Setup](#setup)
+ [Documentation](#documentation)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Information

### Description
```
rsync - aka Remote Sync - is a commonly used GNU/linux command for copying and synchronizing files and directories both locally and remotely.

rsync can copy and synchronize your data remotely/locally across directories, disks and networks, perform backups and mirroring between 2 linux machines

Some examples include
    - Data Backup
    - Timed synchronization
    - Data Mirroring (1:1 synchronization)

Comparing with cp, 
    - rsync will do Hash/Differentiation-checking to validate/verify that there are changes, and copy only changed files if there are any existing files. 
    - cp will copy the entire file
```

### Background

## Setup

### Pre-Requisites

### Dependencies
- rsync
    - Using apt-based
        ```console
        sudo apt(-get) install rsync
        ```
    - Using portage
        ```console
        emerge sys-apps/rsync
        ```
    - Using pacman
        ```console
        sudo pacman -S rsync
        ```
    - Using yum
        ```console
        sudo yum install rsync
        ```
    - Using zypper
        ```console
        sudo zypper install rsync
        ```
- OpenSSH : For using SSH; if you want to use SSH during rsync

### Obtaining

### Installing

## Documentation

### Synopsis/Syntax
- Local sync/copy
    ```console
    rsync {options} [source-file/directory] [destination-file/directory]
    ```

- Remote sync/copy
    - local to server
        ```console
        rsync {options} [source-file/directory] [username]@[domain]:[destination-file/directory]
        ```
    - server to local
        ```console
        rsync {options} [username]@[domain]:[source-file/directory] [destination-file/directory]
        ```

### Parameters
- Positionals
    + source-file-directory : Your target source file/directory to synchronize
    + destination-fle-directory : Your target destination file/directory to synchronize to
- Optionals
    - Flags
        + -a : Archive mode; allows copying of files recursively and it also preserves symbolic links, file permissions, user & group ownership and timestamps
        + -f : Force copy
        + -h : Human-readable, output numbers in a human-readable format
        + -r : Copies data recursively; doesnt preserve timestamps and permissions while transferring data
        + -v : Verbose; Display more details to standard output
        + -W : Explicitly want to synchronize the whole file like `cp`; By default, rsync synchronizes changed blocks and bytes only
        + -z : Compress file data
        + --delete : Delete an existing file/directory at the target while syncing IF a file/directory does not exist at the source but already exists at the destination
        + --dry-run : rsync will not make any changes to the files and just shows the output of the command; in a sense, it is like a test execution/installation command that shows the output until you have confirmed that you want to execute the command
        + --progress : Show progress while transferring data with rsync
        + --remove-source-files : Automatically remove/delete source files after a successful transfer; Only do this IF you are sure you want to automatically delete the file/directory specified as the source
    - With Arguments
        + -e [protocol] : To specify the protocol you want to use with rsync
            - Protocols
                + ssh : Use this to copy/sync to and from a remote server via SSH; This is the `ssh` command in your system
        + --bwlimit=[limit] : Specify and set a bandwidth limit while transferring data from one machine to another machine; This helps you to limit I/O bandwidth
            - Limit
                + Type: Integer
        + --exclude [filename(s)] : Exclude files/folders in your sync that you dont want to be transferred
            - Special Characters
                + * : Wildcard; All files
        + --include [filename9s)] : Include files/folders in your sync
            - Special Characters
                + * : Wildcard; All files
        + --max-size='max-size' : Specify the Max file size to be transferred/sync
            - Syntax
                + (x)k : Kilobytes
                + (x)m : Megabytes
                + (x)g : Gigabytes

### Usage
- Copy/sync files and directories locally
    - Files
        + Copy the file and display verbose
        ```console
        rsync -v file.extension /path/to/destination/directory/
        ```

    - Folder/Directory
        ```console
        rsync -av /path/to/source/directory/ /path/to/destination/directory/
        ```

- Copy/sync files and directories remotely (to and from a server)
    - local to server
        ```console
        rsync -av /path/to/source/directory-or-filename username@domain:/path/to/destination/directory/
        ```

    - server to local
        ```console
        rsync -av username@domain:/path/to/source/directory-or-filename /path/to/destination/directory-or-filename
        ```

    - synchronize source and destination target 
        + Delete an existing file/directory at the target while syncing IF a file/directory does not exist at the source, but already exists at the destination
        + use `--delete`
        ```console
        rsync -av --delete /path/to/source/directory-or-filename username@domain:/path/to/destination/directory-or-filename
        rsync -av --delete username@domain:/path/to/source-directory-or-filename /path/to/destination/directory-or-filename
        ```

    - Automatically delete/remove source files after a successful transfer
        + The source file/directory '/path/to/source/directory-or-filename' will be deleted after a successful transfer
        + `Only do this if you are sure you do not want to keep that local copy of the backup in your server`
        ```console
        rsync --remove-source-files -av /path/to/source/directory-or-filename username@domain:/path/to/destination/directory-or-filename
        rsync --remove-source-files -av username@domain:/path/to/source/directory-or-filename /path/to/destination/directory-or-filename
        ```

- Rsync over SSH
    - Copy from remote server to local server
        + -e : To specify the protocol you want to use with rsync
        ```console
        rsync -ave ssh username@domain:/path/to/source/directory-or-filename /path/to/destination/directory-or-filename
        ```

    - Copy from local server to remote server
        + -e : To specify the protocol you want to use with rsync
        ```console
        rsync -ave ssh /path/to/source/directory-or-filename username@domain:/path/to/destination/directory-or-filename
        ```

    - Show Progress while transferring data with rsync
        ```console
        rsync -ave ssh --progress /path/to/source/directory-or-filename username@domain:/path/to/destination/directory-or-filename
        rsync -ave ssh --progress username@domain:/path/to/source/directory-or-filename /path/to/destination/directory-or-filename
        ```

    - Use custom, non-standardized SSH port
        ```console
        rsync -ave "ssh -p [port-number]" --progress /path/to/source/directory-or-filename username@domain:/path/to/destination/directory-or-filename
        rsync -ave "ssh -p [port-number]" --progress username@domain:/path/to/source/directory-or-filename /path/to/destination/directory-or-filename
        ```

- General/Quality of Life
    - Dry run the rsync
        + If you dont know what the command string you wrote will do
        + You can perform a dry run, essentially its like a test run/test install option in certain commands
        - Local
            ```console
            rsync --dry-run -av /path/to/source/directory-or-filename username@domain:/path/to/destination/directory/
            rsync --dry-run -av username@domain:/path/to/source/directory-or-filename /path/to/destination/directory-or-filename
            ```
        - Remote
            - Base
                ```console
                rsync --dry-run --remove-source-files -v /path/to/source/directory-or-filename username@domain:/path/to/destination/directory-or-filename
                rsync --dry-run --remove-source-files -v username@domain:/path/to/source/directory-or-filename /path/to/destination/directory-or-filename
                ```
            - Over SSH
                ```console
                rsync --dry-run --remove-source-files -ve ssh /path/to/source/directory-or-filename username@domain:/path/to/destination/directory-or-filename
                rsync --dry-run --remove-source-files -ve ssh username@domain:/path/to/source/directory-or-filename /path/to/destination/directory-or-filename
                ```

## Wiki

## Resources

## References
+ [tecmint - rsync local/remote file synchronization](https://www.tecmint.com/rsync-local-remote-file-synchronization-commands/)
+ [tecmint - rsync synchronize files with non-standard SSH port](https://www.tecmint.com/sync-files-using-rsync-with-non-standard-ssh-port/)

## Remarks

