# Python snippets - Dynamically generate tables for each nested branch/sub-branches while traversing within a tree data structure using recursion

## Information
### Description
- Simple snippet showcasing the dynamic generating of tables whenever a node is a nested branch/sub-branch whilst traversing within a nested tree data structure object
    + Replace the struct class 'Table' with your table equivalent object

## Steps

### Setup
1. Create table structure class to hold the properties/attributes of each table
    - Explanation
        - structure class 'Table'
            - Properties/Attributes
                + `self.data` : Contains the data/values to be placed within the table
                + `self.tables` : A dictionary (key-value mapping) to store all the nested tables
                + `self.references` : A list to store the references to nested tables within the root table
    ```python
    class Table:
        def __init__(self, data):
            self.data = data
            self.tables = {}  # To store nested tables
            self.references = []  # To store references to nested tables in the root table
    ```

### Traversal
1. Define function to traverse and generate the tables
    - Explanation
        - Parameter Signature/Headers
            - data : Specify the tree data structure you want to traverse through
            - depth : Contains the depth of the current node within the nested branch/sub-branches
    ```python
    def traverse_and_create_tables(data, depth=0):
    ```
2. Create a new Table instance for the current data
    ```python
        current_table = Table(data)
    ```
3. Perform data structure type checking
    - Check if the current data is a dictionary
        - Explanation
            - Perform a for loop and iterate through the current dataset
                - Recursively traverse the current value with incremented depth
                    + For each iteration, return the obtained table
                    - On retrieving of a table, 
                        + Add the nested table to the current table's table dictionary
                        + Add a reference to the nested table in the refernces list of the current table
                    + Repeat the above down all nested nodes until there are no more nested branch/sub-branches within the values of this dataset
        ```python
        if isinstance(data, dict):
            # Traverse each key-value pair in the dictionary
            for key, value in data.items():
                # Recursively traverse the value with incremented depth
                table = traverse_and_create_tables(value, depth + 1)
                # Add the nested table to current_table's tables dictionary
                current_table.tables[key] = table
                # Add a reference to the nested table in the references list of current_table
                current_table.references.append(table)
        ```

    - Check if the current data is a list
        - Explanation
            - Perform a for loop and iterate through the current dataset
                - Recursively traverse the current value with incremented depth
                    + For each iteration, return the obtained table
                    - On retrieving of a table, 
                        + Add the nested table to the current table's table dictionary
                        + Add a reference to the nested table in the refernces list of the current table
                    + Repeat the above down all nested nodes until there are no more nested branch/sub-branches within the values of this dataset
        ```python
        elif isinstance(data, list):
            # Traverse each element in the list
            for idx, item in enumerate(data):
                # Recursively traverse the item with incremented depth
                table = traverse_and_create_tables(item, depth + 1)
                # Add the nested table to current_table's tables dictionary
                current_table.tables[idx] = table
                # Add a reference to the nested table in the references list of current_table
                current_table.references.append(table)
        ```
4. Return the current table back up to the previous node up the branches
    ```python
        return current_table
    ```

## Snippets

> Create table structure class to hold the properties/attributes of each table

```python
class Table:
    def __init__(self, data):
        self.data = data
        self.tables = {}  # To store nested tables
        self.references = []  # To store references to nested tables in the root table
```

> Define function to traverse and generate the tables

```python
def traverse_and_create_tables(data, depth=0):
    # Create a new Table instance for the current data
    current_table = Table(data)

    # Check if the current data is a dictionary
    if isinstance(data, dict):
        # Traverse each key-value pair in the dictionary
        for key, value in data.items():
            # Recursively traverse the value with incremented depth
            table = traverse_and_create_tables(value, depth + 1)
            # Add the nested table to current_table's tables dictionary
            current_table.tables[key] = table
            # Add a reference to the nested table in the references list of current_table
    
    # Check if the current data is a list
    elif isinstance(data, list):
        # Traverse each element in the list
        for idx, item in enumerate(data):
            # Recursively traverse the item with incremented depth
            table = traverse_and_create_tables(item, depth + 1)
            # Add the nested table to current_table's tables dictionary
            current_table.tables[idx] = table
            # Add a reference to the nested table in the references list of current_table
            current_table.references.append(table)

    return current_table
```

> Define function to print tables recursively

```python
def print_tables(table, indent=0):
    # Print the current table data
    print('  ' * indent + 'Table:', table.data)

    # Recursively print nested tables
    for key, nested_table in table.tables.items():
        print('  ' * (indent + 1) + f'Key: {key}')
        print_tables(nested_table, indent + 2)
```

> Main Function

```python
def main():
    # Example usage with an extended nested structure including lists
    nested_structure_1 = {
        'A': {
            'B': {
                'C': {},
                'D': [1, 2, 3]
            },
            'E': [
                {'F': {}},
                {'G': {}}
            ]
        },
        'H': [
            {'I': {}},
            {'J': {}}
        ]
    }

    nested_structure_2 = {
        "key_str" : "str",
        "key_int" : 0,
        "key_list" : ["element1", "element2", "element3"],
        "key_dict" : {
            "subkey1" : {
                "subsubkey1" : "subsubvalue1"
            }
        }
    }

    # Create the root table
    root_table = traverse_and_create_tables(nested_structure_2)

    # Print the root table and all nested tables
    print_tables(root_table)

if __name__ == "__main__":
    main()
```

## Resources

## References

## Remarks

