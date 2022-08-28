# Proxmox - Setup guide

## Information
+ [Proxmox URL](https://www.proxmox.com/en/downloads)

## Setup

### Pre-Requisites
- A Disk/Image Writing Utility to create a Proxmox bootable live USB/live CD
    + Balena Etcher
    + Raspberry Pi Imager
    + Rufus
    + dd (Command Line - Destructive, use this as last resort or if you are familiar)
- Downloaded the Proxmox Image ISO
- Plug in Ethernet cable
- Note your Disk Device Label/Name (/dev/sd(X) etc)

### Dependencies

### Setting up Live USB (Installer)
- Using a Disk/Image Writing Utility
    - Open your bootable live USB/CD
	- Select your Proxmox ISO
	- Select your Disk Device Label/Name
	- Select Optional parameters
	- Click "Format"

- Using dd (Disk Destroyer)
    ```console
    dd if=[proxmox-iso-filename] of=[target-disk-name (/dev/sdX etc)] bs=1
    ```

### Installing
```
NOTES:
- Proxmox uses a GUI interface
- Beware of the following, this installation will most definitely format your whole target drive
    + Please backup your important files before performing this
```


## Documentation

## Wiki

## References
+ [YouTube | NetworkChuck | Virtual Machines Pt. 2 (Proxmox install w/ Kali Linux)](https://www.youtube.com/watch?v=_u8qTN3cCnQ)

## Resources

## Remarks