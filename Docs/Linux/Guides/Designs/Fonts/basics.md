# Linux - Post-Installation Customization - Fonts : Basics

## Information
### DESCRIPTION
```
A general rundown/documentation of your Linux system fonts and post-installation customization (aka 'Ricing') tips n trick

This is essentially a basics including components such as
    - Commands used to find fonts
    - File Locations of Fonts
```

## Introduction
- In an Operating System, fonts (generally) are files/packs containing various graphically-related glyphs to display on the screen.    
    - Fonts are created by referencing various character sets 
        - such as
            + ASCII
            + Unicode
    - Fonts provides glyphs and characters for various categories such as
        - Languages
        - Emojis
        - etc

- From Wikipedia
    ```
    A computer font is implemented as a digital data file containing a set of graphically related glyphs. 
    A computer font is designed and created using a font editor. 
    A computer font specifically designed for the computer screen, and not for printing, is a screen font.
    ```

## Font Formats
- Bitmap Fonts
    - BDF : Bitmap Distribution Format
    - PCF : Portable Compiled Format
    - PSF : PC Screen Format
- Outline/Vector Fonts
    - PostScript Fonts
        + PFA : Printer Font ASCII
        + PFB : Printer Font Binary
    - TTF : TrueType
    - OTF | TTF : OpenType; Built on TrueType
   
## File Locations
> Locations within the Linux Filesystem that handles/contains fonts
+ User fonts : ~/.local/share/fonts
+ System-wide fonts : /usr/local/share/fonts
+ System-wide fonts installed by Package Manager (Should not be modified manually) : /usr/share/fonts

### Structure
```
    / : Root
    |
    |-- usr/
        |
        |-- local/
            |
            |-- share/
                |
                |-- fonts/ : To store system-wide font files
                    |
                    |-- otf/ : Stores all OpenType (otf) fonts
                    |-- ttf/ : Stores all TrueType (ttf) fonts
        |
        |-- share/
            |
            |-- fonts/ : To store system-wide font files installed by a package manager - Should not be modified manually
                |
                |-- otf/ : Stores all OpenType (otf) fonts
                |-- ttf/ : Stores all TrueType (ttf) fonts
    |
    |-- /home
        |
        |-- ~/ : Your user's home directory
            |
            |-- .local/
                |
                |-- share/
                    |
                    |-- fonts/ : To store user/local font files
                        |
                        |-- otf/ : Stores all OpenType (otf) fonts
                        |-- ttf/ : Stores all TrueType (ttf) fonts
                        
```

## Commands
### Fontconfig
- fc-list : List all fonts detected by the system
    - Synopsis/Syntax
        ```console
        fc-list
        ```
    
- fc-query : Query/Obtain more details of a font file
    - Synopsis/Syntax
        ```console
        fc-query <{options} 'arguments'> ""/path/to/font/file"
        ```
        
- fc-cache : Updates the fontconfig cache
    - Synopsis/Syntax
        ```console
        fc-cache
        ```

- fc-match : Test/Check if a specific font exists
    - Synopsis/Syntax
        ```console
        fc-match [{options} <arguments...>] [font-name]
        ```
    - Usage
        - Test for a default font being set
            ```console
            fc-match
            ```
        
## Files
### Font Packages


## References
        
## Resources
+ [ArchWiki - Fonts](https://wiki.archlinux.org/title/fonts)

## Remarks

