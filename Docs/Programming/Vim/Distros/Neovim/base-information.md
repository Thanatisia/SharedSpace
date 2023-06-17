# Documentation - Base Information

Documentation of the Vim Distribution - NeoVim

## Table of Contents
+ [Information](#information)
+ [Setup](#setup)
+ [Documentations](#documentations)
+ [Wiki](#wiki)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Information

### Project
+ Repository URL: https://github.com/neovim/neovim
- Documentations

### DESCRIPTION
```
Neovim is a distribution of vim that focuses on improving Vim by adding Lua support - expanding its scripting capabilities on top of the base vimscript, making it even more extensible.

With Lua support as well as built-in features such as LSP, Neovim is considered an improved variant of Vim
```

### File Structure
- On Linux
	```
	~/
	|
	|
	|-- .config/
	    |
	    |-- nvim/
	        |
	        |-- vimfiles/
	            |
	    	    |-- after/
	    	    |
	    	    |-- autoload/
	    	    |
	    	    |-- colors/
		    |
		    |-- ftplugin/
		    |
		    |-- lua/
		    |    |
		    |    |-- other_modules/
		    |
		    |
		    |-- plugged/
		    |
		    |-- site/
	 	    |
		    |-- .vimrc 
	        |
	        |-- init.vim
	|
	|-- .vimrc (if no .vim)
	```

- On Windows
	```
	%LOCALAPPDATA%
	|
	|-- nvim/
	    |
	    |-- vimfiles/
	        |
	    	|-- after/
	    	|
	    	|-- autoload/
	    	|
	    	|-- colors/
		|
		|-- .vimrc 
	    |
	    |-- init.vim
	|
	|-- nvim-data/
	    |
	    |-- plugged/
	    |
	    |-- shada/
	    |
	    |-- site/
	    |
	    |-- swap/
	|
	|-- .vimrc (if no .vim)
	```

## Setup
### Dependencies
+ git : For cloning git repositories

### Pre-Requisites

### Obtaining

### Installing


## Documentations

### Directories
+ after/ : All scripts placed here will be sourced or ran *after* the init.vim has been sourced and finished running.
+ autoload/ : Place all scripts to be sourced here; generally plugins
+ colors/ : Place colorschemes here; This folder will be searched for colorschemes
+ docs/ : This folder will be used by `:help` to find help documentations
+ ftplugin/ : Filetype plugins
+ lua/ : Contains all personal lua scripts; This folder will be searched for when loading modules at runtime
+ lua/other_modules/ : Contains all lua modules/libraries

### Terminologies
- rtp : The neovim Runtime Path; Basically this contains the paths that Neovim will load on runtime into the cache so it knows what the path contains
    - Structure : Your rtp is roughly ordered as follows
        1. your `~/.config/nvim/` directory : Configuration directory
        2. `~/.local/share/nvim/site` : local share directory
        3. loaded plugin directories
            - i.e.
                + `require("plugin-file")` => will load the lua file at "/lua/plugin/init.lua"
        4. neovim runtime : The runtime folder of your installed Neovim)
        5. Neovim libraries
        6. `/after` directories

## Wiki

## Resources

## References

## Remarks