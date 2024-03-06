# Linux command - Sort

```
The sort command is a CLI utility for sorting lines of text files by 

1. Opening a file
2. Obtaining file contents
3. Closing the file
4. Sorting the results
5. Printing the results to standard output
```

## Information

## Documentations
### Synopsis/Syntax
- Standard
    ```console
    sort {options} <arguments> [target-file]
    ```

- Sort the results of a standard output
    ```console
    [command] | sort {options} <arguments>
    ```

### Defaults
- If a file has uppercase and lowercase contents
    + sort will order uppercase first

### Parameters
- Positionals
    + target-file : Specify the target file to sort
- Optionals
    - With Arguments
        + `-k [field-number]` : Sort according to the specified field/column (i.e. if field-number is 2, sort using column 2)
        - `-t [delimiter]` : Sort by a delimiter
            - Delimiters
                + , : Values separated by comma-delimiter (i.e. CSV files)
    - Flags
        + -c : Check if a file is already sorted; This will write to standard output if there are lines that are out of order
        + -f : Sort mixed-case texts; This will ignore case sensitivity
        + -M : Sort by month
        + -n : Sort by number (numerical value)
        + -r : Sort in reverse order       
        + -u : Remove duplicates and find unique values

### Usage
- Sort the results of a standard input
    ```console
    [command] | sort
    ```

- Sort the results of a standard input in Reverse Order
    ```console
    [command] | sort -r
    ```

- To find the highest value (i.e. most expensive) in the list
    ```console
    [command] | sort -n -r
    ```

- Sorting CSV
    - To find the most expensive item in a price database
        ```console
        sort -k [price-column] -t , -n -r file.csv
        ```

## Wiki

## Resources

## References
+ [Shapeshed - UNIX sort](https://shapeshed.com/unix-sort/)

## Remarks

