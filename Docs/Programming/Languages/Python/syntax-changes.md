# Python new syntax updates

```
List/Compilation of Python syntax additions/changes
```

## Table of Contents
+ [Python v3.9](#python-v3-9)

## Python v3.9
- variables
    - Setting value to variable name
        ```python
        variable_name: value
        ```
    - Setting value to variable name WITH type definition
        ```python
        variable_name: data_type = value
        ```

- class variables
    ```python
    class ClassName:
        # Setting value to variable name
        variable_name: value

        # Setting value to variable name WITH type definition
        variable_name: data_type = value
    ```

- Function return type explicit specification
    ```python
    def function_name(arguments, ...) -> return_type:
    ```