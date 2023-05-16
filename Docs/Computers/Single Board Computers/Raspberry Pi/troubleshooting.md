# Raspberry Pi 4B+ Troubleshoot Guide

```
Troubleshooting compilation list of FAQ, Bugs and Issues encountered
```

## Troubleshooting
- Pi4B+ not booting up
    - Symptoms
        + Red Light blinks but Green Light does not blink
    - Possible Issues
        - Cable/Charger has a problem
            + Unable to provide enough power/voltage to the board
                - i.e.
                    + Undervoltage
        - MicroSD/USB filesystem issue
            + Perform a fsck to check
        - Bootloader Firmware/EEPROM issue
            - Methods
                1. Get a spare microsd card and use rpi-imager and burn the bootloader repair
        - Motherboard issue

