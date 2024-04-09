# Python Library/Module - toml

## Table of Contents
* [Documentation](#documentation)

## Information
### DESCRIPTION
+ toml is a Write-only variant of [tomllib](../tomllib/docs.md) which is a built-in Python TOML Parser library
- as of Python v3.11, the standard library version of tomllib does not support `.dump()` and is read-only
    + hence, this library is required as it contains '.dump()'

## Documentation

### Packages
- toml : Built-in TOML parser library

### Modules
- toml

### Classes

### Functions
- toml
    - `.dump(data, file-object)` : Dump/Write the specified data into the provided opened file object
        - Note
            + if the parameter 'file-object' is not specified, `.dump()` will return the dumped data as a TOML string
        - Parameter/Argument Signature
            - data: Specify the dictionary data you wish to dump into the file as TOML
                + Type: Dictionary
            - file-object: (Optional) Specify the opened file stream object you want to dump the dictionary contents into as TOML
                + Type: File Object
        - Return
            - toml_string : If 'file-object' is not specified, `.dump()` will return the dumped data as a TOML string
                + Type: String

### Data Types and Objects

### Attributes/Variables


### Usage

### Operational Workflow
- Import package and modules
    - TOML Parser (read-only as of Python 3.11)
        ```python
        import toml
        ```

- Convert and dump/write a dictionary object back into a TOML file
    - Open the TOML configuration file you want to dump to
        ```python
        file = open("config-new.toml", "a+")
        ```

    - Dump the target dictionary contents into the opened TOML configuration file
        ```python
        toml.dump(toml_contents, file)
        ```

    - (Optional) Dump the target dictionary contents as a TOML string
        ```python
        toml_str = toml.dump(toml_contents)
        ```

    - Close file after usage
        ```python
        file.close()
        ```

### Snippets

## Wiki

### Terminologies
+ Dictionary: A Relational Key-Value Mapping-based data structure; Equivalent other language's Associative Array and HashMap
+ List: Index/Positional-based data structure; Python's equivalent of Array/ArrayLists/Vectors

## References

## Resources
+ [Python Docs - Python3 - Library - tomllib](https://docs.python.org/3/library/tomllib.html)
+ [Invent With Python - Blog - 2022-02-23 - How to Use Python 3.11's New TOML Parser, tomllib](https://inventwithpython.com/blog/2022/02/23/how-to-use-python-311s-new-toml-parser-tomllib/)
+ [StackOverflow - Questions - 62690573 - Method to write python module output to toml file](https://stackoverflow.com/questions/62690573/method-to-write-python-module-output-to-toml-file)

## Remarks

