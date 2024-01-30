# Vim Usage Tips and Tricks - Regex

## Information
### Introduction

### Regex Basics

## Documentations

### Synopsis/Syntax
- Format
    - Explanation
        + action-patterns : Actions to apply in the selected/all texts (i.e. g = Match/Search, s = Substitution)
        + keyword-filter(s) : List of consecutive keywords to be used as the pattern filter; Please seperate all keyword filter(s) with a delimiter
        + application-pattern : Action to execute on all returned/found results of the pattern filter
    ```
    [action-patterns]{delimiter}[keyword-filter(s)]{delimiter}[application-pattern]
    ```

- Using regex in vim
    - Default: Apply to all texts in the buffer if no texts are selected
    ```console
    :[regex]
    ```

- Using regex with selected texts
    + Select texts
    + ':[regex]'

### Regex Keywords
#### Action Patterns
+ `g` : Search/Match globally
+ `s` : Substitute

#### Application Pattern
- Search/Match Results
    + `d` : Delete results

### Regex operators
- Search/Match Pattern
    + `[search-pattern]!` : Does not match search pattern

- Substitution Pattern
    + `s[delimiter]` : Vim allows you to use any regex delimiter in your pattern substitution (i.e. instead of '/', you can use '#'); This allows you to avoid escaping slashes

### Usages
+ `g/pattern`    : Searches for results that matches the pattern globally
+ `g!/pattern`   : Searches for results that does not match the pattern globally
+ `g/pattern/d`  : Delete/Remove lines that matches the pattern
+ `g!/pattern/d` : Delete/Remove lines that does not match the pattern
+ `s/[target-text-pattern]/[substitute-target-pattern]/[number-of-lines]` : Substitute the results of the original target text pattern with the substitute pattern [number-of-lines] times

## Wiki

### Vim-specific changes
- Vim allows you to use any regex delimiter in your pattern substitution (i.e. instead of '/', you can use '#'); This allows you to avoid escaping slashes
    - i.e.
        + `:g#Hello World#d` : Search for the text(s) 'Hello World' and delete them using the delimiter '#'
        + `:g#/usr/bin/app#d` : Search for an application in a path string and delete them without escaping slashes

### Snippets

## Resources

## References

## Remarks