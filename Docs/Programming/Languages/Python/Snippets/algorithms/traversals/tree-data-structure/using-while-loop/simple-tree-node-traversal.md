# Python snippets - Traversal - Tree Data Structures - Traversing through a nested tree data structure using a while loop with depth tracking

## Information

### Description
- This documentation/snippet contains the algorithm to traverse through a nested tree-like data structure (such as a dictionary (key-value mapping) or a binary tree) using a while loop
    - Including the obtaining of data such as
        + Depth tracking : How deep each node is at the current leaf on the branch/sub-branches within the tree

### Components
+ Tree Data Structure to traverse/dig through
+ Stack container to hold the tree data structures to traverse through
+ depth counter

## Steps/Algorithm
1. Initialize Variables
    - Explanation
        + `parent = None`  : The default local variable containing the parent/previous key mapped to the current tree data structure
        + `current = tree` : The current tree data structure to traverse through in the stack
        + `depth = 0`      : how deep the node is in relation to the branch
        + `stack = [(parent, current, depth)]` : The stack object that will hold the tree data structure object as the starting node to traverse through, with each element in the stack as a tuple containing the current tree data structure object to iterate and the previous/parent key containing the current tree data structure object
        + `results = []`   : A results list to store the results to return to the function caller
        + `previous_keys = []` : List to hold all previous key
    ```python
    parent = None # The default local variable containing the parent/previous key mapped to the current tree data structure
    current = tree # The current tree data structure to traverse through in the stack
    depth = 0 # how deep the node is in relation to the branch
    stack = [(parent, current, depth)] # The stack object that will hold the tree data structure object as the starting node to traverse through, with each element in the stack as a tuple containing the current tree data structure object to iterate and the previous/parent key containing the current tree data structure object
    results = [] # A results list to store the results to return to the function caller
    previous_keys = [] # List to hold all previous key
    ```

2. Create a while loop that will iterate as long as the stack has items to traverse through
    ```python
    while stack:
        # Statements ...
    ```

3. Retrieve the (current, parent) tuple containing the current tree data structure to traverse through and the parent/previous 'key', then Pop the current element in the stack after retrieval
    ```python
        parent, current, depth = stack.pop()
    ```

4. Check if depth is back up to 1 (Root key) => reset the list
    - Explanation
        + This is used for resetting/re-initializing the list of previous keys and sub-keys while traversing down the current tree data structure's branches, sub-branches, leaf and nodes
    ```python
        if depth == 1:
            # Reset the previous keys
            previous_keys = []
    ```

5. (Optional) Print out the leaf nodes (points on the tree branch and sub-branches) and the parent tree branches
    ```python
        print(f"{'  ' * depth}Key: {parent}, Node: {current}, Depth: {depth}, Previous Keys: {previous_keys}")
    ```

6. Perform type checking - check if the current data structure is an iterable (i.e. dictionary, list) or just a static value (string, int)
    - Dictionary (Key-Value Mapping) Nested tree data structure
        - Explanation
            - Perform a for-loop iterating through the current dictionary tree data structure
                - Append each item in the dictionary into the stack as a tuple containing the values
                    + [0] : Key corresponding to the current dictionary value
                    + [1] : The current data structure element in the tree
                    + [2] : The depths of each key (depth+1)
                - (Optional) Check if the depth is more than 1 (contains nested subkeys)
                    - Check if there are items in the previous keys list
                        + Create a new map for the current depth mapping to a new list with the key
                    - Check if the current depth is not in the key
                        + Create a new map for the current depth
                    - Else
                        + Append all previous keys into the list
        ```python
        if isinstance(current, dict):
            # Object is a dictionary (key-value mapping) - Iterate through the current tree and append the key-value tuple to the stack
            # with the value as the current tree data structure, and the key as the previous
            for key, value in current.items():
                # Append the current data structure tuple to the top of the stack
                stack.append((key, value, depth+1))

                # Check if depth is more than 1 (subkeys) => Append all previous keys into the list
                if depth+1 > 1:
                    # Check if there are items in the previous keys list
                    if (len(previous_keys) == 0):
                        # No Items
                        # Create a new map for the current depth
                        previous_keys = [{depth : [key]}]
                    # if the current depth is in the key
                    elif not (depth in previous_keys[0]):
                        # No key
                        # Create a new map for the current depth
                        previous_keys[0][depth] = []
                    else:
                        # Append the previous keys
                        previous_keys[0][depth].append(key)
        ```
    - List (Index-based Ordered container) nested data structure
        - Explanation
            - Perform a for-loop iterating through the current list
                - Append each item in the list into the stack as a tuple containing the values
                    + [0] : The current element's index
                    + [1] : The current data structure element in the tree
                    + [2] : The depths of each key (depth+1)
                - (Optional) Check if the depth is more than 1 (contains nested subkeys)
                    - Check if there are items in the previous keys list
                        + Create a new map for the current depth mapping to a new list with the current index
                    - Check if the current depth is not in the list
                        + Create a new map for the current depth
                    - Else
                        + Append all previous index into the list
        ```python
        elif isinstance(current, list):
            # Object is a list (ordered, i.e. array)
            ## Iterate through the current tree and append the value to the stack
            ## with the parent as the current data structure and the value as the previous
            for i in range(len(current)):
                # Get current element
                curr_data = current[i]

                # Append the current data structure tuple to the top of the stack
                stack.append((i, curr_data, depth+1))

                # Check if depth is more than 1 (subkeys) => Append all previous keys into the list
                if depth+1 > 1:
                    # Check if there are items in the previous keys list
                    if (len(previous_keys) == 0):
                        # No Items
                        # Create a new map for the current depth
                        previous_keys = [{depth : [i]}]
                    # if the current depth is in the key
                    elif not (depth in previous_keys[0]):
                        # No key
                        # Create a new map for the current depth
                        previous_keys[0][depth] = []
                    else:
                        # Append the previous keys
                        previous_keys[0][depth].append(i)
        ```

7. Append the current results
    ```python
        results.append({"node" : current, "depth" : depth, "key" : parent})
    ```

8. Repeat step 3
    - Explanation
        + Repeat this loop until there are no more nested branches/sub-branches to add into the stack

## Snippets

### Manual

```python
# Initialize Variables
parent = None
current = tree
depth = 0 # how deep the node is in relation to the branch
stack = [(parent, current, depth)] # The stack object that will hold the tree data structure object as the starting node to traverse through, with each element in the stack as a tuple containing the current tree data structure object to iterate and the previous/parent key containing the current tree data structure object
results = []
previous_keys = [] # List to hold all previous key

# Create a while loop that will iterate as long as the stack has items to traverse through
while stack:
    # Retrieve the (current, parent) tuple containing the current tree data structure to traverse through and the parent/previous 'key'
    # then Pop the current element in the stack after retrieval
    parent, current, depth = stack.pop()

    # Check if depth is back up to 1 (Root key) => reset the list
    if depth == 1:
        # Reset the previous keys
        previous_keys = []

    # Print out the leaf nodes (points on the tree branch and sub-branches) and the parent tree branches
    print(f"{'  ' * depth}Key: {parent}, Node: {current}, Depth: {depth}, Previous Keys: {previous_keys}")

    # Perform type checking - check if the current data structure is an iterable (i.e. dictionary, list) or just a static value (string, int)
    if isinstance(current, dict):
        # Object is a dictionary (key-value mapping) - Iterate through the current tree and append the key-value tuple to the stack
        # with the value as the current tree data structure, and the key as the previous
        for key, value in current.items():
            # Append the current data structure tuple to the top of the stack
            stack.append((key, value, depth+1))

            # Check if depth is more than 1 (subkeys) => Append all previous keys into the list
            if depth+1 > 1:
                # Check if there are items in the previous keys list
                if (len(previous_keys) == 0):
                    # No Items
                    # Create a new map for the current depth
                    previous_keys = [{depth : [key]}]
                # if the current depth is in the key
                elif not (depth in previous_keys[0]):
                    # No key
                    # Create a new map for the current depth
                    previous_keys[0][depth] = []
                else:
                    # Append the previous keys
                    previous_keys[0][depth].append(key)
    elif isinstance(current, list):
        # Object is a list (ordered, i.e. array)
        ## Iterate through the current tree and append the value to the stack
        ## with the parent as the current data structure and the value as the previous
        for i in range(len(current)):
            # Get current element
            curr_data = current[i]

            # Append the current data structure tuple to the top of the stack
            stack.append((i, curr_data, depth+1))

            # Check if depth is more than 1 (subkeys) => Append all previous keys into the list
            if depth+1 > 1:
                # Check if there are items in the previous keys list
                if (len(previous_keys) == 0):
                    # No Items
                    # Create a new map for the current depth
                    previous_keys = [{depth : [i]}]
                # if the current depth is in the key
                elif not (depth in previous_keys[0]):
                    # No key
                    # Create a new map for the current depth
                    previous_keys[0][depth] = []
                else:
                    # Append the previous keys
                    previous_keys[0][depth].append(i)

    # Append the current results
    results.append({"node" : current, "depth" : depth, "key" : parent})
```

### Using Functions
- Function definition
    ```python
    def traverse_with_while_loop(tree):
        """
        Traverse the nested tree data structure (i.e. Key-Value Mappings like Dictionary, HashMap, Map, Associative Array or Binary Tree)
        """
        # Initialize Variables
        parent = None
        current = tree
        depth = 0 # how deep the node is in relation to the branch
        stack = [(parent, current, depth)] # The stack object that will hold the tree data structure object as the starting node to traverse through, with each element in the stack as a tuple containing the current tree data structure object to iterate and the previous/parent key containing the current tree data structure object
        results = []
        previous_keys = [] # List to hold all previous key

        # Create a while loop that will iterate as long as the stack has items to traverse through
        while stack:
            # Retrieve the (current, parent) tuple containing the current tree data structure to traverse through and the parent/previous 'key'
            # then Pop the current element in the stack after retrieval
            parent, current, depth = stack.pop()

            # Check if depth is back up to 1 (Root key) => reset the list
            if depth == 1:
                # Reset the previous keys
                previous_keys = []

            # Print out the leaf nodes (points on the tree branch and sub-branches) and the parent tree branches
            print(f"{'  ' * depth}Key: {parent}, Node: {current}, Depth: {depth}, Previous Keys: {previous_keys}")

            # Perform type checking - check if the current data structure is an iterable (i.e. dictionary, list) or just a static value (string, int)
            if isinstance(current, dict):
                # Object is a dictionary (key-value mapping) - Iterate through the current tree and append the key-value tuple to the stack
                # with the value as the current tree data structure, and the key as the previous
                for key, value in current.items():
                    # Append the current data structure tuple to the top of the stack
                    stack.append((key, value, depth+1))

                    # Check if depth is more than 1 (subkeys) => Append all previous keys into the list
                    if depth+1 > 1:
                        # Check if there are items in the previous keys list
                        if (len(previous_keys) == 0):
                            # No Items
                            # Create a new map for the current depth
                            previous_keys = [{depth : [key]}]
                        # if the current depth is in the key
                        elif not (depth in previous_keys[0]):
                            # No key
                            # Create a new map for the current depth
                            previous_keys[0][depth] = []
                        else:
                            # Append the previous keys
                            previous_keys[0][depth].append(key)
            elif isinstance(current, list):
                # Object is a list (ordered, i.e. array)
                ## Iterate through the current tree and append the value to the stack
                ## with the parent as the current data structure and the value as the previous
                for i in range(len(current)):
                    # Get current element
                    curr_data = current[i]

                    # Append the current data structure tuple to the top of the stack
                    stack.append((i, curr_data, depth+1))

                    # Check if depth is more than 1 (subkeys) => Append all previous keys into the list
                    if depth+1 > 1:
                        # Check if there are items in the previous keys list
                        if (len(previous_keys) == 0):
                            # No Items
                            # Create a new map for the current depth
                            previous_keys = [{depth : [i]}]
                        # if the current depth is in the key
                        elif not (depth in previous_keys[0]):
                            # No key
                            # Create a new map for the current depth
                            previous_keys[0][depth] = []
                        else:
                            # Append the previous keys
                            previous_keys[0][depth].append(i)

            # Append the current results
            results.append({"node" : current, "depth" : depth, "key" : parent})

        # Output/Return
        return results
    ```

- Function call/usage
    ```python
    def main():
        # Example usage
        nested_dict = {
            'a': {
                'b': {
                    'c': 1,
                    'd': 2
                },
                'e': 3,
                'f': [
                    {'g': 4},
                    {'h': "hello World"},
                ]
            },
            'i': 5
        }

        stack = traverse_with_while_loop(nested_dict)
        print("Stack: {}".format(stack))

    if __name__ == "__main__":
        main()
    ```

## Resources

## References

## Remarks

