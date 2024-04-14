## Neovim-specific Lua plugins collection

## Information
### Description
- Collection of documentations for (as many as possible) Neovim lua plugins and their purposes so as to have an all-in-one go-to reference spot for Neovim plugins
    + There may be a separate list for Vimscript plugins

## CONTRIBUTIONS
### Rules
1. Please update the file [packages-list.md](packages-list.md) with your plugin name after completion of documentation
2. Please create the documentations according to this format/layout
    ```
    docs/
        + README.md
        + packages-list.md
        - [plugin-name]/
            - README.md
    ```
3. Please refer to [Template](#template) for the plugin README.md template file
    + and create it in '[plugin-name]/README.md'

### Template

> Plugin README.md

```markdown
# Neovim Plugin: [plugin-name]

## Information
### Project
+ Project Author: [author-name]
+ Project Name: [project-repository-name]
- Repositories
    + GitHub: https://github.com/author/repository-name

### Description
- Description of plugin

## Setup
### Dependencies
- Neovim Plugins
    + author/project-name

### Pre-Requisites

### Installation

> Using lazy plugin manager

```lua
{
    "author/repository-name",
    branch = "branch-name",
    dependencies = { "author/dependency-name" },
    config = function()
        require('path.to.configuration.lua.file')
    end
}
```

### Configurations

- Import plugin library/package
    ```lua
    local plugin_name = require('plugin')
    ```

- Setup [plugin-name]
    ```lua
    plugin_name.setup({
        --- Settings here
    })
    ```

## Documentations

### Plugin package

### Plugin modules/libraries

### Plugin classes

### Plugin functions

### Plugin attributes/variables

### Snippets

## Usages

## Wiki

## Resources

## References

## Remarks
```

