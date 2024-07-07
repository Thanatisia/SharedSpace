# Python snippets - Algorithms - Using Recursion to traverse a (Nested) Dictionary Tree and print the key value (and sub-key) mappings

## Steps
1.  Define the recursive function to traverse and dig down into the dictionary dataset branches and sub-branches (subkeys) and print them in a row
    - Explanation
        - This function contains 
            - Parameter Signature/Header
                - data : This is the main dictionary target to loop and traverse through
                    + This parameter is needed to receive the nested subkeys and the nested dictionary-typed subvalues
                    + During every iteration, it will dig through all nested subkeys and subvalues until it reaches the last key (iteration stops recursing)
    ```python
    def print_nested(self, data):
    ```

2. Recursively iterate and traverse through the dictionary key-value (and sub-key values) 
    - Explanation
        - the core logic to check for any nested iterables (Dictionary/Lists) and if detected, will trigger the recursive mechanism
            + Only when there is an Iterable will it iterate, passing all data with it to maintain the state of the process
            - This recursion process will continue until the recursion is not called (No dictionaries are detected)
                + When that occurs, the function will finish everything and return the resulting container to the caller
    ```python
        for k, v in data.items():
            # Check data type of value
            if isinstance(v, dict):
                print("")
                print("{0} : {1}".format(k, v))
                self.print_nested(v, results)
            elif isinstance(v, list):
                print("{}".format(k))
                for i in range(len(v)):
                    # Get current element
                    curr_element = v[i]
                    # Print
                    print(" - {}".format(curr_element))
            else:
                print("{0} : {1}".format(k, v))
    ```

## Snippets

> Function Definition and Implementation

```python
def print_nested(self, data): 
    """
    Traverse and dig down into the dictionary dataset branches and sub-branches (subkeys) and print them in a row
    """
    # Recursively iterate and traverse through the dictionary key-value (and sub-key values) 
    for k, v in data.items():
        # Check data type of value
        if isinstance(v, dict):
            print("")
            print("{0} : {1}".format(k, v))
            self.print_nested(v, results)
        elif isinstance(v, list):
            print("{}".format(k))
            for i in range(len(v)):
                # Get current element
                curr_element = v[i]
                # Print
                print(" - {}".format(curr_element))
        else:
            print("{0} : {1}".format(k, v))
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
                "subkey2" : [ "subelement-1" ],
                "subkey3" : {
                    "subkey4" : "value"
                }
            }
        }
    }
    print(data)

    if data != None:
        if isinstance(data, dict):
            # Print nested
            print_nested(data)

if __name__ == "__main__":
    main()
```

## Resources

## References

## Remarks

