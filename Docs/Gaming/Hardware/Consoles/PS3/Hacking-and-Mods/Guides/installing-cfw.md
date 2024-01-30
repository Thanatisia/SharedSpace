# PS3 Hacking Guide

## Setup
### Dependencies
- EVILNAT 4.90 (Cobra 8.4) CFW
    - PS3 Custom Firmware
    - Download 
        - [here](https://www.psx-place.com/threads/cfw-4-90-evilnat-cobra-8-4-cex-dex-pex-d-pex.39743/)
            + File name should be something along the lines of 'CFW 4..90 Evilnat Cobra 8.4 [PEX].rar'

- PyPS3checker
    - PS3 custom firmware validator
    - Download 
        + from the releases in [littlebalup/PyPS3tools](https://github.com/littlebalup/PyPS3tools)

- Multiman
    + A custom firmware tool, a backup manager and a file manager with many other extra features
    + This will be used in the custom firmware
    - Download 
        + from [Brewology Store - Multiman](https://store.brewology.com/multiman.php)

### Pre-Requisites
- Note your PS3 Model
    + Not all PS3 models can be jailbroken
    + You can check your model [here](https://techjury.net/blog/can-a-ps3-be-jailbroken/)

- Prepare a FAT32 USB Stick
    + Recommended Size: >= 8GB
    - Purpose:
        + Create a copy of the flash memory that you will dumped from the PS3 for recovery purposes
        - Install and hold a Custom Firmware which you will flash from the USB flashdrive into the PS3
            - Recommended
                - CFW: 4.90 EVILNAT (Cobra 8.4) : Uses the latest 4.90 official firmware for the PS3 - this means all the games should play without any firmware updates required
                    - it also comes with full PS2 game compatibility via a compatibility layer
                        + This requires an original FAT model PS3 for the backwards compatibility via hardware
                        + If you do not have it, the CFW supports software emulation
    - Formatting
        - Using Rufus
            - Specifications
                + Boot Selection: Not Bootable
                + Disk Partition Scheme: MBR/GPT
                + Motherboard Boot Filesystem Label: BIOS/UEFI
                + File System: Large FAT32 (Default)
                + Cluster Size: 32kb (Default)

- If you do not have a jailbreakable PS3
    + You need the homebrew enabler method [here](#jailbreak-using-homebrew-enabler)

### Host System Preparation

### PS3 System Preparation
+ Connect your USB flashdrive into one of the ports on the PS3

### Jailbreak using Custom Firmware
- Jailbreak on the PS3 using the web browser application
    - Open your web browser application in the PS3
        + Go to [ps3toolset](www.ps3toolset.com)
        - The website will prompt you to run the plugin
            + Select 'yes'
        - Take a backup of your flash which is installed on your PS3
            - After the page has loaded, 
                - assuming you have a green tick next to the CFW compatible firmware
                    + This confirms you can jailbreak this model of PS3
                    - Click on the 'Flash Memory' tab
                        - Click 'Save Flash Memory Backup'
                            - Select the USB flashdrive device you inserted previously
                                - i.e.
                                    + /dev_usb[number] : The USB flashdrive device label
                            + Click 'Save'
                            + This will dump the PS3 flash memory to the selected USB flashdrive
                    - Verify that the dump is good
                        - Bring the USB flashdrive to your computer
                            - Drag and drop the dump into 'PyPS3checker' found in the open source repository [littlebalup/PyPS3tools](https://github.com/littlebalup/PyPS3tools)
                                - The number of dangers and warnings is what you want to note
                                    + Have as little as possible  
                    - While the USB flashdrive is still in your computer
                        - Extract and copy the EVILNAT 4.90 Custom Firmware
                            + Extract to the root of your USB flashdrive
                        + Copy the multiMAN PKG file into the root of your USB flashdrive
                    - Now that you have a good flash dump
                        + Plug the USB flashdrive back into the PS3
                    - Patch the flash memory so that it can be jailbroken with a Custom Firmware
                        - Repeat the web browser steps until you are back in the green tick page
                            - Select the 'Flash Memory Patch' option
                                + This will load up the patch data that will be applied to the flash memory in order for the PS3 to accept and install Custom Firmware
                            + Select 'Load patch via HTTP'
                            - Select 'Apply loaded patch'
                                + This will then write the patched flash back into the PS3's loaded flash memory
                                - Note
                                    + This can take afew minutes
                                    + This may look like the progress has frozen
                                    + Do **not** cut the power while the progress is happening as this might brick your hardware
                    - Once the patch is done
                        + You can reboot the PS3
                        - Go to 'System Update'
                            + Click 'Update via Storage Media'
                            - Click 'OK' 
                                + Install the EVILNAT 4.90 [PEX] CFW from the USB flashdrive
                                + Let the installation complete
                    - Once the installation is completed
                        - If you see the 'EVILNAT' bootup splash screen
                            + You should now be fully in a jailbroken environment

### Jailbreak using Homebrew Enabler

### Post-Installation Setup
- Install a backup manager
    - Install multiman
        - Scroll to your USB flashdrive contents
            + Select the multiman PKG file you placed at the root of the USB flashdrive (/dev_usb[Number])
            + Let it install
    - (Optional) Recommended Backup managers
        + ManaGunz
        + IrisMan
        + WebMan

## Documentations

### Backing up games
- Using multiman
    - Notes
        + This is applicable for backing up/dumping PS1, PS2 or PS3 games/data
        + To play PS2 and PS1 games, you need to make sure that you have a FAT model PS3 that supports Backwards Compatibility
    - Go into multiman
        - Insert your game disc into the drive
        - Enter the games tab
            - Scroll up to the top
                + You should see your game
            - Press the 'Triangle' button to open a menu
                - copy : You can tell where to dump the game (i.e. on the HDD or the USB Flashdrive)
                    + Select the storage and 'Yes' to copy the game

## Wiki
### Terminologies
+ CFW : Custom Firmware

## Resources

## References
+ [GitHub - littlebalup/PyPS3tools](https://github.com/littlebalup/PyPS3tools)
+ [Brewology Store - Multiman](https://store.brewology.com/multiman.php)
+ [PSX Place - Threads - CFW 4.90 EVILNAT (cobra 8.4)](https://www.psx-place.com/threads/cfw-4-90-evilnat-cobra-8-4-cex-dex-pex-d-pex.39743/)
+ [TechJury - Blog - Can a PS3 be jailbroken](https://techjury.net/blog/can-a-ps3-be-jailbroken/)
+ [YouTube - Modern Vintage Gamer - Jailbreaking a PS3 Slim in 2024 - Preserve your entire PS3 collection](https://www.youtube.com/watch?v=BkHBEpiF9FI)
+ [YouTube - MrMario2011 - How to Jailbreak Your PS3 on Firmware 4.90 or Lower with PS3 Toolset!](https://www.youtube.com/watch?v=suM4dUAYUPE)

## Remarks