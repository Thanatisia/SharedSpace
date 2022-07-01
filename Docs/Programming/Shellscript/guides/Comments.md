# Linux Shellscripting - Comments

There are various ways of commenting in Shellscripting
- Single Line
    + Using '#' 
        ```console
        # Comment
        ```
- Multiline/Multistring
    + Using heredoc
    + Using colon

## Multi-line Strings

- Heredoc
    + 'here documents' or 'heredoc', 
        ```console
        <<EOF
        // Lines here
        EOF
        ```
        
- Using colon (':')
    ```console
    : "
    // Lines here
    "
    ```
