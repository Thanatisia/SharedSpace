# Powershell Documentations - Syntax

## Syntax
- Initialize a variable
    ```powershell
    $variable_name = value
    ```

- Define a list
    ```powershell
    $list_variable = @(
        // Elements-1,
        // Elements-2,
        // ...
    )
    ```

- Define a multiline string
    ```powershell
    $multiline = @"
    multiline
    strings
    here
    ...
    "@
    ```

- Execute a command and obtain the results and store in a variable
    ```powershell
    $result = Function {options} <arguments>
    ```

- Access the attributes of an object
    - Get
        ```powershell
        $attr = $variable_name.object
        ```
    - Set
        ```powershell
        $variable_name.object = value
        ```

- Iteration/Loops 
    - Foreach loop 
        - through a list
            ```powershell
            $i = 0
            foreach ($current_variable in $list) {
                // Loop through each element in the list, with $current_variable being the variable per iteration

                // Statements...

                // Increment the counter by 1
                $i += 1;
            }
            ```

- Pipe (Redirect) standard output of a function into the standard input of another function
    ```powershell
    Function-1 | Function-2 {options} <arguments>
    ```

## Wiki

## Resources

## References

## Remarks

