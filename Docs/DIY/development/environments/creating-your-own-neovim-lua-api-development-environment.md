# DIY - Creating your own Neovim lua plugin project workspace/development environment from scratch

## Information

### Project Workspace Structure/Layout
- Typical layout
    - root/ : This is the project root working directory
        + README.md : Contains an introduction to your project
        + BUILD.md : Contains your build steps and instructions on how to compile/build from source
        + CHANGELOGS.md : Contains your changelogs
        + CONTRIBUTING.md : Contains your instructions to contributors on the rules and regulations to follow
        - lua/ : This is the main source code directory containing all your source files
            + init.lua : This is the main entry point containing your plugin master logic when (neo)vim is sourcing on load
        - plugin/ : This is the test directory. Contains your unit tests and development/debugging space
            + unittest.lua : This is a sample unit test file

## Setup

### Dependencies
+ neovim

### Pre-Requisites

### Initialize a Neovim lua plugin project workspace
- Manually
    - Make the plugin's project root directory
        - Notes
            + Name the plugin directory ending with '*.nvim' to identify that the repository folder is for a Neovim plugin
        ```bash
        mkdir -pv [project-root-directory]/[plugin-name]
        ```

- Change directory into project directory
    ```bash
    cd [project-name]
    ```

### Post-Initialization setup
- Prepare and Create your project workspace structure/layout
    - Create directories
        ```bash
        mkdir -pv [project-root-directory]/docs/
        mkdir -pv [project-root-directory]/lua/
        ```
    - Create files
        ```bash
        touch [project-root-directory]/{README,BUILD,CHANGELOGS,CONTRIBUTING}.md
        touch [project-root-directory]/lua/init.lua
        ```

- Create/Populate the plugin's 'lua/init.lua' entry point
    - Notes
        + This structure is applicable and basically the foundation for every Neovim lua scripts, the building block of making a neovim lua script/plugin

    - Initialize the lua master table key-value mapping
        ```lua
        local M = {}
        ```
    - Set the master table's default options
        ```lua
        M.opts = {}
        ```
    - Define a open() function in the master table
        - Explanation
            + This function will be triggered when the UI is opened
        ```lua
        function M.open()

        end
        ```
    - Define a `.setup(opts)` function in the master table 
        - Explanation
            + This function will be activated when `require(plugin).setup({})` is sourced
        ```lua
        function M.setup(opts)
            --- Check if options are provided
            if opts ~= nil then
                --- Initialize options and set the options to the master table
                --- M.opts = vim.tbl_deep_extend("force", {}, defaults, opts or {})

                --- Iterate through the options table/dictionary (Key-value mappings) and obtain the key-values to replace the default
                for k,v in pairs(opts) do
                    --- Update/Modify the keys found in the default options with the values of the provided options by the custom configuration file
                    M.opts[k] = v
                end
            end
        end
        ```
    - Return the plugin master configuration table to the caller for use
        - Explanation
            - The table 'M' is the object returned to the function call when `local object = require(plugin)` is called
                + Effectively, this is the plugin object itself
        ```lua
        return M
        ```

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

### Installing the plugin
- Manually
    - Copy the plugin repository directory into your neovim's runtimepath directory
        - Explanation
            - Neovim will auto-source files found in the runtimepath
                + The following locations are part of the runtimepath and as such, all directories (branches) and sub-directories (sub-branches) of the runtimepath tree will be sourced
        - Neovim
            - Linux
                ```bash
                cp -r [project-root-directory]/ $HOME/.local/share/nvim/site/pack/[your-plugin-repository]/
                ```
            - Windows
                ```bash
                cp -r [project-root-directory] \path\to\nvim-data\site\pack\[your-plugin-repository]\
                ```

- Using a plugin manager
    - lazy.nvim
        - Setting up
            + TBC
        - Installing the plugin
            ```lua
            {
                "author/repository-name",
                requires = {"place", "your", "dependencies", "here"},
                opts = {},
                config = function()
                    require("plugin").setup({
                        -- M.setup(opts) configurations here
                    })
                end
            }
            ```

### Running the application


## Wiki

### Tools

### Tutorials

## Resources
+ [GitHub - nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
+ [Build Neovim from source](Docs/

## References 

## Remarks

