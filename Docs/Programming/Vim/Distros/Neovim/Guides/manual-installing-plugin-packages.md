# Neovim - Manually install plugin packages without a package manager

## Information
### Neovim Project filesystem structure
- $HOME/
    - .config/
        - nvim/
            + init.{vim|lua} : Neovim initialization configuration file
            - lua/ : Place your main system lua scripts here
                + [script.lua] : Lua script to source/run

- $HOME/
    - .local/ : Userspace local cache/temporary files
        - share/ : local user's shared resources files
            - nvim/ : Local user's neovim resources
                - site/ : Neovim source codes directory for cloning plugins into
                    - pack/
                        - [plugin-directories]/ : Place your plugins into individually-created plugin directories here
                            - opt/ : Plugins here are loaded manually
                                - [plugin-name]/ : This is your plugin's project repository
                            - start/ : Plugins here are loaded automatically on startup by Neovim
                                - [plugin-name]/ : This is your plugin's project repository

## Setup

### Steps
- Preparing new plugins
    1. Clone the repository into the 'start' or 'opt directory
    2. Generate help tags after adding new plugins/updating existing plugins

- Manual Plugin Management
    3. Manually load plugins from the 'opt' directory
    4. Manually updating and maintaining plugins

### Preparing new plugins
1. Clone the repository into the 'start' or 'opt directory
    - For automatic sourcing/loading on startup
        ```bash
        git clone [plugin-remote-repository-url] $HOME/.config/nvim/pack//my-plugins/start
        ```
    - For manual sourcing/loading
        ```bash
        git clone [plugin-remote-repository-url] $HOME/.config/nvim/pack//my-plugins/opt
        ```

2. Generate help tags after adding new plugins/updating existing plugins
        - init.vim : Vimscript
            ```bash
            helptags ALL
            ```
        - init.lua : Neovim lua script
            ```bash
            vim.cmd('helptags ALL')
            ```

### Manual Plugin Management
3. Manually load plugins from the 'opt' directory
    - Add the following line into your init file
        - init.vim : Vimscript
            ```bash
            packadd [your-plugin-name]
            ```
        - init.lua : Neovim lua script
            ```bash
            vim.cmd('packadd [your-plugin-name]')
            ```

4. Manually updating and maintaining plugins
    - Change directory to the plugin local repository
        ```bash
        cd ~/.config/nvim/pack/my-plugins/{start|opt}/[your-plugin-name]
        ```
    - Pull the latest changes
        ```bash
        git pull origin [branch (default: main)]
        ```

## Resources

## References

## Remarks
