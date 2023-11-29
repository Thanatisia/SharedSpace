# Linux command/package - losetup

## Information
```
losetup - which stands for "Loopback Device Setup" - is a Loopback Device Handling CLI utility meant to make managing of Loopback devices easier
```

## Setup
### Dependencies
### Pre-Requisites

## Documentations

### Synopsis/Syntax
```console
losetup {options} <arguments> [path-to-virtual-hard-disk-img]
```
### Parameters
- Positionals
- Optionals
    - With Arguments
        - path-to-virtual-hard-disk-img : Specify the Disk Image you wish to setup with
            Type: String
    - Flags
        + `-P | --partscan` : Partition Scanning; Forces the kernel to scan the partition table on a newly created loop device.
        + `-f | --find {file}` : Find and print the first available loop device; If a file argument is specified, use the found device as the loop device. Otherwise, just print its name

### Usage
- Mount Disk Image and Partitions as loopback devices
    - Explanation
        - Parameters
            + -P : Forces the kernel to scan the partition table on a newly created loop device.
            + -f : Find and print the first available loop device; If a file argument is specified, use the found device as the loop device. Otherwise, just print its name
    ```console
    sudo losetup -Pf [path-to-virtual-hard-disk-img]
    ```

## Wiki

## Resources

## References

## Remarks

