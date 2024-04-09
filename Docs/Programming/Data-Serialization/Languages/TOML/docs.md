# TOML - Documentations

## TOML Rules
- TOML does not support newline key-value definitions in their dictionaries, every key-value maps have to be on a single line
    + However, defining Dictionaries in lists allows for newline

## Components
- Creating/Defining a new header block
    - Format
        + Use the '[your-header-block-keyword-here]' operator to set a header key
        + Specify your values underneath each header key
    ```toml
    [header-block]
    variable = value
    ```

- Setting a nested key within a header block updating that key's values
    - Format
        - Use the '[your-header-block-keyword-here]' operator to set a header key like before
            - However, the difference here is the addition of a '.' separator.
                + For each '.' delimiter you add along with a subkey, you are adding a new subtopic/key into the previous keyword and modifying the values in the latest keyword
    - Examples
        - Nested Subkey-1
            + This is equivalent to '{ "header-block" : { "subkey1" : { variable=value } } }'
            ```toml
            [header-block.subkey1]
            variable = value
            ```
        - Nested Subkey-2
            + This is equivalent to '{ "header-block" : { "subkey1" : { "subkey2" : { variable=value } } } }'
            ```toml
            [header-block.subkey1.subkey2]
            variable = value
            ```
        - Nested Subkey-N
            + This is equivalent to '{ "header-block" : { "subkey1" : { "subkey2" : { ... : "subkeyN" : { variable=value } } } } }'
            ```toml
            [header-block.subkey1.subkey2.subkeyN]
            variable = value
            ```

- Data Types
    - String variables
        ```toml
        [header-block]
        string_variable = "string-value"
        ```
    - int variables
        ```toml
        [header-block]
        int_variable = 0-9 # Numerical values
        ```
    - list variables
        ```toml
        [header-block]
        list_arr_variable = [
            "elements",
            ...
        ]
        ```
    - Dictionary variables
        - Notes
            - Dictionary is generally categorised as Key-Value Mappings, also known as HashMap, Associative Arrays
        ```toml
        [header-block]
        dictionary_variable = { "key"="value", ... }
        ```

## Structure

### Syntax Tree
- TOML has a syntax tree similar to .ini but converts into a similar structure as JSON, using Dictionary (Key-Value) mappings at its core
    - i.e.
        ```toml
        [header-block]
        string_variable = "string-value"
        int_variable = 0-9
        list_arr_variable = [
            "elements",
            { key=value, ... },
            ...
        ]
        dictionary_variable = { "key"="value" }
        ```

### Features
- Accessing/Modifying the values of a subkey in a parent key
    - Explanation
        - Given the following JSON
            ```json
            {
                "header" : {
                    "subtopic1" : {
                        "subtopic2" : {}
                    }
                }
            }
            ```
            + To access and modify "subtopic1" directly instead of accessing "header"
                ```toml
                [header.subtopic1]
                variable = value
                ```
            + To access and modify "subtopic2" directly instead of accessing "header" or "subtopic1"
                ```toml
                [header.subtopic1.subtopic2]
                variable = value
                ```
        - Access updating the TOML like the following
            ```toml
            [header]
            hello = "world"

            [header.subtopic1]
            foo = "bar"

            [header.subtopic1.subtopic2]
            foo1 = "bar2"
            ```
            - This will translate to the following JSON
                ```json
                {
                    "header" : {
                        "hello" : "world",
                        "subtopic1" : {
                            "foo" : "bar",
                            "subtopic2" : {
                                "foo1" : "bar2"
                            }
                        }
                    }
                }
                ```

### Similarities/Comparison between TOML and JSON
- Header Key-Value Mappings
    - TOML
        ```toml
        [header-block]
        variable = value
        ```
    - JSON
        ```json
        {
            header-block : {
                "variable" : value,
                ...
            }
        }
        ```

- Setting Variable-Values
    - String variables
        - TOML
            ```toml
            [header-block]
            string_variable = "string-value"
            ```
        - JSON
            ```json
            {
                header-block : {
                    "string-variable" : "string-value"
                }
            }
            ```
    - int variables
        - TOML
            ```toml
            [header-block]
            int_variable = int-value
            ```
        - JSON
            ```json
            {
                header-block : {
                    "int-variable" : int-value
                }
            }
            ```
    - list variables
        - TOML
            ```toml
            [header-block]
            list_arr_variable = [ "elements", ... ]
            ```
        - JSON
            ```json
            {
                header-block : {
                    "list_arr_variable" : [ "elements", ... ]
                }
            }
            ```
    - dictionary variables
        - Notes
            - TOML does not support newline key-value definitions in their dictionaries, every key-value maps have to be on a single line
                + However, defining Dictionaries in lists allows for newline
        - TOML
            ```toml
            [header-block]
            dictionary_variable = { "key"="value", ... }
            ```
        - JSON
            ```json
            {
                header-block : {
                    "dictionary_variable" : {
                        "key" : "value"
                    }
                }
            }
            ```

### Parsing TOML as a Dictionary (Key-Value) mapping
> Note: The following will be using Python as a pseudocode representative of the concept of Key-Value Mappings (equivalents excluding dictionary are: HashMap, Associative Arrays)

- Setup
    - Dependencies
        + python
        + python-pip
        + python-venv
        - Python package dependencies
            + tomllib

- Header Key-Value Mappings
    - TOML
        ```toml
        [header-block]
        variable = value
        ```
    - Python
        ```python
        {
            "header-block" : {
                "variable" : value,
                ...
            }
        }
        ```

- Setting Variable-Values
    - String variables
        - TOML
            ```toml
            [header-block]
            string_variable = "string-value"
            ```
        - Python
            ```python
            {
                "header-block" : {
                    "string-variable" : "string-value"
                }
            }
            ```
    - int variables
        - TOML
            ```toml
            [header-block]
            int_variable = int-value
            ```
        - Python
            ```json
            {
                "header-block" : {
                    "int-variable" : int-value
                }
            }
            ```
    - list variables
        - TOML
            ```toml
            [header-block]
            list_arr_variable = [ "elements", ... ]
            ```
        - Python
            ```python
            {
                "header-block" : {
                    "list_arr_variable" : [ "elements", ... ]
                }
            }
            ```
    - dictionary variables
        - TOML
            ```toml
            [header-block]
            dictionary_variable = { "key"="value", ... }
            ```
        - Python
            ```python
            {
                "header-block" : {
                    "dictionary_variable" : {
                        "key" : "value"
                    }
                }
            }
            ```

## Resources
+ [TOML to JSON Visualizer/Translator by Orchard Dweller](https://toml-to-json.orchard.blog/)

## References
+ [InventWithPython - Blog - 20220223 - How to Use Python 3.11's New TOML Parser, tomllib](https://inventwithpython.com/blog/2022/02/23/how-to-use-python-311s-new-toml-parser-tomllib/)

## Remarks

