# VimRC Configuration Masterlist - Settings

A full consolidation/compilation of VimRC Configuration topics as reference in creating a brand new VimRC. 

This is for settings (non-plugin, base Vim settings)

## Table of Contents
- [Settings](#settings-and-enable)
- [Conditionals](#conditionals)
- [Highlighting](#highlighting)
- [Remarks](#remarks)
- [Resources](#resources)
- [References](#references)

## Settings and Enable

Enable Autoindent in new line			: set autoindent
Enable Smart indent in new line based off language : set smartindent
Enable Cursor Column 				: set cursorcolumn
Enable Cursor Line/Row 				: set cursorline
Enable Highlight Search Pattern			: set hlsearch
Enable Ignore case search sensitivity		: set ignorecase
Enable Line Numbers 				: set number
Enable Mouse Support 				: set mouse=a
Enable Relative Line Numbers 			: set relativenumber
Enable Smart Case search sensitivity		: set smartcase
Enable Syntax Highlighting 			: syntax on
Set amount of whitespace to be added		: set softtabstop=n
Set amount of whitespace to addd in normal mode : set shiftwidth=n
Set width of tab character			: set tabwidth=n
Set text wrap width (default to 0 to have unlimited line length) : set textwidth=n
Set use space instead of tabs			: set expandtab
Show the matching part of pairs [] {} and () 	: set showmatch

## Conditionals

" Enable Color Themes
if !has('gui_running')
	set t_Co=256	: Set Terminal Colour if is not gui
endif
set termguicolors 	: Set Terminal GUI colors
colorscheme [colorscheme] : Set colorscheme

## Highlighting
Set Cursor Line Highlighting 	:highlight Cursorline cterm=bold ctermbg=black
Set Cursor Column Highlighting 	:highlight CursorColumn cterm=bold ctermbg=black


## Remarks

## Resources

## References