# Linux Shellscript - String Handling

## Information
### Basics
- Keywords
    - EOF : Known as 'End-of-File', when used in the context of a multiline string, this is used to take everything within in as a string
        - Notes
            + Close the EOF by adding another EOF at the end of the multiline string
            - Everything within EOF are taken as literals, meaning that any tabs made from the left-most side will be treated as tabs
                + As such, please ensure that all strings, unless tabs are required, are aligned to the left as though it is in a text file.
        - Syntax
            ```console
            << EOF
            Test
            EOF
            ```

## Snippets
### Multiline Strings
- Getting multiline string and storing into variable using EOF
    ```console
    msg="$(cat << EOF
line1
line2
line3
...
EOF
)"
    echo -e "$msg"
    ```

- Generating multiline file
    ```console
    msg="$(cat << EOF
line1
line2
line3
...
EOF
)"
    echo -e "$contents" | tee -a [configuration-file] && \
        echo -e "file written.
    ```

- Storing a multiline string standard output into an array/list
    - Executing command and storing standard output into array
        ```bash
        arr=( $(command) )
        ```
    - Accessing the array
        ```bash
        echo -e "${arr[@]}"
        ```

## Wiki

## Resources

## References

## Remarks

