# Python Algorithms - Recursion and Recursive functions for tree traversal

## Information
+ Recursion is the idea of repeating itself over and over again in a spiral loop

- A recursive function in Computer Science and Software Development is a function/method that will repetively call itself until a break or a return condition is encountered.
    + A useful recursive function is one where you have a specific recursion condition that will trigger the recursion, passing along the new dataset that you want to traverse through, as well as the results object to maintain the state of the recursion

- A recursive function usually consists of several components
    1. Function definition with the following parameter signatures/headers (at minimum)
        - data/dataset : The target data structure you want to traverse through either laterally (horizontally) or vertically
            + This dataset will change according to your iterable key-values while propagating/traversing down the tree
        - entries/results : A data object/container used to store all existing state during a recursion. 
            + This variable will be passed through during the recursion to collect the data as long as the recursion is still ongoing
    2. Recursive condition : This is typically a condition check for a certain condition where, if triggered, will call the function and pass all necessary data to the next stage of the recursion
        - The condition can be, but not limited to
            + Type checking : i.e. for a dictionary - if the type is a dictionary (iterable containing key-values), re-execute the function with that dictionary value as the target dataset
    3. Return condition : This will work as a break condition where if the recursive condition is not encountered, that means the traversal has reached the end of the tree and return the final dataset
        + This final dataset will be the 'entries' data object

+ Recursion in general is useful when attempting to dig downwards into any data structure resembling a tree with branches and nestings
- Various use cases includes
    + Nested Dictionary with branches and sub-branches
    + Binary Tree

## Syntax

> Using Python as a pseudocode

```python
def recursive_fn(dataset, results):
    # Condition Check
    if <recursion-condition>:
        # Perform Recursion here
        recursive_fn(dataset, results)
    else:
        # Set data as necessary to the results container

    # Return/Output
    return results
```

## Structure Example

> Dictionary (Key-value mapping) data structure (i.e. HashMap, Map, Associative Array)

```python
def dictionary_traversal(data, results=None): 
    # Initialize Variables
    if results == None: results = []

    # Recursively iterate and traverse through the dictionary key-value (and sub-key values) 
    for k, v in data.items():
        # Check data type of value
        if type(v) == dict:
            dictionary_traversal(v, results)
        else: 
            # Append the value into the key-value results list
            results.append({k : v})

    # Return
    return results

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
                "subkey2" : [ "entry", "entry", "entry" ],
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

