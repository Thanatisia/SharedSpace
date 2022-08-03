# Docs - Python Module : hashlib

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [References](#references)
- [Resources](#resources)
- [Remarks](#remarks)

## Information

+ Package Name: hashlib
+ Package Type : Secure hashing and message digest 

### Description

```
hashlib is a built-in python module that implements a common interface to many difference secure hashing and message digest algorithms such as
- SHA1
- SHA256
- MD5
```

## Setup

### Pre-Requisites

### Dependencies
- python
- pip

### Installation
> *hashlib* is a built-in package in python

## Documentation

### Synopsis/Syntax

- Import the module
    ```python
    import hashlib
    ```

### Modules

### Classes

### Functions
- hashlib
    - .md5(message) : To hash the byte string with MD5 algorithm; Returns a MD5 Hash object
        + Not Recommended
        + Return Type : MD5 <'hash'> object
    - .sha256(message) : To hash the byte string with SHA-256 algorithm; Returns a SHA-256 hash object
        + Return Type : SHA256 <'hash'> object
    - .sha512(message) : To hash the byte string with SHA-512 algorithm; Returns a SHA-512 hash object
        + Return Type : SHA512 <'hash'> object
    - .sha3_256(message) : To hash the byte string with SHA-3 algorithm; Returns a SHA-3 hash object
        + SHA3 is introduced by *NIST* as a backup plan
        + is a Sponge function that is completely different from SHA-2 and SHA-1
        + Return Type : SHA256 <'hash'> object
    + .blake2s(message) : To hash the byte string with 256-bit BLAKE2 (aka BLAKE2s) algorithm; Returns a Blake2 hash object
        + Return Type : 256-bit Blake2 <'hash'> object
    + .blake2b(message) : To hash the byte string with 512-bit BLAKE2 (aka BLAKE2b) algorithm; Returns a Blake2 hash object
        + Return Type : 512-bit Blake2 <'hash'> object
        
### Objects
- hashlib.bytes
    - Properties
        + .digest_size : Get the size of the resulting hash in bytes
- hashlib.hash
    - Properties
        + .digest_size : Get the size of the resulting hash in bytes
        + .block_size : Get the internal block size of the hash algorithm in bytes
    - Functions/Methods
        - .update(byte_string) : To update and append more byte string into the SHA256 Hash Object
            + Equivalent to appending the byte string with the existing byte string in the Hash object
        + .digest() : To obtain the digest of the byte string data passed to the .update() method at that point
            - Return Type : <'bytes'> object of size [digest_size] which may contain bytes in the range from 0 to 255
        + .hexdigest() : Like .digest() except the digest is returned as a string object of double length
            + Contains hexadecimal digits
            + Return Type : <'string'>
        + .copy() : Returns a copy ("clone") of the hash object
            + Can be used to efficiently compute the digests of data sharing a common initial substring

### Variables

### Usage
- Encode substring message to byte strings
    + using *string.encode()*
        ```python
        text = "Hash Text"
        message = text.encode()
        ```
    
- Decode byte string message to string
    + using *byte-string.decode()*
        ```python
        text = b"Hash Text"
        message = message.decode()
        ```

## References
+ [Python Docs - Hashlib](https://docs.python.org/3/library/hashlib.html)
+ [ThePythonCode - Hashing functions in Python using hashlib](https://www.thepythoncode.com/article/hashing-functions-in-python-using-hashlib)

## Resources


## Remarks

