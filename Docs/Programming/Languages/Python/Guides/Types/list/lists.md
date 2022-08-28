# Python - Lists

## Formatting
- To encode a list into bytes object
    ```
    A list cannot natively be encoded into a string
    ```
    - Convert the list into a string 
        ```python
        list_obj = ["Hello", "World"]
        list_str = str(list_obj)
        ```
    - Encode the list string into bytes
        ```python
        encoded_list = list_str.encode("utf-8")
        ```

- To decode a encoded list back into list object
    - Convert the encoded list object back into a string 
        ```python
        list_str = encoded_list.decode("utf-8")
        ```
    - Revert the list string into list
        ```python
        list_obj = list(list_str)
        ```

