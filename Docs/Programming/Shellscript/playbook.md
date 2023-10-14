# Linux Bash Shellscripting - Playbook

```
Go-to Quickflow reference, and Collection of useful things to note with regardings to Linux Bash Shellscripting
```

## Topics
+ [Array/ArrayLists/Lists](#array)
+ [Key-Value Pair Mapping/HashMap/Dictionary/Associative Arrays](#associative-arrays)

## Contents
### Array
- Operators and Keywords
    + ! : Retrieve the index of the elements of the list
    + @ : Retrieve the size of the list

- Data Manipulation
    - To initialize an Array
        ```console
        declare array=()
        ```
- Accessing
    - To loop through the index of the elements of the list
        ```console
        for elements in "${!array[@]}"; do
            echo -e "$elements"
        done
        ```
    - To loop through the elements directly
        ```console
        for elements in "${array[@]}"; do
            echo -e "$elements"
        done
        ```
    - To obtain the value of an index in the list
        + Format: `${array[index]}`
        ```console
        for i in "${!array[@]}"; do
            # Get value of the index
            value="${array[$i]}"
            echo -e "$i => $value"
        done
        ```
- Remove an element from list via index (Array)
    - Unset the index from the list
        ```console
        unset list_name[$index]
        ```

### Associative Arrays
- Operators and Keywords
    + ! : Retrieve the key of the elements of the list
    + @ : Retrieve the size of the list

- Data Manipulation
    - To initialize an Associative Array
        ```console
        declare -A array=( [key]=value )
        ```
- Accessing
    - To loop through the keys of the dictionary/hashmap
        ```console
        for key in "${!assoc[@]}"; do
            echo -e "$key"
        done
        ```
    - To loop through the values of the dictionary/hashmap directly
        ```console
        for value in "${assoc[@]}"; do
            echo -e "$value"
        done
        ```
    - To obtain the value of a key
        + Format: `${assoc[key]}`
        ```console
        for key in "${!assoc[@]}"; do
            # Get value of key
            value="${assoc[$key]}"
            echo -e "$key => $value"
        done
        ```
- Remove a key from an Associative Array
    - Unset the key from the dictionary
        ```console
        unset assoc[$key_name]
        ```

## Resources

## References

## Remarks
