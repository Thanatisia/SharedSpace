# Linux Shellscript - Using map object

## Information
### Basics
- A map data object generally refers to a Key-value data structure that maps a keyword to a value
    - Such as
        + Associative Array
        + Dictionary
        + HashMap

## Documentation
### Synopsis/Syntax
```console
declare -A 
```

### Parameters
+ -A : Explicitly declare the array object as a key-value data structure 'Associative Array' instead

### Usage
- Using Dictionary as Option flags
    - Declaring
        ```console
        declare -A opts=(
            # Current session options
            # [key]="value"
        )
        ```
    - Setting value
        ```console
        opts["--option"]=new_value
        ```

- For loop
    - Getting the key and value
        ```console
        # Declare and Initialize Associative Array variable
        declare -A assoc=(
            [key]="value"
        )

        for key in "${!assoc[@]}"; do
            # Get the value from the key
            value="${assoc[$key]}"

            # Print out key-value
            echo "$key = $value"
        done
        ```
    - Getting the value
        ```console
        # Declare and Initialize Associative Array variable
        declare -A assoc=(
            [key]="value"
        )

        for value in "${assoc[@]}"; do
            # Print out key-value
            echo "$value"
        done
        ```

- Check if Associative Array/Dictionary/HashMap key is a certain result
    ```console
    declare -A aarr=(
        ["key"]="value"
    )

    if [[ "${aarr["key"]}" == "value" ]]; then
        # Correct value
    fi
    ```

## Wiki

### Snippets

## Resources

## References

## Remarks