# Python Algorithms - Using Recursion - (Nested) Dictionary Tree Traversal

## Steps
1. Define the recursive function to traverse and drill through the nested dictionary key-values and subkeys
    - Explanation
        - This function contains 
            - Parameter Signature/Header
                - data : This is the main dictionary target to loop and traverse through
                    + This parameter is needed to receive the nested subkeys and the nested dictionary-typed subvalues
                    + During every iteration, it will dig through all nested subkeys and subvalues until it reaches the last key (iteration stops recursing)
                - entries : For holding the current state of all ongoing processes during the recursion
                    + This container will be brought all the way until the return keyword (break condition) is received to end the recursion
    ```python
    def dictionary_traversal(data, entries=None): 
    ```

2. Initialize all variables (if it doesnt exist)
    ```python
        # Initialize Variables
        if entries == None: entries = []
    ```

3. Recursively iterate and traverse through the dictionary key-value (and sub-key values)
    - Explanation
        - the core logic to check for any nested iterables (Dictionary/Lists) and if detected, will trigger the recursive mechanism
            + Only when there is an Iterable will it iterate, passing all data with it to maintain the state of the process
            - This recursion process will continue until the recursion is not called (No dictionaries are detected)
                + When that occurs, the function will finish everything and return the resulting container to the caller
    ```python
        # Recursively iterate and traverse through the dictionary key-value (and sub-key values) 
        for k, v in data.items():
            # Check data type of value
            # if isinstance(v, dict): 
            if type(v) == dict:
                # entries.append({k : v})
                entries.append(k)
                dictionary_traversal(v, entries)
            else: 
                # print("{0} : {1}".format(k, v))
                # Append the value into the key-value results list
                entries.append({k : v})
    ```

4. Break Condition: Return the entries if no more Iterables are detected
    ```python
        # Return
        return entries
    ```

## Snippets

> Function Definition and Implementation

```python
def dictionary_traversal(data, entries=None): 
    # Initialize Variables
    if entries == None: entries = []

    # Recursively iterate and traverse through the dictionary key-value (and sub-key values) 
    for k, v in data.items():
        # Check data type of value
        # if isinstance(v, dict): 
        if type(v) == dict:
            # entries.append({k : v})
            entries.append(k)
            dictionary_traversal(v, entries)
        else: 
            # print("{0} : {1}".format(k, v))
            # Append the value into the key-value results list
            entries.append({k : v})

    # Return
    return entries
```

> Function call and usage

```python
def main():
    data = {
        "key_str" : "str",
        "key_int" : 0,
        "key_list" : [
            "element-1",
            "element-2",
        ],
        "key_dict" : {
            "subkey1" : {
                "subkey2" : [ "subeelemnt-1" ],
                "subkey3" : {
                    "subkey4" : "value"
                }
            }
        }
    }
    print(data)
    results = dictionary_traversal(data)
    for i in range(len(results)):
        curr_row = results[i]
        print("{} : {}".format(i, curr_row))

if __name__ == "__main__":
    main()
```

