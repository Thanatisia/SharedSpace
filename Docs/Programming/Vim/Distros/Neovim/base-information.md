# Documentation - Base Information

Documentation of the Vim Distribution - NeoVim

## Table of Contents
+ [Information](#information)
+ [File Structure](#file-structure)
+ [Explanation](#explanation)

## Information

### DESCRIPTION

```
Neovim is a distribution of vim that focuses on improving Vim by adding Lua support - expanding its scripting capabilities on top of the base vimscript, making it even more extensible.

With Lua support as well as built-in features such as LSP, Neovim is considered an improved variant of Vim
```

## File Structure

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

## Explanation

### Directories
+ after/ : All scripts placed here will be sourced or ran *after* the init.vim has been sourced and finished running.
+ autoload/ : Place all scripts to be sourced here; generally plugins
+ colors/ : Place colorschemes here
+ ftplugin/ : Filetype plugins
+ lua/ : Contains all personal lua scripts
+ lua/other_modules/ : Contains all lua modules/libraries
