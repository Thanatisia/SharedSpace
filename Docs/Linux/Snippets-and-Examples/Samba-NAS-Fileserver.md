# Samba (SMB) File Server use-cases, Snippets and Examples

```
Samba (SMB) is a Network File Sharing protocol that is commonly used with CIFS for Mounting, hence commonly labelled as 'SMB/CIFS'.

SMB is cross-platform and used in many different Operating Systems
    - such as
        + GNU/Linux : SMB/CIFS
        + Windows : Network Shared Drive
```

## Snippets
- Basic setup
    - Installing Dependencies
        - Packages
            + samba     : Optional - if you are running a samba server
            + smbclient : Used to communicate with a SMB server
            + cifs-util : Used for mounting
        - Using package manager
            - apt-based
                ```console
                sudo apt install smbclient cifs-utils
                ```
            - pacman-based
                ```console
                sudo pacman -S smbclient cifs-utils
                ```
    - List all shares
        ```console
        smbclient -L //[your-ip-address]
        ```

- Mount a Samba Network File Server
    - Make mount point
        ```console
        sudo mkdir [mount-directory]
        ```
    - Mount SMB drive (using cifs)
        ```console
        sudo mount -t cifs -o username=[fileserver-username] //[fileserver-ip-address]/[share-name] [mount-point]
        ```

- To permanent mount the share to a folder on bootup
    - Add file server entry to your filesystems table (/etc/fstab)
        ```console
        //[fileserver-ip-address]/[share-name] [mount-point] cifs username=[fileserver-user-name],password=[fileserver-user-password],iocharset=utf-8,file_mode=0777,dir_mode=0777
        ```

## Resources
+ [chrismiller - mount samba share](https://chrismiller.com/mount-samba-share-in-ubuntu/amp)

## References

## Remarks

