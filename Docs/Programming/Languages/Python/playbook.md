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

