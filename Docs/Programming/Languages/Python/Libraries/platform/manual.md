# Python Library - platform

## Table of Contents
* [Documentation](#documentation)
* [Pre-Requisites](#pre-requisites)
* [Setup](#setup)

## Information
### DESCRIPTION
```
Platform is a built-in Python library designed to provide access to the underlying platform's identifying data

- Platform contains various functions that functions around retrieving the platform/system information such as 
    + architecture
    + kernel
    + system - Linux/Windows
    + release version etc

- Platform is an add-on with regards to functionalities found in the built-in library 'os'
```

## Documentation
        
### Importing
- Whole Module
    ```python
    import platform
    ```
    
### Modules
- platform

### Classes


### Objects

### Functions

#### Cross-Platform
- platform
    - .architecture(executable, bits, linkage) : Queries the system for the system architecture (x86|x64 etc)
        - Parameters
            - Positionals
                - executable : The executable to check
                    + Type :
                    + Default Value : sys.executable
                - bits : The
                    + Type : String
            - Optionals
        + Return Type : Tuple
        - Return Values : 
            - bit-architecture : The bit architecture 
                + Type : String
            - linkage-format-used : The linkage format used for the executable
                + Type : String

    - .machine() : Returns the machine type (i.e. "AMD64")
        + Return Type : String
        - Return Value : Empty string if the value cannot be determined
        
    - .node() : Returns the computer's network name (aka Hostname); The network name may not be qualified
        - Return
            + Type : String
            - Value : Empty string if the value cannot be determined
        
    - .platform(aliased, terse) : Checks the platform and obtains as much useful information as possible
        - Parameters
            - Positionals
                - aliased : Use Aliases; If set to true, the function will use aliases for various platforms that reports system names that differs from their common names
                    + Type : Integer
                - terse : Verbose Flag; If set to true, the function returns only the absolute minimum information needed to identify the platform
                    + Type : Integer
            - Optionals
        - Return
            + Type : String
            + Value : Human-Readable String
    
    - .system() : Returns the platform's Operating System
        - Return 
            + Type : String
            - Examples
                + Linux
                + Darwin
                + Java
                + Windows
    
    - .release() : Returns the platform's release version
        - Return
            + Type : String
            - Examples
                + 2.2.0
                + NT
      
### Usage
- Get platform's Operating System
    ```python
    os = platform.system()
    ```
    
- Get platform's release version
    ```python
    release = platform.release()
    ```

## Wiki

    
## References
+ [YouTube | NetworkChuck | build a meme Python website (Flask Tutorial for Beginners)](https://www.youtube.com/watch?v=5aYpkLfkgRE)

## Resources

## Remarks
+ Decorators : Essentially, adds more functionality to the function referenced right below it
