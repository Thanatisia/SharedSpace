# Python snippets - Algorithms - Tree Traversal - Dictionary - Key Lookup

## Steps
1. Define the key lookup function with the parameter signature/headers
    - Explanation
        - Parameter Signature/Headers
            - dict_obj : The target Dictionary (Key-Value) mapping you wish to search from
                + Type: dict

            - keys : List of all configuration keys to pull from the set configs
                + Type: vargs
                - Format
                    + String key (1 layer) : key_lookup("key-name")
                    + Nested Keys (multi-layer) : key_lookup(["parent-root-key", "nested-key-1", "nested-key-2", ...])
    ```python
    def key_lookup(dict_obj, *keys):
    ```

2. Initialize Variables
    - Explanation
        + The variable 'results' is used to store the results to return to the function caller
    ```python
        results = []
    ```

3. Iterate through the keys provided
    ```python
        for i in range(len(keys)):
    ```

4. Get the current key in the iteration/loop
    ```python
            curr_key = keys[i]
    ```

5. Check the type of the current key
    - Explanation
        - Using a match-case (aka switch-case), check the type of the current key
            - If the current key is list
                - Get the first element of the list - This is the 'root' key (Basically the top-level key within a key-value mapping tree (dictionary))
                    + Set it as the parent root key (`parent_key = curr_key[0]`)
                + Get the value mapped to the root key and set it as the parent root value (`parent_root_val = dict_obj[parent_key]`)
                - Get the nested (child) sub-keys under the parent key (All subsequent elements within the current key list)
                    + This will be the nested subkeys for the current key (`nested_subkeys = curr_key[1:]`)
                - Pre-Loop Setup
                    - Initialize a new results value for the current key (`curr_res_val = ""`)
                        + This is a temporary container used to hold the resulting value derived from the current key
                        + This will be appended into the results container for returning
                    + Set the current nested subkey's value as the parent root value as the starting point (`curr_subkey_val = parent_root_val`)
                - Iterate the list of nested subkeys belonging to the current key - Essentially, this will repeat and the current results value will be the final key within the list of nested subkeys, aka the target nested key
                    + Get the current subkey from the nested subkeys (`curr_subkey = nested_subkeys[j]`)
                    + Get the value of the current subkey (`curr_subkey_val = curr_subkey_val[curr_subkey]`)
                    + Set the current results value as the previous subkey value (`curr_res_val = curr_subkey_val`)
            - If the current key is a string
                + Set the current result value as the current key's value (`curr_res_val = dict_obj[curr_key]`)
            - Else (Default value)
                + Invalid type, set as empty string
    ```python
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

                        # Get the value of the current subkey
                        curr_subkey_val = curr_subkey_val[curr_subkey]

                        # Set the previous value as the current value
                        curr_res_val = curr_subkey_val
                case str():
                    ## String element
                    curr_res_val = dict_obj[curr_key]
                case _:
                    # Invalid type; Default
                    curr_res_val = ""
    ```

6. Append the current resulting value into the results list after processing
    - Explanation
        + After the pattern matching, the current key's resulting value will be determined
        + Append that result and repeat the iteration until the last element
    ```python
            results.append(curr_res_val)
    ```

7. Return the results on completion
    ```python
        return results
    ```

## Snippets

### Implementation
```python
def key_lookup(dict_obj, *keys):
    """
    Get the values of all specified keys (and nested subkeys) within the provided dictionary (Key-Value mapping; aka HashMap, Map, Table, Associative Array)

    :: Params
    - dict_obj : The target Dictionary (Key-Value) mapping you wish to search from
        + Type: dict

    - keys : List of all configuration keys to pull from the set configs
        + Type: vargs
        - Format
            + String key (1 layer) : key_lookup("key-name")
            + nested Keys (multi-layer) : key_lookup(["parent-root-key", "nested-key-1", "nested-key-2", ...])
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

                    # Get the value of the current subkey
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

### Usage

```python
dict_obj = {
    "Hello" : {
        "World" : "Yes"
    },
    "Hello-2" : "String Yes",
    "Hello-3" : {
        "Hello-4" : {
            "Hello-5" : "No"
        }
    }
}
print(key_lookup(dict_obj, ["Hello", "World"], "Hello-2", "Hello-3", ["Hello-3", "Hello-4", "Hello-5"]))
```

## Resources

## References

## Remarks

