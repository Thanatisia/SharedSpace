# Command: find

## Information
### Basics
```
A basic file searcher CLI utility that is powerful in the terminal for file management
```

## Setup
### Dependencies

### Pre-Requisites

## Documentation
### Synopsis/Syntax
```console
find [directory] {options} <argument> [search-keyword]
```

### Parameters
- Positionals
- Optionals
    - With Arguments
        - `-atime [access-time]` : Find files with the specified access time
        - `-exec [command-to-exec]` : Specify a command to execute to the found files
        - `-group [group]` : Find files belonging to the specified group
        - `-iname [filename]` : Find a specific file and ignore the case
        - `-mtime [modification-time]` : Find files with the specified modification time
        - `-name "file-name" : Specify a target file name
        - `-path [target-path]` : Specify a target path to search (If you do not want to use the positional argument 'directory')
        - `-perm [permission]` : Specify the permission of a file you want to find (r = read, w = write, x = execute, 775=rwxrwxr-x)
        - `-regex "regex-pattern" : Search for files using a Regular Expression (Regex) pattern
        - `-size [size-format]` : Specify the target size to search for; Format of the size input: `{size-switch}[size][suffixes]`
            - Size Format
                - Switch
                    + '+' : More than
                    + '-' : Less than
                - Suffixes
                    + 'b' : For 512-byte blocks (This is the default if no suffix is used)
                    + 'c' : For Bytes (Character)
                    + 'w' : For 2-byte words
                    + 'k' : For Kilobytes (units of 1024-bytes)
                    + 'M' : For Megabytes (units of 1048576-bytes, or 1024K)
                    + 'G' : For Gigabytes (units of 1073741824-bytes, or 1024M, or (1024*1024)K)
        - `-type [type-format]` : Specify the type you want to search for
            - Type Formats
                + d : Directory/folder
                + f : File
                + l : Symbolic links
        - `-user [username]` : Find files belonging to the specified username
    - Flags
        + -empty : Find all empty files/folders; To be used with '-type {d|f|l}' to specify the content type
        + -not : Find all results the negative of the specified options
        + -o : OR operator; Allows you to specify multiple conditions
        + -prune : Exclude a target file/directory; Must be used with '-name "file-name"'
        + -print0 : Print only the filename strings excluding the nul-character separators, which basically prevents any whitespaces or other stray characters in the filenames causing problems

### Usage
- Find only files
    ```console
    find [directory] -type f -name "filename"
    ```

- Find only directories/folders
    ```console
    find [directory] -type d -name "folder"
    ```

- Find all git directories
    ```bash
    find [directory] -name ".git" -type d
    ```

- Find files 
    - Using a specific name
        ```console
        find [directory] -name "filename"
        ```
    - Using a file extension
        ```console
        find [directory] -name "*.extension"
        ```
    - Using multiple file extensions
        ```console
        find [directory] -name "*.extension1" -o -name "*.extension2"
        ```
    - bigger than a specific size
        ```console
        find [directory] -type f -size +N{b|c|w|k|M|G}
        ```
    - smaller than a specific size
        ```console
        find [directory] -type f -size -N{b|c|w|k|M|G}
        ```

- Manipulate the found contents
    - list files 
        - using ls
            ```console
            find [directory] -type f -size {+|-}N{b|c|w|k|M|G} -exec ls -sh {} \;
            ```
    - Delete the files
        - Using rm
            ```console
            find [directory] -type f -size {+|-}N{b|c|w|k|M|G} -exec rm -f {} \;
            ```

- Using find to locate files of a certain filter and tar archive it
    - Using '-exec'
        - Compress and archive using xz
            ```bash
            find [root-path-to-search] -type {f|d} -name "specific-name" -size {{+|-}N{K|G|B}} {other-options ...} -exec tar -cJvf [output-tar-file] {} \;
            ```

        - Compress and archive using gz
            ```bash
            find [root-path-to-search] -type {f|d} -name "specific-name" -size {{+|-}N{K|G|B}} {other-options ...} -exec tar -czvf [output-tar-file] {} \;
            ```

        - Compress and archive with the same permissions
            ```bash
            find [root-path-to-search] -type {f|d} -name "specific-name" -size {{+|-}N{K|G|B}} {other-options ...} -exec tar -cvpf [output-tar-file] {} \;
            ```

    - Using 'xargs'
        - Compress and archive using xz
            ```bash
            find [root-path-to-search] -type {f|d} -name "specific-name" -size {{+|-}N{K|G|B}} {other-options ...} -print0 | xargs -0 tar --null -cJvf [tar-file]
            ```

        - Compress and archive using gz
            ```bash
            find [root-path-to-search] -type {f|d} -name "specific-name" -size {{+|-}N{K|G|B}} {other-options ...} -print0 | xargs -0 tar --null -czvf [tar-file]
            ```

## Wiki

## Resources

## References
+ [Snapshooter - learn - linux - find](https://snapshooter.com/learn/linux/find)
+ [Superuser - Questions - 204564 - How can I find files that are bigger/smaller than x bytes?](https://superuser.com/questions/204564/how-can-i-find-files-that-are-bigger-smaller-than-x-bytes)

## Remarks

