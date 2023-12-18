# Linux System Management - Complete Compendium

## Information
### Background
```
A Complete all-in-one collection of Linux system administration and management snippets, tips and tricks and guides
```

## User Defaults

### Shells
- List all available shells
    - Viewing the '/etc/shells' file
        ```console
        cat /etc/shells
        ```

- List current user's shell
    - Using the 'SHELL' environment variable
        ```console
        echo $SHELL
        ```

- Changing User default shell
    - Using 'usermod'
        ```console
        sudo usermod [ {-s | --shell} new-shell ] [username]
        ```

    - Using 'chsh'
        ```console
        sudo chsh --shell [new-shell] [username]
        ```

    - Changing user shell in the '/etc/passwd' file
        - Edit '/etc/passwd'
            + Structure of file 'username:group:userid:groupid:FirstName LastName:home-directory:default-shell'
            ```console
            $EDITOR /etc/passwd
            ```
        - Locate your user's row
            + Change the last field which will contain your user's default shell
            + Save and exit

