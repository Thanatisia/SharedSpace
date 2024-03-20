# Build from Source - git

### Project
+ Repository Author: git
+ Repository Name: git
+ Repository URL: github.com/git/git

## Setup
### Dependencies
+ git
+ make
+ Build Essentials (base-devel (for pacman), build-essential (for apt))
+ autoconf 
+ gettext 
+ gcc 
+ g++ 
+ asciidoc 
+ libcurl4-openssl-dev 
+ libexpat1-dev

### Pre-Requisites
- Clone repository
    ```bash
    git clone https://github.com/git/git
    ```

- Change directory into repository
    ```bash
    cd git
    ```

- Initialize git submodules
    - Explanation
        + 2>&1 : Redirect stderr to stdout
    ```bash
    git submodule init 2>&1
    ```

- Update and clone submodule repositories
    - Explanation
        + 2>&1 : Redirect stderr to stdout
    ```bash
    git submodule update --recursive 2>&1
    ```

- Make configuration
    ```bash
    make configure
    ```

- Configure and prepare to build
    ```bash
    ./configure prefix=/usr/local
    ```

### Build From Source
- Information
    - Files Installed
        - /usr/local/bin/
            + git
            + gitk
            + git-shell
            + git-upload-pack
            + git-cvsserver
            + git-receive-pack
            + git-upload-archive
            + scalar
    - Folders Installed
        - /usr/local/libexec/
            + git-core/
        - /usr/local/share/
            + gitweb/
            + git-core/
            + git-gui/
            + gitk/
            + gitweb
            - doc/
                + git/
                + git-doc/
            - man/
                - man1/
                    + git*
                    + scalar.1
                - man3/
                    + Git.3pm
                - man5/
                    + git*
                - man7/
                    + git*

- Build all executables
    ```bash
    make prefix=/usr/local all
    ```

- Build all documentations
    ```bash
    make prefix=/usr/local doc
    ```

- Build all information
    ```bash
    make prefix=/usr/local info
    ```

### Installation
- Install all binaries
    ```bash
    make prefix=/usr/local install
    ```
- Install all documentations
    ```bash
    make prefix=/usr/local install-doc
    ```
- Install all HTML documentations
    ```bash
    make prefix=/usr/local install-html
    ```
- Install all information
    ```bash
    make prefix=/usr/local install-info
    ```

### Uninstallation
```bash
rm /usr/local/bin/{git,gitk,git-shell,git-upload-pack,git-cvsserver,git-receive-pack,git-upload-archive,scalar}
rm -r /usr/local/libexec/git-core/
rm -r /usr/local/share/gitweb/
rm -r /usr/local/share/git-core/
rm -r /usr/local/share/git-gui/
rm -r /usr/local/share/gitk/
rm -r /usr/local/share/gitweb
rm -r /usr/local/share/doc/git/
rm -r /usr/local/share/doc/git-doc/
rm /usr/local/share/man/man1/git*
rm /usr/local/share/man/man1/scalar.1
rm /usr/local/share/man/man3/Git.3pm
rm /usr/local/share/man/man5/git*
rm /usr/local/share/man/man7/git*
```

## Resources

## References
+ [GitHub - git/git - Git installation and build from source steps](https://github.com/git/git/blob/master/INSTALL)

## Remarks

