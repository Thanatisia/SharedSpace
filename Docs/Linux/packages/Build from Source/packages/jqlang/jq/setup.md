# jq - Building from Source: Setup

## Information
### Project
+ Project Author: jqlang
+ Project Name: jq
- Project Repository Sites
    + [jq Website - download](https://jqlang.github.io/jq/download/)
    + [GitHub Repository](https://github.com/jqlang/jq.git)

### Build
+ Build System: make
- Platforms: 
    + Linux, 
    + MacOS, 
    + Cygwin, 
    + other POSIX-like operating systems

## Setup
### Dependencies
+ gcc
+ make
+ autotools/libtool
+ automake
+ autoconf
- Development Essentials 
    + build-essential : for apt-based 
    + base-devel : for pacman-based
+ python : (Optional) for building the documentation
+ flex
+ bison

### Pre-Requisites
- Obtain repository
    - Clone using git
        ```console
        git clone --recursive https://github.com/jqlang/jq.git
        ```

    - Change directory into repository
        ```console
        cd jq
        ```

- (Optional) Initialize and clone submodules 
    + if building from git to get oniguruma
    ```console
    git submodule update --init
    ```

### Configuration
- Reconfigure source files for building/compilation
    - Notes
        + Skip this if you're not using the latest git version but instead building a released tarball (available on the release page)
    ```console
    autoreconf -i
    ```

- Configure project
    ```console
    ./configure
    ```

### Compilation
+ For Cross-Compilation, Please proceed to [Cross-Compilation](cross-compilation.md)

- Make/Build source project
    ```console
    make {-jN}
    ```

- Check if output is valid 
    ```console
    make check 
    ```

- Make/Build a statically-linked version
    ```console
    make LDFLAGS=-all-static
    ```

### Installation
- Install built files to system
    ```console
    sudo make install
    ```

### Uninstallation
- Uninstall installed files from the system
    ```console

    ```

### Building the Documentation
+ jq's documentation is compiled into static HTML using Python
- To build the docs
    + Build and set the output root directory to '/output'
    + The docs will be in the 'docs/' folder
    ```console
    pipenv run python3 build_website.py --root /output
    ```

- To serve the documentation locally
    ```console
    python3 -m http.server
    ```

## Wiki
### Search Queries
#### Google
+ linux jq build from source

## Resources

## References
+ [DigitalOcean - How to transform JSON data with jq](https://www.digitalocean.com/community/tutorials/how-to-transform-json-data-with-jq)

## Remarks
