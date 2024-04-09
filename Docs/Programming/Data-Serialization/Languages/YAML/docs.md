# YAML - Documentations

## YAML Rules
- YAML takes its spaces very seriously
    + only use the selected tab/spaces for indentations once one is used

## Components
- Data Types
    - String variables
        - Default
            ```yaml
            string_variable: "string-value"
            ```
        - Unquoted string
            ```yaml
            string_variable: string-value
            ```
    - int variables
        - Default
            ```yaml
            int_variable: 0-9 # Numerical values
            ```
    - list variables
        - Explanation
            - Lists (Arrays) are prepended with the '-' behind each list entry indented under the list variable header
                + The '-' represents each element values (i.e. multiple options, Lists)
        - Default
            ```yaml
            list_arr_variable:
                - "elements"
                - ...
            ```
        - List of Dictionaries
            ```yaml
            list_arr_variable:
                - dictionary_variable:
                    key_1 : value_1
                    key_2 : value_2
                    ...
            ```
        - Nested List
            ```yaml
            list_arr_variable:
                - "element_1"
                - element-2
                - nested_list_arr_variable:
                    - "element-3"
                    - element-4
                    - ...
            ```
    - Dictionary variables
        - Explanation
            - Dictionary (Key-Value) mappings are represented by the ':' operator
                + Each key-value mapping entry is indented under the header block variable and the key (left-hand side (LHS)) is mapped to the value (right-hand side (RHS))
        - Default
            ```yaml
            dictionary_variable:
                key_1 : value_1
                key_2 : value_2
            ```
        - Dictionary of Lists
            ```yaml
            dictionary_variable:
                key_1 : value_1
                key_2 : value_2
                list_variable:
                    - element-1
                    - "element-2"
            ```
        - Nested Dictionaries
            ```yaml
            dictionary_variable:
                key_1: value_1
                key_2: value_2
                nested_dictionary:
                    key_3 : value_3
                    key_4 : value_4
            ```
        - Nested Dictionary of Lists
            ```yaml
            dictionary_variable:
                key_1: value_1
                key_2: value_2
                nested_dictionary:
                    key_3 : value_3
                    key_4 : value_4
                    nested_list:
                        - element-1
                        - "element-2"
            ```

## Structure

### Syntax Tree
- YAML's syntax tree is similar to Python, whereby it uses indentations as its method of line separation
    - i.e.
        ```yaml
        string_key: "string-value"
        int_var: 0-9
        list_arr_variable:
            - "elements"
        dictionary_variable:
            "key1" : "value-1"
            "key2" : "value-2"
        ```
    - However, it converts into a similar structure as JSON, using Dictionary (Key-Value) mappings at its core
        ```json
        {
            "string_key" : "string-value",
            "int_var" : 0-9,
            "list_arr_variable" : [
                "elements"
            ],
            "dictionary_variable" : {
                "key1" : "value1",
                "key2" : "value2",
            }
        }
        ```

### Features

### Similarities/Comparison between YAML and JSON
- Header Key-Value Mappings
    - YAML
        ```yaml
        header-block:
            variable: value
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
        - YAML
            ```yaml
            header-block:
                string-variable: "string-value"
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
        - YAML
            ```yaml
            header-block:
                int_variable: 0-9
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
        - YAML
            ```yaml
            header_block:
                list_arr_variable:
                    - "elements"
                    - ...
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
        - YAML
            ```yaml
            header-block:
                dictionary_variable:
                    key: "value"
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

### Parsing YAML as a Dictionary (Key-Value) mapping
> Note: The following will be using Python as a pseudocode representative of the concept of Key-Value Mappings (equivalents excluding dictionary are: HashMap, Associative Arrays)

- Setup
    - Dependencies
        + python
        + python-pip
        + python-venv
        - Python package dependencies
            + pyyaml

- Header Key-Value Mappings
    - YAML
        ```yaml
        header-block:
            variable: value
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
        - YAML
            ```yaml
            header-block:
                string-variable: "string-value"
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
        - YAML
            ```yaml
            header-block:
                int-variable: 0-9
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
        - YAML
            ```yaml
            header-block:
                list_arr_variable:
                    - "elements"
                    - ...
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
        - YAML
            ```yaml
            header-block:
                dictionary_variable:
                    key: value
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

## Wiki

### Example YAML file use-cases

> docker-compose.yaml

```yaml
version: "3.7"
services:
  service-name:
    image: "image-name"
    container_name: "container-name"
    restart: unless-stopped
    environment:
      - "ENV_NAME=value"
    build:
      context: .
      dockerfile: "Dockerfile"
    ports:
      ## Port Forward/Translate/Map from host system to container
      ## {host-ip-address}:[host-port-number]:[container-port-number]
      - "8080:8080"
    volumes:
      ## Mount volumes from host system into container
      ## [host-system-volume]:[container-volume]:{permissions (rwx)}
      - "/path/to/volumes:/app"
```

### Terminologies
+ Dictionary : generally categorised as Key-Value Mappings, also known as HashMap, Associative Arrays

## Resources

## References

## Remarks

