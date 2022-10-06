# Documentation - Command : chkdsk

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
Stands for "Check Disk", chkdsk is a Windows command line utility that checks your hard disk for any issues and 
even attempt to fix them, similar to *NIX's 'fsck' (The filesystem checker).
```

## Documentation

### Synopsis/Syntax
```batchdos
chkdsk {options} {volume|{path/}filename}
```

### Parameters

- Positional
    + volume:[drive-letter|mount-point|name] : Specify the drive letter (followed by a colon), mount point or volume name
    + filename : (FAT|FAT32 only) Specify the files to check for fragmentation

- Optionals
    + /? : Displays detailed information
    + /b : (NTFS-only) Re-evaluate Bad Clusters; Re-evaluates Bad Clusters on the volume (implied /R)
    + /c : (NTFS-only) Skip Cycles; Skips checking of cycles within the folder structure
    + /f : Checks for any errors in the disk and Attempt to fix/repair them
    + /I : (NTFS-only) Indexed; Perform a less vigorous check using index entries
    + /L:[size (in kilobytes)] : (NTFS-only) Change the log file size to the specified size in kilobytes. If size is not specified, display current size
    + /r : Checks for any physical sector issues and attempt to fix/repair them
    + /v : (On FAT|FAT32) Displays the full path and name of every file on the disk
    + /x : Force the volume to dismount first if necessary. All opened handles to the volume would then be invalid (implied /F)
    + /forceofflinefix : (NTFS-only; Must be used with '/scan') Bypass all online repairs; all defects found are queued for offline repair
    + /freeorphanedchains : (FAT|FAT32|exFAT-only) Frees any orphaned cluster chains instead of recovering their contents
    + /markclean : (FAT|FAT32|exFAT-only) Marks the volume clean if no corruption was detected. (even if /F was not specified)
    + /offlinescanandfix : Run an offline scan and fix on the volume
    + /perf : (NTFS-only; Must be used with '/scan') Performance flag; Uses more system resources to complete a scan as fast as possible. This may have a negative performance impact on other tasks running on the system
    + /scan : (NTFS-only) Run an online scan on the volume
    + /sdcleanup : (NTFS-only) Garbage collect unneeded security descriptor data (implied /F)
    + /spotfix : (NTFS-only) Runs spot fixing on the volume

### Usage

- Check for any errors in the disk and repair/fix them
    ```batchdos
    chkdsk /f
    ```

- Check for physical sector issues and repair/fix them
    ```batchdos
    chkdsk /r
    ```

## Wiki

## Resources

## References
+ [YouTube | NetworkChuck | 40 Windows Commands you NEED to know (in 10 Minutes)](https://www.youtube.com/watch?v=Jfvg3CS1X3A)

## Remarks

