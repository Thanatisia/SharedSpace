# Comparisons and similarities of syntax between languages

## Concepts
+ [Variables](#variables)
+ [Functions](#functions)

## Comparisons
### Variables
#### Declaration
- Python
    - variable object
        ```python
        var:[data-type] = values
        ```

- Javascript
    - variable object: let
        + Prefix the variable with the 'let' keyword
        + Basically, saying "let this object be a variable"
        ```js
        let var = value;
        ```

    - constant object: const
        + Prefix the variable with the 'const' keyword
        + A constant object cannot be changed during runtime after initialization
        ```js
        const var = value;
        ```

#### Simple value (aka standard variable)
+ Format: 1-to-1 value mapping
- Python
    ```python
    var:[data-type] = value
    ```
- Javascript
    ```js
    let var = value;
    ```

#### Lists : Index-based ordered mappings (i.e. Array, ArrayLists)
+ Format: 1-to-many container value
- Python
    ```python
    var:list = [element-1, element-2, ..., element-N]
    ```
- Javascript
    ```js
    let var = [element-1, element-2, ..., element-N];
    ```

#### Dictionary : Key-Value Mappings
+ Format: 1-to-many name:value pair mappings
+ Properties: name:value pairs
- Python
    - Declaration
        ```python
        variable:dict = {key:value, ...}
        ```
    - Accessing Object Properties
        ```python
        value = variable["key"];
        ```
- Javascript
    - Declaration
        ```js
        let variable = {key:value, ...};
        ```
    - Accessing Object Properties
        - Access as a variable of the object
            ```js
            var value = variable.property_name;
            ```
        - Access as a string element
            ```js
            var value = variable["property-name"];
            ```

### Functions

### Using as a package/module/library
#### Check if package is being imported
- Bash shellscript
    - Explanation
        + Similar to python
        - Syntax explanation 
            + '${variable}' will expand and resolve the variable into the value
            + '${BASH_SOURCE[0]}' will resolve to the first element that is sourced
            + ${0} expands to the current shellscript file on runtime
        - The application will check if "${BASH_SOURCE[0]}" expands into the same value as the current script's file name ("${0}")
            + If its the same, run the code
        + This is checking if the application is being ran as a standalone script, or as an imported library
    - Use Cases
        + this is important to identify the code to execute if and only if (iff) the script is imported/sourced as a dependency, and not if it is being ran normally
    ```bash
    main() {
        # Statements
    }

    if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
        main()
    fi
    ```

- JavaScript
    - Explanation
        + Similar to python
        - Syntax explanation 
            - require : A function
                + .main : main is a property of the function 'require' that checks if the module is a main file that is being ran directly
            - module : This is an object type/variable that is passed to all modules that are loaded by node.js
        - The application runtime will check
            - If 'require.main' expands and resolves to the current module (module)
                + If require.main is, then the current module is what was loaded from the command line
                + Run code
            - If not
                + The module was probably loaded by something else
                + Dont run code
        + This is checking if the application is being ran as a standalone script, or as an imported library
    - Use Cases
        + this is important to identify the code to execute if and only if (iff) the script is imported/sourced as a dependency, and not if it is being ran normally
    ```js
    function main() {
        // Statements ...
    }

    if (require.main === module) {
        main()
    }
    ```

- Python
    - Explanation
        + Python's default entry point is __main__.py or main.py
        - Python has a set of 'special macro functions' that performs automated runtime processing if it is detected
            + Basically detecting any occurences of this file/function (i.e. __function__/__function__.py) will overwrite the default functions with the code found
            - __name__ will be substituted with the current source filename on runtime
                - The application will then check if __name__ resolves into "__main__"
                    + If __name__ is "__main__", run the code
        + This is checking if the application is being ran as a standalone, or as an imported module/library/package (collectively written as 'library')
    - Use Cases
        - When using a packaging/distribution tool like setuptools (setup.py/pyproject.toml)
            + this is important to identify the code to execute if and only if (iff) the library is imported/sourced, and not if it is being ran normally
    ```python
    def main():
        # Statements

    if __name__ == "__main__":
        main()
    ```

## Wiki

## Resources

## References

## Remarks
