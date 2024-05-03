# Software Development/Programming - Build Systems: CMake

## Information
### Description

## Setup
### Dependencies
### Pre-Requisites
### Build
### Installation

## Configurations and Customizations
> Preparing your CMake file

## Documentations
### Synopsis/Syntax
```bash
cmake {optionals} <arguments>
```

### CMake Parameters
+ `--build [cmake-build-directory]` : Build the CMake files configured in the build directory
+ `--install [cmake-build-directory]` : Install the built CMake files to the specified system prefix (installation directory)
+ `--prefix [installation-directory]` : Explicitly specify the PREFIX (installation directory) to install the built source files into
- `--target [target]`
    - Targets 
        + executable-name : Specify the target executables you wish to build/compile; Repeat this for every target you wish to compile
        + package : Build the source as a package

### Usage

### Operational Workflow
> Pre-Requisites
- Clone repository package
    ```bash
    git clone https://github.com/author-name/repository-name
    ```

- Change directory into local repository
    ```bash
    cd repository-name
    ```

- Make a dedicated build directory
    ```bash
    mkdir -pv build
    ```

- Change directory into dedicated build directory
    ```bash
    cd build
    ```

> Build
- Configure and prepare cmake for building process
    ```bash
    cmake ..
    ```

- Build the configured cmake files and output targets
    - Explanation
        - CMake Parameters
            + `--build [cmake-build-directory]` : Build the CMake files configured in the build directory
            + `--target [target-executables]` : Specify the target executables you wish to build/compile; Repeat this for every target you wish to compile
    ```bash
    cmake --build . --target fastfetch --target flashfetch
    ```

> Packaging
- Package as a debian (DEB)/RPM package
    - Explanation
        - CMake Parameters
            + `--build [cmake-build-directory]` : Build the CMake files configured in the build directory
            + `--target package` : build the source as a package
    ```bash
    cmake --build . --target package
    ```

> Installation
- Install to PREFIX
    - Explanation
        - CMake Parameters
            + `--install [cmake-build-directory]` : Install the built CMake files to the specified system prefix (installation directory)
            + `--prefix [installation-directory]` : Explicitly specify the PREFIX (installation directory) to install the built source files into
    ```bash
    cmake --install . --prefix /usr/local
    ```

## Wiki

## Resources

## References

## Remarks

