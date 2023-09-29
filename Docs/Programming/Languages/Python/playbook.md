# Python Playbook

## Environment Variables
### Setup
- Dependencies
    - os
        + .environ.get("ENVIRONMENT_VARIABLE_KEYWORD") : To get the Environment Variable value into the application
            + .getenv("ENVIRONMENT_VARIABLE_KEYWORD") : Wrapper for 'os.environ.get()'
- Pre-Requites

### Basics
- Import Environment Variable
    + Use the `variable = os.environ.get("ENVIRONMENT_VARIABLE_KEYWORD")` function
    - Using `os.environ.get()`
        ```python
        import os
        env = os.environ.get("ENVIRONMENT_VARIABLE_KEYWORD")
        print("Environment Variable: {}".format(env))
        ```
    - Using `os.getenv()`
        ```python
        import os
        env = os.getenv("ENVIRONMENT_VARIABLE_KEYWORD")
        print("Environment Variable: {}".format(env))
        ```

### Usage
- Check if user is sudo
    - Use Environment Variables '$USER' or '$SUDO_USER'
        - Explanation
            + '$USER' returns the user's name by default; Thus -> if user is root, returns 'root' and the user's name if not root
            + '$SUDO_USER' returns 'root' if is root, and None if not root
        - Using '$USER'
            ```python
            import os

            user = os.environ.get("USER")

            if user == "root":
                # Is root
            else:
                # Is not root
            ```
        - Using '$SUDO_USER'
            ```python
            import os

            user = os.environ.get("SUDO_USER")

            if user != None:
                # Is root
            else:
                # Is not root
            ```

## Wiki
### Terminologies
+ Polling : the process where the computer or controlling device waits for an external device to check for its readiness or state, often with low-level hardware

