# Creating your own source/binary-based package repository

## Information
### Description
+ The purpose of this guide is to have a walkthrough explanation on the operational workflow as well as how to create/self-host your own binary-based/source-based package repository from scratch

### Repository server filesystem structure and layout
- Binary-based
    - repository-directory-root/ : The directory containing the start of your package repository
        - packages/ : Place all your packages here
            - [project-author]/ : The author of the package
                - [package|project-name]/ : The name of the package/project
                    - versions/ : Place all version numbers correlating to this package here
                        - [version-number]/ : Place your binary source file tarball archives separated by versions here
                            + docs/ : Place all documentations compiled for this version here
                            + bin/  : Place all executables/binaries compiled for this version here
                            + share/ : Place all shared resource files compiled for this version here

- Source-based
    - repository-directory-root/ : The directory containing the start of your package repository
        - packages/ : Place all your packages here
            - [project-author]/ : The author of the package
                - [package|project-name]/ : The name of the package/project
                    - versions/ : Place all version numbers correlating to this package here
                        - [version-number]/ : Place your binary source file tarball archives separated by versions here
                            + tarball-file-name.tar.gz : The source file tarball archive

- Git local/remote repository server (i.e. using git bare)
    - repository-server-root.git/ : The directory containing the start of your repository server (Recommended to name the directory ending with a '.git' extension to distinguish the directories containing Git repositories from regular directories)
        + .git : git bare git directory
        - packages/ : Place all your packages here
            - [project-author]/ : The author of the package
                - [repository|package|project-name]/ : The name of the package/project containing the project repository
                    + README.md
                    + docs/ : Documentations

- Python PyPI (Pip) local/remote repository server
    - repository-directory-root/ : The directory containing the start of your package repository
        - packages/ : Place all your packages here
            - [project-author]/ : The author of the package
                - [package|project-name]/ : The name of the package/project
                    - versions/ : Place all version numbers correlating to this package here
                        - [version-number]/ : Place the repository of the project corresponding to the version number here
                            + README.md
                            + pyproject.toml | setup.py
                            - src/ : Source file

- Rust (cargo) local/remote repository server
    - repository-directory-root/ : The directory containing the start of your package repository
        - packages/ : Place all your packages here
            - [project-author]/ : The author of the package
                - [package|project-name]/ : The name of the package/project
                    - versions/ : Place all version numbers correlating to this package here
                        - [version-number]/ : Place the repository of the project corresponding to the version number here
                            + README.md
                            + pyproject.toml | setup.py
                            - src/ : Source file

## Setup

### Repository server Setup
#### Git repository server
- User Management
    - Create a dedicated git user
        - Notes
            + Recommended git user username: git
            + If you want to add the git user to secondary groups, pass them in the '-G [secondary-groups,...]' parameter/argument
            + If you want to assign the git user a custom home directory, pass the '-m' flag and the '-d [custom-home-directory]' parameter/arguments
        ```bash
        useradd -g git git
        ```

    - Set a password for the new user
        ```bash
        passwd git
        ```

    - Chroot/Switch user to the new user
        ```bash
        su - git
        ```

- Security Configuration Hardening
    - Create a SSH configuration directory for securing access into the git remote repository server
        - Now you have an .ssh directory to hold your “authorized_keys” file,
            + which is used to authenticate login requests.
        ```bash
        mkdir -pv .ssh
        ```
    - Change permission to the '.ssh' directory so that it is only accessible by the git user
        ```bash
        chmod 700 .ssh
        ```
    - Create the 'authorized_keys' file in '.ssh' to authenticate and authorize (AA) login requests via SSH
        - Explanation
            - When you hear about “uploading” or “managing” keys, 
                + you are basically appending these keys to the .ssh/authorized_keys file
        ```bash
        touch .ssh/authorized_keys
        ```
    - Change the permission modifier of '.ssh/authorized_keys' to make the file accessible only to the git user
        ```bash
        chmod 600 .ssh/authorized_keys
        ```
    - Copy/"Upload" the SSH private key from the client to the server for authorization
        ```bash
        ssh-copy-id -i $HOME/.ssh/key [client-username]@[server-host-name|ip|domain]
        ```

- Create repository filesystem
    - Make git repository directory
        ```bash
        mkdir -pv /path/to/git/repository/server/[root|base-directory].git
        ```

- Generate git "bare" repositories to be the git remote repository server
    - Notes
        + It is recommended to name the directory ending with a '.git' extension to distinguish the directories containing Git repositories from regular directories

    - Switch directory into the target local git repository directory
        ```bash
        cd [repository-server-root|base-directory].git
        ```

    - Initialize git bare
        - Explanation
            - This directory will be the git server root/base directory, similar to how github works
                - In GitHub, 
                    + 'https://github.com' holds a git bare and
                    + 'https://github.com/project-author' holds all projects relating to the author and
                    + 'https://github.com/project-author/repository-name' holds the git repository of 'project-author/repository-name'
            + When you add this repository as a remote repository server, git will be able to recognize it
        ```bash
        git init --bare
        ```

#### Source-based repository server
- Create repository filesystem

- Download tarball archive from a remote repository server
    - GitHub
        - Download tarball archive
            - Explanation
                - Parameter/Argument Signature
                    + `-P [output-prefix-path]` : Specify the custom output directory path to download the file to
                    + `-O [output-file]`        : Specify the custom output file name; Preferably you want to set this as a static filename such that every tarball archive file has the same name for convenience
            ```bash
            wget https://github.com/author/repository-name/archive/refs/tags/[version].tar.gz \
                 -P [repository-directory-root]/packages/[project-author]/[project-name]/versions/[version-number] \
                 -O [version].tar.gz
            ```

- Extract the tarball archive
    - Using tar.gz
        ```bash
        tar -xvzf [repository-directory-root]/packages/[project-author]/[project-name]/versions/[version-number]/[version].tar.gz
        ```

## Usage
### Git local/remote package repository server
- Add your remote repository server
    - Explanation
        - Parameters
            + server-username: This is the user you wish to login as (via SSH) when accessing the git remote repository server to clone the repository
            + server-ip|domain: Specify the git remote repository server's IP address/domain name
            + git-remote-repository-server-directory: Specify the path to the target git repository
        - This is equivalent to running `git remote add origin https://github.com/project-author/repository-name`
            - Where assuming the remote repository server is GitHub
                - GitHub uses something like a Web/Remote Proxy Server that translated/mapped 
                    + '[server-username]@[server-ip|domain]:/path/to/[project-author]/[repository-name].git' => 'https://[server-ip|domain]/[project-author]/[repository-name].git'
                    + To view the files in its raw format: 'https://[server-ip|domain]/[project-author]/[repository-name].git' => 'https://raw.githubusercontent.com/[project-author]/[repository-name]/[branch]/path/to/file'
    ```bash
    git remote add origin [server-username]@[server-ip|domain]:[git-remote-repository-server-directory].git
    ```

- Set git remote URL origin
    - Explanation
        - This will basically map the alias (in this case, 'origin') to a remote repository server URL that you can use 
            + instead of '[server-username]@[server-ip|domain]:/path/to/[project-author]/[repository-name].git'
    ```bash
    git remote set-url origin new.git.url/here
    ```

- Clone a project repository from your local git remote repository server
    - Using ssh
        - Explanation
            - Parameters
                + server-username: This is the user you wish to login as (via SSH) when accessing the git remote repository server to clone the repository
                + server-ip|domain: Specify the git remote repository server's IP address/domain name
                + git-remote-repository-server-directory: Specify the path to the target git repository
        - Possible Tips and Tricks
            - Use a Web/Reverse Proxy Server like Nginx to map '[protocol]://[server-username]@[server-ip|domain]' => '[your-server-domain]:packages'
                + So that you dont have to type the full link everytime, and just append the project author, repository name and the git repository configuration settings
        ```bash
        git clone [server-username]@[server-ip|domain]:packages/project-author/repository-name.git
        ```

### PyPI (pip) package repository server
- Install git repository HTTP Server
    ```bash
    python3 -m pip install git+[local|remote-repository-server-url]/[package-name]
    ```
- Install pip repository HTTP server
    ```bash
    python3 -m pip install --extra-index-url [local-repository-server-url] [package-name]
    ```

### Binary-based package repository server
- Download the directories
    - Using wget
        - Documentations folder
            ```bash
            wget [local-repository-server-url]/[repository-directory-root]/packages/[project-author]/[project-name]/versions/[version-number]/docs
            ```
        - Binary/executables folder
            ```bash
            wget [local-repository-server-url]/[repository-directory-root]/packages/[project-author]/[project-name]/versions/[version-number]/bin
            ```
        - Shared Resources folder
            ```bash
            wget [local-repository-server-url]/[repository-directory-root]/packages/[project-author]/[project-name]/versions/[version-number]/share
            ```
- Copy files to the appropriate $PREFIX (installation path) directories
    - Notes
        - $PREFIX is usually '/usr/local' 
            - i.e. 
                + binary : '/usr/local/bin'
                + documentations : '/usr/local/share/docs'
                + shared resources : '/usr/local/share'
    - Documentations folder
        ```bash
        sudo mv docs $PREFIX/share/docs
        ```
    - Binary/executables folder
        ```bash
        sudo mv bin $PREFIX/bin
        ```
    - Shared Resources folder
        ```bash
        sudo mv share $PREFIX/share/
        ```

### Source-based package repository server
- Download the tarball file from the file server
    - Using wget
        ```bash
        wget [local-repository-server-url]/[repository-directory-root]/packages/[project-author]/[project-name]/versions/[version-number]/src.tar.gz
        ```
- Extract the tarball archive
    - Using tar.gz
        - Explanation
            - Parameters/Argument Signature
                + `-C [content-output-directory]` : Specify the custom directory to extract the tarball contents into
                + `--strip-components=1` : Remove the first layer of the extracted tarball (this will be the base/root directory)
        ```bash
        mkdir -pv [project-name] && \
        tar -xvzf [repository-directory-root]/packages/[project-author]/[project-name]/versions/[version-number]/src.tar.gz -C [project-name] --strip-components=1
        ```
- Change directory into tarball extract
    ```bash
    cd src
    ```
- Build from Source
    + Please follow based on maintainer's instructions
- Install built files
    + Please follow based on maintainer's instructions

## Documentations

## Wiki

## Resources

## References
+ [inmotionhosting - git server](https://www.inmotionhosting.com/support/website/git/git-server/)
+ [StackOverflow - Questions - 2432764 - How do I change the URI (URL) for a remote Git repository?](https://stackoverflow.com/questions/2432764/how-do-i-change-the-uri-url-for-a-remote-git-repository)

## Remarks

