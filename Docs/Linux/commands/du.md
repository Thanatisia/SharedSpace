# Linux command - Disk Usage

```
du - known as Disk Usage - is a Linux systems CLI utility that is used for finding all files in a directory and obtaining the sizes of the files/folders
```

## Information

## Documentations
### Synopsis/Syntax
```console
du {options} <arguments> [target-directory]
```

### Parameters
- Positionals
- Optionals
    - With Arguments
        + `-B | --block-zie=[size]` : Scale sizes to the specified block size before printing to standard output
        + `-d | -max-depth=[depth]` : Specify a maximum depth of directories; print total for directory only if it is at the specified depth or lower
    - Flags
        + -0 | -null : End each output line with NULL
        + -a : Display disk usage information for all files and directories, including hidden ones
        + –apparent-size : Print apparent sizes instead of disk usage
        + -c | -total : Show the total disk usage in addition to individual usage for directories and files
        + -h | -human-readable : Print/display the output sizes in human-readable format
        + -S | -separate-dirs : Dont include size of subdirectories; for directories only
        + -s | -summarize : Get the total size of the specified folder/directory
        + -time : Show the time of last modification of the file or directory
        + -x | -exclude : Excludes specific directories or files from disk usage calculation based on pattern or names

### Usage
- Display/Print in human-readable format
    ```console
    du -sh [directory-path]
    ```

- Display the total size of a folder in human-readable format
    ```console
    du -sh [directory-path]
    ```

- Print directories and files that are consuming the most disk space
    - Explanation
        - sort : Sort the results of du
            - Parameters
                + -n : Sort by number (numerical value)
                + -r : Sort in reverse order
        - head : Obtain the top N results after the shuffling of sort
            - Parameters
                + `-n N` : Specify the top N results of a standard input you want to get
    ```console
    du -a -x [directories] | sort -n -r | head -n 10
    ```

## Wiki

## Resources

## References
+ [GeeksForGeeks - du command line examples](https://www.geeksforgeeks.org/du-command-linux-examples/)

## Remarks

