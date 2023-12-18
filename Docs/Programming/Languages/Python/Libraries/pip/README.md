# Python package - pip

## Information
### Package
+ Name: pip

## Setup
### Dependencies
+ python

### Pre-Requisites

### Installation
- Using package manager
    - apt-based
        ```console
        sudo apt install python-pip
        ```
    - pacman-based
        ```console
        sudo pacman -S python-pip
        ```

## Documentation
### Synopsis/Syntax
- Running as a standalone binary
    ```console
    pip [actions] {options} <arguments>
    ```

- Running as a python module
    ```console
    python -m pip [action] {options} <arguments>
    ```

### Parameters
#### Positionals
- Actions
    + `freeze` : 
    + `install {options} <arguments>` : Install a python package
    + list
    + show

#### Optionals
- With Arguments

- Flags

### Usage

## Python Package
### Synopsis/Syntax
- Import package
    ```console
    import pip
    ```

### Modules
- pip
    - utils

### Classes

### Functions
- pip
    - main(command-list) : Execute the pip command
        - Parameters
            - command-list : List of command and subsequent CLI argument options (Similar to subprocess.Popen(command-list)
                + Type: List
                + Format: ['command', 'arguments', ...]
                - Commands
                    - list : List all packages using the pip subprocess wrapper; Equivalent to 'python -m pip list'
                    - show : Show 

- pip
    - utils
        - get_installed_distributions() : Returns a list of packages installed
             - Output
                 + Type: List

### Attributes

### Usage
- Execute the main pip wrapper
    ```console
    pip.main(['command', 'arguments', ...])
    ```

## Wiki

## Resources

## References

## Remarks