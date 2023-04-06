# VimRC Configuration Masterlist - Autocommands

```
A full consolidation/compilation of VimRC Configuration topics as reference in creating a brand new VimRC. 

This is for Autocommands
```

## Table of Contents
- [Information](#information)
- [Documentation](#documentation)
- [Remarks](#remarks)
- [Resources](#resources)
- [References](#references)

## Information
```
Autocommands are actions that vim will execute on reading that autocommand and if the condition is met
```

## Documentation

### Synopsis/Syntax

autocmd [condition] [filetypes] [commands]

### Parameters

#### Conditions
- BufWritePre 	: Execute [command] before buffer is written to a file of [filetype]
- BufWritePost  : Execute [command] after buffer is written to a file of [filetype]
- BufReadPre    : Execute [command] before file of [filetype] is read into a buffer/before file is opened
- BufReadPost   : Execute [command] after file of [filetype] is read into a buffer/after file is opened
- FileType      : Execute [command] when the specified [FileType] is detected
- InsertEnter   : Execute [command] after entering Insert Mode
- InsertLeave   : Execute [command] after leaving Insert Mode
- WinEnter      : Execute [command] after entering the window
- WinLeave      : Execute [command] after leaving the window

### Examples

- Remove trailing whitespace from files of a specified extension
    ```
    autocmd BufWritePre *.{extension} :%s/\s\+$//e
    ```

## Remarks

## Resources

## References