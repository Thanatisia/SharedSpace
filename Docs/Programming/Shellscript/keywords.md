# Linux Shellscripting : Concepts and Keywords

## Concepts
### Conditionals
- If-conditionals
    - Syntax
        ```console
        if condition; then
            # Command statements here
        else if condition; then
            # Other conditional command statements here
        else
            # Other command statements her
        fi
        ```
    - Operators
        - `if [ condition ]` : '[' is another name/alias for the traditional 'test' command which is a standard built-in POSIX utility
            ```console
            if [ condition ]; then
                # If test is true
            else
                # If test is false
            fi
            ```
        - `if [[ condition ]]` : '[[' is a new upgraded variation of 'test' from ksh that the other shells also support; This construct also sets an exit code which the if condition will act accordingly
            ```console
            if [[ condition ]]; then
                # If test is true
            else
                # If test is false
            fi
            ```
        - `if (( condition ))` : '((' is an arithmetic test command which checks the arithmetic provided, an exit code is set according to the result and the if statement will act accordingly. 
            + It returns an exit code of 0 (true) if the result of the arithemtic calculation is non-zero
            ```console
            if (( condition )); then
                # If calculation is non-zero: Return '0'
            else
                # If calculation is zero
            fi
            ```
        - `if ( command )` : '(' Runs the specified command in a subshell; when the command is completed, it sets an exit code and returns to the if condition for validation.
            + A typical reason for using a subshell like this is to limit the side-effects of the command if the command required variable assignments or other changes to the shell's environment, such changes do not remain after the subshell completed.
            ```console
            if ( command ); then
                # If exit code is 0
            else
                # If exit code > 0
            fi
            ```
        - `if command` : This executes the command and the if statement acts according to its exit code
            ```console
            if command; then
                # If exit code is 0
            else
                # If exit code > 0
            fi
            ```

## Resources

## References
+ [UNIX StackExchange - Questions - 306111 - What is the difference between the bash operators \[\[ vs \[ vs \( vs \(\(](https://unix.stackexchange.com/questions/306111/what-is-the-difference-between-the-bash-operators-vs-vs-vs)

## Remarks
