# Batch - Documentation and Playbook

## Table of Contents
+ Information
- Documentation
    + Operators
    + Special Keywords
    + Commands
    + Concepts
+ Playbook
+ Wiki
+ Resources
+ References
+ Remarks

## Information

## Documentation

### Operators
+ &  : Run in background operator; Place this at the end of any operator to join that with anything that goes in the next line
+ %  : Wrap variable name around this operator to access the value mapped to the variable
+ :: : Comment operator; Equivalent to 'REM'

### Special Keywords
- @   : "Silences" the command prompt; Disables display of shell prompt during execution of the assigned line
- REM : Comment keyword; Equivalent to '::' operator

### Commands
- ECHO {OPTIONS} [ON|OFF|values]: Echoes/prints out a given message
    - Positionals
        + ON|OFF : Enables/Disables the displaying of the command prompt when executing commands
        + message : Displays/Echoes the messages
        + . : Prints Newline
    - Optionals
        + -e : Allow regex operations
    - Usage
        + To disable echoing shell prompt when executing commands: `@ECHO OFF`
        + To print a newline: `echo.`

- SET {options} [variable-name] : To set a variable
    - Notes
        + Setting nothing/empty as the value unsets the variable, set Quotation Marks for empty value
        + Append multiple values in a variable to set an array/list
    - Options
        + /p = To prompt/get/read user input
    - Usage
        + Default set variable: `SET VARIABLE=VALUE`
        + To clear variable values: `SET VARIABLE=`
        + To set empty variable value: `SET VARIABLE=""`
        + To set an array/list variable: `SET VARIABLE=Hello World !
        + To prompt user for input: `SET /p input="Prompt message"`

- SETLOCAL : To set a local variable
    - Special Options/Values
        + EnableDelayedExpansion : Enables the special setting 'Delayed Expansion' whereby you can use '!variable!' to access certain variable values

### Concepts
- To set and access variables
    + Use the '%' operator
    ```batch
    SET VARIABLE=VALUE
    echo %VARIABLE%
    ```

- IF-ELSE IF-ELSE condition
    ```batch
    IF "condition" (
        :: If condition is met
    ) ELSE IF (
        :: If condition 1 is not met but 2 is met
    ) ELSE (
        :: If all conditions failed
    )
    ```

- For-Loop
    ```batch

    ```

## Playbook
- To join and append operations and commands together in a single line
    + Append each command with a '&' operator
    ```batch
    SET VARIABLE=VALUE &
    SET VARIABLE_2=VALUE_2 & ...
    command {options} <arguments>
    ```


## Wiki

## Resources

## References

## Remarks