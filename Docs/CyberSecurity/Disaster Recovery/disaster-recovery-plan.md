# Disaster Recovery Plans

```
This is my general Disaster Recovery (DR) plan in case of any downtime, 
including the following, but not all

1. Server downtime
2. Breach and potential Data loss
```

## Table of Contents
+ [Inventory Management](#inventory-management)
+ [Data Backup and Recovery](#data-backup-and-recovery)
+ [Migration](#migration)

## Inventory Management
+ The idea is that all software and hardware purchased and/or used in the company must be recorded in an Inventory Management to ensure that everything are accounted for.
+ This will also
- An inventory documentation should contain the following
    - Software
        + Software/Application name
        + Software model
        + Software brand
        + Software type/category
        + Operating System
        + Purpose
    - Hardware
        + Hardware name
        + Hardware model
        + Hardware brand
        + Hardware type/category
        + Purpose
    - Technologies used
        - i.e.
            + Docker
            + Kubernetes
    - Services
        + Service application/name
        + Server Type
        + Server deployed
        + Target purpose

## Data Backup and Recovery
- Data Backup/Recovery Framework
    - The '3-2-1' backup plan
        + At least 3 copies (inclusive of the original production copy) on 2 different mediums and at least 1 in an off-site backup

- Plan
    1. Copy and archive folders at least once every week
        - Rsync from remote server into backup drive directory
            ```console
            rsync -arv [directory-path] [backup-drive-directory]
            ```
        - Tar archive the directory/folder
            ```console
            tar -cvzf [tar-file].tar.gz [directories-to-compress]
            ```
        - Test and list all contents within tar archive to confirm
            ```console
            tar -tvf [tar-file].tar.gz
            ```
        - Extract the tar archive at least once to ensure backup is stable
            ```console
            tar -xvzf [tar-file].tar.gz
            ```

## Migration
- (Optional) Mount the drives you want to backup
    ```console
    sudo mkdir -p /mnt/testmnt && sudo mount /dev/[partition-disk] /mnt/testmnt 
    ```

- Transfer methods
    - Imaging (via dd)
        ```console
        dd if=[source-disk-or-directory-to-clone] of=[output-path/disk.iso | /dev/device] bs=[block-size]
        ```
    - Tar compress and extract
        ```console
        sudo tar -cvzf full-backup-yyyymmdd-hhmmH.tar.gz /mnt/testmnt
        ```
    - Rsync cloning
        ```console
        rsync -arv /mnt/testmnt /path/to/destination/backup
        ```


