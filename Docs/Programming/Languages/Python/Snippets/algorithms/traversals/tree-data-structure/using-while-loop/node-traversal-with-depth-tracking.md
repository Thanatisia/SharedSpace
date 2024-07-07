# Python snippets - Traversal - Tree Data Structures - Nested Tree Data Structure Traversal using stack and while-loops with depth tracking

## Information
### Description
+ Traversing through a nested tree data structure using a stack and while loop iteration to dig down and track the depth of the branch and sub-branches

## Basics
### Operating System and Memory Management
> Stack and Heap

- In computer science/software development 
    - The stack (in general) is a component of the category known as memory management and system programming,
        + and typically tied to another component known as the heap (together - they are called the 'stack & heap')
    + The stack and heap are both located in the computer's Random Access Memory (RAM)

- The Stack
    + The stack is a memory space set aside for function executions to occur
    - When a function is called, the block is reserved on the top of the stack for local variables to have a place to be stored when necessary
        + When that function is returned on completion, the block becomes unset and it can be used by another function call.
    - The stack contains elements arranged in a LIFO (Last-in-First-Out) model, where the last element (in this context - the node/branches of the tree to traverse through) that goes in will be the first to be processed out
        + The most-recently reserved block is always the next block to be freed
        - This makes keeping track of the stack simple
            + To free a block from the stack, just adjust one pointer 

- The Heap
    + The heap is a memory space set aside for dynamic memory allocation.

- In an Operating System context
    + the stack and heap are essentially still software/pieces of programs that executes the functionality required of a stack and heap

## Steps
1. Initialize variables
    - Explanation
        - Variables
            - stack : This is the stack - a list of tuples containing the nodes/branches/sub-branches that are to be added, traversed through and removed during the lifetime of the process loop/iteration in a LIFO (Last-in-First-Out) model
                + Type: List<Tuple>
                - Notes
                    + For more explanation, please refer to [Basics - Operating System and Memory Management](#operating-system-and-memory-management) for the basics of the Stack & Heap in an operating system
            - depth : This contains how deep the current node is in relation to the tree and branches
                + Type: Integer
    ```python
    # Initialize Variables
    stack = [(tree, 0, None)] # Stack to keep track of the current tree data structure to traverse through (aka the 'node') and their depths
    depth = 0 # How deep the current node is to the tree
    ```

2. Create a while loop that will iterate as long as the stack has items to traverse through
    ```python
    while stack:
    ```

3. Retrieve the next (current_node, depth) tuple containing the current tree data structure to traverse through (aka 'node') and the depth of the current node (how deep the current node is with relation to the overall tree)
    + then Pop the current node from the stack after retrieval
    ```python
        # Retrieve the next (current_node, depth) tuple containing the current tree data structure to traverse through (aka 'node') and the depth of the current node (how deep the current node is with relation to the overall tree)
        # then Pop the current node from the stack after retrieval
        current_node, depth, key = stack.pop()
        print(f"{'  ' * depth}Node: {current_node}, Depth: {depth}, Key: {key}")
    ```

4. Perform type checking - check if the current data structure is an iterable (i.e. dictionary, list) or just a static value (string, int)
    - Explanation
        - Check if the type of the current node within the leaf
            - Is a dictionary (Key-Value mapping)
                - Iterate through the dictionary and add a tuple containing the next node/branches to traverse through into the stack
                    - Tuple containing
                        + [0] = The value mapped to the current key
                        + [1] = The current depth of the branch + 1
                        - [2] = (Optional) The key mapping to the branch
                            - Notes
                                + If you leave this out, ensure that you remove 'i' from step 3, as well as from `elif isinstance(current_node, list)`
            - Is a list (ordered list (i.e. array))
                - Iterate through the list and add a tuple containing the next node/branches to traverse through into the stack
                    - Tuple containing
                        + [0] = The value mapped to the current key
                        + [1] = The current depth of the branch + 1
                        - [2] = (Optional) The index containing the current value
                            - Notes
                                + If you leave this out, ensure that you remove 'key' from step 3, as well as from `elif isinstance(current_node, dict)`
    ```python
        if isinstance(current_node, dict):
            # Object is a dictionary (key-value mapping) - Iterate through the current tree and append the key-value tuple to the stack
            # with the value as the current tree data structure, and the key as the previous
            for key, value in current_node.items():
                stack.append((value, depth + 1, key))
        elif isinstance(current_node, list):
            # Object is a list (ordered, i.e. array)
            ## Iterate through the current tree and append the nodes within the list to the stack in the form of a tuple
            ## with the elements [0] = The current node in the list, and [1] = The current depth + 1
            for i in range(len(current_node)):
                value = current_node[i]
                stack.append((value, depth + 1, i))
    ```

## Snippets

### Manual

```python
# Initialize Variables
stack = [(tree, 0, None)] # Stack to keep track of the current tree data structure to traverse through (aka the 'node') and their depths
depth = 0 # How deep the current node is to the track

# Create a while loop that will iterate as long as the stack has items to traverse through
while stack:
    # Retrieve the next (current_node, depth) tuple containing the current tree data structure to traverse through (aka 'node') and the depth of the current node (how deep the current node is with relation to the overall tree)
    # then Pop the current node from the stack after retrieval
    current_node, depth, key = stack.pop()
    print(f"{'  ' * depth}Node: {current_node}, Depth: {depth}, Key: {key}")

    if depth > 0:
        print("")

    # Perform type checking - check if the current data structure is an iterable (i.e. dictionary, list) or just a static value (string, int)
    if isinstance(current_node, dict):
        # Object is a dictionary (key-value mapping) - Iterate through the current tree and append the key-value tuple to the stack
        # with the value as the current tree data structure, and the key as the previous
        for key, value in current_node.items():
            stack.append((value, depth + 1, key))
    elif isinstance(current_node, list):
        # Object is a list (ordered, i.e. array)
        ## Iterate through the current tree and append the nodes within the list to the stack in the form of a tuple
        ## with the elements [0] = The current node in the list, and [1] = The current depth + 1
        for i in range(len(current_node)):
            value = current_node[i]
            stack.append((value, depth + 1, i))
```

### Using Functions
- Function definition
    ```python
    def traverse_nested_dict_track_depth(tree):
        """
        Traverse the nested tree data structure (i.e. Key-Value Mappings like Dictionary, HashMap, Map, Associative Array or Binary Tree) and 
        track the depth of the branch/sub-branch or nodes (how deep it currently is), and reduce the depth whenever it goes back up to the previous branches
        """
        # Initialize Variables
        stack = [(tree, 0, None)] # Stack to keep track of the current tree data structure to traverse through (aka the 'node') and their depths
        depth = 0 # How deep the current node is to the track

        # Create a while loop that will iterate as long as the stack has items to traverse through
        while stack:
            # Retrieve the next (current_node, depth) tuple containing the current tree data structure to traverse through (aka 'node') and the depth of the current node (how deep the current node is with relation to the overall tree)
            # then Pop the current node from the stack after retrieval
            current_node, depth, key = stack.pop()
            print(f"{'  ' * depth}Node: {current_node}, Depth: {depth}, Key: {key}")

            if depth > 0:
                print("")

            # Perform type checking - check if the current data structure is an iterable (i.e. dictionary, list) or just a static value (string, int)
            if isinstance(current_node, dict):
                # Object is a dictionary (key-value mapping) - Iterate through the current tree and append the key-value tuple to the stack
                # with the value as the current tree data structure, and the key as the previous
                for key, value in current_node.items():
                    stack.append((value, depth + 1, key))
            elif isinstance(current_node, list):
                # Object is a list (ordered, i.e. array)
                ## Iterate through the current tree and append the nodes within the list to the stack in the form of a tuple
                ## with the elements [0] = The current node in the list, and [1] = The current depth + 1
                for i in range(len(current_node)):
                    value = current_node[i]
                    stack.append((value, depth + 1, i))
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

        traverse_nested_dict_track_depth(nested_dict)

    if __name__ == "__main__":
        main()
    ```

## Resources

## References
+ [Baeldung - Computer Science - Stack and Heap memory](https://www.baeldung.com/cs/memory-stack-vs-heap)

## Remarks

