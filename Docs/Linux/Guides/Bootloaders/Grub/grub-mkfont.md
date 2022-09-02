# Bootloaders - Grub - grub-mkfont

## Information
### DESCRIPTION
```
A GRUB Command Line utility that converts a regular font into a GRUB-readable font format.

- Out of the box, most if not all fonts in the system should not be 
```

### GRUB-readable font formats
+ .pf2

## Setup
### Pre-Requisites 
- Locate the font you want to use
    ```console
    fc-list | grep "target-font"
    ```
    + Get the font path

## Documentation 
### Synopsis/Syntax
```console
grub-mkfont {options} <arguments> [target-font-location]
```

### Parameters
- -o [output-location] : Specify the output location and font filename to convert and save the output font file to
    - Argument
        - output-location : String
- -s [size] : Specify the size of the font
    - Argument
        - size : Integer

### Usage
- Convert your target font to a GRUB-readable font type
    ```console 
    sudo grub-mkfont -o /boot/grub/fonts/file_name.pf2 /path/to/font/file.{ttf|otf}
    ```

## Best Practices
+ Save your fonts in '/boot/grub/fonts' so that you have a constant location for all your GRUB fonts
