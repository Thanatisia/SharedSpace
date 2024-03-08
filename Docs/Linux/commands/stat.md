# Linux command: stat

## Information
### Description
- stat is a CLI utility that gives information about the file and filesystem. 
    - The command gives information about the file such as 
        + the size of the file, 
        + access permissions and 
        + the user ID and 
        + group ID, 
        + birth time 
        + access time of the file. 
    - Stat command has another feature, 
        + by which it can also provide the file system information. 
+ This is the best tool to use when we want the information of any file.

### Application
- The file information we get from stat
    + File: The name of the provided file. If the provided file is a symlink, then the name will be different.
    + Size: The size of a given file in Bytes.
    + Blocks: Total number of allocated blocks to the file to store on the hard disk.
    + IO Block: The size of every allocated block in bytes.
    + File type: The file may be of the following types: Regular files, special files, directories, or symbolic links.
    + Device: Device number in hexadecimal format.
    + Inode: Inode number of the file.
    + Links: Number of hard links of the file.
    + Access: Access permissions in the numeric and symbolic methods.
    + Context: The field stores SELinux security context.
    + Access: The last time at which the file was accessed.
    + Modify: The last time at which file was modified.
    + Change: The last time the at which file’s attribute or content was changed.
    + Birth: The time at which the file was created

- filesystem information from the stat
    + File: The name of provided file.
    + ID: File system ID in hexadecimal format.
    + Namelen: The maximum length (number of characters) of a file name.
    + Fundamental block size: Total size of each block on the file system.
    + Blocks:
    + Total: Total number of blocks in the file system
    + Free: Total number of free blocks in the file system
    + Available: Total number of free blocks available for non-root users
    + Inodes:
    + Total: Total number of inodes in the file system.
    + Free: Total number of free inodes in the file system.

## Setup
### Dependencies
### Pre-Requisites

## Documentations
### Synopsis/Syntax
```bash
stat {options} <arguments> [directory|filenames ...]
```

### Parameters
- Positionals
    - directory/filenames : Specify the directory/files you want to view the stats of; Separate all entries with a space delimiter
        - Notes
            - If you provide a symlink (symbolic link) file to the stat commes, it will give the information about the symbolic link instead of the original file
                + You need to dereference symlinks first by providing the '-L' option
- Optionals
    - With Arguments
        - `-c '[your-format]' | --format='[your-format]'` : Customize and Format the output instead of using the default output format
            - Output Formats
                + %n : Append newline after each operand's output
                - To obtain all formats, read the man page
                    ```bash
                    man stat
                    ```
        - `--print='[your-format]'` : Print customized output; Unlike '-c|--format', this works like printf whereby it removes all newlines
            - Output Formats
                + %n\n : Provide trailing characters by appending a newline after each line output
                - To obtain all formats, read the man page
                    ```bash
                    man stat
                    ```
    - Flags
        + -f | --file-system : Obtain filesystem information of the drive/device the file is in
        + -L | --dereference : Dereference a symbolink link (symlink) file
        + -t | -terse : Display the information in the terse form

### Usage
- View the stats of a directory/file
    ```bash
    stat [directory|file-name]
    ```

- Display the filesystem information of the drive/device the given file is in
    ```bash
    stat -f [directory|file-name]
    ```

- Display the stats of a symbolic link (symlink) file
    - Notes
        - If you provide a symlink (symbolic link) file to the stat commes, it will give the information about the symbolic link instead of the original file
            + You need to dereference symlinks first by providing the '-L' option
    ```bash
    stat -L [symlink-file]
    ```

## Wiki

## Resources

## References
+ [GeeksForGeeks - stat command in linux with examples](https://www.geeksforgeeks.org/stat-command-in-linux-with-examples/)

## Remarks

