# Python Development/Workspace Environment 

## Setup
### Dependencies
+ python3
+ python-pip
+ python-venv

### Pre-Requisites
- Create project filesystem structure
    - Explanation
        - Files
            + __init__.py : Module/package constructor/initializer file
            + __main__.py : Your main entry point/runner/launcher script/file
        - File Structure
            - root/
                - README.md
                - CHANGELOGS.md
                - requirements.txt : Contains your package dependencies
                - setup.py / pyproject.toml : For packaging
                - src/
                    - [package-name]
                        - __main__.py
                        - module-N
                            - __init__.py
                            - submodules-1
                            - submodules-2
                            - ...
                            - submodules-N
                        - lib/
                            - __init__.py
                            - utils/
                                - __init__.py
                - res
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

- Create setup file (i.e. setup.py/pyproject.toml)
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
    - pyproject.toml
        ```toml
        [tool.poetry]
        name = "your-project-name"
        version = "0.1.0"
        description = "your project description"
        authors = ["your-name <your-email>"]
        packages = [{include = "your-package-name", from="src"}]

        [build-system]
        requires = ["poetry-core>=1.0.0", "dependencies-name>=version-number"]
        build-backend = "poetry.core.masonry.api"

        [tool.poetry.dependencies]
        package-name = "^package-version"
        ```

- Create a virtual environment folder for the project
    ```console
    python -m venv [virtual-environment-name]
    ```

- Source and chroot into virtual environment
    - Windows
        ```console
        .\[virtual-environment-name]\Scripts\activate
        ```
    - Linux
        ```console
        . [virtual-environment-name]/bin/activate
        ```

- Install python packages
    ```console
    {python -m} pip install -Ur requirements.txt
    ```

## Documentations

### Testing
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

## Resources

## References

## Remarks

