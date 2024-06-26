# Python snippets - Data Types - Type Checking - Using isinstance()

## Information
### Description
+ isinstance() is a built-in function for checking the type of an object compared to a specific data type

### Synopsis/Syntax

- Function Definition
    ```python
    def isinstance(data, type)
    ```

- Parameter Signature/Headers
    - data : Specify the variable/object you wish to check the data type of
        + Type: Any
    - type : Specify the type/class to compare with the provided data
        + Type: Any

- Return
    - is_type : Boolean value representing if the object is the provided data type
        + Type: Boolean

## Steps
1. Define and Initialize your variable/objects
    ```python
    i = 0
    data = ["value", "of", 1, 0.5, ["List", "Elements"], {"dictionary" : "mappings"}]
    v = data[i]
    ```

2. Check the type of the variable
    ```python
    # Check value type
    if isinstance(v, str):
        # Is string
    elif isinstance(v, int):
        # Is integer
    elif isinstance(v, float):
        # Is float/real
    elif isinstance(v, list):
        # Is list
    elif isinstance(v, dict):
        # Is dictionary
    else:
        # None of the above typings
        print("Invalid value: {} [type: {}]".format(v, type(v)))
    ```

## Snippets

```python
data = ["value", "of", 1, 0.5, ["List", "Elements"], {"dictionary" : "mappings"}]

for k,v in data.items():
    # Check value type
    if isinstance(v, str):
        # Is string
    elif isinstance(v, int):
        # Is integer
    elif isinstance(v, float):
        # Is float/real
    elif isinstance(v, list):
        # Is list
    elif isinstance(v, dict):
        # Is dictionary
    else:
        # None of the above typings
        print("Invalid value: {} [type: {}]".format(v, type(v)))
```

