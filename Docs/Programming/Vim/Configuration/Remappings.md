# VimRC Configuration Masterlist - Remappings and Keybindings

A full consolidation/compilation of VimRC Configuration topics as reference in creating a brand new VimRC. 

This is for remappings and Keybindings

## Table of Contents
- [Modes](#modes)
- [Visual Mode](#visual-mode)
- [Remarks](#remarks)
- [Resources](#resources)
- [References](#references)

## Information

Vim is a Modular Editor, this means it operates on multiple modes, allowing for various usages as well as potential

Types of Modes includes
- Normal
- Insert
- Visual
- Command

## Documentation

### Synopsis/Syntax

[mode][[{no}[re]]map] [new-keybind] [old-command/keybind]

### Parameters

+ remap   : Recursive Mapping
+ noremap : Non-Recursive Mapping

#### Modes

- General
	+ map : General, Overall Mapping
	+ noremap : General Non-Recursive Mapping

- Normal
	+ nmap : Normal Mode Mapping
	+ nnoremap : Normal Mode Non-Recursive Mapping

- Insert Mode
	+ imap : Insert Mode Mapping
	+ inoremap : Insert Mode Non-Recursive Mapping

- Visual Mode
	+ vmap : Visual Mode Mapping
	+ vnoremap : Visual Mode Non-Recursive Mapping

### Examples

#### Visual Mode

- Reselect Visual Selection after indenting
	```
	vnoremap < <gv	# When indenting backwards
	vnoremap > >gv	# When indenting forward
	```

## Remarks

## Resources

## References
