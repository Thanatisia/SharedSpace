# Linux command - Disk Free

```
df - known as Disk Free - is a Linux systems CLI utility that provides information on disk space utilization.

The df command displays information about file system disk space usage on the mounted file system and 
    - retrieves the information from `/proc/mounts` or `/etc/mtab`. 

By default, df command shows disk space in Kilobytes (KB) and 
    + uses the SI unit suffixes (e.g, M for megabytes, G for gigabytes) for clarity
```

## Information
### Summary
- displays a table with columns for:
    + Filesystem: The name of the mounted storage device (e.g., /dev/sda4).
    + Size: The total size of the filesystem in bytes.
    + Used: The amount of space currently occupied by data in bytes.
    + Avail: The amount of free space available in bytes.
    + Use%: The percentage of the filesystem used.
    + Mounted on: The directory where the filesystem is mounted (e.g., /, /home).

## Documentations
### Synopsis/Syntax
```console
df {options} <arguments> [filesystems]
```

### Parameters
- Positionals
    - filesystems : Specify the filesystem/partition label you want to list; By default, df will list all
        - Notes
            + If you specified a filename instead of a filesystem, it will display the filesystem that contains the file
        - Filesystem Examples
            + SATA/AHCI : /dev/sdX{partition-number}
            + NVME: /dev/nvme[disk-number]np{partition-number}
            + Loopback: /dev/loop[disk-number]p{partition-number}
- Optionals
    - With Arguments
        + `-B | –block-size=<SIZE>’ : Scales sizes by SIZE before printing them.
        + `-t | –type=<TYPE>’ : Limits listing to file systems of type TYPE.
    - Flags
        + -a | –all :	Includes pseudo, duplicate, and inaccessible file systems in the output.
        + -h | –human-readable : Prints sizes in a human-readable format using power of 1024.
        + -H | –si : Prints sizes in a human-readable format using power of 1000.
        + -i | –inodes : Lists inode information instead of block usage.
        + -l | –local : Limits listing to local file systems.
        + -P | –portability : Uses POSIX output format for better portability.
        + –sync  : Invokes sync before getting usage info.
        + –total : Elides all entries insignificant to available space and produces a grand total.
        + -T | –print-type  : Prints file system type

### Usage
- Display/Print in human-readable format
    ```console
    df -h [filesystem-label]
    ```

## Wiki

## Resources

## References
+ [GeeksForGeeks - df command line examples](https://www.geeksforgeeks.org/df-command-linux-examples/)

## Remarks
