# Python Library - os

## Table of Contents
* [Documentation](#documentation)
* [Pre-Requisites](#pre-requisites)
* [Setup](#setup)

## Information
### DESCRIPTION
```
OS is a built-in python library to provide a portable way of handling Operating System (OS)-dependent functionality.
```

## Documentation
        
### Importing
- Whole Module
    ```python
    import os
    ```
    
### Modules
- os         : Handles general OS hardware/software information
- os.path    : Handles System Path (i.e. PATH or PYTHONPATH variable)
- os.environ : Handle Environment Variables

### Classes


### Objects

### Variables
- os
    - .name : Returns the name of the Operating System-dependent module import
        - Notes
            + Similar to 'sys.platform' or the 'platform' module
        - Examples
            + posix : For UNIX/Linux systems
            + nt : For Windows (NT) systems

### Functions

#### Cross-Platform
- os.environ
    - .get(env_variable_key) : Get value of the Environment Variable
        - Parameters
            - env_variable_key : The Environment Variable to get
                + Type : String
        + Return Type: String
      
### Usage
- Get Environment Variables
    ```python
    env = os.environ.get("Environment-Variable-Key") # Get value of the Environment Variable
    ```
    
## Wiki

    
## References


## Resources
+ [Python Docs - OS](https://docs.python.org/3/library/os.html)

## Remarks

