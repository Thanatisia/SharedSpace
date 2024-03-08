# Linux Command Documentation: sed

## Table of Contents:
- [Information](#information)
    + [Background](#background)
+ [Setup](#setup)
+ [Documentation](#documentation)
+ [Patterns](#patterns)
+ [Use-Cases](#use-cases)

## Information
### Project
+ Command Name: sed
+ Abbreviation: Stream Editor

### Background
+ sed - stands for Stream Editor - is a Command Line (CLI) utility that takes in a stream of text / opens a file, and edit it with regular expressions, then prints it to standard output (by default)

## Regular Expression 
### Basics
#### Regular Expression (POSIX)
- Synopsis/Syntax Structure of a POSIX-based Regular Expression Pattern
    ```bash
    [action]/arguments/values/[options|properties]
    ```

- Terminologies
    - Regex 'action' patterns
        + These are 'action' patterns because these are effectively commands that you execute on the selected data to perform changes
    - Regex 'options/properties'
        - These are 'options' or 'properties' because these are applied to the actions to apply additional functionalities
            - i.e.
                - '/g' : Global search expression 
                    + `s/[search-string]/[substitute-string]/g` : with the '/g', 's/' will now be "Find all occurences of 'old-text' and replace (substitute) with 'new-text'" instead of just search for the first occurence

- Actions
    + d : delete line
    + p : print only specific lines
    + `s/[target-string]/[target-replacement]/g` : Find all occurences of 'old-text' and replace (substitute) with 'new-text'
    - `N[action]` : where N = A prefix value (may/may not necessarily need to be integer) added to the action to perform an action
        - Examples
            + {N}p : Print only line N of the data stream
- Options/Properties
    + g : Global Expression; Apply to all occurences of the applied pattern

#### Regex pattern expression examples


## Setup
### Dependencies

### Pre-Requisites


## Documentation
### Synopsis/Syntax
- Piping a standard output of a command as a data stream into sed as standard input
    ```bash
    [command] | sed '<regular-expression>' -
    ```

- Editing a file
    ```bash
    sed {options} <arguments> '<regular-expression>' [input-filename]
    ```

- Editing file(s) in-place instead of printing to standard output
    - Explanation
        + Using the '-i' flag
    ```bash
    sed {options} <arguments> -i '<regular-expression>' [input-filename]
    ```

- Streaming the contents of a file into sed
    ```bash
    sed [options} <arguments> '<regular-expression>' < [input-filename]
    ```

- Piping a standard output of a command as a data stream into sed as standard input and outputting the file
    ```bash
    [command] | sed '<regular-expression>' - > [output-filename]
    ```

- Editing and Outputting a file
    ```bash
    sed {options} <arguments> '<regular-expression>' [input-filename] > [output-filename]
    ```

### Parameters
- Positionals
- Optionals
    - With Arguments
        + `-e 'regex-expression' | --expression='regex-expression'` : Explicitly specify a regular express to execute. Can be combined/stacked with '-e'. Without '-e' or '-f', sed uses the first non-option parameter as the script and the following non-option parameters as input files
        + `-f [.sed script file] | --file=[sed script file]` : Explicitly specify a '.sed' regex script to execute. Can be combined/stacked with '-e'. Without '-e' or '-f', sed uses the first non-option parameter as the script and the following non-option parameters as input files
    - Flags
        + -i : Editing file(s) in-place instead of printing to standard output
        + -h | --help : Display help
        + -n : Suppress output; By default, sed prints all processed input (except input that has been modified/deleted by commands such as d)

### Usage
> Use-Cases

- Comment a line containing a specific string
    ```bash
    sed -i '/<pattern_keyword>/s/^/#/g' <filename>
    ```

- Uncomment a line containing a specific string with sed
    ```bash
	sed -i '/<pattern_keyword>/s/^#//g' <filename>
    ```

- Search and Replace
	- Explanation:
		+ `s/[target-string]/[target-replacement]/g` : Find all occurences of 'old-text' and replace (substitute) with 'new-text'
	```bash 
    sed -i 's/old-text/new-text/g' filename
    ```

- Print only specific lines of the input file to standard output
    - Explanation
        + -n : Used to suppress output. By default, sed prints all processed input (except input that has been modified/deleted by regex commands such as d)
        - The regex command 'p' is used to print specified lines
            + The regex command '{N}p' therefore means to print only line N
    ```bash
    sed -n 'Np' [input-filename]
    ```

- Print lines within a range
    - Explanation
        + Sed treats multiple input files as one long stream
        - 'first-file-line-number ; nth-file-line-number ; ... ; last-file-line-number' : Separator/Delimiter between file line numbers. If only 2 is specified, it is taken that the first entry is the line number from the first file and the 2nd entry is the line numebr from the last file
            - Special Characters
                + '$p' : Last line of the file
        + `input-files ...` : Specify the names of all input files to stream; Separate all filenames with a space delimiter
        + Use '-s' to reverse this behaviour
    ```bash
    sed -n '{first-file-line-number}p ; {nth-file-line-number}p ; ... ; {last-file-line-number}p' [input-files ...]
    ```

- Filter and convert a Hexadecimal string to ASCII plaintext
    - Explanation
        + Print the hexadecimal string as standard output to pipe into sed's standard input
        + Sed will format the hexadecimal string into ASCII plaintext and pipe the ASCII plaintext out as standard output into xargs's standard input
        + xargs will print the ASCII plaintext using the 'printf' function
    ```bash
    echo -n [hexadecimal-string] | sed 's/\([0-9A-F]\{2\}\)/\\\\\\x\1/gI' | xargs printf && echo ''
    ```

## Wiki
### .sed script files
#### Format
+ Literally just a regex expression/pattern

#### Generate
- Generate a .sed script file using echo
    ```bash
    echo 's/hello/world' > script.sed
    ```

### Snippets
#### One-Liner
- Comment a locale in '/etc/locale.gen'
    ```bash
    sed -i '/en_SG.UTF-8/s/^/#/g' /etc/locale.gen
    ```

- Uncomment a locale in '/etc/locale.gen'
    ```bash
	sed -i '/en_SG.UTF-8/s/^#//g' /etc/locale.gen
    ```

#### Functions
- Comment a line in a file
    ```bash 
    comment_line()
    {
        #
        # Uncomment line that contains a keyword using
        #	sed : Regular Expression
        #
        regex_Pattern="$1"
        filename="$2"
        sed -i '/$regex_Pattern/s/^/#/g' $filename
    }
    ```

- Uncomment a line in a file
    ```bash
    uncomment_line()
    {
        #
        # Uncomment line that contains a keyword using
        #	sed : Regular Expression
        #
        regex_Pattern="$1"
        filename="$2"
        sed -i '/$regex_Pattern/s/^#//g' $filename
    }
    ```

## Resources

## References
+ [GitHub - le0me55i/uncomment_sed.md - Uncomment/comment line using sed](https://gist.github.com/le0me55i/e1f2244cdc0d64d8e541378357543b15)
+ [GNU - Manual - sed](https://www.gnu.org/software/sed/manual/sed.html)

## Remarks

