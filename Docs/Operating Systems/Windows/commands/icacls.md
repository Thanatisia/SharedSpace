# Documentation - Command : icacls

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
icacls is the Integrated Control Access Control Lists, a Command Line Utility that handles the Access Control List and permissions of a NTFS filesystem folder within Windows.
    - think of this as the smbpasswd of the Samba (SMB) file sharing utility/system.
icacls is the replacement of the cacls sys32 utility (deprecated).

icacls allows you to
    - grant permissions 
    - deny permissions
    - remove permissions
    from a file/folder via switches.
```

## Setup

### Pre-Requisites
- Understand the following concepts
    + ACL : The Windows NTFS Filesystem Access Control List

## Documentation

### Synopsis/Syntax
```batchdos
icacls [object] {options <arguments>}
```

### Parameters

- Positionals
    - object : The target Network Shared Drive object of type [file | folder | volume]
        - Types
            - file : The target Network Shared Drive folder's file path and file name
                + Format: filename.extension
            - folder : The target Network Shared Drive folder's path and name
                + Format: {domain\}folder_path\folder_name
            - volume : A File Share in a Network Shared Drive/File Server
                + Format: \\shared_drive_name\path\to\file|folder
    
- Optionals
    - Flags
        + /c : Ignore Errors
        + /q : Quiet mode; Suppress success messages
        + /T : Recursively backup files/folder ACLs
        + /? : Display this help menu and detailed documentation
    - Commands
        + /restore [backup-acl-folder] : Restores the target file/folder's ACL/permission back to the permissions of the specified backup ACL folder
        + /save [destination-folder] : Save the file/folder ACLs into the specified destination folder
    - Switches
        + /deny [user_id]:[permission-code(,s)] : Revoke access for the specified username/id to the target folder/file
        + /grant [user_id]:[permission-code(,s)] : Grant the specified permission code to the specified username of the target file/folder
        + /remove [user_id] : Remove user permissions to a file/folder
    - Inheritance
        - /inheritance:[argument] : Manage the inheritance of the specified target object
            - Arguments
                + d : Disable Inheritance
                + e : Enable Inheritance
                + r : Disable and Remove all occurences of inherited ACEs from the object
        + /reset : Reset a file/folder's inheritance; Remove all permissions and the file will inherit the parent folder's permissions
    - Integrity Level
        + /setintegritylevel {U | L | M | H | S | I} : Setting the integrity level for Non-Admin Users to a file/folder

### Usage

- View permissions/ACL of a folder
    ```batchdos
    icacls [folder_name]
    ```

- Recursively backup files and folder's ACLs into the destination folder as a file
    ```batchdos
    icacls [source-folder-path] /save [destination-folder] /T
    ```

- Restore a file/folder's ACLs back to a backed-up ACL file
    ```batchdos
    icacls [target-folder-path] /restore [backup-acl-folder]
    ```

- Grant permission
    - Files
        - Full Permissions to user 'your_username' on file 'myfilename'
            ```batchdos
            icacls myfilename.txt /grant your_username:F
            ```
    - Folders
        - Read Permission to user 'your_username' on folder 'MyFolder'
            ```batchdos
            icacls MyFolder /grant your_username:R
            ```

- Grant special permissions
    > Enclose the subsequent permissions in parenthesis '()'
    - Folders
        - Delete Permission and Read data/list directory Permission to user 'your_username' on folder 'MyFolder'
            ```batchdos
            icacls MyFolder /grant your_username:(D,RD)
            ```

- Deny permission
    - Files
        - Full Permissions of user 'your_username' to file 'myfilename'
            ```batchdos
            icacls myfilename.txt /deny your_username:F
            ```
    - Folders
        - Full Permissions of user 'your_username' to folder 'MyFolder'
            ```batchdos
            icacls MyFolder /deny your_username:(F)
            ```

- Remove permission
    - Files
        - Remove all permissions for user 'your_username' to file 'myfilename.txt'
            ```batchdos
            icacls myfilename.txt /remove your_username
            ```
    - Folders
        - Remove all permissions for user 'your_username' to folder 'MyFolder'
            ```batchdos
            icacls MyFolder /remove your_username
            ```

- Restrict Non-Admin users to Modify a file/folder
    - Set the Integrity Level of the file 'myfilename' to "High"
        ```batchdos
        icacls myfilename.txt /setintegritylevel H
        ```

- Disabling Inheritance
    - Disable inheritance to file '/path/to/file.txt'
        ```batchdos
        icacls /path/to/file.txt /inheritance:d
        ```

- Enable Inheritance
    - Enable inheritance to file '/path/to/file.txt'
        ```batchdos
        icacls /path/to/file.txt /inheritance:e
        ```

- Disabling and Remove all occurences of Inheritance from object
    - Disable and remove inheritance to file '/path/to/file.txt'
        ```batchdos
        icacls /path/to/file.txt /inheritance:r
        ```

- Reset file/folder's Inheritance after removing
    - Reset the Inheritance of file 'file.txt' quietly and compress the errors 
        ```batchdos
        icacls file.txt /q /c /reset
        ```

- Granting/Denying Permissions in different inheritance levels
    - NOTES
        - Different Inheritance Levels requires specifying each permission code in a parenthesis
            - Essentially:
                + Each parenthesis represents one inheritance level
    - Grant Full permission to user 'my_user' to folder 'MyFolder'
        ```batchdos
        icacls MyFolder /grant my_user:(F)
        ```

    - Grant Read-only (R) permission to user 'my_user' that applies from the folder 'MyFolder' to the child files and folders '(OI)(CI)'
        ```batchdos
        icacls MyFolder /grant my_user:(OI)(CI)(F)
        ```

## Wiki

### ACLs
- Basics
    + ACL refers to the Windows NTFS Filesystem Access Control List.

- Roles
    + BUILTIN : default system roles
    + NT AUTHORITY : Windows NT Authoritative

- Permissions
    + D : Delete Permission
    + F : Full Permission
    + M : Modify-level Access
    + R : Read Access
    + RD : Read data/list directory Permission
    + W : Write Access
    + X : Executable Access

- Inheritance
    + CI : Container Inheritance; Applies to this directory and subdirectories
    + IO : Inherit-Only; Does not apply to the current file/directory
    + OI : Object Inheritance; Applies to this files and folders; No inheritance or propagation to subfolders

- Integrity Levels
    + Untrusted
    + Low
    + Medium
    + High
    + System
    + Installer

- Filesystem Hierarchy
    > This is the Windows filesystem Hierarchical layer and their permission integrity levels
    - Kernel : Installer
    - Root : System
        - User-Space
            - Admin : High
            - User : Medium
                - Applications
                    - Launch Automatically : Untrusted
                    - Cannot Write to Registry/Limited Access : Low

### Defaults
+ By Default, without any flags, icalcs will return the ACL permissions assigned to the object

## Resources

## References
+ [adam the automator - icacls](https://adamtheautomator.com/icacls/)

## Remarks

