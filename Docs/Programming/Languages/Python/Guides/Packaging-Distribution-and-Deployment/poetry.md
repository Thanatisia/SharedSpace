# Python packaging, containerization and distribution - poetry

## Table of Contents
+ [Information](#information)
- [Setup](#setup)
    + [Dependencies](#dependencies)
    + [Pre-Requisites](#pre-requisites)
- [Documentations](#documentations)
    + [Customization](#customization)
    + [Snippets](#snippets)
    - [Usage](#usage)
        + [Testing](#testing)
        + [Package Distribution](#package-distribution)
        + [Installation](#installation)

## Information
- Purpose:
    + A modern tool for dependency management and packaging in Python.
    + Aims to simplify and improve the Python packaging workflow.
- Features:
    + Manages dependencies, packaging, and publishing in a single tool.
    + Uses the pyproject.toml file for configuration instead of setup.py.
    + Provides commands for managing dependencies, building, and publishing packages.
- Dependency Management:
    + Manages dependencies directly in the pyproject.toml file, eliminating the need for a separate requirements.txt.
    + Uses a lock file (poetry.lock) to ensure reproducible builds.
- Advantages:
    + Simplifies the packaging process by consolidating various tasks into one tool.
    + Improved dependency resolution and management.
    + Supports project versioning and publishing to PyPI.

- Project file structure
    - root/
        - README.md
        - requirements.txt : Contains your package dependencies
        - pyproject.toml : Your packaging configuration file
        - [package-name]/
            - __init__.py : Module initializer macro file
            - module-1.py
            - module-2.py
            - ...
            - other-module-files
        - tests/
            - test_module.py

## Setup
### Dependencies
- Python pip
    + poetry
    ```console
    python -m pip install poetry
    ```

### Pre-Requisites
- Initialize a new project
    - Change directory to where you want to create your new python project
        ```console
        cd [python-project-directory]
        ```
    - Create new python project
        - Using poetry
            - Explanation
                + This command will create a new directory with the specified project name and generate some default project files
            ```console
            poetry new [project-name]
            ```
    - Change into the project directory
        ```console
        cd [project-name]
        ```
- Edit 'pyproject.toml'
    - Explanation
        + This file contains your project configurations, including dependencies
        + Please refer to 'Customization' subsection to get more details with the pyproject.toml file
    - Minimal 'pyproject.toml'
        ```toml
        [tool.poetry]
        name = "your-project-name"
        version = "0.1.0"
        description = "your project description"
        authors = ["your-name <your-email>"]
        packages = [{include = "your-project-name", from="src"}]

        [build-system]
        requires = ["poetry-core>=1.0.0", "dependencies-name>=version-number"]
        build-backend = "poetry.core.masonry.api"
        ```
- Install 'poetry-build'
    - Explanation
        + It provides the necessary functionality for building distributions
    ```console
    poetry add build
    ```

## Documentations
### Customization
- pyproject.toml
    - Key-Value entries
        - tool.poetry : Poetry package information
            - name : Specify your project name
                + Type: String
            - version : Specify your project version
                + Type: String
            - description : Specify your project description
                + Type: String
            - authors : Specify a list of all authors, following the format: "your-name <your-email@example.com>"
                + Type: List
            - packages : Specify a list of dictionaries containing information pertaining to the project package file system structure includes
                + Type: List of Dictionaries
                + Format: `[ { package-1-specs }, { package-2-specs }, ..., { package-N-specs } ]`
                - Package/module include specification key-values
                    - include : Specify the name of the package/module to include in the project
                        + Type: String
                        - Special Keywords
                            + '*' : All files in a directory
                    - from : Specify the name of the root/parent folder or directory containing the package/module to be included
                        + Type: String
                - Example:
                    - If your package is in a 'src' directory
                        - Explanation
                             - File Structure
                                 - root/
                                      - src/
                                          - [your-package-name]
                                              - modules-1.py
                                              - modules-2.py
                                              - modules-3.py
                                              - modules-4.py
                        ```toml
                        packages = [{include = "your-package-name", from="src"}]
                        ```
        - build-system : Specify specifications for the build system to be used
            - requires : Specify list of all dependencies and required packages as well as its version
                + Type: List
                - Format: ["package-name>=version"]
            - build-backend : Specify the backend API to be used to build the project
                + Type: String
                - Valid Values
                    + poetry.core.masonry.api
        - tool.poetry.dependencies : Specify all your package dependencies here in a key-value mapping
            - Operators/Special Keywords
                + ^ : More than
            - Format: 
                ```toml
                [tool.poetry.dependencies]
                package-name = "^package-version"
                ```
            - Example
                ```toml
                [tool.poetry.dependencies]
                python = "^3.8"
                ```

### Snippets
- pyproject.toml
    ```toml
    [tool.poetry]
    name = "your-project-name"
    version = "0.1.0"
    description = "your project description"
    authors = ["your-name <your-email>"]

    [build-system]
    requires = ["poetry-core>=1.0.0", "dependencies-name>=version-number"]
    build-backend = "poetry.core.masonry.api"

    [tool.poetry.dependencies]
    package-name = "^package-version"
    ```

### Usage
#### Testing
- Install project dependencies
    - Explanation
        + Poetry will automatically create a virtual environment for your project
    ```console
    poetry install
    ```
- Activate the virtual environment
    - Explanation
        + This will drop you into a shell within the Virtual Environment
        + You can install additional tools or run your project commands from this shell
    ```console
    poetry shell
    ```
- If your project has a script or an entry point defined
    ```console
    poetry run python [your-script].py
    ```
- Additional commands
    - Add a new dependencies
        ```console
        poetry add [dependency-package-name]
        ```
    - Update a dependency
        ```console
        poetry update [dependency-package-name]
        ```
    - To build the package
        ```console
        poetry build
        ```
    - To publish the package
        ```console
        poetry publish --build
        ```

#### Package Distribution
- Build the package
    - Explanation
        + This command generates source distributions (sdist) and built distributions (bdist) like wheels in the dist directory.
    ```console
    poetry build
    ```

- Check the generated files
    - Change into the dist' directory and
        - Verify that your distribution files are present
            - They will typically have names like 
                + your_package_name-0.1.0.tar.gz (source distribution) and 
                + your_package_name-0.1.0-py3-none-any.whl (wheel distribution)

- (Optional) Upload to PyPI
    - Using poetry
        - Information
            + You can use poetry to upload your distribution static files to PyPI
            + This command will build your package and publish it to PyPI.
        - Pre-Requisites
            - Setup PyPI
                + Sign up on [PyPI](https://pypi.org)
                + Configure your '~/.pypirc' file with your credentials
        - Upload the folder 'dist/*' using twine
            ```console
            poetry publish --build
            ```

#### Installation
- Install from manually-shared distribution files
    - Explanation
        + If you do not want to publish to PyPI and prefer to share distribution files manually (i.e. git cloning)
        + You can provide the generated files in the 'dist' directory
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
    - using pip
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
            pip install git+https://<token>@github.com/username/repo-name.git#subdirectory=/path/to/package
            ```
    - Using poetry (Recommended)
        - Install the latest version from the default branch
            ```console
            poetry add git+https://github.com/username/repo-name.git
            ```
        - Install a specific branch or tag
            ```console
            poetry add git+https://github.com/username/repo-name.git@[branch-or-tag]
            ```
        - Install from a private repository
            - Explanation
                + You need to provide authentication in the form of a token
            ```console
            poetry add git+https://<token>@github.com/username/repo-name.git@[branch-or-tag]
            ```
        - Using SSH URL
            - Pre-Requisites
                + Setup SSH keys with GitHub
            ```console
            poetry add git+git@github.com:username/repo-name.git@[branch-or-tag]
            ```

## Resources

## References

## Remarks

