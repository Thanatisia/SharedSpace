# Linux System Troubleshooting and Triaging

## Information
### Description
+ This is step 1 to investigating the issues that is happening to your system
+ The issue has not yet been determine and can either be hardware-caused or software-related

## Setup

### Dependencies
- Components
    + USB flashdrive (with a linux distro LiveUSB/LiveCD flashed)
    - At least 1 Linux distro LiveUSB/LiveCD ISO Image to boot into for the triaging process
        - Recommended
            + Debian Linux (latest version) : Stable, doesnt change as much

### Pre-Requisites
- Prepare a Linux LiveUSB/LiveCD
    - NOTE
        - The following steps will remove and delete all contents on the USB flashdrive as the image will be flashed onto the drive
            + Please ensure that the drive is backed up and/or is brand new/unused
    - Standard single ISO/Image flash
        - Using rufus
            + Download rufus
            + Select your target USB flashdrive to flash into
            + Select the LiveISO image to burn
        - Using Balena Etcher
            + Download Balena Etcher
            + Select your target USB flashdrive to flash into
            + Select the LiveISO image to burn
        - Using Raspberry Pi Image Maker
            + Download RPI Image Maker
            + Select your target USB flashdrive to flash into
            + Select the LiveISO image to burn
    - Multiboot
        - Using ventoy
            + Download ventoy
            + Startup ventoy
            + Select your target USB flashdrive to flash into
            + Reformat and install ventoy into the USB flashdrive
            + After installing, copy the LiveISO image into ventoy

- Boot the LiveUSB Linux Distribution
    + Connect the USB flashdrive to your system
    + Startup your system
    + Enter the bootloader screen by (quickly) pressing the function key during the bootup process (Lookup your manufacturer's motherboard documentation on the function key required to access the device selection)
    + Select your USB flashdrive to enter the LiveISO
    + Enter the system

## Triage and Troubleshooting

### Hardware

### Software


