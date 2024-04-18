# Python Development/Workspace Environment 

*Information*
-------------
- Python project layout/structures
    - Source-layout
        ```
        root/
            + README.md : Your main document
            + BUILD.md  : Place the steps to build the program here
            + CHANGELOGS.md : Place all changes here
            + CONTRIBUTING.md : Place all contribution steps for contributing members
            + USAGE.md : Contains all usages of the modules/libraries/scripts
            + requirements.txt : Contains your python package dependencies
            + pyproject.toml | setup.py
            - docs/
            - src/
                - [package-name]/ : Place your package here
                    - __init__.py : Package and Module initializer
                    + module.py
                    - [submodules]/ : Place all submodules here; Repeat this for every submodule directories
                        + __init__.py
                        + module.py
                    - [script-name]/ : Place your script projects here (if is a utility)
                        + main.py : Your main entry point/runner/launcher script/file
        ```
    - Root-layout
        ```
        root/
            + README.md : Your main document
            + BUILD.md  : Place the steps to build the program here
            + CHANGELOGS.md : Place all changes here
            + CONTRIBUTING.md : Place all contribution steps for contributing members
            + USAGE.md : Contains all usages of the modules/libraries/scripts
            + requirements.txt : Contains your python package dependencies
            + pyproject.toml | setup.py
            - docs/
            - [package-name]/ : Place your package here
                - __init__.py : Package and Module initializer
                + module.py
                - [submodules]/ : Place all submodules here; Repeat this for every submodule directories
                    + __init__.py
                    + module.py
                - [script-name]/ : Place your script projects here (if is a utility)
                    + main.py : Your main entry point/runner/launcher script/file
        ```

## Setup
### Dependencies
+ python3
+ python-pip
+ python-venv

### Pre-Requisites
- Generate Project Layout
    - Make directories
        - Source ('src') layout
            - Linux
                ```bash
                mkdir -pv [project-workspace-root]/{docs,src/[package-name]}
                ```
            - Windows
                ```bash
                mkdir [project-workspace-root]\docs
                mkdir [project-workspace-root]\src
                mkdir [project-workspace-root]\[package-name]
                ```
        - Root layout
            - Linux
                ```bash
                mkdir -pv [project-workspace-root]/{docs,[package-name]}
                ```
            - Windows
                ```bash
                mkdir [project-workspace-root]\docs
                mkdir [project-workspace-root]\[package-name]
                ```

    - Create documentation and files
        - Documentations
            - Linux
                ```bash
                touch [project-workspace-root]/{README,BUILD,CHANGELOGS,CONTRIBUTING,USAGE}.md
                ```
        - Python package dependencies file
            - Linux
                ```bash
                touch [project-workspace-root]/requirements.txt
                ```

- Create project filesystem structure
    - Windows
        ```console
        mkdir [project]\app\src\lib
        mkdir [project]\res
        ```
    - Linux
        ```console
        mkdir -p [project]/{app/src/lib,res}
        ```

- Create requirements file
    + Place your python-pip dependencies here
    + Each line is 1 package
    ```
    # Python packages and dependencies here

    ## Pip Packages
    "package-name"

    ## Git Packages
    "[package-name] @ git+https://github.com/author-name/repository-name{@[branch-name]|#options=value}"
    ```

### Python configuration

- pyproject.toml (Recommended)
    - setuptools
        ```toml
        [build-system]
        requires = ["setuptools>=61.0"]
        build-backend = "setuptools.build_meta"

        [project]
        name = "your-package-name"
        version = "project-current-version"
        description = "project-description"
        authors = [
            { name="author-name", email="author-email@domain" },
        ]
        readme = "README.md"
        requires-python = ">=3.8"
        classifiers = [
            # How mature is this project? Common values are
            #   3 - Alpha
            #   4 - Beta
            #   5 - Production/Stable
            'Development Status :: 3 - Alpha',

            # Indicate who your project is intended for
            'Intended Audience :: Developers',
            'Operating System :: OS Independent',

            # Pick your license as you wish
            'License :: OSI Approved :: MIT License',

            # Specify the Python versions you support here.
            'Programming Language :: Python :: 3',
            'Programming Language :: Python :: 3.6',
            'Programming Language :: Python :: 3.7',
            'Programming Language :: Python :: 3.8',
            'Programming Language :: Python :: 3.9',
            'Programming Language :: Python :: 3.10',
            'Programming Language :: Python :: 3.11',
            'Programming Language :: Python :: 3.12',
        ]
        dependencies = [
            # List your dependencies here
            ## Pip Packages
            "package-name",
            ## Git Packages
            "[package-name]@git+https://github.com/author-name/project-name",
        ]

        [project.scripts]
        # Program Entry Point(s) and scripts
        # executable-name = "package.submodule.module:entry_point_function"

        [project.urls]
        Homepage = "https://github.com/author/repository-name"
        Repository = "https://github.com/author/repository-name.git"

        [tools.setuptools.packages.find]
        where = ["src"]
        ```
    - poetry
        ```toml
        [tool.poetry]
        name = "your-project-name"
        version = "program-version"
        description = "your project description"
        authors = ["your-name <your-email>"]
        packages = [{include = "your-package-name", from="src"}]

        [build-system]
        requires = ["poetry-core>=1.0.0", "dependencies-name>=version-number"]
        build-backend = "poetry.core.masonry.api"

        [tool.poetry.dependencies]
        package-name = "^package-version"
        ```

- setup.py : Setuptools
    ```python
    from setuptools import setup, find_packages

    setup(
        name='your_package',
        version='0.1.0',
        packages=find_packages(),
        install_requires=[
            # List your dependencies here
        ],
        entry_points={
            # Set your entry point scripts and groups here
            'console_scripts': [
                '[script-name] = [your-namespace].[your-package].[your-module]:[function-to-run]',
            ],
        },
        author='Your Name',
        author_email='your.email@example.com',
        description='A short description of your package',
        url='https://github.com/yourusername/your_package',
        classifiers=[
            'Development Status :: 3 - Alpha',
            'Intended Audience :: Developers',
            'License :: OSI Approved :: MIT License',
            'Programming Language :: Python :: 3',
            'Programming Language :: Python :: 3.6',
            'Programming Language :: Python :: 3.7',
            'Programming Language :: Python :: 3.8',
        ],
        package_data = {
            'your_package' : ['data/*.txt'],
        }
    )
    ```

- Create a Python Virtual Environment for the project
    - Generate Virtual Environment
        ```bash
        python3 -m venv [virtual-environment-name]
        ```

    - Source and chroot into virtual environment
        - Linux
            ```bash
            . [virtual-environment-name]/bin/activate
            ```
        - Windows
            ```bash
            .\[virtual-environment-name]\Scripts\activate
            ```

## Documentations

### Testing
- To install your package locally for testing
    - Change directory to your project's root directory
        ```console
        cd [project-root-directory]
        ```
    - (Optional) Install python packages and dependencies
        ```console
        {python3 -m} pip install -Ur requirements.txt
        ```
    - Install the current package in editable mode
        + This allows you to make changes without reinstalling
        ```console
        pip install .
        ```

### Package Distribution
- Create a source distribution and/or wheel distribution
    - setuptools
        - Explanation
            - This will create 
                - a 'dist' directory containing your source distribution ('tar.gz' file)
                    + This file contains your source code and essential metadata.
                    + It's commonly used for distributing packages on PyPI.
                    + Example: your_package-0.1.0.tar.gz
                - a wheel distribution ('wh1' file)
                    + This is a binary distribution format that can be installed faster than source distributions.
                    + It's platform-specific, meaning there might be different wheels for different operating systems or Python versions.
                    + Example: your_package-0.1.0-py3-none-any.whl
        ```console
        python setup.py sdist bdist_wheel
        ```

- Upload to PyPI
    - Using Twine
        - Information
            + You can use Twine to upload your distribution static files to PyPI
        - Dependencies
            + twine
        - Pre-Requisites
            - Install dependencies
                ```console
                python -m pip install twine
                ```
            - Setup PyPI
                + Sign up on [PyPI](https://pypi.org)
                + Configure your '~/.pypirc' file with your credentials
        - Upload the folder 'dist/*' using twine
            ```console
            twine upload dist/*
            ```

### Installation
- Install using setup.py
    - setuptools
        ```console
        python setup.py install
        ```

- Install using pip
    - Install from manually-shared distribution files
        - Using the created files, you can share these distribution files with others for installation
            - Install package using the '.tar.gz' file for the source distribution
                ```console
                python -m pip install '[package-name]-[version].tar.gz'
                ```
            - Install package using the '.wh1' file for the wheel distribution
                ```console
                python -m pip install '[package-name]-[version]-[python-version]-none-any.wh1'
                ```

    - Install from PyPI (Official)
        ```console
        python -m pip install [your-package-name]
        ```

    - Install python package directly from github
        - Install git package
            - Install the latest version from the default branch
                ```console
                pip install git+https://github.com/username/repo-name.git
                ```
            - Install a specific branch or tag
                ```console
                pip install git+https://github.com/username/repo-name.git@[branch-or-tag]
                ```
            - Install from a private repository
                - Explanation
                    + You need to provide authentication in the form of a token
                ```console
                pip install git+https://<token>@github.com/username/repo-name.git@[branch-or-tag]
                ```
            - Using SSH URL
                - Pre-Requisites
                    + Setup SSH keys with GitHub
                ```console
                pip install git+git@github.com:username/repo-name.git@[branch-or-tag]
                ```
            - Install python package directly from github in a subdirectory
                ```console
                pip install git+https://github.com/username/repo-name.git#subdirectory=/path/to/package
                ```

### Usage
- To import from command line as a package.module
    ```console
    python -m [package-name].[module-name|script-name|function] {options} <arguments>
    ```
    - Example
        - main() function
            ```console
            python -m [package-name].main {options} <arguments>
            ```

- To call the application directly as an application (main.py)
    ```console
    python -m [package-name] {options} <arguments>
    ```

## Wiki
### Templates

> README.md

```markdown
# Program Title Here
## Information
### Project
+ Project Author: your-author-name
+ Project Name: project-repository-name
+ Project Version: package-version-number

### Description
+ Place your descriptions here

## Setup
### Dependencies
### Pre-Requisites
### Build
### Installation
### Uninstallation
### Cleanup

## Quickstart Documentations
### Synopsis/Syntax
### Parameters
### Usage

## Wiki

## Resources

## References

## Remarks
```

> BUILD.md

> CHANGELOGS.md

```markdown
# CHANGELOGS
## Table of Contents
+ [yyyy-mm-dd](#yyyy-mm-dd)

## Entries
### yyyy-mm-dd
#### HH:MM(H)
+ Version Number: [package-new-version-number]

- Version Changes:
    - Changes made

- New
    + Added new [document|directory] 'file-name' in '/path/to/file'
- Updates
    - Updated 'filename' in '/path/to/file'
        + Changes made
```

> CONTRIBUTING.md

```markdown
# CONTRIBUTING

## Table of Contents
+ [Rules](#rules)
+ [Distribution and Packaging](#distribution-and-packaging)

## Rules
### Open Source Contribution
- Create a fork/branch to your contribution
- Open Pull Request to request to merge your updates into the 'development' branch
    - Please specify your contribution details in the following in your Pull Request
        + Title: `[category] : [summary]`
        - Body:
            '''
            Author Name: [your-name]
            Files Modified:
                - Files changed here
            Reason/Motivation:
            Summary:
                - Your changes here
            '''
+ Do not force merge directly to the main branch
```

> USAGE.md


## Resources

## References

## Remarks

