# Python Library/Module - ruamel.yaml

## Table of Contents
* [Documentation](#documentation)

## Information
### DESCRIPTION
- ruamel.yaml is a Python YAML Parser library 

## Documentation

### Packages
- ruamel.yaml : YAML Parser library

### Modules
- ruamel.yaml
    - .main : Contains main YAML functionalities

### Classes
- ruamel.yaml
    - `.YAML()` : Creates and initializes a YAML Parser instance
        - Return
            - yaml : The YAML Parser class object
                + Type: ruamel.yaml.YAML

### Functions
- ruamel.yaml.YAML()
    - `.dump(data, file-object)` : Dump/Write the specified data into the provided opened file object
        - Note
            + if the parameter 'file-object' is not specified, `.dump()` will return the dumped data as a YAML string
        - Parameter/Argument Signature
            - data: Specify the dictionary data you wish to dump into the file as YAML
                + Type: Dictionary
            - file-object: (Optional) Specify the opened file stream object you want to dump the dictionary contents into as YAML
                + Type: File Object
        - Return
            - yaml_string : If 'file-object' is not specified, `.dump()` will return the dumped data as a YAML string
                + Type: String
    - `.load(data)` : Load and read the provided opened YAML configuration file object/string to a dictionary
        - Parameter/Argument Signature
            - data: Specify the target opened YAML configuration file object stream/YAML configuration string to read into a dictionary
                + Type: String | File Object
        - Return
            - yaml_dict: The YAML file contents read and parsed to be stored into a dictionary (JSON-style)
                + Type: Dictionary

### Data Types and Objects

### Attributes/Variables

### Usage

### Operational Workflow
- Import package and modules
    - YAML Parser
        ```python
        from ruamel.yaml import YAML
        ```

- Initialize class object variables
    ```python
    yaml = YAML()
    ```

- Loading/Reading YAML configuration file into dictionary
    - Open the YAML configuration file you want to import
        ```python
        file = open("config.yaml", "r+")
        ```

    - Load the YAML configuration file contents into a dictionary
        ```python
        yaml_contents = yaml.load(file)
        ```

    - (Optional) Load a YAML string into a dictionary
        ```python
    yaml_string = """
key: value
key-2: value-2
        """
        yaml_contents = yaml.load(yaml_string)
        ```

    - Close file after usage
        ```python
        file.close()
        ```

- Convert and dump/write a dictionary object back into a YAML file
    - Open the YAML configuration file you want to dump to
        ```python
        file = open("config-new.yaml", "a+")
        ```

    - Dump the target dictionary contents into the opened YAML configuration file
        ```python
        yaml.dump(yaml_contents, file)
        ```

    - (Optional) Dump the target dictionary contents as a YAML string
        ```python
        yaml_str = yaml.dump(yaml_contents)
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
+ [lyz-code GitHub Pages - ruamel.yaml](https://lyz-code.github.io/blue-book/coding/python/ruamel_yaml/)
+ [Towards Data Sceicne - Writing YAML files with Python](https://towardsdatascience.com/writing-yaml-files-with-python-a6a7fc6ed6c3)
+ [YAML documentations - ruamel.yaml](https://yaml.readthedocs.io/en/latest/)

## Remarks

