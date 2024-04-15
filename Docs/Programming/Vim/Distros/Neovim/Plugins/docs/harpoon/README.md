# Neovim Plugin: Harpoon

## Information
### Project
+ Project Author: ThePrimeagen
+ Project Name: Harpoon
- Repositories
    + GitHub: https://github.com/ThePrimeagen/Harpoon

### Description
- Harpoon is a file finder/jumper Neovim Plugin focusing on Quality-of-Life/Coding experience improvements by
    + Simplifying the ability to search for files

## Setup
### Dependencies
- Neovim Plugins
    + nvim-lua/plenary.nvim

### Pre-Requisites

### Installation

> Using lazy plugin manager

```lua
{
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require('path.to.harpoon.lua')
    end
}
```

### Configurations

- Import plugin library/package
    ```lua
    local harpoon = require('harpoon')
    ```

- Setup harpoon
    ```lua
    harpoon:setup({
        settings = {
            save_on_toggle = true,
            sync_on_ui_close = true,
        },
    })
    ```

- Additional configuration extensions
    ```lua
    harpoon:extend({
      UI_CREATE = function(cx)
        vim.keymap.set("n", "<C-v>", function()
          harpoon.ui:select_menu_item({ vsplit = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "<C-x>", function()
          harpoon.ui:select_menu_item({ split = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "<C-t>", function()
          harpoon.ui:select_menu_item({ tabedit = true })
        end, { buffer = cx.bufnr })
      end,
    })
    ```

- Set the harpoon keybinding/keymappings
    - Harpoon list menu
        ```lua
        vim.keymap.set("n", "<C-a>", function() harpoon:list():add() end, { desc = "Adds current file into the buffer list" })
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        ```
    - Harpoon list switching
        ```lua
        vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "Switch to the 1st buffer item"})
        vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end, { desc = "Switch to the 2nd buffer item"})
        vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end, { desc = "Switch to the 3rd buffer item"})
        vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end, { desc = "Switch to the 4th buffer item"})
        ```
    - Toggle previous & next buffers stored within Harpoon list
        ```lua
        vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Toggle the previous buffer stored within harpoon's list"})
        vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Toggle the next buffer stored within harpoon's list"})
        ```

## Documentations

### Plugin package
- harpoon

### Plugin modules/libraries
- harpoon : The efficient Codebase file finder
    + `.ui` : Harpoon User Interface libraries

### Plugin classes

### Plugin functions
- harpoon
    - `:extend(extensions)` : Extend harpoon's configurations according to the key-value provided
        - Parameter/Argument Signature
            - extensions : A Key-Value mapping of extension keywords
                - UI_CREATE : Apply when an User Interface is created
                    - Value:
                        ```lua
                        UI_CREATE = function(cx)
                            --- Keymappings here
                            vim.keymap.set("mode", "keymap", function()
                                --- Function statements
                                harpoon.ui:select_menu_item( settings )
                            end, { buffer = cx.bufnr })
                        end
                        ```
    - `:list()` : Manage/handle a list of buffers that is added by harpoon (aka 'harpoon list')
        + `:add()` : Add the current buffer into the Harpoon list
        + `:next()` : Toggle to the next buffer stored within the Harpoon list
        + `:prev()` : Toggle to the previous buffer stored within the Harpoon list
        + `:select(index)` : Switch/select the specified buffer index number
    - `:setup(configurations)` : Perform setup according to the provided configuration list/array/dictionary
        - Parameter/Argument Signature
            - configurations : A key-value mapping of configurations to parse/apply to the harpoon setup function
                - Configuration Key-Value Mappings
                    - settings : Specify key-value mappings relating to Harpoon's general settings
                        - `save_on_toggle = true|false` : Enable/Disable automatic saving of file on toggling of buffer
                            + Type: Boolean
                        - `sync_on_ui_close = true|false` : Enable/Disable automatic syncing of buffers on the closing of UI
                            + Type: Boolean


- harpoon.ui
    - `:select_menu_item( settings )` : Select a menu item and apply the settings to the item/buffer selected
        - Parameter/Argument Signature
            - settings: Key-Value mappings of all settings you can apply to the selected item/buffer
                + `vsplit = true|false`  : Vertical Split
                + `split = true|false`   : Horizontal Split
                + `tabedit = true|false` : New Tab
    - `:toggle_quick_menu(harpoon_files)` : Open a popup menu to let user select a buffer to modify/manage
        - Parameter/Argument Signature
            - harpoon_files: Parse in the list of buffers that is added by harpoon (aka 'harpoon list')
                + Type: List/Array (In lua, this is just a dictionary object as everything is a dictionary/key-value mapping)

### Plugin attributes/variables

### Snippets
- Setup basic Telescope configuration for harpoon with Telescope UI
    - Create function
        ```lua
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end
        ```
    - Map to a keybinding
        ```lua
        vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
        ```

## Usages

### Harpoon Buffer List
- Notes
    + Harpoon uses vim motions for the UI elements as well

- In harpoon buffer list quick menu
    + Delete buffer: Select the entry and delete the buffer with 'dd'

## Wiki

## Resources

## References

## Remarks

