# VimRC Configuration Masterlist - Autocommands

A full consolidation/compilation of VimRC Configuration topics as reference in creating a brand new VimRC. 

This is for Autocommands

## Table of Contents
- [Information](#information)
- [Documentation](#documentation)
- [Remarks](#remarks)
- [Resources](#resources)
- [References](#references)

## Information

Autocommands are actions that vim will execute on reading that autocommand and if the condition is met

## Documentation

### Synopsis/Syntax

autocmd [condition] [filetypes] [commands]

### Parameters

#### Conditions
- BufWritePre 	: Runs [command] when file of [filetype] is opened before writing buffer into the editor for editing
- BufWritePost 	: Runs [command] when file of [filetype] is opened after writing buffer into the editor for editing

### Examples

" Remove trailing whitespace from files of a specified extension
autocmd BufWritePre *.{extension} :%s/\s\+$//e

## Remarks

## Resources

## References