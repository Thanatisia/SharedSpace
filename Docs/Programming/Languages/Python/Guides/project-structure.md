# Python project structure 

## Best Practices
- Given the following project structure of 
    ```
    root/
        - src/
            - [package-name]/
                - __main__.py : Your main.py
                - __init__.py
                - modules-1.py
                - modules-2.py
                - ...
                - module-N.py
                    - libs/
                        - package-1/
                            - __init__.py
                            - subpackage-1/
                                - __init__.py
                        - package-2/
                            - __init__.py
                        - package-3/
                            - __init__.py
    ```
    - Create a '__main__.py' instead of main.py as your main runner/launcher file
        - Explanation
            - Take note of the __main__.py file
                + The __main__.py is your main.py file equivalent
                - Python uses these macro files on boot/runtime where if python detects these files, instructions dedicated to these special macro functions will be executed
                    + In terms of packaging, it will become easier to handle
    - Create a '__init__.py' in every package/module directory
        - Explanation
            - Take note of the __init__.py file
                + By placing an '__init__.py' file, you are initializing that folder as a package/module to be imported (like an constructor initializer)
- When importing from current working directory
    + Import using `from . import [module|function|attributes] as [alias]`
- When importing libraries, modules and packages from another directory
    + Import using `from .{[directories].} import [module|function|attributes] as [alias]` instead of `import .{[directories].} as alias`
- When importing libraries, modules and packages from parent directories
    - Import using `from ...{[directories].} import [module|function|attributes] as [alias]` instead of `import ...{[directories].} as alias`
        + Each dot represents 1 directory backwards
