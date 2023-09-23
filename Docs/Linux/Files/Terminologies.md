# Some Linux Terminologies

## Disk Management/Partitioning
+ ESP : EFI System Partition; used as a boot partition's filesystem for GPT (Partition Table) in UEFI (Bootloader Firmware) systems
+ Disk Label: Effectively the "name" of the disk; normally represented by '/dev/sdX' for SATA devices, '/dev/nvmeXpN' for NVME devices
+ UUID: The User Unique Identifier (ID); This is typically a randomized unique ID assigned to every disk/drive that is attached to the computer
- Filesystem Type: The filesystem type just refers to the filesystem that the partition is formatted with
    + ext4
    + btrfs
- Partition Label: Typically applies to GPT Partition Table partitions, GPT allows you to create partitions based on names
- Partition Type: The type of partition that was created on formatting
    - Partition Layout
        - MSDOS/MBR : Legacy; and the most common
            + primary
            + logical
            + extended
        - GPT : Modern; >= 2TB Drives
            + primary
            + logical
            + extended
            + Partition Label
- Motherboard Bootloader Firmware: This is the motherboard's firmware capabilities
    + BIOS   : A legacy motherboard firmware
    + (U)EFI : The Unified Extension Firmware Interface; a modern motherboard firmware used as replacement of the BIOS firmware
- Partition Table Label/Format: This is the format/"type" that the disk's Partition Table is formatted with
    + MSDOS  : aka Master Boot Record (MBR) partitioning; Legacy format used with the BIOS motherboard bootloader firmware for disk with max size <= 2TB
    + GPT    : The UEFI/GPT partition table format; Used for disks with max size > 2TB
- Bootloader : The bootloader in Linux is basically a piece of software that tells the Boot manager where the target Operating System to boot is located, and how to boot it
    + GRUB

## Ricing and Customization
+ Display Server : a server utility required to allow the system to draw graphics on the top layer; i.e. xorg/wayland
+ Window Manager : The window manager is the base graphical layer that users will be able to use as a canvas to run other graphical environments, utilities and tools on top of it
+ Desktop Environment : A collection of components built on top of a Display Server (i.e. xorg/wayland) and a Window Manager to form a working environment for general use; Please refer to [Packages Masterlist](packages-masterlist.md) for a full list of components that forms a Desktop Environment

