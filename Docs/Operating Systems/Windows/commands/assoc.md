# Documentation - Command : assoc

## Table of Contents
+ [Information](#information)
+ [Setup](#setup)
+ [Documentation](#documentation)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Information

### Description
```
assoc, short for Association, is a Windows command line utility that 
shows which file types are associated with which programs.
```

## Documentation

### Synopsis/Syntax
```batchdos
assoc {options <arguments>} {.fileext[=filetype]}
```

### Parameters

- Positional
    + .fileext : Specify the file extension to associate the file type with
    + filetype : Specify the file type to associate with the file extension

- Optionals
    + /? : Display detailed option information

### Usage

- Set a new program to be associated with the file type/extension
    - MP4
        ```batchdos
        assoc .mp4=[program_ID]
        ```

## Wiki

## Resources

## References
+ [YouTube | NetworkChuck | 40 Windows Commands you NEED to know (in 10 Minutes)](https://www.youtube.com/watch?v=Jfvg3CS1X3A)

## Remarks

