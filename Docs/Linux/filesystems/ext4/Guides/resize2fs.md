# ext4 Filesystem - Resizing filesystem using resize2fs

## Information
### Summary
- The 'resize2fs' program (pronounced as resize to filesystem), is a CLI utility for handling the resizing of the filesystem 
    + after partitions have been modified
+ After resizing partitions using parted, the filesystem needs to be notified of the update as well as adjusted accordingly

## Setup
### Dependencies
+ e2fsprogs : Package

### Pre-Requisites

## Documentations
### Synopsis/Syntax
```console
resize2fs {options} [disk-label]<partition-number> {new-size}
```
### Parameters
- Positionals
    - disk-label : Specify the disk device label/name that you wish to adjust
        + Type: String
        - Format: 
            + AHCI SATA: /dev/sdX
            + NVME: /dev/nvme[device-number]np[partition-number]
            + Loopback: /dev/loop[device-number]p[partition-number]
    - partition-number : Specify the partition number of the disk label you wish to adjust
        + Type: Integer
    - new-size : Specify the new size you want to adjust to
        + Type: String
        + Format: `x {GB|GiB|MB|MiB|KB|KiB}`
        + Defaults: By default, resize2fs will automatically adjust and fill up that partition to all take up all remaining space
- Options

### Usage

## Wiki

## Resources

## References

## Remarks

