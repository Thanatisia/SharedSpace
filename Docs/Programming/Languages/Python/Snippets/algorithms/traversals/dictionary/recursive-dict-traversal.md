# Python snippets - Algorithms - (Nested) Dictionary Tree Traversal - Using Recursion

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

- Nested Tree Traversal
    ```python
    def traverse(data, results=None): 
        """
        Traverse and dig down into the dictionary dataset branches and sub-branches (subkeys) and return the keys and key-values in a list of lists

        :: Params
        - data : Specify the target dictionary (key-value mapping) dataset you want to traverse and navigate through
            + Type: Dictionary
        - results : This is the results list that will hold the ongoing state/results per recursion.
            + Type: List<List<str,T>>
            + Default: None

        :: Return
        - results : Contains a list of lists where each eleemnt of the master list is a key-value mapping
            + Type: List<List<str,T>>
            - Notes
                - This format is designed such that 
                    + the first element (`results[0]`) is always the key and
                    + the subsequent elements (`results[1:]`) are always the value
                + You can check if the key is a subkey by checking if the value is a dictionary
            - Format
                [
                    [key, value], # Key 1
                    [key, value], # Key 2
                    [key, value], # Key 3
                    [key, value], # Key 4
                ]
        """
        # Initialize Variables
        if results == None: results = []

        # Recursively iterate and traverse through the dictionary key-value (and sub-key values) 
        for k, v in data.items():
            # Append a new entry for the current key, with the current key being the root
            curr_iter_res = [k]

            # Check data type of value
            if isinstance(v, dict):
                print("")
                print("{0} : {1}".format(k, v))
                # Append current element to the current results list
                curr_iter_res.append(v)
                # Append the iteration to the results
                results.append(curr_iter_res)
                traverse(v, results)
            elif isinstance(v, list):
                print("{}".format(k))
                for i in range(len(v)):
                    # Get current element
                    curr_element = v[i]
                    # Append current element to the current results list
                    curr_iter_res.append(curr_element)
                # Append the iteration to the results
                results.append(curr_iter_res)
            else:
                print("{0} : {1}".format(k, v))
                # Append current element to the current results list
                curr_iter_res.append(v)
                # Append the value into the key-value results list
                results.append(curr_iter_res)

        # Return
        return results
    ```

- Check if a target key is a subkey
    ```python
    def check_if_subkey(dataset, target_key, counter=0):
        """
        Check if the given key is a subkey within the dictionary

        :: Params
        - dataset : Specify the target dataset (of type list<list<str,T>>; derived using `.traverse(data)`) you want to use to check if the specified target key is a subkey (contains nested dictionary as values)
            + Type: Dictionary
        - results : This is the results list that will hold the ongoing state/results per recursion.
            + Type: List<List<str,T>>
            + Default: None

        :: Return
        - results : Contains a list of lists where each eleemnt of the master list is a key-value mapping
            + Type: List<List<str,T>>
            - Notes
                - This format is designed such that 
                    + the first element (`results[0]`) is always the key and
                    + the subsequent elements (`results[1:]`) are always the value
                + You can check if the key is a subkey by checking if the value is a dictionary
            - Format
                [
                    [key, value], # Key 1
                    [key, value], # Key 2
                    [key, value], # Key 3
                    [key, value], # Key 4
                ]
        """
        # Initialize Variables
        results = []
        is_subkey = False

        # Recursively iterate and traverse through the dictionary key-value (and sub-key values) 
        for kv in dataset:
            # Get the key and the values
            k = kv[0]
            v = kv[1]
            print("{} = {}".format(k,v))

            # Check if the data type of the value is a dictionary (contains nested key-values) == subkey
            if isinstance(v, dict):
                # Dictionary, key is a subkey
                ## Check if the current key is the target key
                if k == target_key:
                    is_subkey = True
            elif isinstance(v, list):
                # List - re-run the function with the new value as the dataset
                # k = v[0]
                # v = v[1]

                # Recursively re-run
                check_if_subkey(v, target_key)

        # Return
        return is_subkey
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

    # Traverse and navigate down each branch and sub-branch of the dictionary tree and obtain all key-values and nested sub-key and sub-values
    results = traverse(data)

    # Perform basic print - Iterate all results returned
    for i in range(len(results)):
        # Get current row
        curr_row = results[i]
        # Print current row
        print("{0} : {1}".format(i, curr_row))

if __name__ == "__main__":
    main()
```

> Check if the keys in the dataset is a subkey (value mapped is a nested dictionary)

- Using 'check_if_subkey()'
    ```python
    # Check if the key is a subkey - Check if the last element of the current dataset is a subkey
    is_subkey = check_if_subkey(all_key_values, k)
    print("is {} nested?: {}".format(k, is_subkey))
    if is_subkey:
        print("{} is a subkey".format(k))
    else:
        print("{} is not a subkey".format(k))
    ```

- Manually
    ```python
    for kv in all_key_values:
        # Get the key and the values
        k = kv[0]
        v = kv[1]
        if isinstance(v, dict):
            print("{} is a subkey".format(k))
        else:
            print("{} is not a subkey".format(k))
        print(kv)
        print("")
    ```

## Resources

## References

## Remarks

