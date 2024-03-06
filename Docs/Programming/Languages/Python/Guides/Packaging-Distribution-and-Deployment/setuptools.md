# Python packaging, containerization and distribution - setuptools

## Table of Contents
+ [Information](#information)
- [Setup](#setup)
    + [Dependencies](#dependencies)
    + [Pre-Requisites](#pre-requisites)
- [Documentations](#documentations)
    + [API Documentation](#api-documentation)
    + [Snippets](#snippets)
    - [Usage](#usage)
        + [Testing](#testing)
        + [Package Distribution](#package-distribution)
        + [Installation](#installation)
        + [Post-Installation Usage](#post-installation-usage)

## Information
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

- Python 'magic' macro files
    - Files
        + __init__.py : Module/package constructor/initializer file
        + __main__.py : Your main entry point/runner/launcher script/file

## Setup

### Dependencies
+ python3
+ python-pip
+ python-venv
- Python pip
    + setuptools

### Pre-Requisites
- Create a 'setup.py' file at the root of your project
    - Explanation
        + This file contains metadata about your package and instructions for setuptools
        + Please refer to [Snippets](#snippets) for an example design of the setup file

## Documentations
### API Documentation
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
                    - Recommended: 
                        + find_packages()
                - py_modules : Specify a list of single-file python modules (without the .py extension) you want to let setuptools be aware of that are not part of a package
                    + Type: List
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

### Snippets
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

### Usage
#### Testing
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

#### Package Distribution
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

#### Installation
- Install using setup.py
    - Explanation
        + 
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
        - Notes
            - This is often referred to as "editable" or "development" mode
                + It will allow you to install the package in such a way that changes made to the source code are immediately reflected without needing to reinstall
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
        - Install python package directly from github in a subdirectory
            ```console
            pip install git+https://<token>@github.com/username/repo-name.git#subdirectory=/path/to/package
            ```
        - Install using SSH URL
            - Pre-Requisites
                + Setup SSH keys with GitHub
            ```console
            pip install git+git@github.com:username/repo-name.git@[branch-or-tag]
            ```

#### Post-Installation Usage
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

## Resources

## References

## Remarks

