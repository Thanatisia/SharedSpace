# Free and Open Source Software - Cross-Platform - rclone

## Information

### Description
- rclone is a Remote File Synchronization/Cloning CLI utility that allows you to connect to various remote 'cloud' storages like Google Drive and MEGA to pull/clone/download them down remotely via the CLI
    + Imagine rsync but for remote cloud server/platforms

### Project Configuration File Structure
- Default Configuration File Paths
    + Windows: `%APPDATA%\rclone\rclone.conf`
    + Linux: `$HOME/.config/rclone/rclone.conf`

- Remote Host syntax/structure
    - rclone.conf
        ```conf
        [your-remote-session-id]
        type = [remote-platform]
        ...
        ```

### rclone configuration file settings
- your-remote-session-id : Each new `[section/header blocks]` represents the remote platform's profile in your configuration. Each profile contains key-value setting mappings to the server side information (i.e. title, configurations)
    - Key-Value Settings
        + `server_side_across_configs = [true|false]` : Enable/Disable I/O operations between remote server sessions

## Setup
### Dependencies

### Pre-Requisites

### Build from Source

### Installation

### Uninstallation

### Post-Installation Configuration
- Perform initial configuration file setup
    ```bash
    rclone config
    ```

## Documentations

### Synopsis/Syntax
- Default
    ```bash
    rclone [action] [action-options ...] {optionals} <arguments>
    ```

### Parameters
- Positionals
    - action : Specify the action you wish to execute to the remote platform/server
        - Actions
            - `copy [source] [destination]` : Clone/copy/download/pull/sync files between the remote platform and a local directory of your specification
                - Parameters
                    - Positionals
                        - source : Specify the source directory you wish to copy
                            + Local: /path/to/local/clone/directory
                            - Remote Platform: [remote-id]:{target-directory}
                                + Leave 'target-directory' empty if you wish to copy everything from the root as the top-level directory
                        - destination : Specify the target destination directory you wish to copy into
                            + Local: /path/to/local/clone/directory
                            - Remote Platform: [remote-id]:{target-directory}
                                + Leave 'target-directory' empty if you wish to copy everything from the root as the top-level directory
            - `copyurl [file-url] [destination]` : Download the file in the specified URL to the target directory
                - Parameters
                    - Positionals
                        - file-url : Specify the source file URL you wish to download from
                            + Type: String
                        - destination : Specify the target destination directory you wish to download into
                            + Type: String
            - `mount [remote-id]:[mount-directory]` : Mount the whole/entire specified remote platform/session to the specified mount directory/folder on the system
                - Parameters
                    - Positionals
                        - remote-id : This remote id refers to the remote target (added into your ['$HOME'/'%APPDATA%]']/rclone/rclone.conf configuration file) corresponding to a remote server profile that you wish to mount on your local directory
                            + Type: String
                        - mount-dirctory : Specify the mount directory you wish to mount the remote platform to
                            + Type: String
                - Notes
                    + Leave 'target-directory' empty if you wish to copy everything from the root as the top-level directory
            - `move [source] [destination]` : Move files from the source to the destination path of your specification
                - Parameters
                    - Positionals
                        - source : Specify the source directory you wish to move
                            + Local: /path/to/local/clone/directory
                            - Remote Platform: [remote-id]:{target-directory}
                                + Leave 'target-directory' empty if you wish to move everything from the root as the top-level directory (Not Recommended)
                        - destination : Specify the target destination directory you wish to move into
                            + Local: /path/to/local/clone/directory
                            - Remote Platform: [remote-id]:{target-directory}
                                + Leave 'target-directory' empty if you wish to move everything from the root as the top-level directory (Not Recommended)
                    - Optionals
                        - With Arguments
                            + `--files-from [files-list]` : Move only files specified inside the provided file 'files-list' containing a list of all files to move
                        - Flags
            - `ls [remote-id]:{target-directory}` : List all files and directories in the server mapped to the specified remote-id starting from 'target-directory'
                - Parameters
                    - Positionals
                        - remote-id : This remote id refers to the remote target (added into your ['$HOME'/'%APPDATA%]']/rclone/rclone.conf configuration file) corresponding to a remote server profile that you wish to list
                            + Type: String
                        - target-directory : Specify a target top-level root directory you wish to start the listing/searching from
                            + Type: String
                            - Notes
                                + Leave 'target-directory' empty if you wish to copy everything from the root as the top-level directory
                - Optionals
                    - With Arguments
                    - Flags
                        + --human-readable : Print the size output as human readable format (i.e. 1024 = 1KiB)
            - `lsd [remote-id]:{target-directory}` : List all directories in the server mapped to the specified remote-id starting from 'target-directory'
                - Parameters
                    - Positionals
                        - remote-id : This remote id refers to the remote target (added into your ['$HOME'/'%APPDATA%]']/rclone/rclone.conf configuration file) corresponding to a remote server profile that you wish to list
                            + Type: String
                        - target-directory : Specify a target top-level root directory you wish to start the listing/searching from
                            + Type: String
                            - Notes
                                + Leave 'target-directory' empty if you wish to copy everything from the root as the top-level directory
            - `lsf [remote-id]:{target-directory}` : List all files in the server mapped to the specified remote-id starting from 'target-directory'
                - Parameters
                    - Positionals
                        - remote-id : This remote id refers to the remote target (added into your ['$HOME'/'%APPDATA%]']/rclone/rclone.conf configuration file) corresponding to a remote server profile that you wish to list
                            + Type: String
                        - target-directory : Specify a target top-level root directory you wish to start the listing/searching from
                            + Type: String
                            - Notes
                                + Leave 'target-directory' empty if you wish to copy everything from the root as the top-level directory
            - `lsl [remote-id]:{target-directory}` : List all files in the server mapped to the specified remote-id starting from 'target-directory' but list only the modification time, size and path of the objects
                - Parameters
                    - Positionals
                        - remote-id : This remote id refers to the remote target (added into your ['$HOME'/'%APPDATA%]']/rclone/rclone.conf configuration file) corresponding to a remote server profile that you wish to list
                            + Type: String
                        - target-directory : Specify a target top-level root directory you wish to start the listing/searching from
                            + Type: String
                            - Notes
                                + Leave 'target-directory' empty if you wish to copy everything from the root as the top-level directory
                - Optionals
                    - With Arguments
                        + `--min-size [minimum-size]` : Filter all files found to be at least more than the specified minimum-size
                    - Flags
                        + --human-readable : Print the size output as human readable format (i.e. 1024 = 1KiB)
            - `size [remote-id]:{target-directory}` : Obtains and prints the total size and number of objects in the given `remote:path`
                - Parameters
                    - Positionals
                        - remote-id : This remote id refers to the remote target (added into your ['$HOME'/'%APPDATA%]']/rclone/rclone.conf configuration file) corresponding to a remote server profile that you wish to find the size to
                            + Type: String
                        - target-directory : Specify a target top-level root directory you wish to start the listing/searching from
                            + Type: String
                            - Notes
                                + Leave 'target-directory' empty if you wish to copy everything from the root as the top-level directory
                - Optionals
                    - With Arguments
                    - Flags
                        + --json : Format output as JSON
            - `sync [source] [destination]` : Sync the specified source directory to the destination directory
                - Parameters
                    - Positionals
                        - source : Specify the source directory you wish to synchronize
                            + Local: /path/to/local/clone/directory
                            - Remote Platform: [remote-id]:{target-directory}
                                + Leave 'target-directory' empty if you wish to copy everything from the root as the top-level directory
                        - destination : Specify the target destination directory you wish to synchronize with
                            + Local: /path/to/local/clone/directory
                            - Remote Platform: [remote-id]:{target-directory}
                                + Leave 'target-directory' empty if you wish to copy everything from the root as the top-level directory
                    - Optionals
                        - With Arguments
                        - Flags
                            + --create-empty-src-dirs : Create empty directories for any empty source directories
                            + --interactive : Enable interactive mode which will ask users questions
- Optionals
    - With Arguments
        - `--config [configuration-file-path]` : Explicitly specify a custom configuration path containing a 'rclone.conf' file
            - Parameters
                - configuration-file-path : Specify the custom configuration file path
                    + Type: String
    - Flags
        + -P | --progress : Optional argument to display progress of the copy
        + --progress-terminal-title : Use the terminal as the progress bar title
        - Platform-specific
            - Google Drive
                + --drive-shared-with-me : Only show files that are shared with me. Instructs rclone to operate on your "Shared with me" folder (where Google Drive lets you access the files and folders others have shared with you).

### Usage
- List all files and directories in a remote source
    - Explanation
        + remote-id : This remote id refers to the remote target added into your ['$HOME'/'%APPDATA%]']/rclone/rclone.conf configuration file
        - /path/to/files : This refers to the source directory in the remote session you wish to list from as the top-level root directory
            - Notes
                + Leave this empty if you wish to copy everything from the root as the top-level directory
    ```bash
    rclone ls [remote-id]:/path/to/files >> drive-contents-yyyymmdd-HHMMSS.log
    ```

- List all files in a remote source
    - Explanation
        + remote-id : This remote id refers to the remote target added into your ['$HOME'/'%APPDATA%]']/rclone/rclone.conf configuration file
        - /path/to/files : This refers to the source directory in the remote session you wish to list from as the top-level root directory
            - Notes
                + Leave this empty if you wish to copy everything from the root as the top-level directory
    ```bash
    rclone lsf [remote-id]:/path/to/files >> drive-contents-yyyymmdd-HHMMSS.log
    ```

- List all files with only the modification time, size and path of the objects
    - Explanation
        + `--min-size [minimum-size]` : Filter all files found to be at least more than the specified minimum-size
        + remote-id : This remote id refers to the remote target added into your ['$HOME'/'%APPDATA%]']/rclone/rclone.conf configuration file
        - /path/to/files : This refers to the source directory in the remote session you wish to list from as the top-level root directory
            - Notes
                + Leave this empty if you wish to copy everything from the root as the top-level directory
    ```bash
    rclone lsl [remote-id]:/path/to/files
    ```

- List all files bigger than a certain size with only the modification time, size and path of the objects
    - Explanation
        + `--min-size [minimum-size]` : Filter all files found to be at least more than the specified minimum-size
        + remote-id : This remote id refers to the remote target added into your ['$HOME'/'%APPDATA%]']/rclone/rclone.conf configuration file
        - /path/to/files : This refers to the source directory in the remote session you wish to list from as the top-level root directory
            - Notes
                + Leave this empty if you wish to copy everything from the root as the top-level directory
    ```bash
    rclone lsl --min-size [minimum-size] [remote-id]:/path/to/files
    ```

- List all directories in Google Drive
    - Explanation
        + remote-id : This remote id refers to the remote target added into your ['$HOME'/'%APPDATA%]']/rclone/rclone.conf configuration file
        - /path/to/files : This refers to the source directory in the remote session you wish to list from as the top-level root directory
            - Notes
                + Leave this empty if you wish to copy everything from the root as the top-level directory
    ```bash
    rclone lsd [remote-id]:/path/to/files >> drive-directories-yyyymmdd-HHMMSS.log
    ```

- Clone files from a remote source to your local folder
    - Explanation
        + -P : Optional argument to display progress of the copy
        + remote-id : This remote id refers to the remote target added into your ['$HOME'/'%APPDATA%]']/rclone/rclone.conf configuration file
        - /path/to/files : This refers to the source directory in the remote session you wish to clone
            - Notes
                + Leave this empty if you wish to copy everything from the root as the top-level directory
        + /path/to/clone/directory : This refers to the destination local directory you wish to clone to
    ```bash
    rclone copy [remote-id]:/path/to/files /path/to/clone/directory -P
    ```

- Clone files from the local source to your remote destination
    - Explanation
        + -P : Optional argument to display progress of the copy
        + remote-id : This remote id refers to the remote target added into your ['$HOME'/'%APPDATA%]']/rclone/rclone.conf configuration file
        + /path/to/files : This refers to the source directory in the local host you wish to clone/backup
        - /path/to/clone/directory : This refers to the destination local directory you wish to clone to
            - Notes
                + Leave this empty if you wish to copy everything from the root as the top-level directory
    ```bash
    rclone copy /path/to/files [remote-id]:/path/to/clone/directory -P
    ```

- Mount the specified remote platform/session to a mount directory on your system
    - Explanation
        - remote-id : This remote id refers to the remote target (added into your ['$HOME'/'%APPDATA%]']/rclone/rclone.conf configuration file) corresponding to a remote server profile that you wish to mount on your local directory
            + Type: String
        - mount-dirctory : Specify the mount directory you wish to mount the remote platform to
            + Type: String
    ```bash
    rclone mount [remote-id]:[mount-directory]
    ```

### Wiki

#### Google Drive
> Setup

- Pre-Requisites
    - Setup google drive in your rclone configuration file
        - Using 'rclone config'
            - Explanation
                + This will update your rclone configuration file with a new remote host
            - Notes
                - Take note that you will need to sync and authorize rclone to be used by your Google Drive account.
                    - To remove the authentication after usage
                        + Go into your google drive account
                        + Find 'rclone' in 'Accounts authenticated'
                        + Remove access
            ```bash
            rclone config
            ```

> Cloning
- Notes
    - The following usage/snippets is going to assume the following
        + Google Drive remote session profile is 'clone-google-chrome'

- List all files in Google Drive
    ```bash
    rclone ls clone-google-drive: >> drive-contents-yyyymmdd-HHMMSS.log
    ```

- List all files bigger than a certain size with only the modification time, size and path of the objects
    ```bash
    rclone lsl --min-size [minimum-size] clone-google-drive:
    ```

- List all directories in Google Drive
    ```bash
    rclone lsd clone-google-drive: >> drive-directories-yyyymmdd-HHMMSS.log
    ```

- List all Shared With Me drives in Google Drive
    ```bash
    rclone ls clone-google-drive: --drive-shared-with-me >> shared-with-me-contents-yyyymmdd-HHMMSS.log
    ```

- Clone/Download files from google drive to local directory
    - Explanation
        + -P : Optional argument to display progress of the copy
        + clone-google-chrome : This remote id refers to the remote target added into your ['$HOME'/'%APPDATA%]']/rclone/rclone.conf configuration file
        - /path/to/src/directory : This refers to the source directory in the remote session you wish to clone
            - Notes
                + Leave this empty if you wish to copy everything from the root as the top-level directory
        + /path/to/clone/directory : This refers to the destination local directory you wish to clone to
    ```bash
    rclone copy clone-google-chrome:/path/to/src/directory /path/to/clone/directory -P
    ```

- Backup/Upload files from local backup directory to google drive
    - Explanation
        + -P : Optional argument to display progress of the copy
        + clone-google-chrome : This remote id refers to the remote target added into your ['$HOME'/'%APPDATA%]']/rclone/rclone.conf configuration file
        + /your/backup/directory : This refers to the source directory in the local host you wish to clone/backup
        - /path/to/clone/directory : This refers to the destination local directory you wish to clone to
            - Notes
                + Leave this empty if you wish to copy everything from the root as the top-level directory
    ```bash
    rclone copy /your/backup/directory clone-google-chrome:/path/to/clone/directory -P
    ```

- Clone/Download 'Shared With Me' Drives from google drive to local directory
    - Explanation
        + -P : Optional argument to display progress of the copy
        + clone-google-chrome : This remote id refers to the remote target added into your ['$HOME'/'%APPDATA%]']/rclone/rclone.conf configuration file
        - /path/to/src/directory : This refers to the source directory in the remote session you wish to clone
            - Notes
                + Leave this empty if you wish to copy everything from the root as the top-level directory
        + /path/to/clone/directory : This refers to the destination local directory you wish to clone to
    ```bash
    rclone copy clone-google-chrome:/path/to/src/directory /path/to/clone/directory -P --drive-shared-with-me
    ```

- Mount the entire google drive to a mount directory on your system
    ```bash
    rclone mount clone-google-chrome:[mount-directory]
    ```

## Resources
+ [rclone Documentations - Google Drive (drive)](https://rclone.org/drive)
+ [rclone Documentations - Google Drive (drive) - drive shared with me](https://rclone.org/drive/#drive-shared-with-me)

## References
+ [rclone forums - rsync synchronize remote to local](https://forum.rclone.org/t/rclone-syn-remote-to-local/12626/2)

## Remarks

