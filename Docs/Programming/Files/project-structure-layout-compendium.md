# Project Structure Layout Compendium

## Information
### Summary
```
Collection of various project structure layouts
```


## Languages
+ Python

## Project Structure
### General
- Folders
    - src/   : An alternative directory/location generally used to contain source codes; Helpful to keep the project repository clean and tidy
        + app/   : This contains application code specific to this project and/or the various application components
        + lib/   : For holding tested libraries. Generally contains frameworks and library files obtained from projects/repositories/packages where they are not touched except by a maintainer
        + utils/ : Project-specific libraries. These libraries typically are only used within this particular project and are not used elsewhere (or limited uses)
    + tests/ : This folder, as the name suggests, is where you place all your unit test functions and files

- Files
    + README.md : Typicall written as a markdown file, the README contains a brief introduction to your project, its purpose and any installation and/or usage instructions

### Python
- Project Folder Layout
    ```
    root/
        README.md
        LICENSE
        pyproject.toml
        setup.py
        src/
            main.py
            app/
                [application-components]/
            lib/
            utils/
            [package-name]/
    ```

- Package Folders
    - Layout
        ```
        ...
            src/
                [package-name]/
                    - __init__.py
                    - module.py
        ```

    - If you are creating a standalone package that can be imported into other projects
        - Create the package folder
            - To import this package
                ```python
                import [package-name]
                ```
            - Within the package folder, it should contain
               + __init__.py : This is the python constructor file that will automatically be activated when the package is imported; basically the '__init__' function but for the package
               - module.py   : This is basically your module class/file you wish to add into your package; you can name this to anything you like
                   - To import this file
                       ```python
                       import [package-name].[module-name] as [module-name]
                       ```
                   - To import the package module's functions, attributes or classes
                       ```python
                       from [package-name].[module-name] import [functions], [attributes], [classes], ...
                       ```

- Package setup files
    - Layout
        ```
        root/
            pyproject.toml
            setup.py
        ```

    - dependency management
        + setup.py
        + pyproject.toml



## Wiki

## Resources

## References
+ [Medium - Guide to Python Project Structure and Packaging](https://medium.com/mlearning-ai/a-practical-guide-to-python-project-structure-and-packaging-90c7f7a04f95)

## Remarks
