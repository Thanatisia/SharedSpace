# Docs - Python Module : re

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [References](#references)
- [Resources](#resources)
- [Remarks](#remarks)

## Information

+ Package Name: re
+ Package Type : Regular Expression 

## Setup

### Pre-Requisites

### Dependencies
- python
- pip

### Installation
> *re* is a built-in package in python

## Documentation

### Description

```
re is a built-in python Regular Expressions (regex) library/module
```

### Synopsis/Syntax

- Import the module
    ```python
    import re
    ```

### Modules


### Classes

### Functions
- re
    + .compile(regex-pattern) : Compiles the Regular Expression for use and returns the Regex Pattern as an object
        + Return Type : re.Pattern
    + .findall(regex-pattern, substring) : Returns a list containing all matches
        + Return Type : <'list'>
    + .search(regex-pattern, substring) : Search the substring to see if it matches the regular expression pattern provided
        + Return Type : re.Match
    + .split(regex-pattern, substring, maxsplit) : Searches the string to see if it matches the regular expression pattern provided and Returns a list where the string has been split at each match
        + Return Type : <'list'>
        - Parameters
            + maxsplit : Specify the number of occurences
    + .sub(character-regex-pattern, replace-text, substring, count) : Replaces the matches with the text of your choice
        + sub = Substitute
        + Return Type : <'str'>
        
### Objects
- re.Pattern : The Regular Expression Pattern
    - Properties
        + .search : Gets the search keyword from the Pattern
- re.Match : Contains information about the Matched search and result
    - Properties
        + .string : Returns the string passed into the function
    - Functions/Methods
        + .span() : Returns a tuple containing the start-, and end positions of the match
        + .group() : Returns the part of the string where there was a match

### Variables

### Usage


## References
+ [w3schools - Python Regex](https://www.w3schools.com/python/python_regex.asp)
+ [w3schools - Python Regex - findall](https://www.w3schools.com/python/python_regex.asp#findall)

## Resources


## Remarks

