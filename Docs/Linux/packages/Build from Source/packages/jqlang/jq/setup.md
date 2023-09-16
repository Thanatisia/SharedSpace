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
+ autotools
- Development Essentials 
    + build-essential : for apt-based 
    + base-devel : for pacman-based
+ python : (Optional) for building the documentation

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

### Configuration
- Reconfigure source files for building/compilation
    ```console
    autoreconf -i
    ```

### Compilation
- Make/Build source project
    ```console
    make
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
