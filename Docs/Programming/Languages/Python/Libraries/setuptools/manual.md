# Python Library - setuptools

## Table of Contents
* [Documentation](#documentation)
* [Pre-Requisites](#pre-requisites)
* [Setup](#setup)

## Information
### DESCRIPTION
```
setuptools is a Built-in python library that manages the setting up of the python module/package, and 
packages all the required specifications, resources and dependendencies to prepare for distribution.
```

## Documentation
        
### Importing
- Whole Module
    - setuptools
        ```python
        import setuptools
        ```

- Import class
    ```python
    from setuptools.[class] import [functions|class|variables]
    ```
    
### Modules

### Classes

### Objects

### Variables

### Functions
     
### Usage
    
## Wiki

### Format

### Packaging Python Projects
#### Filesystem Structure/Hierarchy
- Structure
    ```
    root/
    |
    |-- LICENSE
    |-- pyproject.toml : Tells the "frontend" build tools like pip and build what "backend" tools to use to create the distribution packages for your project
    |-- README.md
    |-- src/ : Your project source code
        |
        |-- package_name/
            |
            |-- __init__.py : For Initialization when module is imported; required to import the directory as a package (should be empty)
            |-- module_name.py : Your modules in the package that contains the logic
    |-- tests/ : Your Unit Tests here
    ```

#### pyproject.toml 
- Components
    - build-system
        - build-backend : The python object that frontends will use to build your python project/package
            + Type : String
            - Valid Values
                + flit_core.buildapi : Using Flit
                + hatchling.build : Using hatchling
                + pdm.pep517.api : Using PDM
                + setuptools.build_meta : Using setuptools
        - requires : Dependencies required to build/setup your python project
            + Type : List
            - Backend Builder Dependencies
                + flit_core : for Flit
                + hatchling : for Hatchling
                + pdm-pep517 : for PDM
                + setuptools : For Setup tools

- skeleton Structure
    - Setuptools
        ```toml
        [build-system]
        requires = [
            "setuptools>=61.0"
        ]
        build-backend = "setuptools.build_meta"
        ```

## References


## Resources
+ [Packaging Python Projects](https://packaging.python.org/en/latest/tutorials/packaging-projects/)

## Remarks

