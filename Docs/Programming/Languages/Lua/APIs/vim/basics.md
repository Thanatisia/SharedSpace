# Lua APIs - Vim API for Neovim

## Table of Contents
+ [Information](#information)
+ [Documentation](#documentation)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Information

### DESCRIPTION

```
A collection of functions created in Lua for configuring (Neo)vim configurations.

Neovim is a distribution of Vim that has integrated the Lua language as their Primary programming language of configuration instead of the vimscript language.
```

## Documentation

### Synopsis/Syntax

+ vim.api.[function](parameters) 	: General (n)vim operation-related functions
+ vim.filetype.[function](parameters)	: Custom Filetype helper functions
+ vim.keymap.[function](parameters) 	: Keybinding and Keymapping Functions
+ vim.g.[variable] = value 	 	: To set global variable values
+ vim.o.[variable] = value	 	: To set setting values
+ vim.opt.[variable] = value		: To set optional setting values

### Classes

#### vim.api
+ .nvim_command('autocmd event here') 				: Run a vim autocmd event function here
+ .nvim_create_autocmd('autocmd_group_name', function_run) 	: Create an autocmd event

#### vim.filetype
+ .add()	: Add a new file type pattern

#### vim.keymap
+ .set(mode, key, remap-value, options...) : Set a keymap/remap/keybinding

#### vim.g
+ .mapleader = 'key' : Map <leader> to the specified key
+ .maplocalleader = 'key' : Map <leader> to the specified key

#### vim.o
> (Neo)vim settings
+ .autoindent = {true|false} : Set automatic indentation for new line
+ .background = {'dark'|'light'} : Set the background color (Dark or Light)
+ .backup = {true|false} : Set backup options
+ .backupdir = '/path/to/backup/dir' : Set backup directory path
+ .cindent = {true|false} : Column Indent
+ .clipboard = 'clipboard-manager' : Set the clipboard manager; Recommended : unnamedplus
+ .cursorline = {true|false} : Highlight the row that the cursor is in
+ .cursorcolumn = {true|false} : Highlight the column that the cursor is in
+ .directory = '/path/to/directory' : Set general temporary directory path
+ .expandtab = {true|false} : Pressing tab actually tabs, not spaces
+ .hidden = {true|false} : Do not save when switching buffers
+ .history = n : Remember n items in command line history
+ .ignorecase = {true|false} : Case insensitive searching unless /c or capital in search
+ .jumpoptions = 'view' : Preserve view while jumping
+ .list = {true|false}
+ .listchars = 'keyword-1:[glyphicon-1],keyword-2:[glyphicon-2],...' : Substitute the specified keywords with their corresponding glyphicons; Seperate each keyword-glyphicon mapping with a comma-delimiter (',')
+ .number = {true|false} : Display row numbers
+ .numberwidth = n : Set width of the row-number column
+ .relativenumber = {true|false} : Display row numbers relative to the position of the cursor
+ .scrolloff = n  : Set number of screen lines to keep above and below the cursor
+ .signcolumn = {'yes'|'no'} : Display sign
+ .shiftwidth = n : Set the number of tabs you can have in a row; Recommended : 0
+ .smartcase = {true|false} : Case sensitivity according to search
+ .smartindent = {true|false} : Set smart indentation for new line
+ .softtabstop = n : Set the number of spaces in a tab; If negative, shiftwidth value is used
+ .splitright = {true|false} : Enable splitting to the right
+ .splitbelow = {true|false} : Enable splitting to the bottom
+ .swapfile = {true|false} : Generate/Disable swapfile
+ .tabstop = n : Set the number of spaces in a tab
+ .termguicolors = {true|false} : Set terminal GUI colors support
+ .textwidth = n : Set the number of words allowed in a row before wrapping
+ .timeoutlen = n : Set update timeout length
+ .undodir = '/path/to/undo/dir' : Set Undo directory path
+ .undofile = {true|false} : Generate/Disable undofile
+ .updatetime = n : Set update time
+ .wrap = {true|false} : Enable text wrapping
+ .writebackup = {true|false} : Write the backup

#### vim.opt
> (Neovim) optional settings
+ .mouse = 'a' : Set the mouse manager

## Resources

## References

## Remarks
