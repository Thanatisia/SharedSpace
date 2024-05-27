# Lua Vim API for Neovim

## Information
### Summary
```
A documentation/write-up of various settings, syntax and structures to the Lua Vim API for Neovim
```

### Lua baics
#### Important functions
- `local status, return_value = pcall(keyword, function)` : Protected call so the process don't error out on first use
    - Keywords
        - require : Protected require/import

## Documentation

### Libraries
+ vim : This is the Vim lua API/library used for Neovim

### Classes
+ vim.api : Base vim general functionalities
+ vim.cmd : Base vimscript command line mode commands
+ vim.fn : Access standard vim functions
+ vim.g : To get neovim global Variables
+ vim.keymap : Manage neovim keymap/keybindings
+ vim.loop : Loop/Recursive functions
+ vim.o | vim.opt : To get (neo)vim options

### Functions
- vim
    - `vim.cmd[[<command-to-execute>]]` : Execute vimscript command line commands; Vimscript-equivalent of neovim's vim.api.nvim_command "command"
        - Parameters
            + command-to-execute : Specify the command line string(s) to execute when called. Separate each command into a new line for a multiline command

- vim.api
    - `.nvim_buf_get_name(buffer_id)` : Get the name of the provided buffer ID
        - Parameter/Argument Signature
            - buffer_id : Specify the ID of the target buffer that you want to receive the name of
                + Type: Integer
                - Explanation
                    + Index 0: Current Buffer
    - `.nvim_command "command-to-execute"` : Execute Neovim commands
        - Parameters
            + command-to-execute : Specify the command line string to execute when called
    - `.nvim_create_autocmd(events, {pattern={file-extensions,...}, command="command-to-execute"})` : Create an autocommand to map a command to a set of buffer events and file types
        - Parameter Signature/Headers
            - events : Specify a list of vim buffer events/action to check for. the command will execute only for the specified file types, and during the event
                + Type: List of Event Strings
                + Format: `{events}`
            - pattern : Specify a list of file extensions for the autocommand to detect
                + Type: List of file extensions/type strings
            - command : Specify the command to execute during the Buffer event when the file extension/types are detected
                + Type: String
    - `.nvim_create_user_command('CommandName', target_function, {option-keys=values});` : Create user commands in command mode; The commands created will be executable using ':YourCommandHere <arguments>'
        - Parameters
            + CommandName : Specify the name of the command; You call call the command using "<Cmd>:CommandName<CR>"
            - target_function : Map the command/function to execute when the command is called. 
                - Notes
                    + You can write a new function
                        ```lua
                        local function functionName()
                            --- Statements
                        end
                        ```
                    + and/or write inline commands
            - Optional Key Values
                - Options
                    + `silent=[true|false]` : Enable/Disable Verbose message output
    - `.nvim_get_runtime_file(filename, all)`: Get the specified/all runtime files
        - Parameter/Argument Signature
            - filename: Specify the name of the runtime file to return; Pass '' to get all
                + Type: String
            - all: Enable/Disable getting all runtime files
                + Type: Boolean

- vim.cmd
    - `.edit(file)` : Open up the specified filepath/filename to edit
        - Parameters
            + file : Specify the file to edit

- vim.fn
    + `.empty(path)` : Check for the number of files in the specified path; Returns the number of files in the specified path
    - `.expand(expression)` : Expand the given string with an expression
        - Parameter/Argument Signature
            - expression : Specify the keyword, string or filepath format to expand
                - Special Keywords/Wildcards
                    + '%' : Expanded to the current filename
                - Filename Modifiers
                    - '<path>:p' : Gives the full (absolute) path of the provided file path
                        - i.e.
                            + '%:p' : Give the full (absolute) path of the current working directory regardless of the current path
    + `.glob(path)` : Check if the path specified is a glob file
    - `.stdpath('keywords')` : Obtain the standard path for a special directory defined by (neo)vim
        - Keywords
            + config : Obtain Neovim's configuration directory
            + data : Obtain Neovim's data directory
    - `.system({'command', 'arguments-1', 'arguments-2', ..., 'arguments-N'})` : Execute parameterized system commands; Separate each command and its arguments with comma-delimited

- vim.keymap
    - `.set('<mode (n|v|i)>', '<keybind>', '<command>', {option-keys=values})` : Set Neovim Keymap/Keybindings
        - Parameters
            - mode : Set the mode to apply this keybinding to; The keybind will then only work in this mode
                - Modes
                    + n : Normal Mode
                    + i : Insert Mode
                    + v : Visual Mode
            - Keybind : Specify the keybinding combinations to press on the keyboard to activate
                - Special Keywords
                    + '<leader>' : Set the Prefix/Leader keybind (i.e. ',')
            - Command : Specify the command line/string to execute when the keybind is pressed
                - Special Keywords
                    + <Cmd> : Activate Command Line Mode (Pressing ':')
                    + <CR> : Press the Enter key (Carriage Return)
            - Optional Key Values
                - Options
                    + `silent=[true|false]` : Enable/Disable Verbose message output

- vim.loop 
    + `.fs_stat(target_path)` : Loop through all stats (statistics) of the specified files/directories in the filesystem; Will return true/false if the path specified can be found

### Attibutes/Key-Values
- vim.g
    + `.mapleader = ","` : Set the <leader>/prefix keymapping
    + `.maplocalleader = "\\"` : Set the local <leader>/prefix keymapping

- vim.{o|opt}
    + `.encoding = "utf-8"`                          : Set an encoding format
    + `.backspace = "indent,eol,start"`              : Backspace works on every character in insert mode
    + `.completeopt={"menu", "menuone", "noselect"}` : Setting completion values; Default: vim.o.completeopt = 'menuone,noselect'
    + `.mouse = "a"`                                 : Set Mouse
    + `.clipboard = 'unnamedplus'`                   : Set Clipboard Manager
    + `.scrolloff = 8`                               : Set number of spaces before the screen moves vertically
    + `.sidescrolloff = 8`                           : Set number of spaces before the screen moves horizontally
    + `.showmatch = true`                            : Show matching brackets
    + `.laststatus = 2`                              : Always show status line
    + `.list = false`                                : Do not display white characters
    + `.wrap = false`                                : Do not wrap lines if goes over the screen (similar to :set nowrap)
    + `.showbreak = "↪"`                             : Show the assigned icon where a line break is found
    + `.cursorline = true`                           : Enable Cursor Line Highlighting
    + `.cursorcolumn = true`                         : Enable Cursor Column Highlighting
    + `.showtabline = 2`                             : Always show tabs
    + `.cmdheight = 2`                               : Set amount of space in the neovim command line; for displaying messages
    + `.number = true`                               : Show line number on the left (similar to :set number)
    + `.relativenumber = true`                       : Show relative line numbers (similar to :set relativenumber)
    + `.showcmd = true`                              : Display commands in bottom bar
    + `.incsearch = true`                            : Incremental Search; starts searching as soon as you type anything, without enter needed
    + `.ignorecase = true`                           : Ignore case sensitivity when searching
    + `.smartcase = true`                            : case insensitive unless capitals are specified in the search pattern.
    + `.autoindent = true`                           : Enable Autoindent
    + `.smartindent = true`                          : Enable Smart indenting
    + `.expandtab = true`                            : Expand tabs into spaces
    + `.tabstop = 4`                                 : Set 1 tab = n spaces
    + `.shiftwidth = 4`                              : Indentation Rules
    + `.writebackup = false`                         : Write backup to a file
    + `.swapfile = false`                            : Disable swapfiles
    + `.undofile = false`                            : Enable persistent undo
    + `.background = 'dark'`                         : Set Background color (light|dark)
    + `.termguicolors = true`                        : Set to use terminal gui colors
    - `.runtimepath:[action]`                        : Manage the neovim runtime path
        - Actions 
            + prepend(path)`                         : Prepend the specified path into the neovim RTP (runtime path)

## Usage
### Neovim Information
- Obtain standard data directory
    ```lua
    nvim_data = vim.fn.stdpath('data')
    ```

- Obtain standard configuration directory
    ```lua
    nvim_config = vim.fn.stdpath('config')
    ```

### Filepath expansion
- Expand the filepath to the current filename
    ```lua
    vim.fn.expand('%:p')
    ```

### Filesystem
- Recursive Filesystem check
    ```lua
    if not vim.loop.fs_stat(target_directory) then
        --- Check
    end
    ```

### Setting Custom Keymappings
- Map Tree Explorer to '<leader>-e'
    - Set nvim-tree toggle on '<leader>-e' keypress
        ```lua 
        vim.keymap.set('n', "<leader>e", "<Cmd>NvimTreeToggle<CR>", {silent=true})
        ```

### Buffer Event Autocommands
- Create autocommand
    ```lua
    vim.api.nvim_create_autocmd(
        {"BufEnter", "BufWinEnter"},
        {
            pattern = {"*.c", "*.h"},
            command = "echo 'Entering a C or C++ file'",
        }
    )
    ```

## Wiki

### Snippets

## Resources

## References
+ [Neovim Documentations - User API - vim.api.nvim_buf_get_name(index)](https://neovim.io/doc/user/api.html#nvim_buf_get_name())
+ [Neovim Documentations - User API - vim.api.nvim_create_autocmd()](https://neovim.io/doc/user/api.html#nvim_create_autocmd())
+ [Reddit - Neovim - Lua keybindings via vim keymap set](https://www.reddit.com/r/neovim/comments/101b07t/lua_keybindings_via_vimkeymapset/)

## Remarks

