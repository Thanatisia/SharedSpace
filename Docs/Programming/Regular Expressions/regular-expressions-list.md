# Documentation - Regular Expressions - Keywords & Terms

## Table of Contents
+ [Information](#information)
+ [Basics](#basics)
+ [Expressions](#expressions)
+ [References](#references)
+ [Resources](#resources)
+ [Remarks](#remarks)

## Information

### DESCRIPTION

```
Regular Expressions (regex) are string patterns that will match strings/substrings with specific rules specified in the pattern.

regex are used to perform pattern matching as well as filtering of texts.
```

## Basics

### Elements/Characters
> The individual building block characters of any Regular Expression (regex) pattern
- All characters excluding special characters in Regex matches themselves
    - Examples
        + pattern x => substring "x"
        + pattern 9 => substring "9"
        + pattern = => substring "="
        + pattern @ => substring "@"

### Rules
- Escape Sequences (\char)
    - To match a special character, you need to use an escape sequence prefix with a backslash
        - Examples
            + \+ = "+"
            + \( = "("

### Special Regex Characters
+ .     : Match any characters
+ \+     : Matches a sequence of one or more instances of the following character
+ \*     : Zero or more instances of whatever precedes/came before it
+ ?     : Match zero or one instance of the following character
+ ^     : A match must occur at the beginning of the searched text
+ \-     : Range operator; Range of min (x) to max (y)
- $     : Matches the end of a line; Placed at the end of the entire pattern
    + Matches an entire line    : If an entire Regex pattern is enclosed by a caret and dollar sign
+ (,)   : Group the enclosed elements within that section Regular Expression pattern together
+ [,]   : Alias/shorthand for an '|' (logical OR operator) on all of the enclosed contents
- {,} : Matches a specific number of times
+ |     : Logical OR operator
+ \     : Escape Sequence Character
+ /     : Indicates the start and end of the Regular Expression pattern

### Modifiers
> Modifiers are special characters that, when used, perform specific formatting to the regex pattern
+ g : *Global match*; Finds all matches of the specified target characters, instead of the first occurence

### Metacharacters
+ \r : Carriage Return
+ \n : Newline
+ \s : Matches Any whitespaces
+ \s* : Zero or more whispaces
+ \s\\+ : One or more whitespaces
+ ^\\# : Comment
+ ^# : Uncomment 

## Expressions
```
Example Expression Snippets
```
### Match Lines
+ /a.c/ : Matches lines that contain strings such as a+c, a-c, abc, match, and a3c
+ /a*c/ : Matches the same strings along with strings such as ace, yacc, and arctic
+ /[tT]he/ : Matches the string The and the
+ /^$/ : Matches blank lines
+ /^.*$/ : Matches an entire line whatever it is
+ / */ : Matches one or more spaces	
+ /^$/ : Matches blank lines

### Match Characters
+ [a-z] : Matches a single lowercase letter	
+ [A-Z] : Matches a single uppercase letter	
+ [a-zA-Z] : Matches a single letter	
+ [0-9] : Matches a single number	
+ [a-zA-Z0-9] : Matches a single letter or number


### Match Count
+ {x}   : Preceding element or subexpression must occur exactly x times
+ {x,y} : Matches a specific number of times; Element or subexpression must occur between x and y times, inclusive
    + x = Minimum number of occurences
    + y = Maximum number of occurences (can be left empty)
+ {x,}  : Preceding element or subexpression must occur at least x times

## References
+ [Digital Humanities - Regex Tips](http://dh.obdurodon.org/regex-tips.xhtml#:~:text=A%20question%20mark%20\(%20%3F%20\),will%20match%20Great%20or%20Great!%20)
+ [NTU - Programming - Howto - Regex](https://www3.ntu.edu.sg/home/ehchua/programming/howto/Regexe.html)
+ [rexegg - Regex Modifiers](https://www.rexegg.com/regex-modifiers.html)
+ [StackOverflow - What does the forward slash mean within a JavaScript regular expression?](https://stackoverflow.com/questions/15661969/what-does-the-forward-slash-mean-within-a-javascript-regular-expression)
+ [w3schools - Javascript Reference - Regex](https://www.w3schools.com/jsref/jsref_regexp_g.asp)
+ [w3schools - Javascript Reference - Regex Modifier - g](https://www.w3schools.com/jsref/jsref_regexp_g.asp)
+ [w3schools - Javascript Reference - Regex Modifier - Whitespaces](https://www.w3schools.com/jsref/jsref_regexp_whitespace.asp)

## Resources

### Searches
#### Google
+ regex elements
+ regex generator

### Utilities
+ [Regex Generator](https://regex-generator.olafneumann.org/)

## Remarks
