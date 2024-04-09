# Python Library/Module - tomllib

## Table of Contents
* [Documentation](#documentation)

## Information
### DESCRIPTION
+ tomllib is a built-in Python TOML Parser library
- as of Python v3.11, the standard library version of tomllib does not support `.dump()` and is read-only
    + an external library called 'toml' contains '.dump()'

## Documentation

### Packages
- tomllib : Built-in TOML parser library

### Modules
- tomllib

### Classes

### Functions
- tomllib
    - `.loads(data)` : Load and read the provided opened TOML configuration file string (that was read in) to a dictionary
        - Parameter/Argument Signature
            - data: Specify the target TOML configuration string to read into a dictionary
                + Type: String
        - Return
            - toml_dict: The TOML file contents read and parsed to be stored into a dictionary (JSON-style)
                + Type: Dictionary

### Data Types and Objects

### Attributes/Variables


### Usage

### Operational Workflow
- Import package and modules
    - TOML Parser (read-only as of Python 3.11)
        ```python
        import tomllib
        ```

- Loading/Reading TOML configuration file into dictionary
    - Open the TOML configuration file you want to import
        ```python
        file = open("config.toml", "r+")
        ```

    - Read file contents
        ```python
        toml_string = file.read()
        ```

    - (Optional) Design toml string
        ```python
        toml_string = """
    [header]
    string = "value"
        """
        ```

    - Load TOML string into a dictionary
        ```python
        toml_contents = tomllib.loads(toml_string)
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

## Remarks

