# VimRC Configuration Masterlist - Highlighting

A full consolidation/compilation of VimRC Configuration topics as reference in creating a brand new VimRC. 

This is for Highlights (hl)

## Table of Contents

- [Information](#information)
- [Documentation](#documentation)
- [Customization and Configuration](#customization-and-configuration)
- [Remarks](#remarks)
- [Resources](#resources)
- [References](#references)

## Information

Vim allows for Highlight handling based on specific "Types" and colour configurations

## Setup

### Pre-Requisites

- You must enable the following
	```console
	syntax enable
	```	

## Documentation

### Synopsis/Syntax

{hl|highlight} [type] {term, cterm, ctermbg, ctermfg, guibg, guifg}

### Parameters

#### Types

+ Normal	: Set Normal values
+ NonText	: Set Non-Text Value
+ Special	: Set special character values
+ Comment	: Set Comments
+ Constant	: Set constant values
+ Cursor	: Set the cursor itself
+ CursorLine    : Set the Highlighted/Selected Row
+ CursorColumn  : Set the Highlighted/Selected Column

#### Options

+ term : Terminal General Format (I.E. Bold, underline)
	- Options:
		+ bold
		+ underline
+ cterm : Cursor Terminal General Format (I.E. Bold, underline)
	- Options:
		+ bold
		+ underline
+ ctermbg : Cursor Terminal Background Colour (Highlighted Background)
+ ctermfg : Cursor Terminal Foreground Colour (Highlighted Text/Font)
+ guibg : GUI Background Colour
+ guifg : GUI Foreground Colour (I.E. Text/font colour)

### Examples

1. Comments
    ```console
    highlight Comment guifg=DarkGray 
    ```

2. Highlight Cursor Line (Row)
    ```console
    highlight CursorLine term=underline cterm=underline ctermbg=darkgray ctermfg=None guibg=Grey20 guifg=None
    ```

3. Highlight Cursor Column
    ```console
    highlight CursorColumn term=bold cterm=bold ctermbg=darkgray ctermfg=None guibg=Grey20 guifg=None
    ```

## Customization and Configuration

### Notes

1. You can assign a "opacity level" to each colour code/font colours with the following syntax
	- Colour(n)
		- where n = Opacity Level (20, 30, 40 ...)
		- the lower your n, the more opaque it becomes
		- the higher your n, the more transparent it becomes

### Formats

+ underline 
+ bold

### Colour Codes

+ Red
+ darkgray
+ Grey(n)

## Remarks

## Resources

## References
