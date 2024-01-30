# Python Data Structures

## Structures
- Lists : Array/Index-based data structure container that have positions for each element; Equivalence includes Arrays, ArrayLists
    - Default Properties:
        - Pass-by Reference
            - Similar to the concept within C/C++ etc, Pass-by Reference means that any variable referencing the object doesnt do a "full, complete copy", but it performs an assignment copy
                + It will just copy the memory address containing the original target variable, pointing both variables to the same place in memory
                + This means that any changes made to the list will modify the original
                ```python
                new_list:list = class.original_list
                ```
            - To perform a shallow copy of a list
                + This will do a full copy of the original list to the new variable
                + Any changes made to the copy will not be affected
                ```python
                new_list:list = class.original_list.copy()
                ```

- Dictionary : Key-Value Mapping data structure that doesnt have indexes but instead, uses keywords mapping to a value for referencing; Equivalence includes 'HashMaps', 'Associative Arrays'
    - Default Properties:
        + Pass-by Reference
            - Similar to the concept within C/C++ etc, Pass-by Reference means that any variable referencing the object doesnt do a "full, complete copy", but it performs an assignment copy
                + It will just copy the memory address containing the original target variable, pointing both variables to the same place in memory
                + This means that any changes made to the list will modify the original
                ```python
                new_dict:dict = class.original_dict
                ```
            - To perform a shallow copy of a list
                + This will do a full copy of the original list to the new variable
                + Any changes made to the copy will not be affected
                ```python
                new_list:dict = class.original_dict.copy()
                ```
            - You can also use the built-in dict() function to make a shallow copy of a dictionary
                ```python
                new_list:dict = dict(class.original_dict)
                ```

## Tips and Tricks

## Troubleshooting
### Lists
- Using .pop() on a list/dictionary using an assignment copy
    + Will overwrite the original as well
    + This is because the assignment copy will point both variables to the same place in memory, essentially copying the memory address to the new variable
    + To fix: Use the '.copy()' shallow copy function

## Resources

## References
+ [Educative - How to copy a dictionary in python](https://www.educative.io/answers/how-to-copy-a-dictionary-in-python)
+ [Educative - How to copy a list in python](https://www.educative.io/answers/how-to-copy-a-list-in-python)

## Remarks
