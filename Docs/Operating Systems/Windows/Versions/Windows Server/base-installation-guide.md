# Windows Server - Installation From Command Line Guide 

```
This is a general documentation on how to install the Windows Server from Command Line via the Installation Media/ISO

This guide can be improved, and is pretty much considered a WIP.

Currently, I am looking at how to generalise this guide (or if it is even possible) to be usable in the case of installing not just Windows Server, but Windows 10 Home, Enterprise, Professional etc.
```

## Information
### Notes
- You need to perform the windows installation from the Windows PE command prompt instance within the Windows installation ISO

## Setup
### Dependencies
+ Window Server ISO

### Pre-Requisites
- Open Command Prompt in Windows Installation ISO Setup
    + Press `Shift + F10`
- Disk/Partition Management
    - DISKPART
        + List Disk
        + List Volume
        + Select Disk
        + Select Partition
        + List Partition
    - To format a drive 
        ```console
        format [drive-letter] {/q}
        ```

### Installation
- Get Installer wim Image File from installer ISO
    + This obtains the image installer file for manual use
    ```dos
    dism /Get-ImageInfo /imagefile:install.wim
    ```
- Apply the image and Bootstrap Base/Root Filesystem to target drive letter
    + This basically creates your C drive
    ```dos
    DISM /apply-image /imagefile:[drive-containing-install-wim]\sources\install.wim /index:[index-of-version-to-install] /applydir:[target-drive-letter-to-bootstrap-to]
    ```
- Setup Bootloader
    + Copy the boot files for Windows Boot Manager (UEFI etc)
    ```console
    bcdboot [root-partition-drive-letter]:\Windows /s [boot-partition-drive-letter]: /f ALL
    ```

## Documentations

## Wiki

## Resources

## References
+ [YouTube - Titus Tech Talk - Windows Server instead of LTSC](https://www.youtube.com/watch?v=anibuEt1pzg)

## Remarks
