# Documentation - Command : tr

## Table of Contents
+ [Information](#information)
+ [Setup](#setup)
+ [Documentation](#documentation)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Information

### Description
```
tr - also known as "Translate" - is a Command Line Utility built-in to the GNU core utilities that handles String Manipulation and Formatting and Transformation
It supports a range of transformation types including 
	+ Uppercase to Lowercase and vice versa (Default)
	+ Squeezing repeating characters
	+ Deleting specific characters
	+ Basic find and replace

tr operates better as a "pipe" utility, similar to xargs
	- in which, it is more effective if you pipe a string into it for manipulation
```

## Setup

### Pre-Requisites

### Dependencies

### Obtaining
- tr is built-in to most GNU/Linux Distributions

### Installing

## Documentation

### Synopsis/Syntax

- General Syntax
    ```console
    tr {options} "pattern-1" {"pattern-2"}
    ```

- Translate from and to a file
    ```console
    tr "pattern-1" "pattern-2" [file-name]
    ```

- Pipe command
    ```console
    echo -e "Your-String" | tr {options} "your-pattern"
    ```

- Search and Replace (Default)
    ```console
    echo -e "Your-String" | tr "pattern-1" "pattern-2"
    ```

### Parameters
+ -c : Complements the set of character in the string; Reverse the selected values and select all unselected values
+ -d : Deletes characters in "pattern-1" from the output
+ -s "delimiter" : Trims (or "Squeeze") the string and remove extra occurences of the delimiter (pattern-1) except for just 1 remaining
+ -t : Truncate pattern-1

### Usage
- Trim/Squeeze a multi-space string in a line
	- Assumption : 
		+ The string has more than 1 spaces between every word
		+ Delimiter : Space (' ')
	```console
	your_string="Hello    World  I    am    Happy"
	delimiter=" "

	echo -e "$your_string" | tr -s "$delimiter"
	```

- Convert lowercase to uppercase
	```console
	your_string="Hello World"
	
	# echo -e "$your_string" | tr "[a-z]" "[A-Z]"
	# echo -e "$your_string" | tr "[:lower:]" "[:upper:]"
	```

- Convert uppercase to lowercase
	```console
	your_string="Hello World"
	
	# echo -e "$your_string" | tr "[A-Z]" "[a-z]"
	# echo -e "$your_string" | tr "[:upper:]" "[:lower:]"
	```

- Convert Whitespace to Tabs
	```console
	your_string="Hello World"
	
	echo -e "$your_string" | tr [:space:] '\t'
	```

- Translate braces into parenthesis
	```console
	your_string="{Hello World}"
	
	echo -e "$your_string" | tr '{}' '()'
	```

- Delete specific characters
	```console
	your_string="Hello World"
	
	echo -e "$your_string" | tr -d 'character'
	```

- Delete all digits from the string
	```console
	your_string="Hello World 123"
	
	echo -e "$your_string" | tr -d [:digit:]
	```

- Complement the sets
	+ Complement : Reverse the selected values and select all unselected values
	```console
	your_string="Hello World 1233"
	
	echo -e "$your_string" | tr -cd 'character'
	```




## Resources
+ [GeeksForGeeks - tr command in UNIX](https://www.geeksforgeeks.org/tr-command-in-unix-linux-with-examples/)

## References

## Remarks

