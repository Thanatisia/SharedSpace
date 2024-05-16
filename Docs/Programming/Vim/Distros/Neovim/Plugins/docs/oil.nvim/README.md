# Neovim Plugin: oil.nvim

## Information
### Project
+ Project Author: stevearc
+ Project Name: oil.nvim
- Repositories
    + GitHub: https://github.com/stevearc/oil.nvim

### Description
- oil.nvim is a Neovim File Explorer/Manager that lets you edit your filesystem like a buffer with varying degree of customization

## Setup
### Dependencies
- Neovim Plugins
    + nvim-tree/nvim-web-devicons

### Pre-Requisites

### Installation

> Using lazy plugin manager

```lua
{
    "stevearc/oil.nvim",
    -- Package Optionals
    opts = {},
    -- Optional Dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- Configurations
    config = function()
        require('path.to.oil.lua')
    end
}
```

### Configurations

- Import plugin library/package
    ```lua
    local oil = require('oil')
    ```

- Setup plugin
    ```lua
    oil.setup({
      -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
      -- Set to false if you still want to use netrw.
      default_file_explorer = true,
      -- Id is automatically added at the beginning, and name at the end
      -- See :help oil-columns
      columns = {
        "icon",
        -- "permissions",
        -- "size",
        -- "mtime",
      },
      -- Buffer-local options to use for oil buffers
      buf_options = {
        buflisted = false,
        bufhidden = "hide",
      },
      -- Window-local options to use for oil buffers
      win_options = {
        wrap = false,
        signcolumn = "no",
        cursorcolumn = false,
        foldcolumn = "0",
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = "nvic",
      },
      -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
      delete_to_trash = false,
      -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
      skip_confirm_for_simple_edits = false,
      -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
      -- (:help prompt_save_on_select_new_entry)
      prompt_save_on_select_new_entry = true,
      -- Oil will automatically delete hidden buffers after this delay
      -- You can set the delay to false to disable cleanup entirely
      -- Note that the cleanup process only starts when none of the oil buffers are currently displayed
      cleanup_delay_ms = 2000,
      lsp_file_methods = {
        -- Time to wait for LSP file operations to complete before skipping
        timeout_ms = 1000,
        -- Set to true to autosave buffers that are updated with LSP willRenameFiles
        -- Set to "unmodified" to only save unmodified buffers
        autosave_changes = false,
      },
      -- Constrain the cursor to the editable parts of the oil buffer
      -- Set to `false` to disable, or "name" to keep it on the file names
      constrain_cursor = "editable",
      -- Set to true to watch the filesystem for changes and reload oil
      experimental_watch_for_changes = false,
      -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
      -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
      -- Additionally, if it is a string that matches "actions.<name>",
      -- it will use the mapping at require("oil.actions").<name>
      -- Set to `false` to remove a keymap
      -- See :help oil-actions for a list of all available actions
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-s>"] = "actions.select_vsplit",
        ["<C-h>"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
      },
      -- Set to false to disable all of the above keymaps
      use_default_keymaps = true,
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = false,
        -- This function defines what is considered a "hidden" file
        is_hidden_file = function(name, bufnr)
          return vim.startswith(name, ".")
        end,
        -- This function defines what will never be shown, even when `show_hidden` is set
        is_always_hidden = function(name, bufnr)
          return false
        end,
        -- Sort file names in a more intuitive order for humans. Is less performant,
        -- so you may want to set to false if you work with large directories.
        natural_order = true,
        sort = {
          -- sort order can be "asc" or "desc"
          -- see :help oil-columns to see which columns are sortable
          { "type", "asc" },
          { "name", "asc" },
        },
      },
      -- Extra arguments to pass to SCP when moving/copying files over SSH
      extra_scp_args = {},
      -- EXPERIMENTAL support for performing file operations with git
      git = {
        -- Return true to automatically git add/mv/rm files
        add = function(path)
          return false
        end,
        mv = function(src_path, dest_path)
          return false
        end,
        rm = function(path)
          return false
        end,
      },
      -- Configuration for the floating window in oil.open_float
      float = {
        -- Padding around the floating window
        padding = 2,
        max_width = 0,
        max_height = 0,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        override = function(conf)
          return conf
        end,
      },
      -- Configuration for the actions floating preview window
      preview = {
        -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        -- min_width and max_width can be a single value or a list of mixed integer/float types.
        -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
        max_width = 0.9,
        -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
        min_width = { 40, 0.4 },
        -- optionally define an integer/float for the exact width of the preview window
        width = nil,
        -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        -- min_height and max_height can be a single value or a list of mixed integer/float types.
        -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
        max_height = 0.9,
        -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
        min_height = { 5, 0.1 },
        -- optionally define an integer/float for the exact height of the preview window
        height = nil,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
        -- Whether the preview window is automatically updated when the cursor is moved
        update_on_cursor_moved = true,
      },
      -- Configuration for the floating progress window
      progress = {
        max_width = 0.9,
        min_width = { 40, 0.4 },
        width = nil,
        max_height = { 10, 0.9 },
        min_height = { 5, 0.1 },
        height = nil,
        border = "rounded",
        minimized_border = "none",
        win_options = {
          winblend = 0,
        },
      },
      -- Configuration for the floating SSH window
      ssh = {
        border = "rounded",
      },
      -- Configuration for the floating keymaps help window
      keymaps_help = {
        border = "rounded",
      },
    })
    ```

- Set the harpoon keybinding/keymappings
    - To Mimic the `vim-vinegar` method of navigating to the parent directory of a file
        ```lua
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        ```

## Documentations

### Default Movements
+ `<CR>` : To open a file/directory
+ `-` : To go up a directory
+ Treat the movements like a normal buffer and make changes as you like
- `:w` : To confirm that you're done and commit to actually perform the actions; 
    - Notes
        + oil works like a database and git commits where it stores the actions in the buffer until the user confirms that they commit that they want to perform the stored actions

### Plugin setup configuration settings
- `default_file_explorer = true` : Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
  + Set to false if you still want to use netrw.
- `columns = {"icon", "permissions", "size", "mtime",}` : Id is automatically added at the beginning, and name at the end
    - Notes
      - See `:help oil-columns`
+ `buf_options = {buflisted = false,bufhidden = "hide",}` : Buffer-local options to use for oil buffers
+ `win_options = {wrap = false, signcolumn = "no", cursorcolumn = false, foldcolumn = "0", spell = false, list = false, conceallevel = 3, concealcursor = "nvic",}` : Window-local options to use for oil buffers
+ `delete_to_trash = false` : Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
+ skip_confirm_for_simple_edits = false : Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
- `prompt_save_on_select_new_entry = true` : Selecting a new/moved/renamed file or directory will prompt you to save changes first
  - Notes
    + See `:help prompt_save_on_select_new_entry`
- `cleanup_delay_ms = 2000` : Oil will automatically delete hidden buffers after this delay
    - Notes
        + You can set the delay to false to disable cleanup entirely
        + Note that the cleanup process only starts when none of the oil buffers are currently displayed
- `lsp_file_methods = {}` : LSP File Methods
    - Setting Key-Values
        - timeout_ms = 1000 : Time to wait for LSP file operations to complete before skipping
            - Notes
                + Set to true to autosave buffers that are updated with LSP willRenameFiles
        - `autosave_changes = false` : Set to "unmodified" to only save unmodified buffers
- `constrain_cursor` = "editable" : Constrain the cursor to the editable parts of the oil buffer
    - Notes
        + Set to `false` to disable, or "name" to keep it on the file names
+ `experimental_watch_for_changes = false` : Set to true to watch the filesystem for changes and reload oil
- `keymaps = { ["mapping"] = "action.function" }` : Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
    - Notes
        + options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
        + Additionally, if it is a string that matches "actions.<name>", it will use the mapping at require("oil.actions").<name>
        + Set to `false` to remove a keymap
        + See :help oil-actions for a list of all available actions
    - Default/Recommended Keymaps
        + `["g?"] = "actions.show_help"`
        + `["<CR>"] = "actions.select"`
        + `["<C-s>"] = "actions.select_vsplit"`
        + `["<C-h>"] = "actions.select_split"`
        + `["<C-t>"] = "actions.select_tab"`
        + `["<C-p>"] = "actions.preview"`
        + `["<C-c>"] = "actions.close"`
        + `["<C-l>"] = "actions.refresh"`
        + `["-"] = "actions.parent"`
        + `["_"] = "actions.open_cwd"`
        + `["`"] = "actions.cd"`
        + `["~"] = "actions.tcd"`
        + `["gs"] = "actions.change_sort"`
        + `["gx"] = "actions.open_external"`
        + `["g."] = "actions.toggle_hidden"`
        + `["g\\"] = "actions.toggle_trash"`
+ `use_default_keymaps = true` : Set to false to disable all of the above keymaps
- `view_options = { setting-key = value }` : 
    - Options
        + `show_hidden = false` : Show files and directories that start with "."
        - `is_hidden_file` : Shows if the file is a hidden file or visible
            - Using a custom function
                - This function defines what is considered a "hidden" file
                    ```lua
                    is_hidden_file = function(name, bufnr)
                      return vim.startswith(name, ".")
                    end,
                    ```
        - `is_always_hidden` : Define what will never be shown, even when 'show_hidden' is set
            - Using a custom function
                - This function defines what will never be shown, even when `show_hidden` is set
                    ```lua
                    is_always_hidden = function(name, bufnr)
                      return false
                    end,
                    ```
        - `natural_order = true` : Sort file names in a more intuitive order for humans.
            - Notes:
                + This is less performant, so you may want to set to false if you work with large directories.
        - `sort = { {"key", "sort-type"}, ... }` : Sort all specified keys according to the sorting filter keyword
            - Notes 
                + sort order can be "asc" or "desc"
                + see :help oil-columns to see which columns are sortable
            - Sort Types/Targets
                + type : Sort file type by the filter keyword
                + name : Sort file name by the filter keyword
            - Sorting Filter Keywords
                + asc : Ascending Order
                + dsc : Descending Order
            - Example
                ```lua
                sort = {
                  { "type", "asc" },
                  { "name", "asc" },
                },
                ```
+ `extra_scp_args = {}` : Extra arguments to pass to SCP when moving/copying files over SSH
- `git = { git-command = function }` : EXPERIMENTAL support for performing file operations with git
    - Git commands
        - add
            ```lua
            -- Return true to automatically git add files
            add = function(path)
              return false
            end,
            ```
        - move
            ```lua
            -- Return true to automatically git mv files
            mv = function(src_path, dest_path)
              return false
            end,
            ```
        - remove
            ```lua
            -- Return true to automatically git rm files
            rm = function(path)
              return false
            end,
            ```
- `float = { settings = value, }` : Configuration for the floating window in oil.open_float
    - Floating window settings
        + `padding = 2` : Padding around the floating window
        + `max_width = 0` : Specify the maximum width of the floating window (0 = No maximum)
        + `max_height = 0` : Specify the maximum height of the floating window (0 = No maximum)
        - `border = "rounded"` : Specify the border of the floating window
            - Border Options
                + rounded : Rounded border and corner
        - `win_options = { options=values }` : Specify the window options to apply to the floating window
            - Window Options
                + `winblend = 0` : Window blend
        - `override = configuration` : This is the config that will be passed to nvim_open_win.
            - Notes
                + Change values here to customize the layout
            - Override Function
                ```lua
                override = function(conf)
                  return conf
                end,
                ```
- `preview = { settings = values, ... }` : Configuration for the actions floating preview window
    - Preview Settings
        - `max_width = 0.9` : Specify the maximum width (horizontal size) of the floating preview window
            - Notes
                + Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                - min_width and max_width can be a single value or a list of mixed integer/float types.
                    + max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
        - `min_width = { 40, 0.4 }` : Specify the minimum width (horizontal size) of the floating preview window
            - Notes
                + min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
        + `width = nil` : optionally define an integer/float for the exact width of the preview window
        - `max_height = 0.9` : Specify the maximum height (vertical size) of the floating preview window
            - Notes 
                + Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                - min_height and max_height can be a single value or a list of mixed integer/float types.
                    + max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
        - `min_height = { 5, 0.1 }` : Specify the minimum height (vertical size) of the floating preview window
            - Notes
                + min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
        + `height = nil` : optionally define an integer/float for the exact height of the preview window; Set as 'nil' to not define
        - `border = "rounded"` : Specify the border of the floating preview window
            - Border Options
                + rounded : Rounded border and corner
        - `win_options = { options=values }` : Specify the window options to apply to the floating preview window
            - Window Options
                + `winblend = 0` : Window blend
        + `update_on_cursor_moved = true` : Enable/Disable automatic updating of preview window when the cursor is moved
- `progress = { settings = values, ... }` : Configuration for the floating progress window
    - Floating progress window
        + `max_width = 0.9` : Specify the maximum width of the floating progress window
        + `min_width = { 40, 0.4 }` : Specify the minimum width of the floating progress window
        + `width = nil` : Specify the startup static width of the floating progress window; Set as 'nil' to not define
        + `max_height = { 10, 0.9 }` : Specify the maximum height of the floating progress window
        + `min_height = { 5, 0.1 }` : Specify the minimum height of the floating progress window
        + `height = nil` : Specify the startup static height of the floating progress window; Set as 'nil' to not define
        - `border = "rounded"` : Specify the border of the floating progress window
            - Border Options
                + rounded : Rounded border and corner
        - `minimized_border = "none"` : Specify the border of the floating progress window when minimized; Set as 'none' to have no border
        - `win_options = { options=values }` : Specify the window options to apply to the floating progress window
            - Window Options
                + `winblend = 0` : Window blend
- `ssh = { settings = value, ... }` : Configuration for the floating SSH window
    - Floating SSH Window
        - `border = "rounded"` : Specify the border of the floating SSH window
            - Border Options
                + rounded : Rounded border and corner
- `keymaps_help = { settings = value, ... }` : Configuration for the floating keymaps help window
    - Floating Keymaps help window
        - `border = "rounded"` : Specify the border of the floating keymaps help window
            - Border Options
                + rounded : Rounded border and corner

### Adapters
#### SSH
- This adapter allows you to browse files over ssh, much like netrw. 
    - To use it, simply open a buffer using the following name template:
        ```bash
        nvim oil-ssh://[username@]hostname[:port]/[path]
        ```

### Plugin package
- oil

### Plugin modules/libraries
- oil : The Neovim File Explorer/Manager

### Plugin classes

### Plugin functions
- `get_entry_on_line(bufnr, lnum)` : Get the entries on the specified buffer number and line number (1-indexed)
    - Parameter Signature/Header
        + bufnr : Specify the Buffer Number you wish to get the entry from
        + lnum : Specify the Line number within the buffer number to get
    - Return
        - entry : Get the entry on the specified line within the specified buffer number
            + Type: nil | oil.Entry
+ `get_cursor_entry()` : Get the entry currently under the cursor
+ `discard_all_changes()` : Discord all changes made to the oil buffers
- `set_columns(cols)` : Change the display columns for oil to the specified columns
    - Parameter Signature/Header
        + cols : Specify the column to change the display columns for oil to
+ set_sort(sort)
+ set_is_hidden_file(is_hidden_file)
+ toggle_hidden()
+ get_current_dir()
+ open_float(dir)
+ toggle_float(dir)
+ open(dir)
+ close()
+ open_preview(opts)
+ select(opts, callback)
+ save(opts, cb)
+ setup(opts)

### Plugin attributes/variables
- oil
    - `.Entry` : Oil Entry

### Plugin (Auto)Commands
- `Oil {options} <arguments> [path]` : Open up the specified path as a buffer in the File Explorer/Manager; works with `:edit`
    - Parameters
        - Positionals
            + path : Specify the directory/filepath to edit/open
        - Optionals
            - With Arguments
            - Flags
                + --float : Open up oil in a floating window

### Snippets

## Usages
- To open a directory with oil
    ```lua
    :Oil <path>
    ```

- To open oil in a floating window
    ```lua
    :Oil --float <path>
    ```

## Wiki

## Resources

## References
+ [GitHub - stevearc/oilnvim - API](https://github.com/stevearc/oil.nvim/blob/master/doc/api.md)

## Remarks

