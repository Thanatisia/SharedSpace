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
#### poetry
- Information
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

- Setup
    - Dependencies
        - Python pip
            + poetry
            ```console
            python -m pip install poetry
            ```
    - Pre-Requisites
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
    - Documentations
        - Customization
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
    - Snippets
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
- Testing
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

- Package Distribution
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

- Installation
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

#### setuptools
- Information
    - Purpose:
        + Primarily used for packaging, distribution, and installation of Python projects.
        + Handles the setup and installation of packages.
    - Features:
        + setuptools includes the setup.py script for defining project metadata, dependencies, and other configuration.
        + It uses the setuptools.setup() function to configure and install the package.
        + Can generate source distributions (sdist) and built distributions (bdist) like wheels.
    - Dependency Management:
        + Requires a separate requirements.txt file for specifying dependencies.
        + Dependency management is often handled using pip.
    - Advantages:
        + Well-established and widely used.
        + Integrated with the Python standard library.
        + Works with virtual environments.

- Project file structure
    - root/
        - README.md
        - requirements.txt : Contains your package dependencies
        - setup.py : Your setuptools packaging configuration file
        - [package-name]/
            - __init__.py : Module initializer macro file
            - module-1.py
            - module-2.py
            - ...
            - other-module-files
        - tests/
            - test_module.py

- Setup
    - Dependencies
        - Python pip
            + setuptools
    - Pre-Requisites
        - Create a 'setup.py' file at the root of your project
            - Explanation
                + This file contains metadata about your package and instructions for setuptools
    - Documentations
        - Package
            + setuptools
        - Modules
            - setuptools
                - pkg_resources : Allows you to access resources within your package
                    - Explanation
                        + This method is particularly useful when your project is distributed as a package.
                        - Choose the method that fits your project's needs and organization. 
                            + The key is to use relative paths based on the location of your source files within the src directory. 
                            + Adjust the paths accordingly based on your actual project structure.
        - Classes
        - Functions
            - setuptools
                - setup
                    - Parameters
                        - name : Specify the name of your package
                            + Type: String
                        - version : Specify the current version of your package
                            + Type: String
                        - packages : Specify the (sub)packages in your project
                            + Type: List
                            + Default: find_packages()
                        - install_requires : Specify list containing your dependencies
                            + Type: List
                        - entry_points: Contains a dictionary (key-value) mapping scripts to execute on startup/entry
                            + Type: Dictionary
                            - Format
                                ```
                                entry_points={
                                    'entry-point-group-id': [
                                        'script-name = [your-namespace(s)].[your-package].[your-module].[your-script]:[function-to-execute]',
                                    ],
                                },
                                ```
                            - Notes
                                - When defined, you can execute the script by calling the package and the script to execute
                                    ```console
                                    python -m [package-name].{modules}.{script-name|function} <arguments>
                                    ```
                        - author : Specify the author's name; This is used by git for contribution/git purposes
                            + Type: String
                        - author_email : Specify the author's email; This is used by git for contribution/git authentication purposes
                            + Type: String
                        - description : Specify a short description of your package
                            + Type: String
                        - url : Specify the URL of the remote repository server you will be pushing the package repository to (Generally github)
                            + Type: String
                            - Valid Values
                                + GitHub: https://github.com/your-username/your-package-name
                                + Python-Pip: TBC
                        - classifiers : A list containing the licenses and references used in your package
                            + Type: List
                            - Example Values
                                + Development Status :: 3 - Alpha
                                + Intended Audience :: Developers
                                + License :: OSI Approved :: MIT License
                                + Programming Language :: Python :: 3
                                + Programming Language :: Python :: 3.6
                                + Programming Language :: Python :: 3.7
                                + Programming Language :: Python :: 3.8
                        - package_data : Specify a Dictionary (Key-value) mapping of all non-code files (i.e. configuration files) to the type that you would like to include
                            + Type: Dictionary
                            - Format
                                ```python
                                package_data = {
                                    'your_package' : ['data/*.txt'],
                                }
                                ```
                + find_packages
            - pkg_resources
                - resource_string : Source the file at the specified files into the package and return the file contents as byte (Decode to read as string)
                    - Parameters
                        - package-name : Specify your package name
                            + Type: String
                        - file-path : Specify the file name and path you wish to source and read
                            + Type: String
                    - Usage Examples
                        ```python
                        import pkg_resources

                        file_content = pkg_resources.resource_string(package_name, file_path).decode("utf-8")
                        ```
        - Attributes
    - Snippets
        - setup.py
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
                    'console_scripts': [
                        'your_script = your_package.module1:main_function',
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

- Testing
    - To install your package locally for testing
        - Change directory to your project's root directory
            ```console
            cd [project-root-directory]
            ```
        - Create Virtual Environment
            ```console
            python -m venv env
            ```
        - Chroot into Virtual Environment
            - Linux
                ```console
                . env/bin/activate
                ```
            - Windows
                ```console
                .\env\Scripts\activate
                ```
        - Install dependencies (Optional)
            - Note
                + if requirements.txt are available
            ```console
            python -m pip install -Ur requirement.txt
            ```
        - Install the current package in editable mode
            + This allows you to make changes without reinstalling
            ```console
            pip install .
            ```

- Package Distribution
    - Create a source distribution and/or wheel distribution
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

- Installation
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
        - Notes
            - This is often referred to as "editable" or "development" mode
                + It will allow you to install the package in such a way that changes made to the source code are immediately reflected without needing to reinstall
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

## Wiki
### Special Files
- __init__.py : Module initializer/'constructor' macro file; Place this into a folder to initialize it as a importable module/package
- __main__.py : Python 'main' runner/launcher file (aka Entry Point); Python will look for this file as the entry point when being ran as a standalone application

## Resources

## References
+ [python-poetry - Documentations - pyproject - packages](https://python-poetry.org/docs/pyproject/#packages)
+ [StackOverflow - How poetry knows my package is located in the src folder?](https://stackoverflow.com/questions/68684670/how-poetry-knows-my-package-is-located-in-the-src-folder)

## Remarks

