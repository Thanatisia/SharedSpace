# Build from Source - fastfetch-cli/fastfetch

## Information
### Description
+ Fastfetch is a fetch CLI utility like Neofetch written mainly in C for fetching system information and displaying them in a pretty way, with performance and customizability in mind
- Supported Platforms
    + Linux
    + Android
    + FreeBSD
    + MacOS
    + Windows 7+

### Project
+ Package Author: fastfetch-cli
+ Package Name: fastfetch
- Repositories
    - GitHub
        + [fastfetch-cli/fastfetch](https://github.com/fastfetch-cli/fastfetch)

## Setup
### Dependencies

> Linux
+ libvulkan: Vulkan module & fallback for GPU output.
+ libxcb-randr, libXrandr, libxcb, libX11: At least one of them sould be present in X11 sessions for better display detection and faster WM detection. The *randr ones provide multi monitor support The libxcb* ones usually have better performance.
+ libwayland-client: Better display performance and output in wayland sessions. Supports different refresh rates per monitor.
+ libdrm: fall back if both wayland and x11 are not available.
+ libGIO: Needed for values that are only stored GSettings.
+ libDConf: Needed for values that are only stored in DConf + Fallback for GSettings.
+ libmagickcore (ImageMagick): Images in terminal using sixel or kitty graphics protocol.
+ libchafa: Image output as ascii art.
+ libZ: Faster image output when using kitty graphics protocol.
+ libDBus: Bluetooth, Player & Media detection.
+ libEGL, libGLX, libOSMesa: At least one of them is needed by the OpenGL module for gl context creation.
+ libOpenCL: OpenCL module
+ libXFConf: Needed for XFWM theme and XFCE Terminal font.
+ libsqlite3: Needed for pkg & rpm package count.
+ librpm: Slower fallback for rpm package count. Needed on openSUSE.
+ libnm: Used for Wifi detection.
+ libpulse: Used for Sound device detection.
+ libddcutil: Used for brightness detection of external displays
+ DirectX-Headers: Used for GPU detection in WSL

> Windows (Msys2)
+ cmake : mingw-w64-clang-x86_64-cmake 
+ pkg-config : mingw-w64-clang-x86_64-pkgconf 
+ clang : mingw-w64-clang-x86_64-clang 
+ vulkan-loader : mingw-w64-clang-x86_64-vulkan-loader 
+ openCL : mingw-w64-clang-x86_64-opencl-icd
+ vulkan-header : mingw-w64-clang-x86_64-vulkan-header

### Pre-Requisites
- Windows-only
    - Prepare Msys2
        + Please refer to [Windows - Msys2](/Docs/Operating%20Systems/Windows/Programming/Software%20Distribution%20and%20Building%20Platform/msys2/README.md) for the full documentation on how to setup msys2 on Windows
        - Open '[installation-root-directory]/clang64'
            + Not '[installation-root-directory]/msys', this targets cygwin C runtime

    - Install Dependencies
        ```
        pacman -Syu mingw-w64-clang-x86_64-cmake mingw-w64-clang-x86_64-pkgconf mingw-w64-clang-x86_64-clang mingw-w64-clang-x86_64-vulkan-loader mingw-w64-clang-x86_64-opencl-icd mingw-w64-clang-x86_64-vulkan-header
        ```

- Clone repository package
    ```bash
    git clone https://github.com/fastfetch-cli/fastfetch
    ```

- Change directory into local repository
    ```bash
    cd fastfetch
    ```

- Make a dedicated build directory
    ```bash
    mkdir -pv build
    ```

- Change directory into dedicated build directory
    ```bash
    cd build
    ```

### Build
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

### Packaging
- Package as a debian (DEB)/RPM package
    - Explanation
        - CMake Parameters
            + `--build [cmake-build-directory]` : Build the CMake files configured in the build directory
            + `--target package` : build the source as a package
    ```bash
    cmake --build . --target package
    ```

### Installation
- Built from source
    - Using cmake
        - Explanation
            - CMake Parameters
                + `--install [cmake-build-directory]` : Install the built CMake files to the specified system prefix (installation directory)
                + `--prefix [installation-directory]` : Explicitly specify the PREFIX (installation directory) to install the built source files into
        ```bash
        cmake --install . --prefix /usr/local
        ```
    - Manually
        - Linux
            - Install the built executables 'fastfetch' and 'flashfetch' to '/usr/local/bin'
                ```bash
                cp {fastfetch,flashfetch} /usr/local/bin
                ```

        - Windows
            - Copy the built executables 'fastfetch' and 'flashfetch' to a bin directory in the system
                ```bash
                copy fastfetch [bin-directory]
                copy flashfetch [bin-directory]
                ```

- Using pckage manager
    - dpkg-based (Debian)
        - Download deb file
            ```bash
            wget https://github.com/fastfetch-cli/fastfetch/releases/download/<release-version>/fastfetch-linux-amd64.deb
            ```
        - Install debian file using dpkg
            ```bash
            dpkg -i fastfetch-linux-amd64.deb
            ```
    - apt-based
        ```bash
        apt install fastfetch
        ```
    - pacman-based
        ```bash
        pacman -S fastfetch
        ```
    - dnf-based
        ```bash
        dnf install fastfetch
        ```
    - portage-based
        ```bash
        emerge --ask app-misc/fastfetch
        ```
    - apk-based
        ```bash
        apk add --upgrade fastfetch
        ```
    - NixOS
        - nix-env
            ```bash
            nix-env -iA nixpkgs/fastfetch
            ```
        - nix-shell
            ```bash
            nix-shell -p fastfetch
            ```
    - zypper-based
        ```bash
        zypper install fastfetch
        ```

## Documentations

### Synopsis/Syntax
- Run with default configurations
    ```bash
    fastfetch {options} <arguments>
    ```

### Parameters
- Positionals
- Optionals
    - With Arguments
        + `-c [configuration-file (.jsonc)]` : Import the specified .jsonc configuration file
        - `--format [configuration-file-formats]` : Explicitly specify the format of the configuration file to use
            - configuration file formats
                + json : JSON file
        - `-s [module]` : Specify the modules you want fastfetch to detect
    - Flags
        + --gen-config : Generate configuration file based on the command line arguments passed before it
        + --help : Display help message

### Usage
- Run with a custom configuration file
    ```bash
    fastfetch -c all.jsonc
    ```

## Wiki

## Resources

## References
+ [GitHub - fastfetch-cli/fastfetch - Dependencies](https://github.com/fastfetch-cli/fastfetch/wiki/Dependencies)
+ [GitHub - fastfetch-cli/fastfetch Releases](https://github.com/fastfetch-cli/fastfetch/releases/latest)
+ [GitHub - fastfetch-cli/fastfetch - Configurations](https://github.com/fastfetch-cli/fastfetch/wiki/Configuration)

## Remarks

