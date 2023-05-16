# HomeLab Setup Guide

```
A rough write-up or documentation of steps to take 
to recreate my homelab setup
```

## Steps

### General
- Setup security
    - Change Root Password
    - Add new user
        - Change user password

### for NAS, File-related Server
- Install Applications
    - Samba SMB
    - Docker
    - Docker compose
- Setup Docker-compose
    - Jellyfin
    - Gitea
    - Nextcloud
    - Metube
- Setup Configurations
    - System
        - Fstab (/etc/fstab)
            - Add NAS drives into fstab 
                - Recommend
                    + Use 'genfstab'
    - Samba
        - Enable Samba
            ```console
            sudo systemctl enable smbd
            ```
        - Start Samba
            ```console
            sudo systemctl start smbd
            ```
        - Add user to samba
            ```console
            smbpasswd -a [username]
            ```
        - Samba config (/etc/samba)

### for Network-related and Utilities Server
- Setup docker-compose
    - VPN Server
        + Wireguard