# Python - Dictionary - Data Structures and Algorithms : Dynamically Searching/Filtering for key-value using a list of keys

## Information

## Documentations

### Algorithm Operational Signature
1. Declare and initialize variables 
    - Results list
        ```python
        results = []
        ```
    - List of target keys and subkeys
        - Notes
            + This list can contain either a string (standalone key) or a list of keys (parents and nested subkeys within the dictionary)
        ```python
        keys = []
        ```
2. Iterate through the list of target keys
    ```python
    # Iterate through the keys provided
    for i in range(len(keys)):
        # ...
    ```
3. Get the current key in the list
    ```python
    # Get current key
    curr_key = keys[i]
    ```
4. Check if the current element is a list of keys (parent key and the nested subkeys) or a string (standalone key)
    - Notes
        + Implement the instructions in step 5 in the appropriate type cases specified below
    ```python
    # Check the type of the key
    match curr_key:
        case list():
            ## List element
            # ...
        case str():
            ## String element
        case _:
            # Invalid type; Default
    ```
5. Operate on the obtained key according to the variable's data type to obtain the value of the current key
    - List keys
        - Explanation
            - Setup
                - Pre-Requisites
                    - Obtain the parent key in the list of keys (Index 0) (parent_key)
                        + Item 1 (Index 0) is the parent/root key, 
                    - Obtain the value of the parent key in the dictionary object (parent_root_val)
                        + Every subsequent elements in the list (Index 1:) are nested/mapped to the key before
                    + Obtain the remaining subkeys in the list of keys as a separate array (Index 1:) (Stored in 'nested_subkeys')
                - Initialize Variables
                    + Empty variable for storing the results to append into the final list (curr_res_val)
                    + Temporary variable for storing the subkey's values during iteration (curr_subkey_val)
            - Flow
                - Iterate through the nested subkeys list (nested_subkeys)
                    + Obtain the current subkey in the list of nested sub-keys (Store as 'curr_subkey')
                    + Get the value in the dictionary stored in 'curr_subkey_val' containing the key value in 'curr_subkey'
                    + Set the value of 'curr_subkey_val' to 'curr_res_val' (The storage variable) 
                    - Repeat point 1 until every nested subkey is used
                        + The final result will be the mapped value of `dict[parent][nest_1][nest_2][...][nest_N]`
        ```python
        parent_key = curr_key[0] # Get the root key
        parent_root_val = dict_obj[parent_key] # Get the value mapped to the root key
        nested_subkeys = curr_key[1:] # Get the child subkeys under the parent key

        curr_res_val = ""
        curr_subkey_val = parent_root_val

        # Iterate the key and subkeys
        for j in range(len(nested_subkeys)):
            # Get current subkey
            curr_subkey = nested_subkeys[j]

            # Get value in the dictionary stored in 'curr_subkey_val' corresponding to the key value 'curr_subkey'
            curr_subkey_val = curr_subkey_val[curr_subkey]

            # Set the previous value as the current value
            curr_res_val = curr_subkey_val
        ```
    - String key
        ```python
        curr_res_val = dict_obj[curr_key]
        ```
    - Invalid type
        ```python
        curr_res_val = ""
        ```
6. Append the current value to the results list
    ```python
    # Append into results
    results.append(curr_res_val)
    ```
7. Repeat Step 1 until the final element in the list of keys
8. Return the results list containing the values obtained from the keys

## Snippets

- Explanation
    - Parameter Signature/Header
        - dict_obj : The target Dictionary (Key-Value) mapping you wish to search from
            + Type: dict

        - keys : List of all configuration keys to pull from the set configs
            + Type: vargs<str|list>
            - Format
                - String key (1 layer) : This is a layer-1 key that you wish to obtain from the dictionary
                    - Example Structure
                        ```
                        Given an input "key",

                        This is equivalent to `dict_obj["key"]`

                        The lookup algorithm is as follows
                            res = dict["key"]
                        ```
                    ```python 
                    key_lookup("key-name")
                    ```
                - Nested Keys (multi-layer) : Item 1 (Index 0) is the parent/root key, Every subsequent elements in the list are nested/mapped to the key before
                    - Example
                        ```
                        Given a list/array ["parent", "nest-1", "nest-2", "nest-3"],

                        This is equivalent to:
                            parent = arr[0]
                            nested_subkeys = arr[1:]

                            nest_1 = nested_subkeys[0]
                            nest_2 = nested_subkeys[1]
                            nest_3 = nested_subkeys[3]

                        Mapping Structure:
                            dict = {
                                parent
                                    nest_1
                                        nest_2
                                            nest_3
                            }

                            or

                            dict[parent][nest_1][nest_2][nest_3]

                        The lookup algorithm is as follows
                            res = dict[parent]
                            res_1 = res[nest_1] # dict[parent][nest_1]
                            res_2 = res_1[nest_2] # dict[parent][nest_1][nest_2]
                            res_3 = res_2[nest_3] # dict[parent][nest_1][nest_3][nest_3]
                        ```
                    ```python
                    key_lookup(["parent-root-key", "nested-key-1", "nested-key-2", ...])
                    ```

```python
def key_lookup(dict_obj, *keys):
    """
    Get the values of all specified keys (and nested subkeys) within the provided dictionary (Key-Value mapping; aka HashMap, Map, Table, Associative Array)
    """
    # Initialize Variables
    results = []

    # Iterate through the keys provided
    for i in range(len(keys)):
        # Get current key
        curr_key = keys[i]

        # Check the type of the key
        match curr_key:
            case list():
                ## List element
                parent_key = curr_key[0] # Get the root key
                parent_root_val = dict_obj[parent_key] # Get the value mapped to the root key
                nested_subkeys = curr_key[1:] # Get the child subkeys under the parent key

                curr_res_val = ""
                curr_subkey_val = parent_root_val

                # Iterate the key and subkeys
                for j in range(len(nested_subkeys)):
                    # Get current subkey
                    curr_subkey = nested_subkeys[j]

                    # Get value of of subkey
                    curr_subkey_val = curr_subkey_val[curr_subkey]

                    # Set the previous value as the current value
                    curr_res_val = curr_subkey_val
            case str():
                ## String element
                curr_res_val = dict_obj[curr_key]
            case _:
                # Invalid type; Default
                curr_res_val = ""

        # Append into results
        results.append(curr_res_val)

    return results
```

## Resources

## References
+ [StackOverflow - Questions - 72295812 - Python match case by type of value](https://stackoverflow.com/questions/72295812/python-match-case-by-type-of-value)

## Remarks

