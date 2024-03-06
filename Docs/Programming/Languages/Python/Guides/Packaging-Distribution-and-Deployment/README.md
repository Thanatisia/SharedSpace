# Python - Packaging, Distribution and Deployment

## Information

## Table of Contents
+ [Project file structure](#project-file-structure)
+ [Packaging Methods](#packaging-methods)
    + [Packaging as a ibrary/Package/Module](#library/package/module)

## Project file structure
- application
    - root/
        - README.md
        - requirements.txt : Contains your package dependencies
        - src/
            - [package-name]/
                - __init__.py : Module initializer macro file
                - module-1.py
                - module-2.py
                - ...
                - other-module-files
        - scripts/
            - script1.py
            - script2.py
            - ...
        - tests/
            - test_module.py
        - config/ : Configuration files here
            - config.yaml
        - data/
            - input_data/
            - output_data/
            - ...
        - docs/ : Folder to place all Documentations
            - your-docs
- Library, module or framework
    - root/
        - README.md
        - requirements.txt : Contains your package dependencies
        - [package-name]/
            - __init__.py : Module initializer macro file
            - __main__.py : Python 'main' runner/launcher file (aka Entry Point); Python will look for this file as the entry point when being ran as a standalone application
            - module-1.py
            - module-2.py
            - ...
            - other-module-files
        - tests/
            - test_module.py

## Packaging methods
### Differences
- poetry vs setuptools
    - Configuration File:
        + setuptools uses setup.py for configuration, while Poetry uses pyproject.toml.
    - Dependency Management:
        + setuptools relies on requirements.txt for dependencies, while Poetry manages dependencies directly in the pyproject.toml file.
    - Workflow:
        + setuptools focuses on packaging and distribution.
        + Poetry provides an end-to-end solution for managing dependencies, building, and publishing packages.
    - Ease of Use:
        + Poetry is designed to simplify the packaging process and make it more user-friendly.
        + setuptools is more established and might be preferred in traditional workflows.

### Library/Package/Module
+ [setuptools - using setup.py](setuptools.md)
+ [poetry - using setup.py and pyproject.toml](poetry.md)

## Wiki
### Special Files
- __init__.py : Module initializer/'constructor' macro file; Place this into a folder to initialize it as a importable module/package
- __main__.py : Python 'main' runner/launcher file (aka Entry Point); Python will look for this file as the entry point when being ran as a standalone application

## Resources

## References
+ [python packaging - packaging and distribution packages - using setuptools](https://packaging.python.org/en/latest/guides/distributing-packages-using-setuptools/)
+ [python-poetry - Documentations - pyproject - packages](https://python-poetry.org/docs/pyproject/#packages)
+ [StackOverflow - How poetry knows my package is located in the src folder?](https://stackoverflow.com/questions/68684670/how-poetry-knows-my-package-is-located-in-the-src-folder)

## Remarks

