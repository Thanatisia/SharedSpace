Neovim Packaging Format and Structure Documentations
====================================================

## Information

*Project Filesystem Structure*
------------------------------

- root/
    + README.md
    - lua/ : This folder stores all lua scripts/source files
        - [package-name]/ : This folder contains the plugin package
            + init.lua : This is the entry point (aka initializer/main runner) lua script
            + utils.lua : This contains all lua utilities

*Naming Conventions*
--------------------

- Project Repository Name
    + Typically, for neovim-based and/or lua packages, the project will be named '[package-name].lua' or '[package-name].nvim'

## Setup

*Dependencies*
--------------
+ lua
+ nvim

*Pre-Requisites*
----------------

*Installation*
--------------
- With a plugin manager
    - lazy.nvim
        ```lua
        {
            "author/repository-name",
            dependencies = { "your", "other", "dependencies" },
        }
        ```

    - packer.nvim
        ```lua
        use {
            "author/repository-name",
            requires = { { "your", "other", "dependencies" }, }
        }
        ```

## Documentations

### Usage
- Setup configurations
    ```lua
    local pkg = require('package-name').setup({
        --- Configurations
    })
    ```

## Wiki

### Popular Neovim plugins for development
+ plenary.nvim : Plugin library/framework containing pre-defined useful Neovim-lua functionalities

## Resources

## References

## Remarks
