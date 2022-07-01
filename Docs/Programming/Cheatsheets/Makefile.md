# Documentation - Makefile

## Table of Contents
- [Basics](#basics)
- [Syntax](#syntax)
- [References](#references)
- [Resources](#resources)
- [Remarks](#remarks)

## Basics

+ [Operators](#operators)
+ [Pattern Rules](#pattern-rules)
+ [Automatic Variables](#automatic-variables)

### Operators

+ @command : To silence the command echo. Just display the command output and dont show the command itself
+ # : Comment

### Pattern Rules

+ % : matches any non-empty substring/files with the same substring
+ * : Wildcard, everything
+ ? : Checks if is available

### Automatic Variables

+ $@ : refer to the target of the current rule.
+ $^ : refer to the dependencies of the current rule.
+ $< : refer to the first dependency of the current rule.

## Syntax

### Associative Array
- Notes
    + Associative Arrays and usage must be used in 1 block/shell
        ```console
        @declare -A assoc=( \
            [key]="value" \
        ); \
        for key in "$${!assoc[@]}"; do \
            val="$${assoc[$${key}]}"; \
            echo -e "$${k} :$${val}"
        done
        ```

## References

+ [Automation and Make: Running Make](https://swcarpentry.github.io/make-novice/reference.html#:~:text=The%20Make%20wildcard%2C%20%25%20%2C%20specifies,a%20file%20called%20books%2Fabyss.)

## Resources

## Remarks
