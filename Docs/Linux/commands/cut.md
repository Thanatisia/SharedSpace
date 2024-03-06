# Linux Command - cut

## Information
### Background
+ The cut command is a CLI utility for cutting out the sections from each line of files and writing the result to standard output. 
- It can be used to cut parts of a line by 
    + byte position, 
    + character and 
    + field. 
- Basically the cut command slices a line and extracts the text. 
    + It is necessary to specify option with command otherwise it gives error. 
    + If more than one file name is provided then data from each file is not precedes by its file name. 

## Setup
### Dependencies
### Pre-Requisites

## Documentations
### Synopsis/Syntax
- Default
    ```console
    cut {global-options} [filters] [target-file]
    ```

- With pipes
    - Piping the standard output of a command into cut as a standard input
        - Notes
            + You can just leave out the file name as the input data content is from the standard output
        ```console
        [command] | cut {global-options} {filter-options}
        ```

### Parameters
- Positionals
    - target-file : Specify the file name of the target file you want to extract from
        + Type: String
    - filters : Specify a list of bytes, characters, or fields that you want to extract
        + Type: String
        - Filters
            - `-b [bytes,...]` : Extract specific bytes; 
                - Formats
                    - List entries: Separate all entries of the list by comma-delimited
                        + Format: `-b 1,2,3,...`
                    - With Ranges: Separate all range minimum and maximum with a hyphen/dash-delimiter
                        + Format: `-b [min_byte-max_byte],[min_byte-max_byte],...`
                    - Selecting bytes from beginning up to the end of the line: Leave the entry after the hyphen/dash empty
                        + Format: `-b [start-byte]-`
                    - Selecting bytes from 1st byte to a specific byte of a line: Leave the entry before the hyphen/dash empty
                        + Format: `-b -[target-byte]`
            - `-c [pos,...]` : aka Columns; To select and cut by characters provided
                - Notes
                    + Tabs and backspaces are treated as a character
                    + Useful for fixed-length lines
                - Formats
                    - List of characters : Separated by comma-delimiter
                        + Format: `-c [character_position_1],[character_position_2],...`
                    - Range of characters : Separated by hypen/dash-delimiter
                        + Cut first N characters from each line of the file
                        + Format: `-c [starting_position_1]-[ending_position_1],[starting_position_2]-[ending-position_2]`
                    - Cut from the beginning to the end of the line : Leave the entry after the hyphen/dash empty
                        + Format: `-c [starting_position]-`
                    - Cut from the beginning to the specified Nth position : Leave the entry before the hyphen/dash empty
                        + Format: `-c -[target-position]`
            - `-f [field-number]` : aka Field; To extract information by fields rather than columns
                - Notes
                    - Fields are effectively entire words
                        + -f 1 = First word in the array/list after separating
                        + -f 2 = Second word in the array/list after separating
                        + -f N = Nth word in the array/list after separating
                    + If '-d' option is not used: It prints the whole line
                - Formats
                    - List of field numbers : Separated by comma-delimiter
                        + Format: `-f [field_num_1],[field_num_2],...`
                    - Range of field numbers : Separated by hypen/dash-delimiter
                        + Prints fields from the [starting-field-number] to the [ending-field-number] of each line from the file
                        + Format: `-f [starting_field_1]-[ending_field_1],[starting_field_2]-[ending-field_2]`
                    - Cut from the beginning to the end of the line : Leave the entry after the hyphen/dash empty
                        + Format: `-f [starting_position]-`
                    - Cut from the beginning to the specified Nth position : Leave the entry before the hyphen/dash empty
                        + Format: `-f -[target-position]`

- Optionals
    - `-d [delimiter]` : Specify an input delimiter to use and overwrite
        - Notes
            - When used with '-f'
                + cut will prepend all lines printed in the standard output with a the input delimiter 
        - Delimiters
            + tab : "\t"; Prepend all lines printed in the standard output with a tab; Default field limiter by cut
            + space : " "; Do not prepend anything to all the lines and just print
    - `-output-delimiter="delimiter"` : Specify an output delimiter to overwrite
        - Notes
            + By default, the output delimiter is the same as the input delimiter (-d option)
            - When used with '-f n1,n2'
                + cut will populate the empty separator between n1 and n2 with the specified output delimiter
        - Output Delimiters
            + tab : "\t"; Prepend all lines printed in the standard output with a tab; Default field limiter by cut
            + space : " "; Do not prepend anything to all the lines and just print
    + --complement : Complements the output; This option can be used together with the filter options

### Usage
#### Pipes
- Using with cat
    - Take the standard output of cat into cut as standard input
        ```console
        cat [filename] | cut -d [delimiter] -f [field-number]
        ```
    - Output the standard output of the processed data from cut into a file
        ```console
        cat [filename] | cut -d [delimiter] -f [field-number] > [output-file-name]
        ```

## Wiki

## Resources

## References
+ [GeeksForGeeks - Cut command in Linux with examples](https://www.geeksforgeeks.org/cut-command-linux-examples/)
+ [itsfoss - cut command](https://itsfoss.com/cut-command/)
+ [YouTube - Akamai Developer - How to Use the cut Command in Linux | Top Docs with LearnLinuxTV](https://www.youtube.com/watch?v=VCqKNg0yzrc)

## Remarks

