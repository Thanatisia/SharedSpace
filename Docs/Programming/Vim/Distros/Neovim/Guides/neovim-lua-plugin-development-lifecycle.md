# Neovim Lua Plugin Development Lifecycle

## Information
### Description
+ This document contains the write-up of the general operational workflow for the development of a Neovim Lua plugin

## Development
### Setup
- Append your plugin's repository root directory into your runtimepath
    - Notes
        - It is recommended to perform your development in your '~/.local/share/nvim/site/pack' directory
            + Linux: `~/.local/share/nvim/site/pack/[your-plugin-repository]`
            + Windows: `/path/to/nvim/nvim-data`
    ```vimscript
    :set runtimepath+=/path/to/your/plugin/
    ```


### Testing/Debugging your plugin
- Import your plugin within the editor
    - Default
        ```vimscript
        :lua require("path.to.plugin.script"|"plugin-name").setup()
        ```
    - Specify custom values for the settings
        ```vimscript
        :lua require("path.to.plugin.script"|"plugin-name").setup({key=values})
        ```

- Execute the user command/lua functions
    ```vimscript
    :lua Function_Name(arguments, ...)
    ```

- (Re)source the current script after updating
    ```vimscript
    :so
    ```

## Resources

## References

## Remarks

