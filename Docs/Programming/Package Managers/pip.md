# Python Package Manager - pip

## Setup
### Dependencies

### Pre-Requisites

### Installation
- Using package manager
    - apt-based
        ```console
        sudo apt install python-pip
        ```
    - pacman-based
        ```console
        sudo pacman -S python-pip
        ```

- From bootstrap.pypa.io
    - Download 'get-pip.py' from bootstrap.pypa.io
        ```console
        curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
        ```
    - Execute PyPI installer
        ```console
        python get-pip.py
        ```
    - Verify installation
        ```console
        pip help
        ```

## Documentations
### Synopsis/Syntax
```console
{python -m} pip {global-options} [action] {local-options} <arguments>
```

### Parameters
- Positionals
    - Actions
        - `check {local-options} <arguments>`  : Verify installed packages have compatible dependencies
            - Positionals
            - Local Optionals
                - With Arguments
                - Flags
        - `config {local-options} <arguments>` : Manage local and global configurations
            - Positionals
            - Local Optionals
                - With Arguments
                - Flags
        - `freeze  {local-options} <arguments>` : Get and output installed packages in requirements format (hint: output to 'requirements.txt' for backup and restoration for collaboration)
            - Positionals
            - Local Optionals
                - With Arguments
                - Flags
        - `install {local-options} <arguments> [targets ...]` : Install the specified target to install; Seperate all targets with a space delimiter
            - Positionals
                - targets : The target python PyPI packages, tarball, wheel or egg static distribution files you want to install to be used by python
                    - Accepted target formats:
                        + package-name : Name of a python package in PyPi
                        - git-url      : URL of a git repository/tree; 
                            - Format: 
                                + Default: `git+[git-remote-repository-url]`
                                + Specific branch/tag: `git+[git-remote-repository-url]@[branch-or-tag]`
                                + Specific subdirectory: `git+[git-remote-repository-url]#[subdirectory=/path/to/package]`
                        - tarball : Tarball static distribution file created from the setuptools build/installation process
                            + File name format: `[package-name]-[version].tar.gz`
                            + File extension: '.tar.gz'
                        - wheel   : wheel (wh1) static distribution file created from the setuptools build/installation process
                            + File name format: `[package-name]-[version]-[python-version]-none-any.wh1`
                            + File extension: '.wh1'
                        - egg     : Python egg standalone executable (similar to a binary) static distribution file you can use to execute directly
                            + File extension: '.egg'
            - Local Options
                - With Arguments
                - Flags
                    + `-U | --upgrade` : Upgrade the specified target package
                    + `-r | --requirements [requirement-file (i.e. requirements.txt)] : Specify a requirement file containing list of all python packages you want to install; Default: requirements.txt
        - `list {local-options} <arguments>` : List installed packages
            - Positionals
            - Local Optionals
                - With Arguments
                - Flags
        - `show {local-options} <arguments>`   : Show information about installed packages
            - Positionals
            - Local Optionals
                - With Arguments
                - Flags
        - `search {local-options} <arguments>` : Search PyPI for packages
            - Positionals
            - Local Optionals
                - With Arguments
                - Flags
        - `uninstall {local-options} <arguments> [package-name ...]`: Uninstall/remove specified packages
            - Positionals
                - package-name : The target python PyPI packages you want to uninstall/remove from the pip cache directory
            - Local Optionals
                - With Arguments
                - Flags

- Global Options
    - With Arguments
    - Flags

### Usage

#### Installation
- Packaging and Distribution
    - using setuptools
        - Install from manually-shared distribution files
            - Information
                + The static distribution files used here are created by running the build/install process done by setup.py using setuptools
                    ```console
                    python setup.py install
                    ```
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
    - Install individual packages
        ```console
        python -m pip install [your-package-name]
        ```
    - Install from a package/dependencies requirements.txt file
        ```console
        python -m pip install -Ur requirements.txt
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
        pip install git+https://github.com/username/repo-name.git#subdirectory=/path/to/package
        ```
    - Install using SSH URL
        - Pre-Requisites
            + Setup SSH keys with GitHub
        ```console
        pip install git+git@github.com:username/repo-name.git@[branch-or-tag]
        ```

- Handling pip
    - Downgrading pip
        - Pre-Requisite
            - Create a Virtual Environment
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
        ```console
        python -m pip install pip==[version-number]
        ```
    - Upgrade pip
        ```console
        python -m pip install --upgrade pip
        ```

#### Package management
- List all installed packages
    ```console
    python -m pip freeze list
    ```

- Uninstall package
    ```console
    python -m pip uninstall [package-name]
    ```

#### Package Usage
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
+ [StackOverflow - Installing python package from a github subdirectory on another branch](https://stackoverflow.com/questions/66232775/installing-python-package-from-a-github-subdirectory-on-another-branch)

## Remarks
