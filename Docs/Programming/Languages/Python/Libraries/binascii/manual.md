# Docs - Python Module : binascii

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [References](#references)
- [Resources](#resources)
- [Remarks](#remarks)

## Information

+ Package Name: binascii
+ Package Type : Type Conversion

## Setup

### Pre-Requisites

### Dependencies
- python
- pip

### Installation
- Using PyPi
    ```python
    python -m pip install pycryptodome
    ```

## Documentation

### Description
```
Binascii is a Python module created to convert between Binary and ASCII.

binascii supports a number of methods to convert between Binary and various ASCII-encoded Binary representations of the object.

- Relevant modules:
    - Wrapper Modules
        + uu
        + base64
        + binhex
```

### Synopsis/Syntax

- Import the whole module
    + import binascii

### Modules

### Classes

### Functions
- binascii
    - hex_str = .hexlify(byte_obj) : Convert the bytes object specified to a Hexadecimal-value string object
        - Parameters
            - byte_obj : The bytes object you want to convert into a hexadecimal-value string object for printing
                + Type : Bytes
        - Return Type : String
    - byte_obj = .unhexlify(hex_str) : Reverse the hex conversion back to the original Bytes object
        - Parameters
            - hex_str : The Hexadecimal string object you want to reverse back to Bytes object
                + Type : String
        - Return Type : bytes
    

### Objects
  
### Exceptions
- binascii
    + Error : Raised On any programming Error
    + Incomplete : Raised on Incomplete data

### Variables

### Usage

   
## References
+ [Python Docs - binascii](https://docs.python.org/3/library/binascii.html)

## Resources


## Remarks

