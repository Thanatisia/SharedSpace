# YAML Quickstart/Cheatsheet

## Structure
- YAML takes its spaces very seriously
    + only use spaces

- For values with multiple options, Lists or key-value pairs
    - Pre-pend with a '-' at the start
        + The '-' indicates the start of a list item
        ```yaml
        key:
            list_key:
                - value_1
                - value_2
                ...
            key_value_key:
                - key_1: value_1
                - key_2: value_2
                ...
        ```

## Commenting
+ YAML supports single-line commenting : Beginning with the 'sharp' sign
    ```yaml
    # comments
    ```

+ YAML does not support block/multi-line commenting

