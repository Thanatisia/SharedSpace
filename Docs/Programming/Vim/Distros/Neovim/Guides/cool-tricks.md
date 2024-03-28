Neovim - Cool Tips and Tricks and things you can do and must know
=================================================================

## Information

### Configuration Files
- Switching between configurations
    - Explanation
        + You can switch between different configurations using the 'NVIM_APPNAME' environment variable
        + The 'NVIM_APPNAME' environment variable specifies the default/current neovim application name
    - Notes
        + Ensure that this is a proper neovim configuration file with '~/.config/nvim/init.lua' entry point script and '~/.config/nvim/lua/' directory
    - Setup
        - Create a neovim configuration folder in your '.config' directory
            - Linux
                ```bash
                mkdir -pv ~/.config/[neovim-configurations-name]/lua
                ```
            - Windows
                ```bash
                mkdir \path\to\[neovim-configurations-name]\lua
                ```
    - Startup neovim with 'NVIM_APPNAME' set to the configuration directory of your choice
        ```bash
        NVIM_APPNAME=[your-configuration] nvim
        ```

## Resources

## References
+ [zain.mu - linux - Neovim config switcher](https://zain.mu/linux/neovim-config-switcher/)

## Remarks

