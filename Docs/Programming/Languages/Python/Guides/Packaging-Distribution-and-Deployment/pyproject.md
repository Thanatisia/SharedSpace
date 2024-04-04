# Python project Packaging and Deployment Toolset - pyproject.toml

## Information

### Description
+ The pyproject.toml file is a python packaging configuration file format that tells build frontend tools like pip and build which backend to use for your project.
    - Some examples for common build backends includes
        + Hatchling
        + setuptools (setup.py)
        + Flit
        + PDM
    + However, Please check your backend’s own documentation for more details.

## Setup

### Dependencies
+ python
+ python-pip
+ python-venv
- Python Packages
    + build

### Pre-Requisites
- Create Python Virtual Environment
    - Generate Virtual Environment
        ```bash
        python3 -m venv [virtual-environment-name]
        ```
    - Chroot into Virtual Environment
        - Linux
            ```bash
            . [virtual-environment-name]/bin/activate
            ```
        - Windows
            ```bash
            .\[virtual-environment-name]\Scripts\activate
            ```

- Create a new 'pyproject.toml' file at the root of your project containing your build specifications
    ```bash
    touch pyproject.toml
    ```

### Installing
- Using pip
    - in PyPI
        ```bash
        pip install package-name
        ```
    - Git project repository from a remote repository server
        ```bash
        pip install git+https://[git-remote-repository-server-ip|domain]{:port-number}{@branch-name}
        ```

## Customization
### Notes
- Please refer to [Documentations](#documentations) for a more detailed write-up on each component of the pyproject.toml format
    + The documentations may also contain information on the differences between setup.py and pyproject.toml

### Designing build system specifications
- Choose your build backend
    - Hatchling
        ```toml
        [build-system]
        requires = ["hatchling"]
        build-backend = "hatchling.build"
        ```
    - setuptools (setup.py)
        ```toml
        [build-system]
        requires = ["setuptools>=61.0"]
        build-backend = "setuptools.build_meta"
        ```
    - Flit
        ```toml
        [build-system]
        requires = ["flit_core"]
        build-backend = "flit_core.buildapi"
        ```
    - PDM
        ```toml
        [build-system]
        requires = ["pdm-backend"]
        build-backend = "pdm.backend"
        ```
    + Others

### Designing Project Specifications

> Specify project primary information and metadata

```toml
[project]
name='project|package-name'
version='project-version'
description="project description here"
authors = [
    { name="author", email="author@email.com" },
]
readme = "README.md"
requires-python = ">=3.8" # Python minimum version
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
install_requires=[
    # List your dependencies here
]
```

> Specify your project URL/links

```toml
[project.urls]
Homepage = "https://github.com/author/project-name"
Repository = "https://github.com/author/project-name.git"
```

### Optionals

> Specify your toolset parameters

```toml
[tools]
```

> Specify your setuptools backend build parameters

```toml
[tools.setuptools]
```

> Specify your setuptools package requirements/dependencies

```toml
[tools.setuptools.packages]
```

> Specify your setuptools search directories/locations where there might be packages, modules/libraries

```toml
[tools.setuptools.packages.find]
where = ["src"]
```

## Documentations

### Differences between setup.py and pyproject.toml
- setup.py is the native packaging system used by Python for the longest time, 
    + pyproject.toml is a general purpose packaging configuration file that tells build frontend tools like pip and build which backend to use for your project.

### Components
- `[build-system]` : This TOML header block is where you specify your build system backend configuration and specifications
    - Key-Value Settings
        - `requires = ["your-package>=version-number"]` : Specify your list of backend build tools dependencies here (i.e. setuptools); you can set more than one as required
            + Type: Array/List
            - Example Build Backend Dependencies
                + Hatchling  : "hatchling"
                + setuptools : "setuptools"
                + Flit       : "flit_core"
                + PDM        : "pdm-backend"
        - `build-backend = "build-backend-function"` : Specify the build backend function to execute
            + Type: String
            - Example Build Backends
                + Hatchling  : "hatchling.build"
                + setuptools : "setuptools.build_meta"
                + Flit       : "flit_core.buildapi"
                + PDM        : "pdm.backend"

- `[project]` : This TOML header block is where you customize your project details, administrative information, dependencies/requirements and metadata
    - Key-Value Settings
        - `name='project-package/repository-name'` : Name your project package here
            + Type: String
        - `version='version-number'` : State your package version number here
            + Type: String
        - `description="project description here"` : Set your project description here
            + Type: String
        - `authors=[]` : State all your project authors here
            + Type: List of Dictionaries
            - Author Parameter Key-Value Mappings
                - name : State the name of the author here
                    + Type: String
                - email : State the email of the author here
                    + Type: String
            - Example
                ```toml
                authors = [
                    { name="author-name", email="author@email.com" },
                    ...
                ]
                ```
        - `readme = "README.md"` : Specify the name of the README file the system should read from
            + Type: String
            + Default/Recommended: README.md
        - `requires-python = ">=python-version"` : Specify the minimum python version this package/project requires
            + Type: String
        - `classifiers = [ 'classifier', ... ]`  : Specify a list of all classifiers you want to categorize your project in. These standardized classifiers can then be used by community members to find projects based on their desired criteria.
            + Type: List
            - Notes
                - Please refer to the following for a full complete list of all Python packaging classifiers
                    + [PyPI Classifiers List - Raw](https://pypi.org/pypi?%3Aaction=list_classifiers)
                    + [PyPI Classifiers List - Web](https://pypi.org/classifiers/)
            - Important classifiers
                - Development Stage
                    + 'Development Status :: {3 - Alpha | 4 - Beta | 5 - Production/Stable}' : Identifies how mature this project is
                - Indicate who your project is intended for
                    + 'Intended Audience :: Developers'    : Package is made for developers (i.e. framework/library/modules)
                    + 'Operating System :: OS Independent' : Platform/OS-Agnostic, does not dependend on any operating system functionalities/features (i.e. Windows = Win32API, Linux = GDK)

                - Pick your license as you wish
                    + 'License :: OSI Approved :: MIT License' : MIT License

                - Programming Language Versions 
                    - Specify the Python versions you support here.
                        + 'Programming Language :: Python :: 3'    : Python3 of any major version that is the current latest
                        + 'Programming Language :: Python :: 3.6'  : Supports Python 3.6
                        + 'Programming Language :: Python :: 3.7'  : Supports Python 3.7
                        + 'Programming Language :: Python :: 3.8'  : Supports Python 3.8
                        + 'Programming Language :: Python :: 3.9'  : Supports Python 3.9
                        + 'Programming Language :: Python :: 3.10' : Supports Python 3.10
                        + 'Programming Language :: Python :: 3.11' : Supports Python 3.11
                        + 'Programming Language :: Python :: 3.12' : Supports Python 3.12
        - `install_requires=[ dependencies ]` : List all your project dependencies here; These packages will be installed alongside this package
            + Type: List

- `[project.urls]` : This TOML header block is where you specify URL and links related to your project
    - Key-Value Settings
        - `Homepage = "project-homepage-url"` : Specify the URL/domain you wish to map to be the home page of your project
            + Type: String
            - Examples
                + GitHub: https://github.com/author/project-name
        - `Repository = "https://github.com/author/project-name.git"` : Specify the git remote repository server containing the project repository to pull from
            + Type: String

- `[tools]` : This TOML header block is where you configure your backend build tool specifications
    - Key-Value Settings

- `[tools.setuptools]` : This TOML header block is where you configure your setuptools backend build specifications
    - Key-Value Settings

- `[tools.setuptools.packages]` : This TOML header block is where you configure your setuptools packaging specifciations
    - Key-Value Settings

- `[tools.setuptools.packages.find]` : This TOML header block is where you specify the locations, packages and directories to search for when being packaged by setuptools
    - Key-Value Settings
        - `where = ["directories-to-search"]` : Specify a list of directories to search for that may contain packages
            + Type: List

## Wiki

### Templates

> pyproject.toml

```toml
[build-system]
requires = ["setuptools>=61.0"]
build-backend = "setuptools.build_meta"

[project]
name='mkparse'
version='0.5.0'
description="A simple Makefile Parser written in Python that is designed to simplify the process of importing Makefile contents into python as dictionary (key-value mappings (i.e. hashmap/associative arrays)) objects"
authors = [
    { name="author", email="author@email.com" },
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
install_requires=[
    # List your dependencies here
]

[project.urls]
Homepage = "https://github.com/author/project-name"
Repository = "https://github.com/author/project-name.git"

[tools.setuptools.packages.find]
where = ["src"]
```

## Resources

## References
+ [PyPI Classifiers List - Raw](https://pypi.org/pypi?%3Aaction=list_classifiers)
+ [PyPI Classifiers List - Web](https://pypi.org/classifiers/)
+ [Python Packaging - Tutorials - Packaging Projects (in Python)](https://packaging.python.org/en/latest/tutorials/packaging-projects/)
+ [Python Packaging - Guides - Writing pyproject.toml](https://packaging.python.org/en/latest/guides/writing-pyproject-toml/#writing-pyproject-toml)
+ [setuptools - User Guide - pyproject configurations](https://setuptools.pypa.io/en/latest/userguide/pyproject_config.html)

## Remarks

