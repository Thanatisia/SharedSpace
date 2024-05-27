# LuaLS/lua-language-server

## Information
### Description
+ The Lua LSP (Language Server Protocol) server pack.
- Previously maintained by sumneko and was called 'sumneko/luals'
    + The project has now been given a dedicated organization and repository
- The Lua language server provides various language features for Lua to make development easier and faster. 
    + With nearly a million installs in Visual Studio Code, it is the most popular extension for Lua language support.

### Project
+ Author: LuaLS
+ Project: lua-language-server
+ Marketing Website: https://luals.github.io/
- Code Repositories and Mirrors
    + GitHub : https://github.com/LuaLS/lua-language-server

## Setup
### Dependencies
- Development/Building Essentials
    - apt-based: build-essential
    - pacman-based: base-devel
+ make
+ git
- gcc
    + apt-based: gcc
    + pacman-based: gcc
    + portage-based: sys-devel/gcc
- g++ : c++17
    + apt-based: g++
    + pacman-based: g++
    + portage-based: sys-devel/g++
- clang
    + apt-based: clang
    + pacman-based: clang
    + portage-based: sys-devel/clang
- ninja
    + apt-based: ninja-build
    + pacman-based: ninja
    + portage-based: dev-util/ninja

### Pre-Requisites

#### Cloning Repository
- Clone Repository
    - Explanation
        - In this documentation, the repository will be cloned into the '~/.local/bin' because the repository will be the '$PREFIX' (aka the Installation directory/path) containing the LSP server
            + Specifically, ~/.local/bin/lua-language-server/bin
            - As it will access the home directory, using sudo to copy to '$HOME/.local/bin' will be difficult after cloning
                + Hence, it will be more efficient to clone it directly
        - Alternatively, you can build it in your current working directory
            - However, doing so will make copying to the '$HOME/.local/bin' alot more difficult as 'sudo $HOME' will result in the sudo/root user's home, not the current user
                + Hence, it is recommended to make your $PREFIX into '/usr/local/bin' instead for the local user binary
    ```console
    git clone https://github.com/LuaLS/lua-language-server ~/.local/bin/lua-language-server
    ```

- Change directory into folder
    - Explanation
        + $PREFIX = The installation directory of the LSP server, in this case, '~/.local/bin'
    ```console 
    cd $PREFIX/lua-language-server
    ```

- Pull down and update the submodules list recursively
    ```bash
    git submodule update --recursive
    ```

- Change directory into '3rd/luamake'
    ```bash
    cd 3rd/luamake
    ```

- Initialize and clone all packages and submodules specified in the database (i.e. Download the ninja luamake rules)
    ```bash
    git submodule update --init --recursive
    ```

#### Build/Compile from Source
- Using ninja (Recommended)
    - (Optional) Change directory into '3rd/luamake'
        - Notes
            + If you changed directory out of '3rd/luamake'
        ```bash
        cd 3rd/luamake
        ```
    - Build/Compile the Lua language server
        - Explanation
            + your-platform : Specify the target platform/operating system that you want to build for here
            - [your-platform].ninja : This is the ninja build recipe for building the LSP server for the specified platform
                - Platform examples
                    + macos.ninja : For MacOS
                    + linux.ninja : For Linux
                    + mingw.ninja : For MinGW(-w64)/Windows
                    + msys        : For MSYS/Windows
        ```bash
        ninja -f compile/ninja/[your-platform].ninja
        ```
    - Change directory back to the root of the repository
        ```bash
        cd ../../
        ```
    - Rebuild the luamake with the built ninja files to output the executable
        ```bash
        ./3rd/luamake/luamake rebuild
        ```

- Using the install script
    - Change permission modifier of the script to make it executable
        ```bash
        chmod u+x compile/install.sh
        ```
    - Execute the install script
        ```bash
        compile/install.sh
        ```
    - Change directory back to the root of the repository
        ```bash
        cd ../../
        ```
    - Rebuild the luamake with the built ninja files to output the executable
        ```bash
        ./3rd/luamake/luamake rebuild
        ```

- Using 'make.sh'
    - Linux-based
        ```bash
        ./make.sh
        ```
    - Windows-based
        ```bash
        .\make.bat
        ```

#### Installation
- Append the path to the lua-language-server binary into your system PATH environment variable
    ```bash
    echo -e "export PATH+=:$PREFIX/lua-language-server/bin:" >> $(HOME)/.bashrc 
    ```

#### Removal/Uninstallation
- Manually
    - Delete the '$PREFIX/lua-language-server' repository from '$PREFIX'
        ```bash
        rm -r $PREFIX/lua-language-server
        ```

## Documentations
### Configurations
- Configuration Options

- Usages

## Wiki
### Snippets and Examples

## Resources
+ [lua-language-server GitHub Pages - Build from Source guide - using make.bat](https://luals.github.io/wiki/build/)
+ [lua-language-server GitHub Pages - installation guide](https://luals.github.io/#install)
+ [GitHub - LuaLS/lua-language-server - Issues - 60 - Build/Use outside of VSCode - Contains VS Code task details](https://github.com/LuaLS/lua-language-server/issues/60)
+ [GitHub - LuaLS/lua-language-server - Issues - 185 - Build failure on arch linux - Contains solution to building errors](https://github.com/LuaLS/lua-language-server/issues/185)

## References
+ [GitHub - LuaLS/lua-language-server - Documentations - Configurations](https://github.com/LuaLS/lua-language-server/blob/master/doc/en-us/config.md)
+ [GitHub - LuaLS/lua-language-server - Wiki - Getting Started - Building from Source](https://github.com/LuaLS/lua-language-server/wiki/Getting-Started#build)
+ [mbaraa - blog - Install Lua LSP for Neovim](https://www.mbaraa.com/blog/install-lua-lsp-for-neovim#toc_0)
+ [Chris@Machine - Neovim - 28 - Neovim Lua Development](https://www.chiarulli.me/Neovim/28-neovim-lua-development/)

## Remarks

