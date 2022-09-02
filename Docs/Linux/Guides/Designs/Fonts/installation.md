# Linux - Post-Installation Customization - Fonts : Installation

## Information
### DESCRIPTION
```
A general rundown/documentation of your Linux system fonts and post-installation customization (aka 'Ricing') tips n trick

This contains the different methods of installation including manual installation.
```

## Installation
> There are various methods to install fonts
- In Arch-based Distributions (pacman)
    + Fonts and Font collections in the enabled repositories can be installed using Pacman
    - Find Available Fonts
        - Querying the package
            - Keywords
                + font
                + ttf
    ```console
    pacman -Ss {font,ttf}
    ```
   
- Manual Installation
    - Locations
        - Single User
            + Install your fonts to '~/.local/share/fonts'
        - System-Wide (All users)
            + Place your fonts under '/usr/local/share/fonts'
            + Folder may not exist - create if doesnt exist
            + '/usr/local/fonts' is for package manager installation only, should not be modified manually
        - Notes
            - Best Practices
                - Good to keep each font in its own directory
                    - Examples
                        - Hack Nerd Font
                            + ~/.local/share/fonts/Hack Nerd Font/[files...]
        
    - (OPTIONAL) Permissions
        - The font files need to have sufficient read permissions for all users
            - At least 
                + *chmod 444* for files
                + *chmod 555* for dirctories
            ```console
            chmod 444 font.{ttf,otf}
            chmod 555 font-folder/
            ```
       
    - (OPTIONAL) For XServer to load files directly (as opposed to the use of a font server)
        - Directory for your newly added fonts must be added with a *FontPath* entry
            - FontPath Entry : located in the Files section of your Xorg configuration file
                + /etc/X11/xorg.conf
                + /etc/xorg.conf
    
    - Update the font-config cache
        + Usually unnecessary as software using the *fontconfig* library does this
        ```console
        fc-cache
        ```