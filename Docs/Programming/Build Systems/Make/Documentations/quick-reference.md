# Makefile - Symbols, Keywords and Syntaxes

```
A general lookup documentation as like a simple quick reference 
containing various concepts such as
1. Symbols (i.e. =)
2. Keywords (i.e. .PHONY)
3. Syntaxes: Simple summary of how to perform certain concepts
```

## Symbols
+ #  : Comments
+ $  : Referencing to another variable
+ =  : Recursive assignment/setting a variable
+ ?= : Conditional assignment/setting of a mutable, default variable value that will accept an environment variable to replace this value
+ := : Simple assignment/setting of variable, the expression is evaluated only once at the very first occurence and it cannot be changed
+ += : Appending of variable, Append value to a variable

## Keywords
+ .PHONY        : Define all rules/targets/instructions to ensure that the interpreter knows they are instructions to be used
+ .DEFAULT_GOAL : Define a default Target/instruction/rule/goal to run if no target is specified

## Syntaxes
+ $(command <arguments>) : To execute a command and returns the results
+ ${variable} : To use a variable in a rule

## Snippets
- Running custom Makefile script
    ```console
    make -f [custom-makefile] [target/rules/instruction]
    ```

- Setting custom values to variables in Makefile while executing target
    - From the back
        ```console
        [ENV_VARIABLE=value ...] make [target/rule/instruction]
        ```
    - From the back
        ```console
        make [ENV_VARIABLE=value ...] [target/rule/instruction]
        ```

- Setting a value containing spaces to a variable
    ```console
    ENV_VARIABLE="'Foo Bar'" make [target/rule/instruction]
    ```

## Wiki
### Queries
#### StackOverflow
+ [Define a makefile variable using a env variable or a default value](https://stackoverflow.com/questions/24263291/define-a-makefile-variable-using-a-env-variable-or-a-default-value)
+ [Whats the difference between and in Makefile](https://stackoverflow.com/questions/4879592/whats-the-difference-between-and-in-makefile)

## Resources

## References

## Remarks