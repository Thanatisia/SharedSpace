# OpenWRT - Build from Source

## Information
### Project
+ Project Author: openwrt
+ Project Name: openwrt
- Repository:
    + Git Source: https://git.openwrt.org/openwrt/openwrt.git
+ Current Version: v23.05.0

## Setup
### Dependencies
- Build Tools
    + alpine-sdk : apk-based (Alpine)
    + base-devel : pacman-based (ArchLinux)
    + build-essential : apt-based (Debian)
+ git

### Pre-Requisites
- Install packages
    - Using package managers
        - apk-based (alpine)
            ```bash
            apk add argp-standalone asciidoc bash bc binutils bzip2 cdrkit coreutils \
                diffutils elfutils-dev findutils flex musl-fts-dev g++ gawk gcc gettext git \
                grep gzip intltool libxslt linux-headers make musl-libintl musl-obstack-dev \
                ncurses-dev openssl-dev patch perl python3-dev rsync tar \
                unzip util-linux wget zlib-dev

            # missing dependency workaround (libtinfo is not installable by any APK package,
            # but can be simulated via libncurses (see: https://stackoverflow.com/a/41517423 )
            # w/o this - ERROR: package/boot/uboot-mvebu failed to build (build variant: clearfog)
            ln -s /usr/lib/libncurses.so /usr/lib/libtinfo.so
            ```
        - pacman-based (ArchLinux)
            ```bash
            # Essential prerequisites
            pacman -S --needed base-devel autoconf automake bash binutils bison \
            bzip2 fakeroot file findutils flex gawk gcc gettext git grep groff \
            gzip libelf libtool libxslt m4 make ncurses openssl patch pkgconf \
            python rsync sed texinfo time unzip util-linux wget which zlib

            # Optional prerequisites, depend on the package selection
            pacman -S --needed asciidoc help2man intltool perl-extutils-makemaker swig
            ```
        - dnf-based (Fedora)
            ```bash
            sudo dnf --setopt install_weak_deps=False --skip-broken install \
            bash-completion bzip2 gcc gcc-c++ git make ncurses-devel patch \
            rsync tar unzip wget which diffutils python2 python3 perl-base \
            perl-Data-Dumper perl-File-Compare perl-File-Copy perl-FindBin \
            perl-IPC-Cmd perl-JSON-PP perl-Thread-Queue perl-Time-Piece
            ```
        - apt-based (Debian)
            ```bash
            sudo apt update
            sudo apt install build-essential clang flex bison g++ gawk \
            gcc-multilib g++-multilib gettext git libncurses-dev libssl-dev \
            python3-distutils rsync unzip zlib1g-dev file wget
            ```
        - emerge/portage (Gentoo)
            ```bash
            echo \
            app-arch/{bzip2,sharutils,unzip,zip} sys-process/time \
            app-text/asciidoc \
            dev-libs/{libusb-compat,libxslt,openssl} dev-util/intltool \
            dev-vcs/{git,mercurial} net-misc/{rsync,wget} \
            sys-apps/util-linux sys-devel/{bc,bin86,dev86} \
            sys-libs/{ncurses,zlib} virtual/perl-ExtUtils-MakeMaker \
            | sed "s/\s/\n/g" \
            | sort \
            | sudo tee /etc/portage/sets/openwrt-prerequisites \
            && sudo emerge -DuvNa "@openwrt-prerequisites"
            ```
        - zypper (OpenSUSE)
            ```bash
            sudo zypper install --no-recommends asciidoc bash bc binutils bzip2 \
            fastjar flex gawk gcc gcc-c++ gettext-tools git git-core intltool \
            libopenssl-devel libxslt-tools make mercurial ncurses-devel patch \
            perl-ExtUtils-MakeMaker python-devel rsync sdcc unzip util-linux \
            wget zlib-devel
            ```
        - xbps (Void)
            ```bash
            sudo xbps-install -Su asciidoc bash bc binutils bzip2 cdrtools \
            coreutils diffutils findutils flex gawk gcc gettext git grep intltool \
            libxslt linux-headers make ncurses-devel openssl-devel patch perl \
            pkg-config python-devel python3-devel rsync tar unzip util-linux \
            wget zlib-devel
            ```

- Clone repository
    ```bash
    git clone https://git.openwrt.org/openwrt/openwrt.git
    ```

- Change directory into repository
    ```bash
    cd openwrt
    ```

- Pull the latest changes
    ```bash
    git pull
    ```

- Select a specific code revision
    - List all branches
        ```bash
        git branch -a
        ```
    - List all tags
        ```bash
        git tag
        ```
    - Checkout the specific version
        ```bash
        git checkout [branch|tag]
        ```

- Update the feeds to the latest changes
    ```bash
    ./scripts/feeds update -a
    ```

- Install the feeds and make the download package(s) available in `make menuconfig`
    ```bash
    ./scripts/feeds install -a
    ```

- Configure the firmware image
    ```bash
    make menuconfig
    ```

- (Optional) Configure the linux kernel
    - Note
        + Usually not required
        + Do not, unless you have a strong reason to
        + This will take an extremely long time
    ```bash
    make -j$(nproc) kernel_menuconfig
    ```

- (Optional) Configure the build system
    - Configure using the build system configuration interface
        - Notes
            + This handles the selection of the target platform, packages to be compiled, packages to be included in the firmware file, some kernel options, etc.
        - Start the build system configuration interface
            ```bash
            make menuconfig
            ```
    - Configure using a config diff file
        - Creating a diff file for backup
            + Write the changes to diffconfig
            ```bash
            ./scripts/diffconfig.sh > diffconfig
            ```
        - Using the diff file to recover
            - Copy the diffconfig to a '.config' file
                ```bash
                cp diffconfig .config
                ```
            - Expand to full configuration
                ```bash
                make defconfig
                ```

- Build the firmware image
    - Explanation
        - make defconfig : will produce a default configuration of the target device and build system, including a check of dependencies and prerequisites for the build environment.
            + Defconfig will also remove outdated items from .config, e.g. references to non-existing packages or config options.
            + It also checks the dependencies and will add possibly missing necessary dependencies. This can be used to “expand” a short .config recipe (like diffconfig output, possible even pruned further) to a full .config that the make process accepts.
        - make download : Download sources and multi-core compile
            + Before running final make it is best to issue make download command first, this step will pre-fetch all source code for all dependencies, this enables you compile with more CPU cores, e.g. make -j10, for 4 core, 8 thread CPU works great.
            + If you try compiling OpenWrt on multiple cores and don't download all source files for all dependency packages it is very likely that your build will fail.
    ```bash
    make -j$(nproc) defconfig download clean world
    ```

- Build the image(s)
    + This should compile toolchain, cross-compile sources, package packages, and generate an image ready to be flashed.
    ```bash
    make
    ```

- Make a summary information of the generated image
    + This will generate a summary of the image (including default packages, type of target, etc... ) in JSON format. The output is available in <BUILD_DIR>/profiles.json.
    ```bash
    make json_overview_image_info
    ```

- Calculate checksum for generated files
    + The following action will take place: a checksum will be computed and saved for the output files. This checksum will then be stored in the '<BIN_DIR>/sha256sums' .
    ```bash
    make checksum
    ```

- (Optional) Clean up
    ```bash
    make clean
    ```

## Documentations

### Build Filesystem Layout/Structure
- After a successful build, 
    + the freshly built image(s) can be found below the newly created <buildroot>/bin directory. 
    - The compiled files are additionally classified by the target platform and subtarget, 
        + so e.g. a generic firmware built for an ar71xx device will be located in <buildroot>/bin/targets/ar71xx/generic directory (and the package files are below <buildroot>/bin/packages/mips_24kc).
        - E.g. 
            + if your <buildroot> is ~/source, the binaries are in ~/source/bin/targets/ar71xx/generic and ~/source/bin/packages/mips_24kc.

## Wiki

## Resources

## References
+ [OpenWRT - Documentations - Developer Guide - Toolchain - Build System Essentials](https://openwrt.org/docs/guide-developer/toolchain/buildsystem_essentials)
+ [OpenWRT - Documentations - Developer Guide - Toolchain - Build System Essentials - Directory Structure](https://openwrt.org/docs/guide-developer/toolchain/buildsystem_essentials#directory_structure)
+ [OpenWRT - Documentations - Developer Guide - Toolchain - Install Build System](https://openwrt.org/docs/guide-developer/toolchain/install-buildsystem)
+ [OpenWRT - Documentations - Developer Guide - Toolchain - Use Build System](https://openwrt.org/docs/guide-developer/toolchain/use-buildsystem)

## Remarks

