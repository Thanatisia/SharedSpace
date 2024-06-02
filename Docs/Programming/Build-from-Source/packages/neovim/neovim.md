# neovim/neovim

## Information
### Description
+ Neovim is a Vim fork/distribution focused on extensibility (customizability) and usability
- Neovim embedded the lua scripting language into the codebase
    + and as such, is able to use vim motions, and able to execute lua scripts during runtime

### Project
+ Author: neovim
+ Project: neovim
+ Marketing Website: https://neovim.io/
- Code Repositories and Mirrors
    + GitHub : https://github.com/neovim/neovim

## Setup
### Dependencies
- apt-based: 
    - Development/Building Essentials
        + build-essential
        + make
        + git
    + ninja-build
    + gettext
    + cmake
    + unzip
    + curl

- pacman-based: 
    - Development/Building Essentials
        + base-devel
    + ninja
    + cmake
    + unzip
    + curl

- windows
    + msys2/mingw(-w64)
    - msys2
        + mingw-w64-x86_64-gcc
        + mingw-w64-x86_64-cmake
        + mingw-w64-x86_64-make
        + mingw-w64-x86_64-ninja
        + mingw-w64-x86_64-diffutils
        - Open the MSYS2 shell and install the packages
            ```bash
            pacman -S mingw-w64-x86_64-{gcc,cmake,make,ninja,diffutils}
            ```

### Pre-Requisites
- Windows/MSYS2/MinGW(-w64)
    - Setup and append the MSYS2 bin and the MinGW-w64 bin directories into your system PATH environment variable
        - Notes
            + Please replace `C:\msys64` with the appropriate path to the msys64/msys2 root directory if you changed it
        ```bash
        set PATH=C:\msys64\mingw64\bin;C:\msys64\usr\bin;%PATH%
        ```

#### Cloning Repository
- Clone Repository
    - Notes
        + Specify the option `--branch [release-version]` if you wish to clone/build a specific release version
    ```console
    git clone https://github.com/neovim/neovim
    ```

- Change directory into folder
    - Explanation
    ```console 
    cd neovim
    ```

#### Build/Compile from Source
- Using make
    - (Optional) If you want the stable release (or any of the branches)
        + Checkout the branch
        ```bash
        git checkout stable
        ```
    - Build source code
        - Notes
            - The `CMAKE_BUILD_TYPE=[build-type]` environment variable defines what type of build you wish to run with cmake
                - CMake Build types
                    + Debug : Build with full debug information; few optimizations
                    + Release : Build a release version
                    + RelWithDebInfo : Release with Debug Information
            - If you want to install to a custom location
                - Set `CMAKE_INSTALL_PREFIX=[custom-path]`
                    + PREFIX = The installation directory of the executable, in this case, '~/.local/bin'
                    - This will write the specified custom installation path into the 'build/CMakeCache.txt' file
                        + Everytime you run the build process, it will automatically set to install to that instead
                        + Default PREFIX is '/usr/local/'
            - On BSD
                + Use gmake instead of make
        - Install to default location
            ```bash
            make CMAKE_BUILD_TYPE=RelWithDebInfo
            ```
        - Install to custom location
            ```bash
            make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=/custom/path
            ```

- Windows
    - Notes
        - If you have the bash shell from either the PortableGit project or the MinGW-w64 project
            + You can use the above linux Makefiles as well
            + However, you cannot use the default `make install` options
    - Using cmake and ninja generator
        ```bash
        cmake -S cmake.deps -B .deps -G Ninja -D CMAKE_BUILD_TYPE=RelWithDebInfo
        cmake --build .deps
        cmake -B build -G Ninja -D CMAKE_BUILD_TYPE=RelWithDebInfo
        cmake --build build
        ```
    - (Optional) If you cannot install neovim with ninja install due to permission restriction, you can install neovim in a directory you have write access to.
        ```bash
        cmake -S cmake.deps -B .deps -G Ninja -D CMAKE_BUILD_TYPE=RelWithDebInfo
        cmake --build .deps
        cmake -B build -G Ninja -D CMAKE_INSTALL_PREFIX=C:\nvim -D CMAKE_BUILD_TYPE=RelWithDebInfo
        cmake --build build
        ```
    - (Optional) Using mingw32-make
        - Notes
            + You can symlink/copy `mingw32-make` -> `make` to simplify the command
        ```bash
        mingw32-make deps
        mingw32-make CMAKE_BUILD_TYPE=RelWithDebInfo
        :: Or you can do the previous command specifying a custom prefix
        :: (Default is C:\Program Files (x86)\nvim)
        :: mingw32-make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=C:\nvim
        mingw32-make install
        ```

#### Installation
- Using make
    - Notes
        - If you want to install to a custom location/you had set `CMAKE_INSTALL_PREFIX=[custom-path]` during the build process
            - Set `CMAKE_INSTALL_PREFIX=[custom-path]`
                - PREFIX = The installation directory of the executable, in this case, '~/.local/bin'
                    + Default PREFIX (install location) is '/usr/local/'
                - This will write the specified custom installation path into the 'build/CMakeCache.txt' file
                    + Everytime you install, it will automatically install to the custom installation location instead
    ```bash
    sudo make install
    ```

- Debian-based
    - Install using dpkg
        - Change directory into 'build'
            ```bash
            cd build
            ```
        - cpack the debian file
            ```bash
            cpack -G DEB
            ```
        - Install the `.deb` package using dpkg
            + This should help ensuring the clean removal of installed files
            ```bash
            sudo dpkg -i nvim-linux64.deb
            ```

#### Removal/Uninstallation
- Manually
    - Delete the executables the PREFIX (installation path) binary directory
        ```bash
	    rm ${PREFIX}/bin/nvim
        ```
    - Delete the neovim shared resources from the share directory
	    ```bash
        rm -r ${PREFIX}/share/nvim/
        ```

## Documentations
### Configurations
- Configuration Options

- Usages

## Wiki
### Snippets and Examples

## Resources

## References
+ [GitHub - neovim/neovim - Build Pre-Requisites/Dependencies](https://github.com/neovim/neovim/blob/master/BUILD.md#build-prerequisites)
+ [GitHub - neovim/neovim - Build Steps/Instructions](https://github.com/neovim/neovim/blob/master/BUILD.md)
+ [GitHub - neovim/neovim - Build Steps/Instructions - Windows](https://github.com/neovim/neovim/blob/master/BUILD.md#building-on-windows)
+ [GitHub - neovim/neovim - Installation Steps/Instructions - from Source](https://github.com/neovim/neovim/blob/master/INSTALL.md#install-from-source)

## Remarks

