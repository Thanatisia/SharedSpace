# LFS 

## Information
### System
+ Current Version: 12.0

### Package Versions
- Ncurses : 6.4

## Setup
### Pre-Requisites
#### Host System
- Verify that your host system has all the appropriate versions, 
    + and the ability to compile programs
    ```console
    cat > version-check.sh << "EOF"
    #!/bin/bash
    # A script to list version numbers of critical development tools

    # If you have tools installed in other directories, adjust PATH here AND
    # in ~lfs/.bashrc (section 4.4) as well.

    LC_ALL=C 
    PATH=/usr/bin:/bin

    bail() { echo "FATAL: $1"; exit 1; }
    grep --version > /dev/null 2> /dev/null || bail "grep does not work"
    sed '' /dev/null || bail "sed does not work"
    sort   /dev/null || bail "sort does not work"

    ver_check()
    {
       if ! type -p $2 &>/dev/null
       then 
         echo "ERROR: Cannot find $2 ($1)"; return 1; 
       fi
       v=$($2 --version 2>&1 | grep -E -o '[0-9]+\.[0-9\.]+[a-z]*' | head -n1)
       if printf '%s\n' $3 $v | sort --version-sort --check &>/dev/null
       then 
         printf "OK:    %-9s %-6s >= $3\n" "$1" "$v"; return 0;
       else 
         printf "ERROR: %-9s is TOO OLD ($3 or later required)\n" "$1"; 
         return 1; 
       fi
    }

    ver_kernel()
    {
       kver=$(uname -r | grep -E -o '^[0-9\.]+')
       if printf '%s\n' $1 $kver | sort --version-sort --check &>/dev/null
       then 
         printf "OK:    Linux Kernel $kver >= $1\n"; return 0;
       else 
         printf "ERROR: Linux Kernel ($kver) is TOO OLD ($1 or later required)\n" "$kver"; 
         return 1; 
       fi
    }

    # Coreutils first because-sort needs Coreutils >= 7.0
    ver_check Coreutils      sort     7.0 || bail "--version-sort unsupported"
    ver_check Bash           bash     3.2
    ver_check Binutils       ld       2.13.1
    ver_check Bison          bison    2.7
    ver_check Diffutils      diff     2.8.1
    ver_check Findutils      find     4.2.31
    ver_check Gawk           gawk     4.0.1
    ver_check GCC            gcc      5.1
    ver_check "GCC (C++)"    g++      5.1
    ver_check Grep           grep     2.5.1a
    ver_check Gzip           gzip     1.3.12
    ver_check M4             m4       1.4.10
    ver_check Make           make     4.0
    ver_check Patch          patch    2.5.4
    ver_check Perl           perl     5.8.8
    ver_check Python         python3  3.4
    ver_check Sed            sed      4.1.5
    ver_check Tar            tar      1.22
    ver_check Texinfo        texi2any 5.0
    ver_check Xz             xz       5.0.0
    ver_kernel 4.14

    if mount | grep -q 'devpts on /dev/pts' && [ -e /dev/ptmx ]
    then echo "OK:    Linux Kernel supports UNIX 98 PTY";
    else echo "ERROR: Linux Kernel does NOT support UNIX 98 PTY"; fi

    alias_check() {
       if $1 --version 2>&1 | grep -qi $2
       then printf "OK:    %-4s is $2\n" "$1";
       else printf "ERROR: %-4s is NOT $2\n" "$1"; fi
    }
    echo "Aliases:"
    alias_check awk GNU
    alias_check yacc Bison
    alias_check sh Bash

    echo "Compiler check:"
    if printf "int main(){}" | g++ -x c++ -
    then echo "OK:    g++ works";
    else echo "ERROR: g++ does NOT work"; fi
    rm -f a.out
    EOF

    bash version-check.sh
    ```

- Set Environment Variables
    - LFS : Set as the root partition mount point
        ```console
        export LFS="/mnt"
        ```

- Create root partition mount point
    ```console
    mkdir -pv $LFS
    ```

#### Partition Management
- Format Disk Label
    ```console
    sudo parted [disk-label] mklabel {msdos|gpt}
    ```
- Boot partition
    - Create partition
        - MSDOS/BIOS
            ```console
            sudo parted [disk-label] mkpart primary ext4 0% 1024MiB
            ```
        - GPT/UEFI
            ```console
            sudo parted [disk-label] mkpart [partition-label] 0% 1024MiB
            ```
    - Format boot partition filesystem
        ```console
        sudo mkfs.ext4 [disk-label]1
        ```
    - Set partition as bootable
        ```console
        sudo parted [disk-label] set 1 boot on
        ```
- Root partition
    - Create partition
        - MSDOS/BIOS
            ```console
            sudo parted [disk-label] mkpart primary ext4 1024MiB 50%
            ```
        - GPT/UEFI
            ```console
            sudo parted [disk-label] mkpart [partition-label] 1024MiB 50%
            ```
    - Format boot partition filesystem
        ```console
        sudo mkfs.ext4 [disk-label]2
        ```    

- Optionals
    - Home partition
        - Create partition
            - MSDOS/BIOS
                ```console
                sudo parted [disk-label] mkpart primary ext4 50% 100%
                ```
            - GPT/UEFI
                ```console
                sudo parted [disk-label] mkpart [partition-label] 50% 100%
                ```
        - Format boot partition filesystem
            ```console
            sudo mkfs.ext4 [disk-label]3
            ```

    - Mount root partition
        ```console
        mount [disk-label]2 $LFS
        ```

    - Create boot and home directories
        ```console
        mkdir -pv $LFS/{boot,home}
        ```

    - Mount boot partition
        ```console
        mount [disk-label]1 $LFS/boot
        ```

    - Mount home partition
        ```console
        mount [disk-label]3 $LFS/home
        ```

#### Download sources 
- Create 'sources' directory in mount point
    ```console
    mkdir -pv $LFS/sources
    ```
- Set the directory writable and sticky
    ```console
    chmod -v a+wt $LFS/sources
    ```
- Download wget-list from a mirror
    + Recommended: https://www.linuxfromscratch.org/lfs/view/[lfs-version]/wget-list-sysv
    ```console
    wget https://www.linuxfromscratch.org/lfs/view/[lfs-version]/wget-list-sysv
    ```
- Download all of the packages and patches by using wget-list-sysv as an input to the wget command
    ```console
    wget --input-file=wget-list-sysv --continue --directory-prefix=$LFS/sources
    ```
- Download a checksum file 'md5sums' to '$LFS/sources'
    + to verify that all of the correct packages are available before proceeding
    + Link: https://www.linuxfromscratch.org/lfs/view/[lfs-version]/md5sums
    ```console
    wget https://www.linuxfromscratch.org/lfs/view/[lfs-version]/md5sums 
    mv -v md5sums $LFS/sources
    ```
- Validate checksum
    ```console
    pushd $LFS/sources \
        md5sum -c md5sums \
    popd
    ```

- (Optional) If the packages and patches are downloaded as a non-root user
    - Explanation
        + These files will be owned by the user
        - The file system records the owner by its UID, 
            + and the UID of a normal user in the host distro is not assigned in LFS. 
            + So the files will be left owned by an unnamed UID in the final LFS system. 
        - If you won't assign the same UID for your user in the LFS system, 
            + change the owners of these files to root now to avoid this issue
    ```console
    chown root:root $LFS/sources/*
    ```

#### Additional patches
- Explanation
    + This portion is optional for now, but later on in the installation process, it might become necessary
    - In addition to the packages, several patches are also required. 
        + These patches correct any mistakes in the packages that should be fixed by the maintainer. 
        + The patches also make small modifications to make the packages easier to work with. 
    + The following patches will be needed to build an LFS system
    + The following patch list will also be changed every version

- Patches
    - Bzip2 Documentation Patch - 1.6 KB:
        + MD5 sum: 6a5ac7e89b791aae556de0f745916f7f
        + Download URL: https://www.linuxfromscratch.org/patches/lfs/12.0/bzip2-1.0.8-install_docs-1.patch
    - Coreutils Internationalization Fixes Patch - 166 KB:
        + MD5 sum: 3c6340b3ddd62f4acdf8d3caa6fad6b0
        + Download URL: https://www.linuxfromscratch.org/patches/lfs/12.0/coreutils-9.3-i18n-1.patch
    - Glibc Memalign Patch - 20 KB:
        + MD5 sum: 2c3552bded42a83ad6a7087c5fbf3857
        + Download URL: https://www.linuxfromscratch.org/patches/lfs/12.0/glibc-2.38-memalign_fix-1.patch
    - Glibc FHS Patch - 2.8 KB:
        + MD5 sum: 9a5997c3452909b1769918c759eff8a2
        + Download URL: https://www.linuxfromscratch.org/patches/lfs/12.0/glibc-2.38-fhs-1.patch
    - GRUB Upstream Fixes Patch - 8 KB:
        + MD5 sum: da388905710bb4cbfbc7bd7346ff9174
        + Download URL: https://www.linuxfromscratch.org/patches/lfs/12.0/grub-2.06-upstream_fixes-1.patch
    - Kbd Backspace/Delete Fix Patch - 12 KB:
        + MD5 sum: f75cca16a38da6caa7d52151f7136895
        + Download URL: https://www.linuxfromscratch.org/patches/lfs/12.0/kbd-2.6.1-backspace-1.patch
    - Readline Upstream Fix Patch - 1.3 KB:
        + MD5 sum: dd1764b84cfca6b677f44978218a75da
        + Download URL: https://www.linuxfromscratch.org/patches/lfs/12.0/readline-8.2-upstream_fix-1.patch
    - Sysvinit Consolidated Patch - 2.5 KB:
        + MD5 sum: 17ffccbb8e18c39e8cedc32046f3a475
        + Download URL: https://www.linuxfromscratch.org/patches/lfs/12.0/sysvinit-3.07-consolidated-1.patch

- Download individually
    - Bzip2 Documentation Patch - 1.6 KB:
        ```console
        wget https://www.linuxfromscratch.org/patches/lfs/12.0/bzip2-1.0.8-install_docs-1.patch
        ```
    - Coreutils Internationalization Fixes Patch - 166 KB:
        ```console 
        wget https://www.linuxfromscratch.org/patches/lfs/12.0/coreutils-9.3-i18n-1.patch
        ```
    - Glibc Memalign Patch - 20 KB:
        ```console 
        wget https://www.linuxfromscratch.org/patches/lfs/12.0/glibc-2.38-memalign_fix-1.patch
        ```
    - Glibc FHS Patch - 2.8 KB:
        ```console
        wget https://www.linuxfromscratch.org/patches/lfs/12.0/glibc-2.38-fhs-1.patch
        ```
    - GRUB Upstream Fixes Patch - 8 KB:
        ```console 
        wget https://www.linuxfromscratch.org/patches/lfs/12.0/grub-2.06-upstream_fixes-1.patch
        ```
    - Kbd Backspace/Delete Fix Patch - 12 KB:
        ```console 
        wget https://www.linuxfromscratch.org/patches/lfs/12.0/kbd-2.6.1-backspace-1.patch
        ```
    - Readline Upstream Fix Patch - 1.3 KB:
        ```console
        wget https://www.linuxfromscratch.org/patches/lfs/12.0/readline-8.2-upstream_fix-1.patch
        ```
    - Sysvinit Consolidated Patch - 2.5 KB:
        ```console
        wget https://www.linuxfromscratch.org/patches/lfs/12.0/sysvinit-3.07-consolidated-1.patch
        ```

- Download using wget-list
    - wget-list
        ```
        https://www.linuxfromscratch.org/patches/lfs/12.0/bzip2-1.0.8-install_docs-1.patch
        https://www.linuxfromscratch.org/patches/lfs/12.0/coreutils-9.3-i18n-1.patch
        https://www.linuxfromscratch.org/patches/lfs/12.0/glibc-2.38-memalign_fix-1.patch
        https://www.linuxfromscratch.org/patches/lfs/12.0/glibc-2.38-fhs-1.patch
        https://www.linuxfromscratch.org/patches/lfs/12.0/grub-2.06-upstream_fixes-1.patch
        https://www.linuxfromscratch.org/patches/lfs/12.0/kbd-2.6.1-backspace-1.patch
        https://www.linuxfromscratch.org/patches/lfs/12.0/readline-8.2-upstream_fix-1.patch
        https://www.linuxfromscratch.org/patches/lfs/12.0/sysvinit-3.07-consolidated-1.patch
        ```
    - md5sums
        ```
        6a5ac7e89b791aae556de0f745916f7f https://www.linuxfromscratch.org/patches/lfs/12.0/bzip2-1.0.8-install_docs-1.patch
        3c6340b3ddd62f4acdf8d3caa6fad6b0 https://www.linuxfromscratch.org/patches/lfs/12.0/coreutils-9.3-i18n-1.patch
        2c3552bded42a83ad6a7087c5fbf3857 https://www.linuxfromscratch.org/patches/lfs/12.0/glibc-2.38-memalign_fix-1.patch
        9a5997c3452909b1769918c759eff8a2 https://www.linuxfromscratch.org/patches/lfs/12.0/glibc-2.38-fhs-1.patch
        da388905710bb4cbfbc7bd7346ff9174 https://www.linuxfromscratch.org/patches/lfs/12.0/grub-2.06-upstream_fixes-1.patch
        f75cca16a38da6caa7d52151f7136895 https://www.linuxfromscratch.org/patches/lfs/12.0/kbd-2.6.1-backspace-1.patch
        dd1764b84cfca6b677f44978218a75da https://www.linuxfromscratch.org/patches/lfs/12.0/readline-8.2-upstream_fix-1.patch
        17ffccbb8e18c39e8cedc32046f3a475 https://www.linuxfromscratch.org/patches/lfs/12.0/sysvinit-3.07-consolidated-1.patch
        ```

    - Download patches 
        - Notes
            + Download this to a temporary location
            + You will use these to patch later
            + Save the md5 checksums of the patches in a 'md5sums' file in the same temporary location
        ```console 
        wget --input-file=[wget-list-file] --continue --directory-prefix=[temporary-directory]
        ```

    - Validate checksum
        ```console
        md5sum -c md5sums
        ```

#### Creating a limited directory layout in the filesystem
- Set environment variables
    - Notes
        + If you are running the following steps in a script, set/export the environment variables in the script
    - LFS : Set this as your LFS mount point
        ```console
        export LFS=[mount-point]
        ```

- Create the LFS root filesystem directory layout
    ```console
    mkdir -pv $LFS/{etc,var} $LFS/usr/{bin,lib,sbin}

    for i in bin lib sbin; do
        ln -sv usr/$i $LFS/$i
    done

    case $(uname -m) in
        x86_64) mkdir -pv $LFS/lib64 ;;
    esac
    ```

- Create a separate special 'tool' directory
    - Explanation
        + Programs in Chapter 6 will be compiled with a cross-compiler (more details can be found in section Toolchain Technical Notes). 
        + This cross-compiler will be installed in a special directory, to separate it from the other programs
    ```console
    mkdir -pv $LFS/tools
    ```

#### User Management
- Adding the user 'LFS'
    - Create new group 'lfs'
        ```console
        groupadd lfs
        ```
    - Add new user 'lfs'
        ```console
        useradd -m -g lfs -k /dev/null -s /bin/bash lfs
        ```
    - Set password to 'lfs'
        ```console
        sudo passwd lfs
        ```

- Grant user 'lfs' full access to all the directories under $LFS by making 'lfs' the owner
    - Note
        - Ensure that the following Environment Variables are set
            + LFS=[your-lfs-root-mount-point]
    ```console
    chown -v lfs $LFS/{usr{,/*},lib,var,etc,bin,sbin,tools}
    case $(uname -m) in
      x86_64) chown -v lfs $LFS/lib64 ;;
    esac
    ```

- Switch user to user 'lfs'
    ```console
    su - lfs
    ```

- User 'lfs' dotfiles
    - Create .bashrc_profile file
        ```console
        cat > ~/.bash_profile << "EOF"
        exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
        EOF
        ```
    - Create .bashrc file
        ```console
        cat > ~/.bashrc << "EOF"
        set +h
        umask 022
        LFS=[mount-point]
        LC_ALL=POSIX
        LFS_TGT=$(uname -m)-lfs-linux-gnu
        PATH=/usr/bin
        if [ ! -L /bin ]; then PATH=/bin:$PATH; fi
        PATH=$LFS/tools/bin:$PATH
        CONFIG_SITE=$LFS/usr/share/config.site
        export LFS LC_ALL LFS_TGT PATH CONFIG_SITE
        EOF
        ```
    - Force the shell to source and read the new user profile
        + to ensure the environment is fully prepared for building the temporary tools
        ```console
        source ~/.bash_profile
        ```

## Compiling a cross-toolchain
### Table of Contents 
- [Setup](#setup)
- Cross Toolchain Packages
    - Pass 1
        - [Binutils](#binutils)
        - [GCC](#gcc)
        - [Linux API Headers](#linux-api-headers)
        - [Glibc](#glibc)
        - [Libstdc++](#libstdc++)

### Setup
- Validate/Verify pre-requisites
    - Environment Variables
        + LFS
        + LFS_TGT
        + MAKEFLAGS='-jN' : You can set your default make flag to use N cores/processes simultaneously

    - If the above Environment Variables are not set, source the .bashrc file
        ```console
        source ~/.bashrc
        ```

- Change directory to '$LFS/sources'
    ```console
    cd $LFS/sources
    ```

### Pass 1
#### Binutils
- Information
    + File Name: binutils-[version].tar.xz
    + Estimated required disk space: 647MB
    - Description: 
        + More Information: [Section 8.18.2, “Contents of Binutils.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/binutils.html#contents-binutils)
    - Package Contents
        + Linker
        + Assembler
        - Other tools for handling object files

- Extract tar file
    ```console
    tar -xvf binutils-[version].tar.xz
    ```

- Change directory into binutils
    ```console
    cd binutils-[version]
    ```

- Create directory 'build'
    ```console
    mkdir -pv build
    ```

- Change directory into 'build'
    ```console
    cd build
    ```

- Configure and prepare for compilation
    ```console
    ../configure \
        --prefix=$LFS/tools \
        --with-sysroot=$LFS \
        --target=$LFS_TGT   \
        --disable-nls       \
        --enable-gprofng=no \
        --disable-werror
    ```

- Compile the package
    ```console
    make
    ```

- Install the package
    ```console
    make install
    ```

#### GCC
- Information
    + File Name: gcc-[version].tar.xz
    + Estimated required disk space: 4.2GB
    - Description:
        + More Information: [Section 8.27.2, “Contents of GCC.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/gcc.html#contents-gcc)
    - Package Contents
        - GNU compiler collection
            - i.e.
                + C/C++ compilers (gcc, g++ etc)

- Extract GCC tar files
    ```console
    tar -xvf gcc-[version].tar.xz
    ```

- Extract dependency tar files
    - mpfr
        ```console
        tar -xvf mpfr-[version].tar.xz
        ```
    - gmp
        ```console
        tar -xvf gmp-[version].tar.xz
        ```
    - mpc
        ```console
        tar -xvzf mpc-[version].tar.gz
        ```

- Change directory into gcc
    ```console
    cd gcc-[version]
    ```

- Move the dependency source directories to the gcc source directory
    - mpfr
        ```console
        mv -v ../mpfr-[version] mpfr
        ```
    - gmp
        ```console
        mv -v ../gmp-[version] gmp
        ```
    - mpc
        ```console
        mv -v ../mpc-[version] mpc
        ```

- On x86_64 hosts, set the default directory name for 64-bit libraries to “lib”:
    ```console
    case $(uname -m) in
      x86_64)
        sed -e '/m64=/s/lib64/lib/' -i.orig gcc/config/i386/t-linux64
        ;;
    esac
    ```

- Create directory 'build'
    ```console
    mkdir -pv build
    ```

- Change directory into 'build'
    ```console
    cd build
    ```

- Configure and prepare for compilation
    - Explanations
        - Parameters
            - With Arguments
                - `--target=$LFS_TGT` : Specify the target architecture you want to build for
                    + Type: String
                    - Possible Values
                        + x86 : 32-bit
                        + x86_64 : 32/64-bit
                        + aarch64-apple-darwin20 : MacOS
                    + Default: $LFS_TGT
                - --prefix=$LFS/tools : Specify the Cross-Toolchain installation directory/path (aka 'Prefix')
                    + Type: String
                    + Default: $LFS/tools
                - --with-glibc-version=[glibc-version] : Specify the glibc version you want to cross-compile the package with
                    + Type: String
                    + Current Value: 2.38
                - --with-sysroot=$LFS : Specify the LFS system root/mount directory/path you want to use in
                    + Type: String
                    + Default: $LFS
            - Flags
                - --with-newlib         : Compile with new libraries
                - --without-headers     : Compile without header files
                - --enable-default-pie
                - --enable-default-ssp
                - --disable-nls
                - --disable-shared
                - --disable-multilib
                - --disable-threads
                - --disable-libatomic
                - --disable-libgomp
                - --disable-libquadmath
                - --disable-libssp
                - --disable-libvtv
                - --disable-libstdcxx
                - --enable-languages=c,c++
        - Optional Parameters
            - --enable-multilib    : Add this flag if you are using and/or with to compile for x86 (32-bit) architecture CPU
            - --disable-bootstrap  : Disables bootstrapping
                - If you're building this on a x86_64 machine, and you have x86_64 as target, you're not actually building a cross-compiler
                    + Its possible you are building an isolated stage1 compiler.
                + GCC by default disables bootstrap if your build target platform is not the native platform (a cross-compiler)
    ```console
    ../configure                  \
        --target=$LFS_TGT         \
        --prefix=$LFS/tools       \
        --with-glibc-version=2.38 \
        --with-sysroot=$LFS       \
        --with-newlib             \
        --without-headers         \
        --enable-default-pie      \
        --enable-default-ssp      \
        --disable-nls             \
        --disable-shared          \
        --disable-multilib        \
        --disable-threads         \
        --disable-libatomic       \
        --disable-libgomp         \
        --disable-libquadmath     \
        --disable-libssp          \
        --disable-libvtv          \
        --disable-libstdcxx       \
        --enable-languages=c,c++
    ```

- Compile the package
    ```console
    make
    ```

- Install the package
    ```console
    make install
    ```

- Create a full version of the internal header using a command that is identical to what the GCC build system does in normal circumstances
    ```console
    cd ..
    cat gcc/limitx.h gcc/glimits.h gcc/limity.h > `dirname $($LFS_TGT-gcc -print-libgcc-file-name)`/include/limits.h
    ```

#### Linux API Headers
- Information
    + File Name: linux-[version].tar.xz
    + Estimated required disk space: 1.5GB
    - Description: 
    - Package Contents
        - Linux API Headers : Exposes the kernel's API for use by glibc
            - Contents of Linux API Headers
                - Installed headers:
                    + /usr/include/asm/*.h
                    + /usr/include/asm-generic/*.h
                    + /usr/include/drm/*.h
                    + /usr/include/linux/*.h
                    + /usr/include/misc/*.h
                    + /usr/include/mtd/*.h
                    + /usr/include/rdma/*.h
                    + /usr/include/scsi/*.h
                    + /usr/include/sound/*.h
                    + /usr/include/video/*.h
                    + /usr/include/xen/*.h
                - Installed directories:
                    + /usr/include/asm
                    + /usr/include/asm-generic
                    + /usr/include/drm
                    + /usr/include/linux
                    + /usr/include/misc
                    + /usr/include/mtd
                    + /usr/include/rdma
                    + /usr/include/scsi
                    + /usr/include/sound
                    + /usr/include/video
                    + /usr/include/xen
                - Short Descriptions
                    + /usr/include/asm/*.h          : The Linux API ASM Headers
                    + /usr/include/asm-generic/*.h  : The Linux API ASM Generic Headers
                    + /usr/include/drm/*.h          : The Linux API DRM Headers
                    + /usr/include/linux/*.h        : The Linux API Linux Headers
                    + /usr/include/misc/*.h         : The Linux API Miscellaneous Headers
                    + /usr/include/mtd/*.h          : The Linux API MTD Headers
                    + /usr/include/rdma/*.h         : The Linux API RDMA Headers
                    + /usr/include/scsi/*.h         : The Linux API SCSI Headers
                    + /usr/include/sound/*.h        : The Linux API Sound Headers
                    + /usr/include/video/*.h        : The Linux API Video Headers
                    + /usr/include/xen/*.h          : The Linux API Xen Headers
    - Summary: The Linux kernel needs to expose an Application Programming Interface (API) for the system's C library (Glibc in LFS) to use. 
        + This is done by way of sanitizing various C header files that are shipped in the Linux kernel source tarball

- Extract tar file
    ```console
    tar -xvf linux-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd linux-[version]
    ```

- Ensure that there are no stale files embedded in the package
    ```console
    make mrproper
    ```

- Make kernel headers from the source
    ```console
    make headers
    ```

- Extract the user-visible kernel headers from the source to '/usr'
    - Explanation
        - The recommended make target "headers_install" cannot be used 
            + because it requires rsync, which may not be available
    ```console
    find usr/include -type f ! -name '*.h' -delete
    cp -rv usr/include $LFS/usr
    ```

#### Glibc
- Information
    + File Name: glibc-[version].tar.xz
    + Estimated required disk space: 858MB
    - Description: 
    - Package Contents
        - main C library
            - This library provides the basic routines for 
                + allocating memory, 
                + searching directories, 
                + opening and closing files, 
                + reading and writing files, 
                + string handling, 
                + pattern matching, 
                + arithmetic, and 
                + so on.

- Extract tar file
    ```console
    tar -xvf glibc-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd glibc-[version]
    ```

- Create a symbolic link for LSB compliance
    - Additionally, 
        + for x86_64, create a compatibility symbolic link required for proper operation of the dynamic library loader
    ```console
    case $(uname -m) in
        i?86)   ln -sfv ld-linux.so.2 $LFS/lib/ld-lsb.so.3
        ;;
        x86_64) ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64
                ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64/ld-lsb-x86-64.so.3
        ;;
    esac
    ```

- Some of the Glibc programs use the non-FHS-compliant /var/db directory to store their runtime data. 
    - Apply the following patch to make such programs store their runtime data in the FHS-compliant locations
        + glibc-[version]-fhs-1.patch
    ```console
    patch -Np1 -i ../glibc-[version]-fhs-1.patch
    ```

- Create directory 'build'
    ```console
    mkdir -pv build
    ```

- Change directory into 'build'
    ```console
    cd build
    ```

- Ensure that the 'ldconfig' and 'sln' utilities are installed into '/usr/sbin'
    + as part of the installation configuration parameters
    ```console
    echo "rootsbindir=/usr/sbin" > configparms
    ```

- Configure and prepare for compilation
    - Options
        + --host=$LFS_TGT, --build=$(../scripts/config.guess) : The combined effect of these switches is that Glibc's build system configures itself to be cross-compiled, using the cross-linker and cross-compiler in $LFS/tools.
        + --enable-kernel=4.14 : This tells Glibc to compile the library with support for 4.14 and later Linux kernels. Workarounds for older kernels are not enabled.
        + --with-headers=$LFS/usr/include : This tells Glibc to compile itself against the headers recently installed to the $LFS/usr/include directory, so that it knows exactly what features the kernel has and can optimize itself accordingly.
        + libc_cv_slibdir=/usr/lib : This ensures that the library is installed in /usr/lib instead of the default /lib64 on 64-bit machines.
    - Notes
        - During this stage, the following warning migt appear
            + The missing or incompatible msgfmt program is generally harmless. This msgfmt program is part of the Gettext package, which the host distribution should provide.
            ```
            configure: WARNING:
            *** These auxiliary programs are missing or
            *** incompatible versions: msgfmt
            *** some features will be disabled.
            *** Check the INSTALL file for required versions.
            ```
    ```console
    ../configure                             \
          --prefix=/usr                      \
          --host=$LFS_TGT                    \
          --build=$(../scripts/config.guess) \
          --enable-kernel=4.14               \
          --with-headers=$LFS/usr/include    \
          libc_cv_slibdir=/usr/lib
    ```

- Compile the package
    ```console
    make
    ```

- Install the package
    + Install into the root/mount directory of the filesystem
    - Options
        + DESTDIR=$LFS : The DESTDIR make variable is used by almost all packages to define the location where the package should be installed. If it is not set, it defaults to the root (/) directory. Here we specify that the package is installed in $LFS 
    - Warnings
        - If LFS is not properly set, and despite the recommendations, you are building as root, 
            - the next command will install the newly built Glibc to your host system, 
                + which will almost certainly render it unusable. 
            - So double-check for the following before running the following command
                - the environment variables is correctly set, and 
                    + LFS
                    + LFS_TGT
                + that you are not root
    ```console
    make DESTDIR=$LFS install
    ```

- Fix a hard-coded path to the executable loader in the ldd script
    ```console
    sed '/RTLDLIST=/s@/usr@@g' -i $LFS/usr/bin/ldd
    ```

- Intermission
    - it is imperative to stop and ensure that the basic functions (compiling and linking) of the new toolchain are working as expected. 
        - To perform a sanity check, run the following commands
            - Compile a simple main function into an executable using gcc
                + and try to read the elf file
            ```console
            echo 'int main(){}' | $LFS_TGT-gcc -xc -
            readelf -l a.out | grep ld-linux
            ```
        - If everything is working correctly
            + There should be no errors, and 
            - the output of the last command will be of the form
                + Note that for 32-bit machines, the interpreter name will be /lib/ld-linux.so.2.
                ```console
                [Requesting program interpreter: /lib64/ld-linux-x86-64.so.2]
                ```
                - If the output is not as shown above, or there is no output at all, 
                    - then something is wrong. 
                        + Investigate and retrace the steps to find out where the problem is and correct it. 
                        + This issue must be resolved before continuing.
                    - Troubleshooting
                        - Check your PATH environment variable
                            + $LFS/tools/bin should be in your system PATH

        - Once all is well, clean up the test file
            ```console
            rm -v a.out
            ```

- Notes
    + Building the packages in the next chapter will serve as an additional check that the toolchain has been built properly. 
    - If some package, especially Binutils-pass2 or GCC-pass2, fails to build, 
        + it is an indication that something has gone wrong with the preceding Binutils, GCC, or Glibc installations.

#### Libstdc++
- Information
    + File Name: gcc-[version]/libstdc++-v3
    + Estimated required disk space: 1.1GB
    - Description: 
        + libstdc++ is the standard C++ library. 
        - It is needed to compile C++ code (part of GCC is written in C++), 
            - but had to defer its installation when we built gcc-pass1 because Libstdc++ depends on Glibc, 
                + which was not yet available in the target directory
        + More information: [Section 8.27.2, “Contents of GCC.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/gcc.html#contents-gcc)

- Change directory into gcc
    ```console
    cd gcc-[version]
    ```

- Create a seperate directory 'build' for libstdc++
    ```console
    mkdir -pv build
    ```

- Change directory into 'build'
    ```console
    cd build
    ```

- Configure and prepare for compilation
    - Options
        + `--host=...` : Specifies that the cross-compiler we have just built should be used instead of the one in /usr/bin.
        + `--disable-libstdcxx-pch` : This switch prevents the installation of precompiled include files, which are not needed at this stage.
        - `--with-gxx-include-dir=/tools/$LFS_TGT/include/c++/13.2.0` : This specifies the installation directory for include files. 
            - Because Libstdc++ is the standard C++ library for LFS, 
                + this directory should match the location where the C++ compiler ($LFS_TGT-g++) would search for the standard C++ include files. 
                - In a normal build, this information is automatically passed to the Libstdc++ configure options from the top level directory. 
                    + In our case, this information must be explicitly given. 
            - The C++ compiler will prepend the sysroot path $LFS (specified when building GCC-pass1) to the include file search path, 
                + so it will actually search in $LFS/tools/$LFS_TGT/include/c++/13.2.0. 
                + The combination of the DESTDIR variable (in the make install command below) and this switch causes the headers to be installed there.
    ```console
    ../libstdc++-v3/configure           \
        --host=$LFS_TGT                 \
        --build=$(../config.guess)      \
        --prefix=/usr                   \
        --disable-multilib              \
        --disable-nls                   \
        --disable-libstdcxx-pch         \
        --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/13.2.0
    ```

- Compile the package
    ```console
    make
    ```

- Install the package
    + Install into the root/mount directory of the filesystem
    - Options
        + DESTDIR=$LFS : The DESTDIR make variable is used by almost all packages to define the location where the package should be installed. If it is not set, it defaults to the root (/) directory. Here we specify that the package is installed in $LFS 
    ```console
    make DESTDIR=$LFS install
    ```

- Remove the libtool archive files because they are harmful for cross-compilation:
    ```console
    rm -v $LFS/usr/lib/lib{stdc++,stdc++fs,supc++}.la
    ```

## Cross Compiling Temporary Tools
### Table of Contents 
- [Setup](#setup)
- Temporary Tools
    - Pass 1
        - [M4](#m4)
        - [Ncurses](#ncurses)
        - [Bash](#bash)
        - [Coreutils](#coreutils)
        - [Diffutils](#diffutils)
        - [Findutils](#findutils)
        - [Gawk](#gawk)
        - [Grep](#grep)
        - [Gzip](#gzip)
        - [Make](#make)
        - [Patch](#patch)
        - [Sed](#sed)
        - [Tar](#tar)
        - [Xz](#xz)
    - Pass 2
        - [Binutils](#binutils-pass-2)
        - [GCC](#gcc-pass-2)

### Setup
- Validate/Verify pre-requisites
    - Environment Variables
        + LFS
        + LFS_TGT
        + MAKEFLAGS='-jN' : You can set your default make flag to use N cores/processes simultaneously

    - If the above Environment Variables are not set, source the .bashrc file
        ```console
        source ~/.bashrc
        ```

- Change directory to '$LFS/sources'
    ```console
    cd $LFS/sources
    ```

### Pass 1
#### M4
- Information
    + File Name: m4-[version].tar.xz
    + Estimated required disk space: 31MB
    - Description: 
        + More Information: [Section 8.12.2, “Contents of M4.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/m4.html#contents-m4)
    - Package Contents
        + Macro processor

- Extract tar file
    ```console
    tar -xvf m4-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd m4-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr   \
                --host=$LFS_TGT \
                --build=$(build-aux/config.guess)
    ```

- Compile the package
    - Troubleshooting
        - If you received an error message "Assumed value of MB_LEN_MAX wrong"
            + The header file 'limitx.h' is necessary to ensure that a limit length is defined
            - Go back to the root of the gcc source folder and re-run the following command
                ```console
                cat gcc/limitx.h gcc/glimits.h gcc/limity.h > `dirname $($LFS_TGT-gcc -print-libgcc-file-name)`/include/limits.h
                ```
    ```console
    make
    ```

- Install the package
    + Install into the root/mount directory of the filesystem
    - Options
        + DESTDIR=$LFS : The DESTDIR make variable is used by almost all packages to define the location where the package should be installed. If it is not set, it defaults to the root (/) directory. Here we specify that the package is installed in $LFS 
    ```console
    make DESTDIR=$LFS install
    ```

#### Ncurses
- Information
    + File Name: ncurses-[version].tar.gz
    + Estimated required disk space: 51MB
    - Description: 
        + More Information: [Section 8.29.2, “Contents of Ncurses.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/ncurses.html#contents-ncurses)
    - Package Contents
        + libraries for terminal-independent handling of character screens
    - Dependencies
        + gawk

- Extract tar file
    ```console
    tar -xvzf ncurses-[version].tar.gz
    ```

- Extract dependency tar files
    - gawk
        ```console
        tar -xvf gawk-[version].tar.xz
        ```

- Change directory into source file
    ```console
    cd ncurses-[version]
    ```

- Ensure that gawk is found
    ```console
    sed -i s/mawk// configure
    ```

- Build the "tic" program on the build host
    ```console
    mkdir build
    pushd build
      ../configure
      make -C include
      make -C progs tic
    popd
    ```

- Configure and prepare for compilation
    - Options
        + --with-manpage-format=normal : This prevents Ncurses installing compressed manual pages, which may happen if the host distribution itself has compressed manual pages.
        + --with-shared : This makes Ncurses build and install shared C libraries.
        + --without-normal : This prevents Ncurses building and installing static C libraries.
        + --without-debug : This prevents Ncurses building and installing debug libraries.
        + --with-cxx-shared : This makes Ncurses build and install shared C++ bindings. It also prevents it building and installing static C++ bindings.
        + --without-ada : This ensures that Ncurses does not build support for the Ada compiler, which may be present on the host but will not be available once we enter the chroot environment.
        + --disable-stripping : This switch prevents the building system from using the strip program from the host. Using host tools on cross-compiled programs can cause failure.
        + --enable-widec : This switch causes wide-character libraries (e.g., libncursesw.so.6.4) to be built instead of normal ones (e.g., libncurses.so.6.4). These wide-character libraries are usable in both multibyte and traditional 8-bit locales, while normal libraries work properly only in 8-bit locales. Wide-character and normal libraries are source-compatible, but not binary-compatible.
    ```console
    ./configure --prefix=/usr                \
                --host=$LFS_TGT              \
                --build=$(./config.guess)    \
                --mandir=/usr/share/man      \
                --with-manpage-format=normal \
                --with-shared                \
                --without-normal             \
                --with-cxx-shared            \
                --without-debug              \
                --without-ada                \
                --disable-stripping          \
                --enable-widec
    ```

- Compile the package
    ```console
    make
    ```

- Install the package
    + Install into the root/mount directory of the filesystem
    - Options
        + `DESTDIR=$LFS` : The DESTDIR make variable is used by almost all packages to define the location where the package should be installed. If it is not set, it defaults to the root (/) directory. Here we specify that the package is installed in $LFS 
        + `TIC_PATH=$(pwd)/build/progs/tic` : We need to pass the path of the newly built tic program that runs on the building machine, so the terminal database can be created without errors.
        + `echo "INPUT(-lncursesw)" > $LFS/usr/lib/libncurses.so` : The libncurses.so library is needed by a few packages we will build soon. We create this small linker script, as this is what is done in Chapter 8.
    ```console
    make DESTDIR=$LFS TIC_PATH=$(pwd)/build/progs/tic install
    echo "INPUT(-lncursesw)" > $LFS/usr/lib/libncurses.so
    ```

#### Bash
- Information
    + File Name: bash-[version].tar.gz
    + Estimated required disk space: 67MB
    - Description: 
        + More Information: [Section 8.35.2, “Contents of Bash.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/bash.html#contents-bash)
    - Package Contents
        + Bourne-Again Shell

- Extract tar file
    ```console
    tar -xvzf bash-[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd bash-[version]
    ```

- Configure and prepare for compilation
    - Options
        + --without-bash-malloc : This option turns off the use of Bash's memory allocation (malloc) function which is known to cause segmentation faults. By turning this option off, Bash will use the malloc functions from Glibc which are more stable.
    ```console
    ./configure --prefix=/usr                      \
                --build=$(sh support/config.guess) \
                --host=$LFS_TGT                    \
                --without-bash-malloc
    ```

- Compile the package
    ```console
    make
    ```

- Install the package
    + Install into the root/mount directory of the filesystem
    - Options
        + DESTDIR=$LFS : The DESTDIR make variable is used by almost all packages to define the location where the package should be installed. If it is not set, it defaults to the root (/) directory. Here we specify that the package is installed in $LFS 
    ```console
    make DESTDIR=$LFS install
    ```

- Make a symbolic link for the programs that use sh for a shell
    ```console
    ln -sv bash $LFS/bin/sh
    ```

#### Coreutils
- Information
    + File Name: coreutils-[version].tar.xz
    + Estimated required disk space: 168MB
    - Description: 
        + More Information: [Section 8.56.2, “Contents of Coreutils.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/coreutils.html#contents-coreutils)
    - Package Contents
        + basic utility programs needed by every operating system

- Extract tar file
    ```console
    tar -xvf coreutils-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd coreutils-[version]
    ```

- Configure and prepare for compilation
    - Options
        + --enable-install-program=hostname : This enables the hostname binary to be built and installed – it is disabled by default but is required by the Perl test suite.
        + gl_cv_macro_MB_CUR_MAX_good=y     : This is needed to work around an issue in the gnulib copy shipped by the package which would break cross compilation.
    ```console
    ./configure --prefix=/usr                     \
                --host=$LFS_TGT                   \
                --build=$(build-aux/config.guess) \
                --enable-install-program=hostname \
                --enable-no-install-program=kill,uptime \
                gl_cv_macro_MB_CUR_MAX_good=y
    ```

- Compile the package
    ```console
    make
    ```

- Install the package
    + Install into the root/mount directory of the filesystem
    - Options
        + DESTDIR=$LFS : The DESTDIR make variable is used by almost all packages to define the location where the package should be installed. If it is not set, it defaults to the root (/) directory. Here we specify that the package is installed in $LFS 
    ```console
    make DESTDIR=$LFS install
    ```

- Move the programs to their final expected locations
    - Although this is not necessary in this temporary environment, 
        + we must do so because some programs hardcode executable locations
    ```console
    mv -v $LFS/usr/bin/chroot              $LFS/usr/sbin
    mkdir -pv $LFS/usr/share/man/man8
    mv -v $LFS/usr/share/man/man1/chroot.1 $LFS/usr/share/man/man8/chroot.8
    sed -i 's/"1"/"8"/'                    $LFS/usr/share/man/man8/chroot.8
    ```

#### Diffutils
- Information
    + File Name: diffutils-[version].tar.xz
    + Estimated required disk space: 29MB
    - Description: 
        + More Information: [Section 8.58.2, “Contents of Diffutils.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/diffutils.html#contents-diffutils)
    - Package Contents
        + programs that show the differences between files or directories

- Extract tar file
    ```console
    tar -xvf diffutils-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd diffutils-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr   \
                --host=$LFS_TGT \
                --build=$(./build-aux/config.guess)
    ```

- Compile the package
    ```console
    make
    ```

- Install the package
    + Install into the root/mount directory of the filesystem
    - Options
        + DESTDIR=$LFS : The DESTDIR make variable is used by almost all packages to define the location where the package should be installed. If it is not set, it defaults to the root (/) directory. Here we specify that the package is installed in $LFS 
    ```console
    make DESTDIR=$LFS install
    ```

#### File
- Information
    + File Name: file-[version].tar.gz
    + Estimated required disk space: 37MB
    - Description: 
        + More Information: [Section 8.10.2, “Contents of File.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/file.html#contents-file)
    - Package Contents
        + utility for determining the type of a given file or files

- Extract tar file
    ```console
    tar -xvzf file-[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd file-[version]
    ```

- The 'file' command on the build host needs to be the same version as the one we are building in order to create the signature file. 
    - make a temporary copy of the file command
        - Options
            + --disable-* : The configuration script attempts to use some packages from the host distribution if the corresponding library files exist. It may cause compilation failure if a library file exists, but the corresponding header files do not. These options prevent using these unneeded capabilities from the host.
        ```console
        mkdir build
        pushd build
          ../configure --disable-bzlib      \
                       --disable-libseccomp \
                       --disable-xzlib      \
                       --disable-zlib
          make
        popd
        ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr   \
                --host=$LFS_TGT \
                --build=$(./config.guess)
    ```

- Compile the package
    ```console
    make FILE_COMPILE=$(pwd)/build/src/file
    ```

- Install the package
    + Install into the root/mount directory of the filesystem
    - Options
        + DESTDIR=$LFS : The DESTDIR make variable is used by almost all packages to define the location where the package should be installed. If it is not set, it defaults to the root (/) directory. Here we specify that the package is installed in $LFS 
    ```console
    make DESTDIR=$LFS install
    ```

- Remove the libtool archive file because it is harmful for cross compilation
    ```console
    rm -v $LFS/usr/lib/libmagic.la
    ```

#### Findutils
- Information
    + File Name: findutils-[version].tar.xz
    + Estimated required disk space: 42MB
    - Description: 
        + More Information: [Section 8.60.2, “Contents of Findutils.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/findutils.html#contents-findutils)
    - Package Contents
        - Programs to find files. 
        - Programs are provided to search through all the files in a directory tree and to create, maintain, and search a database (often faster than the recursive find, but unreliable unless the database has been updated recently). 
        - Findutils also supplies the xargs program, which can be used to run a specified command on each file selected by a search

- Extract tar file
    ```console
    tar -xvf findutils-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd findutils-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr                   \
                --localstatedir=/var/lib/locate \
                --host=$LFS_TGT                 \
                --build=$(build-aux/config.guess)
    ```

- Compile the package
    ```console
    make
    ```

- Install the package
    + Install into the root/mount directory of the filesystem
    - Options
        + DESTDIR=$LFS : The DESTDIR make variable is used by almost all packages to define the location where the package should be installed. If it is not set, it defaults to the root (/) directory. Here we specify that the package is installed in $LFS 
    ```console
    make DESTDIR=$LFS install
    ```

#### Gawk
- Information
    + File Name: gawk-[version].tar.xz
    + Estimated required disk space: 48MB
    - Description: 
        + More Information: [Section 8.59.2, “Contents of Gawk.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/gawk.html#contents-gawk)
    - Package Contents
        + programs for manipulating text files

- Extract tar file
    ```console
    tar -xvf gawk-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd gawk-[version]
    ```

- Ensure that some unneeded files are not installed
    ```console
    sed -i 's/extras//' Makefile.in
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr   \
                --host=$LFS_TGT \
                --build=$(build-aux/config.guess)
    ```

- Compile the package
    ```console
    make
    ```

- Install the package
    + Install into the root/mount directory of the filesystem
    - Options
        + DESTDIR=$LFS : The DESTDIR make variable is used by almost all packages to define the location where the package should be installed. If it is not set, it defaults to the root (/) directory. Here we specify that the package is installed in $LFS 
    ```console
    make DESTDIR=$LFS install
    ```

#### Grep
- Information
    + File Name: grep-[version].tar.xz
    + Estimated required disk space: 27MB
    - Description: 
        + More Information: [Section 8.34.2, “Contents of Grep.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/grep.html#contents-grep)
    - Package Contents
        + programs for searching through the contents of files

- Extract tar file
    ```console
    tar -xvf grep-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd grep-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr   \
                --host=$LFS_TGT \
                --build=$(./build-aux/config.guess)
    ```

- Compile the package
    ```console
    make
    ```

- Install the package
    + Install into the root/mount directory of the filesystem
    - Options
        + DESTDIR=$LFS : The DESTDIR make variable is used by almost all packages to define the location where the package should be installed. If it is not set, it defaults to the root (/) directory. Here we specify that the package is installed in $LFS 
    ```console
    make DESTDIR=$LFS install
    ```

#### Gzip
- Information
    + File Name: gzip-[version].tar.xz
    + Estimated required disk space: 11MB
    - Description: 
        + More Information: [Section 8.63.2, “Contents of Gzip.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/gzip.html#contents-gzip)
    - Package Contents
        + programs for compressing and decompressing files

- Extract tar file
    ```console
    tar -xvf gzip-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd gzip-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr --host=$LFS_TGT
    ```

- Compile the package
    ```console
    make
    ```

- Install the package
    + Install into the root/mount directory of the filesystem
    - Options
        + DESTDIR=$LFS : The DESTDIR make variable is used by almost all packages to define the location where the package should be installed. If it is not set, it defaults to the root (/) directory. Here we specify that the package is installed in $LFS 
    ```console
    make DESTDIR=$LFS install
    ```

#### Make
- Information
    + File Name: make-[version].tar.gz
    + Estimated required disk space: 15MB
    - Description: 
        + More Information: [Section 8.67.2, “Contents of Make.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/make.html#contents-make)
    - Package Contents
        + program for controlling the generation of executables and other non-source files of a package from source files

- Extract tar file
    ```console
    tar -xvzf make-[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd make-[version]
    ```

- Configure and prepare for compilation
    - Options
        + --without-guile : Although we are cross-compiling, configure tries to use guile from the build host if it finds it. This makes compilation fail, so this switch prevents using it.
    ```console
    ./configure --prefix=/usr   \
                --without-guile \
                --host=$LFS_TGT \
                --build=$(build-aux/config.guess)
    ```

- Compile the package
    ```console
    make
    ```

- Install the package
    + Install into the root/mount directory of the filesystem
    - Options
        + DESTDIR=$LFS : The DESTDIR make variable is used by almost all packages to define the location where the package should be installed. If it is not set, it defaults to the root (/) directory. Here we specify that the package is installed in $LFS 
    ```console
    make DESTDIR=$LFS install
    ```

#### Patch
- Information
    + File Name: patch-[version].tar.xz
    + Estimated required disk space: 12MB
    - Description: 
        + More Information: [Section 8.68.2, “Contents of Patch.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/patch.html#contents-patch)
    - Package Contents
        + program for modifying or creating files by applying a “patch” file typically created by the diff program

- Extract tar file
    ```console
    tar -xvf patch-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd patch-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr   \
                --host=$LFS_TGT \
                --build=$(build-aux/config.guess)
    ```

- Compile the package
    ```console
    make
    ```

- Install the package
    + Install into the root/mount directory of the filesystem
    - Options
        + DESTDIR=$LFS : The DESTDIR make variable is used by almost all packages to define the location where the package should be installed. If it is not set, it defaults to the root (/) directory. Here we specify that the package is installed in $LFS 
    ```console
    make DESTDIR=$LFS install
    ```

#### Sed
- Information
    + File Name: sed-[version].tar.xz
    + Estimated required disk space: 21MB
    - Description: 
        + More Information: [Section 8.30.2, “Contents of Sed.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/sed.html#contents-sed)
    - Package Contents
        + Stream Editor (sed)

- Extract tar file
    ```console
    tar -xvf sed-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd sed-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr   \
                --host=$LFS_TGT \
                --build=$(./build-aux/config.guess)
    ```

- Compile the package
    ```console
    make
    ```

- Install the package
    + Install into the root/mount directory of the filesystem
    - Options
        + DESTDIR=$LFS : The DESTDIR make variable is used by almost all packages to define the location where the package should be installed. If it is not set, it defaults to the root (/) directory. Here we specify that the package is installed in $LFS 
    ```console
    make DESTDIR=$LFS install
    ```

#### Tar
- Information
    + File Name: tar-[version].tar.xz
    + Estimated required disk space: 42MB
    - Description: 
        + More Information: [Section 8.69.2, “Contents of Tar.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/tar.html#contents-tar)
    - Package Contents
        + the ability to create tar archives as well as perform various other kinds of archive manipulation. 
        - Tar can be used on previously created archives 
            + to extract files, 
            + to store additional files, or 
            + to update or list files which were already stored.

- Extract tar file
    ```console
    tar -xvf tar-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd tar-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr                     \
                --host=$LFS_TGT                   \
                --build=$(build-aux/config.guess)
    ```

- Compile the package
    ```console
    make
    ```

- Install the package
    + Install into the root/mount directory of the filesystem
    - Options
        + DESTDIR=$LFS : The DESTDIR make variable is used by almost all packages to define the location where the package should be installed. If it is not set, it defaults to the root (/) directory. Here we specify that the package is installed in $LFS 
    ```console
    make DESTDIR=$LFS install
    ```

#### Xz
- Information
    + File Name: xz-[version].tar.xz
    + Estimated required disk space: 22MB
    - Description: 
        + More Information: [Section 8.8.2, “Contents of Xz.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/xz.html#contents-xz)
    - Package Contents
        + programs for compressing and decompressing files. 
        - It provides capabilities for the lzma and the newer xz compression formats. 
            + Compressing text files with xz yields a better compression percentage than with the traditional gzip or bzip2 commands

- Extract tar file
    ```console
    tar -xvf xz-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd xz-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr                     \
                --host=$LFS_TGT                   \
                --build=$(build-aux/config.guess) \
                --disable-static                  \
                --docdir=/usr/share/doc/xz-5.4.4
    ```

- Compile the package
    ```console
    make
    ```

- Install the package
    + Install into the root/mount directory of the filesystem
    - Options
        + DESTDIR=$LFS : The DESTDIR make variable is used by almost all packages to define the location where the package should be installed. If it is not set, it defaults to the root (/) directory. Here we specify that the package is installed in $LFS 
    ```console
    make DESTDIR=$LFS install
    ```

- Remove the libtool archive file because it is harmful for cross compilation
    ```console
    rm -v $LFS/usr/lib/liblzma.la
    ```

#### Binutils - Pass 2
- Information
    + File Name: binutils-[version].tar.xz
    + Estimated required disk space: 523MB
    - Description: 
        + More Information: [Section 8.18.2, “Contents of Binutils.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/binutils.html#contents-binutils)
    - Package Contents
        + Linker
        + Assembler
        - Other tools for handling object files

- Prepare source environment from scratch
    - Notes
        + Do this if you have removed the previous extracted directory

    - Extract tar file
        ```console
        tar -xvf binutils-[version].tar.xz
        ```

- Change directory into binutils
    ```console
    cd binutils-[version]
    ```

- Binutils ships an outdated copy of libtool in the tarball. 
    + It lacks sysroot support, so the produced binaries will be mistakenly linked to libraries from the host distro. 
    - To work around this issue
        ```console
        sed '6009s/$add_dir//' -i ltmain.sh
        ```

- Create a separate 'build' directory
    ```console
    mkdir -pv build-pass-2
    ```

- Change directory into 'build'
    ```console
    cd build-pass-2
    ```

- Configure and prepare for compilation
    - New Options
        + --enable-shared : Builds libbfd as a shared library.
        + --enable-64-bit-bfd : Enables 64-bit support (on hosts with smaller word sizes). This may not be needed on 64-bit systems, but it does no harm.
    ```console
    ../configure                   \
        --prefix=/usr              \
        --build=$(../config.guess) \
        --host=$LFS_TGT            \
        --disable-nls              \
        --enable-shared            \
        --enable-gprofng=no        \
        --disable-werror           \
        --enable-64-bit-bfd
    ```

- Compile the package
    ```console
    make
    ```

- Install the package
    + Install into the root/mount directory of the filesystem
    - Options
        + DESTDIR=$LFS : The DESTDIR make variable is used by almost all packages to define the location where the package should be installed. If it is not set, it defaults to the root (/) directory. Here we specify that the package is installed in $LFS 
    ```console
    make DESTDIR=$LFS install
    ```

- Remove the libtool archive files because they are harmful for cross compilation, and remove unnecessary static libraries
    ```console
    rm -v $LFS/usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes,sframe}.{a,la}
    ```

#### GCC - Pass 2
- Information
    + File Name: gcc-[version].tar.xz
    + Estimated required disk space: 4.8GB
    - Description: 
        + More Information: [Section 8.27.2, “Contents of GCC.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/gcc.html#contents-gcc)
    - Package Contents
        - GNU compiler collection
            - i.e.
                + C/C++ compilers (gcc, g++ etc)

- Prepare source environment from scratch
    - Notes
        + Do this if you have removed the previous extracted directory

    - Extract GCC tar files
        ```console
        tar -xvf gcc-[version].tar.xz
        ```

    - Extract dependency tar files
        - mpfr
            ```console
            tar -xvf mpfr-[version].tar.xz
            ```
        - gmp
            ```console
            tar -xvf gmp-[version].tar.xz
            ```
        - mpc
            ```console
            tar -xvzf mpc-[version].tar.gz
            ```

    - Change directory into gcc
        ```console
        cd gcc-[version]
        ```

    - Move the dependency source directories to the gcc source directory
        - mpfr
            ```console
            mv -v ../mpfr-[version] mpfr
            ```
        - gmp
            ```console
            mv -v ../gmp-[version] gmp
            ```
        - mpc
            ```console
            mv -v ../mpc-[version] mpc
            ```

    - On x86_64 hosts, set the default directory name for 64-bit libraries to “lib”:
        ```console
        case $(uname -m) in
          x86_64)
            sed -e '/m64=/s/lib64/lib/' -i.orig gcc/config/i386/t-linux64
            ;;
        esac
        ```

- From an existing source directory
    - Change directory into gcc
        ```console
        cd gcc-[version]
        ```

- Override the building rule of libgcc and libstdc++ headers, 
    + to allow building these libraries with POSIX threads support
    ```console
    sed '/thread_header =/s/@.*@/gthr-posix.h/' -i libgcc/Makefile.in libstdc++-v3/include/Makefile.in
    ```

- Create directory 'build'
    ```console
    mkdir -pv build-pass-2
    ```

- Change directory into 'build'
    ```console
    cd build-pass-2
    ```

- Configure and prepare for compilation
    - Pre-Requisites
        + remember to unset any environment variables that override the default optimization flags

    - Explanations
        - New Parameters
            + --with-build-sysroot=$LFS : Normally, using --host ensures that a cross-compiler is used for building GCC, and that compiler knows that it has to look for headers and libraries in $LFS. But the build system for GCC uses other tools, which are not aware of this location. This switch is needed so those tools will find the needed files in $LFS, and not on the host.
            + --target=$LFS_TGT : We are cross-compiling GCC, so it's impossible to build target libraries (libgcc and libstdc++) with the previously compiled GCC binaries—those binaries won't run on the host. The GCC build system will attempt to use the host's C and C++ compilers as a workaround by default. Building the GCC target libraries with a different version of GCC is not supported, so using the host's compilers may cause the build to fail. This parameter ensures the libraries are built by GCC pass 1.
            + LDFLAGS_FOR_TARGET=... : Allow libstdc++ to use the shared libgcc being built in this pass, instead of the static version that was built in GCC pass 1. This is necessary to support C++ exception handling.
            + --disable-libsanitizer : Disable GCC sanitizer runtime libraries. They are not needed for the temporary installation. This switch is necessary to build GCC without libcrypt installed for the target. In gcc-pass1 it was implied by --disable-libstdcxx, but now we have to explicitly pass it.
    ```console
    ../configure                                       \
        --build=$(../config.guess)                     \
        --host=$LFS_TGT                                \
        --target=$LFS_TGT                              \
        LDFLAGS_FOR_TARGET=-L$PWD/$LFS_TGT/libgcc      \
        --prefix=/usr                                  \
        --with-build-sysroot=$LFS                      \
        --enable-default-pie                           \
        --enable-default-ssp                           \
        --disable-nls                                  \
        --disable-multilib                             \
        --disable-libatomic                            \
        --disable-libgomp                              \
        --disable-libquadmath                          \
        --disable-libsanitizer                         \
        --disable-libssp                               \
        --disable-libvtv                               \
        --enable-languages=c,c++
    ```

- Compile the package
    ```console
    make
    ```

- Install the package
    + Install into the root/mount directory of the filesystem
    - Options
        + DESTDIR=$LFS : The DESTDIR make variable is used by almost all packages to define the location where the package should be installed. If it is not set, it defaults to the root (/) directory. Here we specify that the package is installed in $LFS 
    ```console
    make DESTDIR=$LFS install
    ```

- Create a utility symbolic link as a finishing touch
    - Many programs and scripts run cc instead of gcc, 
        + which is used to keep programs generic and therefore usable on all kinds of UNIX systems where the GNU C compiler is not always installed. 
        + Running cc leaves the system administrator free to decide which C compiler to install
    ```console
    ln -sv gcc $LFS/usr/bin/cc
    ```

## Entering Chroot and Building Additional Temporary Tools
### Table of Contents 
- [7.1. Introduction and Explanation](#introduction)
- [Setup](#setup)
- [7.2. Changing Ownership](#changing-ownership)
- [7.3. Preparing Virtual Kernel File Systems](#preparing-virtual-kernel-file-systems)
- [7.4. Entering the chroot environment](#entering-the-chroot-environment)
- [7.5. Creating Directories](#creating-directories)
- [7.6. Creating Essential Files and Symlinks](#creating-essential-files-and-symlinks)
- Tools
    - [7.7. Gettext](#gettext)
    - [7.8. Bison](#bison)
    - [7.9. Perl](#perl)
    - [7.10. Python](#python)
    - [7.11. Texinfo](#texinfo)
    - [7.12. Util-linux](#util-linux)
- [7.13. Cleaning up and Saving the Temporary System](#cleaning-up-and-saving-the-temporary-system)

### Introduction
- Explanation
    - This chapter shows how to build the last missing bits of the temporary system: the tools needed to build the various packages. 
        - Now that all circular dependencies have been resolved, 
            + a “chroot” environment, completely isolated from the host operating system (except for the running kernel), can be used for the build.

    - For proper operation of the isolated environment, 
        + some communication with the running kernel must be established. 
        - This is done via the so-called Virtual Kernel File Systems, 
            + which will be mounted before entering the chroot environment. 
            + You may want to verify that they are mounted by issuing the findmnt command.

- Until Section 7.4, “Entering the Chroot Environment”, 
    + the commands must be run as root, with the LFS variable set. 
    - After entering chroot, all commands are run as root, fortunately without access to the OS of the computer you built LFS on. 
        + Be careful anyway, as it is easy to destroy the whole LFS system with bad commands.

### Setup
#### Pre-Requisites
- Validate/Verify
    - Environment Variables
        + LFS
        + LFS_TGT
        + MAKEFLAGS='-jN' : You can set your default make flag to use N cores/processes simultaneously

    - If the above Environment Variables are not set, source the .bashrc file
        ```console
        source ~/.bashrc
        ```

### Changing Ownership
- Change the ownership of the '$LFS/*' directories to user 'root'
    - Explanation
        - Currently, the whole directory hierarchy in $LFS is owned by the user lfs, 
            + a user that exists only on the host system. 
        - If the directories and files under $LFS are kept as they are, 
            + they will be owned by a user ID without a corresponding account. 
        - This is dangerous because a user account created later could get this same user ID and would own all the files under $LFS, 
            + thus exposing these files to possible malicious manipulation.
    ```console
    chown -R root:root $LFS/{usr,lib,var,etc,bin,sbin,tools}
    case $(uname -m) in
      x86_64) chown -R root:root $LFS/lib64 ;;
    esac
    ```

### Preparing Virtual Kernel File Systems
- Create the virtual filesystem mount points/directories
    ```console
    mkdir -pv $LFS/{dev,proc,sys,run}
    ```

- Mounting and populating the device ('/dev') directory
    ```console
    mount -v --bind /dev $LFS/dev
    ```

- Mounting remaining Virtual (Kernel) File Systems
    ```console
    mount -v --bind /dev/pts $LFS/dev/pts
    mount -vt proc proc $LFS/proc
    mount -vt sysfs sysfs $LFS/sys
    mount -vt tmpfs tmpfs $LFS/run
    ```

- Mount temporary filesystem (tmpfs)
    - Explanation
        - In some host systems, /dev/shm is a symbolic link to /run/shm. 
            + The /run tmpfs was mounted above so in this case only a directory needs to be created.
        - In other host systems /dev/shm is a mount point for a tmpfs. 
            - In that case the mount of /dev above will only create /dev/shm as a directory in the chroot environment. 
                + In this situation we must explicitly mount a tmpfs
    ```console
    if [ -h $LFS/dev/shm ]; then
        mkdir -pv $LFS/$(readlink $LFS/dev/shm)
    else
        mount -t tmpfs -o nosuid,nodev tmpfs $LFS/dev/shm
    fi
    ```

### Entering the chroot environment
- Chroot into the incomplete environment
    + To finish installing the temporary tools.
    + This environment will also be used to install the final system.
    - Parameters
        + The -i option given to the env command will clear all the variables in the chroot environment. 
        + After that, only the HOME, TERM, PS1, and PATH variables are set again. 
        - The TERM=$TERM construct sets the TERM variable inside chroot to the same value as outside chroot. 
            + This variable is needed so programs like vim and less can operate properly. 
        + If other variables are desired, such as CFLAGS or CXXFLAGS, this is a good place to set them.
    ```console
    chroot "$LFS" /usr/bin/env -i   \
        HOME=/root                  \
        TERM="$TERM"                \
        PS1='(lfs chroot) \u:\w\$ ' \
        PATH=/usr/bin:/usr/sbin     \
        /bin/bash --login
    ```

- Notes
    - From this point on, 
        - there is no need to use the LFS variable any more because all work will be restricted to the LFS file system; 
            + the chroot command runs the Bash shell with the root (/) directory set to $LFS.

    - Notice that /tools/bin is not in the PATH. 
        + This means that the cross toolchain will no longer be used.

    - Note that the bash prompt will say 'I have no name!'
        + This is normal because the /etc/passwd file has not been created yet.

    - It is important that all the commands throughout the remainder of this chapter and the following chapters are run from within the chroot environment
        - If you leave this environment for any reason (rebooting for example), 
            - ensure that the virtual kernel filesystems are mounted as explained in 
                + [Section 7.3.1, “Mounting and Populating /dev”](#preparing-virtual-kernel-file-systems) and 
                + [Section 7.3.2, “Mounting Virtual Kernel File Systems”](#preparing-virtual-kernel-file-systems) and enter 
                + chroot again before continuing with the installation.

### Creating Directories
- Create some root-level directories 
    + that are not in the limited set required in the previous chapters
    ```console
    mkdir -pv /{boot,home,mnt,opt,srv}
    ```

- Create the required set of subdirectories below the root-level
    - Explanation
        - Directories are, by default, created with permission mode 755, but this is not desirable everywhere. 
            - In the commands, 
                - two changes are made
                    + one to the home directory of user root, and 
                    + another to the directories for temporary files.

        - The first mode change ensures that not just anybody can enter the /root directory
            + just like a normal user would do with his or her own home directory. 

        - The second mode change makes sure that any user can write to the /tmp and /var/tmp directories, 
            + but cannot remove another user's files from them. 

        + The latter is prohibited by the so-called “sticky bit,” the highest bit (1) in the 1777 bit mask.
    ```console
    mkdir -pv /etc/{opt,sysconfig}
    mkdir -pv /lib/firmware
    mkdir -pv /media/{floppy,cdrom}
    mkdir -pv /usr/{,local/}{include,src}
    mkdir -pv /usr/local/{bin,lib,sbin}
    mkdir -pv /usr/{,local/}share/{color,dict,doc,info,locale,man}
    mkdir -pv /usr/{,local/}share/{misc,terminfo,zoneinfo}
    mkdir -pv /usr/{,local/}share/man/man{1..8}
    mkdir -pv /var/{cache,local,log,mail,opt,spool}
    mkdir -pv /var/lib/{color,misc,locate}

    ln -sfv /run /var/run
    ln -sfv /run/lock /var/lock

    install -dv -m 0750 /root
    install -dv -m 1777 /tmp /var/tmp
    ```

- Notes
    - 7.5.1. FHS Compliance note
        - This directory tree is based on the Filesystem Hierarchy Standard (FHS) (available at https://refspecs.linuxfoundation.org/fhs.shtml). 
            + The FHS also specifies the optional existence of additional directories such as '/usr/local/games' and '/usr/share/games'. 
            - In LFS, we create only the directories that are really necessary. 
                + However, feel free to create more directories, if you wish
        - Warning
            - The FHS does not mandate the existence of the directory '/usr/lib64', and the LFS editors have decided not to use it. 
                - For the instructions in LFS and BLFS to work correctly, 
                    + it is imperative that this directory be non-existent. 
                    - From time to time you should verify that it does not exist, 
                        + because it is easy to create it inadvertently, and this will probably break your system.

### Creating Essential Files and Symlinks
- Create a symbolic link of '/etc/mtab' to '/proc/self/mounts'
    - Explanation
        + Historically, Linux maintained a list of the mounted file systems in the file /etc/mtab (Mount tab). 
        - Modern kernels maintain this list internally and expose it to the user via the /proc filesystem. 
            + To satisfy utilities that expect to find /etc/mtab
    ```console
    ln -sv /proc/self/mounts /etc/mtab
    ```

- Create a basic '/etc/hosts' network hostname file
    ```console
    cat > /etc/hosts << EOF
    127.0.0.1  localhost $(hostname)
    ::1        localhost
    EOF
    ```

- Create User Authenticartion and Authorization files
    - Explanation
        - In order for user root to be able to login and for the name “root” to be recognized, 
            + there must be relevant entries in the /etc/passwd and /etc/group files

    - Create 'etc/passwd' file
        + The actual password for root will be set later.
        ```console
        cat > /etc/passwd << "EOF"
        root:x:0:0:root:/root:/bin/bash
        bin:x:1:1:bin:/dev/null:/usr/bin/false
        daemon:x:6:6:Daemon User:/dev/null:/usr/bin/false
        messagebus:x:18:18:D-Bus Message Daemon User:/run/dbus:/usr/bin/false
        uuidd:x:80:80:UUID Generation Daemon User:/dev/null:/usr/bin/false
        nobody:x:65534:65534:Unprivileged User:/dev/null:/usr/bin/false
        EOF
        ```
    - Create the 'etc/group' file
        ```console
        cat > /etc/group << "EOF"
        root:x:0:
        bin:x:1:daemon
        sys:x:2:
        kmem:x:3:
        tape:x:4:
        tty:x:5:
        daemon:x:6:
        floppy:x:7:
        disk:x:8:
        lp:x:9:
        dialout:x:10:
        audio:x:11:
        video:x:12:
        utmp:x:13:
        usb:x:14:
        cdrom:x:15:
        adm:x:16:
        messagebus:x:18:
        input:x:24:
        mail:x:34:
        kvm:x:61:
        uuidd:x:80:
        wheel:x:97:
        users:x:999:
        nogroup:x:65534:
        EOF
        ```

- Add a test user
    - This user will be deleted at the end of Chapter 8
        ```console
        echo "tester:x:101:101::/home/tester:/bin/bash" >> /etc/passwd
        echo "tester:x:101:" >> /etc/group
        install -o tester -d /home/tester
        ```

- Start a new shell
    - Explanation
        + To remove the "I have no name!" prompt
        + Since the /etc/passwd and /etc/group files have been created, user name and group name resolution will now work
    ```console 
    exec /usr/bin/bash --login
    ```

- Initialize the log files and give them proper permissions
    - Explanation
        - The login, agetty, and init programs (and others) use a number of log files to record information such as who was logged into the system and when. 
            + However, these programs will not write to the log files if they do not already exist
    - Files
        - The /var/log/wtmp file records all logins and logouts. 
        - The /var/log/lastlog file records when each user last logged in. 
        - The /var/log/faillog file records failed login attempts. 
        - The /var/log/btmp file records the bad login attempts.
        - The /run/utmp file records the users that are currently logged in. 
            + This file is created dynamically in the boot scripts.
    ```console
    touch /var/log/{btmp,lastlog,faillog,wtmp}
    chgrp -v utmp /var/log/lastlog
    chmod -v 664  /var/log/lastlog
    chmod -v 600  /var/log/btmp
    ```

### Tools
#### Gettext
- Information
    + File Name: gettext-[version].tar.xz
    + Estimated required disk space: 306MB
    - Description: 
        + More Information: [Section 8.32.2, “Contents of Gettext.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/gettext.html#contents-gettext)
    - Package Contents
         - utilities for internationalization and localization. 
            - These allow programs to be compiled with NLS (Native Language Support), 
                + enabling them to output messages in the user's native language.

- Extract tar file
    ```console
    tar -xvf gettext-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd gettext-[version]
    ```

- Configure and prepare for compilation
    - Options
        + --disable-shared : We do not need to install any of the shared Gettext libraries at this time, therefore there is no need to build them.
    ```console
    ./configure --disable-shared
    ```

- Compile the package
    ```console
    make
    ```

- Install the package
    - For our temporary set of tools, 
        - we only need to install three programs from Gettext.
            + msgfmt
            + msgmerge
            + xgettext
    ```console
    cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin
    ```

#### Bison
- Information
    + File Name: bison-[version].tar.xz
    + Estimated required disk space: 57MB
    - Description: 
        + More Information: [Section 8.33.2, “Contents of Bison.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/bison.html#contents-bison)
    - Package Contents
         - parser generator

- Extract tar file
    ```console
    tar -xvf bison-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd bison-[version]
    ```

- Configure and prepare for compilation
    - Options
        - --docdir=/usr/share/doc/bison-[version] : This tells the build system to install bison documentation into a versioned directory.
            - version : Specify the version of bison you are using/compiling for
    ```console
    ./configure --prefix=/usr \
                --docdir=/usr/share/doc/bison-3.8.2
    ```

- Compile the package
    ```console
    make
    ```

- Install the package
    ```console
    make install
    ```

#### Perl
- Information
    + File Name: perl-[version].tar.xz
    + Estimated required disk space: 280MB
    - Description: 
        + More Information: [Section 8.42.2, “Contents of Perl.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/perl.html#contents-perl)
    - Package Contents
         - the Practical Extraction and Report Language (Perl)

- Extract tar file
    ```console
    tar -xvf perl-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd perl-[version]
    ```

- Configure and prepare for compilation
    - Options
        - des : This is a combination of three options: 
            + -d uses defaults for all items; 
            + -e ensures completion of all tasks; 
            + -s silences non-essential output.
    ```console
    sh Configure -des                                        \
                 -Dprefix=/usr                               \
                 -Dvendorprefix=/usr                         \
                 -Duseshrplib                                \
                 -Dprivlib=/usr/lib/perl5/5.38/core_perl     \
                 -Darchlib=/usr/lib/perl5/5.38/core_perl     \
                 -Dsitelib=/usr/lib/perl5/5.38/site_perl     \
                 -Dsitearch=/usr/lib/perl5/5.38/site_perl    \
                 -Dvendorlib=/usr/lib/perl5/5.38/vendor_perl \
                 -Dvendorarch=/usr/lib/perl5/5.38/vendor_perl
    ```

- Compile the package
    ```console
    make
    ```

- Install the package
    ```console
    make install
    ```

#### Python
- Information
    + File Name: Python-[version].tar.xz
    + Estimated required disk space: 533MB
    - Description: 
        + More Information: [Section 8.51.2, “Contents of Python 3.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/Python.html#contents-python)
    - Package Contents
         - the Python development environment. 
            + It is useful for object-oriented programming, writing scripts, prototyping large programs, and developing entire applications. 
            + Python is an interpreted computer language

- Extract tar file
    ```console
    tar -xvf Python-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd Python-[version]
    ```

- Configure and prepare for compilation
    - Options
        + --enable-shared : This switch prevents installation of static libraries.
        + --without-ensurepip : This switch disables the Python package installer, which is not needed at this stage.
    ```console
    ./configure --prefix=/usr   \
                --enable-shared \
                --without-ensurepip
    ```

- Compile the package
    - Notes
            + Some Python 3 modules can't be built now because the dependencies are not installed yet. 
            - The building system still attempts to build them however, 
                - so the compilation of some files will fail and the compiler message may seem to indicate “fatal error”. 
                    + The message should be ignored. 
                    + Just make sure the toplevel make command has not failed. 
                + The optional modules are not needed now and they will be built in [Chapter 8](#installing-basic-system-software).
    ```console
    make
    ```

- Install the package
    ```console
    make install
    ```

#### Texinfo
- Information
    + File Name: texinfo-[version].tar.xz
    + Estimated required disk space: 116MB
    - Description: 
        + More Information: [Section 8.70.2, “Contents of Texinfo.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/texinfo.html#contents-texinfo)
    - Package Contents
         - programs for reading, writing, and converting info pages

- Extract tar file
    ```console
    tar -xvf texinfo-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd texinfo-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr
    ```

- Compile the package
    ```console
    make
    ```

- Install the package
    ```console
    make install
    ```

#### Util-linux
- Information
    + File Name: util-linux-[version].tar.xz
    + Estimated required disk space: 169MB
    - Description: 
        + More Information: [Section 8.77.2, “Contents of Util-linux.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/util-linux.html#contents-utillinux)
    - Package Contents
         - miscellaneous utility programs

- Extract tar file
    ```console
    tar -xvf util-linux-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd util-linux-[version]
    ```

- Create the hwclock directory
    - Explanation 
        - The FHS recommends using the /var/lib/hwclock directory 
            + instead of the usual /etc directory as the location for the adjtime file. 
    ```console
    mkdir -pv /var/lib/hwclock
    ```

- Configure and prepare for compilation
    - Options
        + ADJTIME_PATH=/var/lib/hwclock/adjtime : This sets the location of the file recording information about the hardware clock in accordance to the FHS. This is not strictly needed for this temporary tool, but it prevents creating a file at another location, which would not be overwritten or removed when building the final util-linux package.
        + --libdir=/usr/lib : This switch ensures the .so symlinks targeting the shared library file in the same directory (/usr/lib) directly.
        + --disable-* : These switches prevent warnings about building components that require packages not in LFS or not installed yet.
        + --without-python : This switch disables using Python. It avoids trying to build unneeded bindings.
        + runstatedir=/run : This switch sets the location of the socket used by uuidd and libuuid correctly.
    ```console
    ./configure ADJTIME_PATH=/var/lib/hwclock/adjtime    \
                --libdir=/usr/lib    \
                --runstatedir=/run   \
                --docdir=/usr/share/doc/util-linux-2.39.1 \
                --disable-chfn-chsh  \
                --disable-login      \
                --disable-nologin    \
                --disable-su         \
                --disable-setpriv    \
                --disable-runuser    \
                --disable-pylibmount \
                --disable-static     \
                --without-python
    ```

- Compile the package
    ```console
    make
    ```

- Install the package
    ```console
    make install
    ```

### Cleaning up and Saving the Temporary System
#### Cleaning
- Remove the currently installed documentation files 
    + To prevent them from ending up in their final system
    ```console
    rm -rf /usr/share/{info,man,doc}/*
    ```
- Remove *.la files from /usr/lib and /usr/libexec
    - Explanation
        + on a modern Linux system, the libtool .la files are only useful for libltdl. 
        - No libraries in LFS are loaded by libltdl, 
            + and it's known that some .la files can cause BLFS package failures. 
    ```console
    find /usr/{lib,libexec} -name \*.la -delete
    ```
- Remove the '/tools' directory
    - Explanation
        - The current system size is now about 3 GB, however the /tools directory is no longer needed.
            + The current system size uses about 1GB of disks space
    ```console
    rm -rf /tools
    ```

#### Backup
- Information
    - At this point the essential programs and libraries have been created and your current LFS system is in a good state. 
        + Your system can now be backed up for later reuse. 
        - In case of fatal failures in the subsequent chapters, 
            + it often turns out that removing everything and starting over (more carefully) is the best way to recover. 
            + Unfortunately, all the temporary files will be removed, too. 
        - To avoid spending extra time to redo something which has been done successfully, 
            + creating a backup of the current LFS system may prove useful.
    - All the remaining steps in this section are optional. 
        - Nevertheless, as soon as you begin installing packages in Chapter 8, the temporary files will be overwritten. 
            + So it may be a good idea to do a backup of the current system as described below.
    + For a more detailed information on backup and restore, please refer to [Tips and Tricks - To backup and restore linux tarballs](#tips-and-tricks)

- Pre-Requisites
    - Notes
        - The following steps are performed from outside the chroot environment. 
            + That means you have to leave the chroot environment first before continuing. 
            - The reason for that is to get access to file system locations outside of the chroot environment 
                + to store/read the backup archive, which ought not be placed within the $LFS hierarchy.

    - Leave the chroot environment
        ```console
        exit
        ```
    - Change user to user 'lfs'
        ```console
        su - lfs
        ```

    - Set environment variables
        - LFS : Set this as your LFS mount point
            ```console
            export LFS=[mount-point]
            ```

    - Validate/Verify pre-requisites
        - Environment Variables
            + LFS
            + LFS_TGT

        - If the above Environment Variables are not set, source the .bashrc file
            ```console
            source ~/.bashrc
            ```

        - Check if root has LFS
            ```console
            sudo echo $LFS
            ```

- (Optional) Making a backup
    - Before proceeding, please validate the following
        - Explanation
            - All of the following instructions are executed by root on your host system. 
                - Take extra care about the commands you're going to run as mistakes made here can modify your host system. 
                    + Be aware that the environment variable LFS is set for user lfs by default but may not be set for root.
            - Whenever commands are to be executed by root, make sure you have set LFS.
                + This has been discussed in Section 2.6, “Setting The $LFS Variable”.
            - Refer to [Suspending and Resuming session](#suspending-and-resuming-session) for more information

        - Unmount the virutal filesystems
            - The following steps can be found [Tips and Tricks](#tips-and-tricks) under 'Backup and Restore'
                ```console
                mountpoint -q $LFS/dev/shm && umount $LFS/dev/shm
                umount $LFS/dev/pts
                umount $LFS/{sys,proc,run,dev}
                ```
            - Change into your archive directory
                ```console
                cd /path/to/archive
                ```
            - Create the backup archive
                ```console
                cd $LFS
                tar -cJpf $HOME/lfs-temp-tools-[lfs-book-version].tar.xz .
                ```

- (Optional) Restore
    - Change directory to $LFS
        ```console
        cd $LFS
        ```
    - Remove all contents within $LFS
        ```console
        rm -rf *
        ```
    - Extract and Restore the archive in the LFS root mount point
        ```console
        tar -xpf $HOME/lfs-temp-tools-[lfs-book-version].tar.xz
        ```

## Building the LFS System
### Table of Contents 
- [Setup](#setup)
- [8.1. Installing Basic System Software](#installing-basic-system-software)
    - [8.2. Package Management](#package-management)
    - [Packages](#packages)
        - [8.3. Man-pages](#man-pages)
        - [8.4. Iana-Etc](#iana-etc)

### Setup
- Validate/Verify pre-requisites
    - Environment Variables
        + LFS
        + LFS_TGT
        + MAKEFLAGS='-jN' : You can set your default make flag to use N cores/processes simultaneously

    - If the above Environment Variables are not set, source the .bashrc file
        ```console
        source ~/.bashrc
        ```

## Installing Basic System Software
### Package Management

### Packages
#### Man-pages
- Information
    + File Name: man-pages-[version].tar.xz
    + Estimated required disk space: 33MB
    - Description: 
    - Package Contents
         - over 2,400 man pages
             - Describe C programming language functions, important device files, and significant configuration files

- Extract tar file
    ```console
    tar -xvf man-pages-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd man-pages-[version]
    ```

- Remove two man pages for password hashing functions. 
    + Libxcrypt will provide a better version of these man pages:
    ```console
    rm -v man3/crypt*
    ```

- Install the package
    ```console
    make prefix=/usr install
    ```

#### Iana-Etc
- Information
    + File Name: iana-etc-[version].tar.gz
    + Estimated required disk space: 4.8MB
    - Description: 
    - Package Contents
         - provides data for network services and protocols
             - /etc/protocols : Describes the various DARPA Internet protocols that are available from the TCP/IP subsystem 
             - /etc/services  : Provides a mapping between friendly textual names for internet services, and their underlying assigned port numbers and protocol types

- Extract tar file
    ```console
    tar -xvzf iana-etc-[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd iana-etc-[version]
    ```

- Copy the files into the '/etc' folder
    ```console 
    cp services protocols /etc
    ```

#### Glibc - Pass 2
- Information
    + File Name: glibc-[version].tar.xz
    + Estimated required disk space: 3.0BB
    - Description: 
    - Package Contents
        - main C library
            - This library provides the basic routines for 
                + allocating memory, 
                + searching directories, 
                + opening and closing files, 
                + reading and writing files, 
                + string handling, 
                + pattern matching, 
                + arithmetic, and 
                + so on.
    - Installed
        + Programs    : gencat, getconf, getent, iconv, iconvconfig, ldconfig, ldd, lddlibc4, ld.so (symlink to ld-linux-x86-64.so.2 or ld-linux.so.2), locale, localedef, makedb, mtrace, nscd, pcprofiledump, pldd, sln, sotruss, sprof, tzselect, xtrace, zdump, and zic
        + Libraries   : ld-linux-x86-64.so.2, ld-linux.so.2, libBrokenLocale.{a,so}, libanl.{a,so}, libc.{a,so}, libc_nonshared.a, libc_malloc_debug.so, libdl.{a,so.2}, libg.a, libm.{a,so}, libmcheck.a, libmemusage.so, libmvec.{a,so}, libnsl.so.1, libnss_compat.so, libnss_dns.so, libnss_files.so, libnss_hesiod.so, libpcprofile.so, libpthread.{a,so.0}, libresolv.{a,so}, librt.{a,so.1}, libthread_db.so, and libutil.{a,so.1}
        + Directories : /usr/include/arpa, /usr/include/bits, /usr/include/gnu, /usr/include/net, /usr/include/netash, /usr/include/netatalk, /usr/include/netax25, /usr/include/neteconet, /usr/include/netinet, /usr/include/netipx, /usr/include/netiucv, /usr/include/netpacke
    - Short Descriptions
        + gencat        : Generates message catalogues
        + getconf       : Displays the system configuration values for file system specific variables
        + getent        : Gets entries from an administrative database
        + iconv         : Performs character set conversion
        + iconvconfig   : Creates fastloading iconv module configuration files
        + ldconfig      : Configures the dynamic linker runtime bindings
        + ldd           : Reports which shared libraries are required by each given program or shared library
        + lddlibc4      : Assists ldd with object files. It does not exist on newer architectures like x86_64
        + locale        : Prints various information about the current locale
        + localedef     : Compiles locale specifications
        + makedb        : Creates a simple database from textual input
        + mtrace        : Reads and interprets a memory trace file and displays a summary in human-readable format
        + nscd          : A daemon that provides a cache for the most common name service requests
        + pcprofiledump : Dump information generated by PC profiling
        + pldd          : Lists dynamic shared objects used by running processes
        + sln           : A statically linked ln program
        + sotruss       : Traces shared library procedure calls of a specified command
        + sprof : Reads and displays shared object profiling data
        + tzselect : Asks the user about the location of the system and reports the corresponding time zone description
        + xtrace : Traces the execution of a program by printing the currently executed function
        + zdump : The time zone dumper
        + zic : The time zone compiler
        + ld-*.so : The helper program for shared library executables
        + libBrokenLocale : Used internally by Glibc as a gross hack to get broken programs (e.g., some Motif applications) running. See comments in glibc-2.38/locale/broken_cur_max.c for more information
        + libanl : Dummy library containing no functions. Previously was the asynchronous name lookup library, whose functions are now in libc
        + libc : The main C library
        + libc_malloc_debug : Turns on memory allocation checking when preloaded
        + libdl : Dummy library containing no functions. Previously was the dynamic linking interface library, whose functions are now in libc
        + libg : Dummy library containing no functions. Previously was a runtime library for g++
        + libm : The mathematical library
        + libmvec : The vector math library, linked in as needed when libm is used
        + libmcheck : Turns on memory allocation checking when linked to
        + libmemusage : Used by memusage to help collect information about the memory usage of a program
        + libnsl : The network services library, now deprecated
        + libnss_* : The Name Service Switch modules, containing functions for resolving host names, user names, group names, aliases, services, protocols, etc. Loaded by libc according to the configuration in /etc/nsswitch.conf
        + libpcprofile : Can be preloaded to PC profile an executable
        + libpthread : Dummy library containing no functions. Previously contained functions providing most of the interfaces specified by the POSIX.1c Threads Extensions and the semaphore interfaces specified by the POSIX.1b Real-time Extensions, now the functions are in libc
        + libresolv : Contains functions for creating, sending, and interpreting packets to the Internet domain name servers
        + librt : Contains functions providing most of the interfaces specified by the POSIX.1b Real-time Extensions
        + libthread_db : Contains functions useful for building debuggers for multi-threaded programs
        + libutil : Dummy library containing no functions. Previously contained code for “standard” functions used in many different Unix utilities. These functions are now in libc

- Prepare source environment from scratch
    - Notes
        + Do this if you have removed the previous extracted directory
    - Extract tar file
        ```console
        tar -xvf glibc-[version].tar.xz
        ```

    - Change directory into source file
        ```console
        cd glibc-[version]
        ```

    - Create a symbolic link for LSB compliance
        - Additionally, 
            + for x86_64, create a compatibility symbolic link required for proper operation of the dynamic library loader
        ```console
        case $(uname -m) in
            i?86)   ln -sfv ld-linux.so.2 $LFS/lib/ld-lsb.so.3
            ;;
            x86_64) ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64
                    ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64/ld-lsb-x86-64.so.3
            ;;
        esac
        ```

    - Some of the Glibc programs use the non-FHS-compliant /var/db directory to store their runtime data. 
        - Apply the following patch to make such programs store their runtime data in the FHS-compliant locations
            + glibc-[version]-fhs-1.patch
        ```console
        patch -Np1 -i ../glibc-[version]-fhs-1.patch
        ```

- fix a regression causing the posix_memalign() function to be very slow in some conditions
    ```console
    patch -Np1 -i ../glibc-2.38-memalign_fix-1.patch
    ```

- Create directory 'build'
    ```console
    mkdir -pv build
    ```

- Change directory into 'build'
    ```console
    cd build
    ```

- Ensure that the 'ldconfig' and 'sln' utilities are installed into '/usr/sbin'
    + as part of the installation configuration parameters
    ```console
    echo "rootsbindir=/usr/sbin" > configparms
    ```

- Configure and prepare for compilation
    - Options
        + --disable-werror : This option disables the -Werror option passed to GCC. This is necessary for running the test suite.
        + --enable-kernel=4.14 : This option tells the build system that this Glibc may be used with kernels as old as 4.14. This means generating workarounds in case a system call introduced in a later version cannot be used.
        + --enable-stack-protector=strong : This option increases system security by adding extra code to check for buffer overflows, such as stack smashing attacks.
        + --with-headers=/usr/include : This option tells the build system where to find the kernel API headers.
        + libc_cv_slibdir=/usr/lib : This variable sets the correct library for all systems. We do not want lib64 to be used
    ```console
    ../configure --prefix=/usr                            \
                 --disable-werror                         \
                 --enable-kernel=4.14                     \
                 --enable-stack-protector=strong          \
                 --with-headers=/usr/include              \
                 libc_cv_slibdir=/usr/lib
    ```

- Compile the package
    ```console
    make
    ```

- Check package compilation
    - Notes 
        + In this section, the test suite for Glibc is considered critical. Do not skip it under any circumstance.
        - Generally a few tests do not pass. The test failures listed below are usually safe to ignore.
            - You may see some test failures. 
                + The Glibc test suite is somewhat dependent on the host system. 
                + A few failures out of over 5000 tests can generally be ignored. 
                - This is a list of the most common issues seen for recent versions of LFS:
                    + io/tst-lchmod is known to fail in the LFS chroot environment.
                    + The stdlib/tst-arc4random-thread test is known to fail if the host kernel is relatively old.
                    + Some tests, for example nss/tst-nss-files-hosts-multi, are known to fail on relatively slow systems due to an internal timeout.
                    + Additionally, some tests may fail with a relatively old CPU model or host kernel version.
    ```console
    make check
    ```

- Though it is a harmless message, the install stage of Glibc will complain about the absence of /etc/ld.so.conf. 
    + Prevent this warning by creating it:
    ```console
    touch /etc/ld.so.conf
    ```

- Fix the Makefile to skip an outdated sanity check that fails with a modern Glibc configuration:
    ```console
    sed '/test-installation/s@$(PERL)@echo not running@' -i ../Makefile
    ```

- Install the package
    ```console
    make install
    ```

- Fix a hard-coded path to the executable loader in the ldd script
    ```console
    sed '/RTLDLIST=/s@/usr@@g' -i $LFS/usr/bin/ldd
    ```

- Install the configuration file and runtime directory for nscd
    ```console
    cp -v ../nscd/nscd.conf /etc/nscd.conf
    mkdir -pv /var/cache/nscd
    ```

- install the locales that can make the system respond in a different language
    - Information
        - None of these locales are required, 
            + but if some of them are missing, the test suites of some packages will skip important test cases.
        - Individual locales can be installed using the localedef program. 
            - E.g., 
                - the second localedef command below combines the '/usr/share/i18n/locales/cs_CZ' charset-independent locale definition with the '/usr/share/i18n/charmaps/UTF-8.gz' charmap definition and 
                    + appends the result to the /usr/lib/locale/locale-archive file.
    - The following instruction will install the minimum set of locales necessary for the optimal coverage of tests
        - Create locale library folder
            ```console
            mkdir -pv /usr/lib/locale
            ```
        - Define locale
            ```
            localedef -i POSIX -f UTF-8 C.UTF-8 2> /dev/null || true
            localedef -i cs_CZ -f UTF-8 cs_CZ.UTF-8
            localedef -i de_DE -f ISO-8859-1 de_DE
            localedef -i de_DE@euro -f ISO-8859-15 de_DE@euro
            localedef -i de_DE -f UTF-8 de_DE.UTF-8
            localedef -i el_GR -f ISO-8859-7 el_GR
            localedef -i en_GB -f ISO-8859-1 en_GB
            localedef -i en_GB -f UTF-8 en_GB.UTF-8
            localedef -i en_HK -f ISO-8859-1 en_HK
            localedef -i en_PH -f ISO-8859-1 en_PH
            localedef -i en_US -f ISO-8859-1 en_US
            localedef -i en_US -f UTF-8 en_US.UTF-8
            localedef -i es_ES -f ISO-8859-15 es_ES@euro
            localedef -i es_MX -f ISO-8859-1 es_MX
            localedef -i fa_IR -f UTF-8 fa_IR
            localedef -i fr_FR -f ISO-8859-1 fr_FR
            localedef -i fr_FR@euro -f ISO-8859-15 fr_FR@euro
            localedef -i fr_FR -f UTF-8 fr_FR.UTF-8
            localedef -i is_IS -f ISO-8859-1 is_IS
            localedef -i is_IS -f UTF-8 is_IS.UTF-8
            localedef -i it_IT -f ISO-8859-1 it_IT
            localedef -i it_IT -f ISO-8859-15 it_IT@euro
            localedef -i it_IT -f UTF-8 it_IT.UTF-8
            localedef -i ja_JP -f EUC-JP ja_JP
            localedef -i ja_JP -f SHIFT_JIS ja_JP.SJIS 2> /dev/null || true
            localedef -i ja_JP -f UTF-8 ja_JP.UTF-8
            localedef -i nl_NL@euro -f ISO-8859-15 nl_NL@euro
            localedef -i ru_RU -f KOI8-R ru_RU.KOI8-R
            localedef -i ru_RU -f UTF-8 ru_RU.UTF-8
            localedef -i se_NO -f UTF-8 se_NO.UTF-8
            localedef -i ta_IN -f UTF-8 ta_IN.UTF-8
            localedef -i tr_TR -f UTF-8 tr_TR.UTF-8
            localedef -i zh_CN -f GB18030 zh_CN.GB18030
            localedef -i zh_HK -f BIG5-HKSCS zh_HK.BIG5-HKSCS
            localedef -i zh_TW -f UTF-8 zh_TW.UTF-8
            ```

- Install the locale for your own country, language and character set
    - Using the ''glibc-2.38/localedata/SUPPORTED file
        - Install all the locales listed in the file
            ```console
            make localedata/install-locales
            ```
        - Create and install locales not listed in the glibc-2.38/localedata/SUPPORTED file when you need them
            - For instance, 
                + the following two locales are needed for some tests later in this chapter
                    ```console
                    localedef -i POSIX -f UTF-8 C.UTF-8 2> /dev/null || true
                    localedef -i ja_JP -f SHIFT_JIS ja_JP.SJIS 2> /dev/null || true
                    ```

- Notes
    + Glibc now uses libidn2 when resolving internationalized domain names. This is a run time dependency. If this capability is needed, the instructions for installing libidn2 are in the BLFS libidn2 page.

- Configuring Glibc
    - Adding 'nsswitch.conf'
        - Explanation
            + The /etc/nsswitch.conf file needs to be created because the Glibc defaults do not work well in a networked environment.
        ```console
        cat > /etc/nsswitch.conf << "EOF"
        # Begin /etc/nsswitch.conf

        passwd: files
        group: files
        shadow: files

        hosts: files dns
        networks: files

        protocols: files
        services: files
        ethers: files
        rpc: files

        # End /etc/nsswitch.conf
        EOF
        ```

    - Adding Time Zone Data
        - zic command Options
            + zic -L /dev/null ... : This creates posix time zones without any leap seconds. It is conventional to put these in both zoneinfo and zoneinfo/posix. It is necessary to put the POSIX time zones in zoneinfo, otherwise various test suites will report errors. On an embedded system, where space is tight and you do not intend to ever update the time zones, you could save 1.9 MB by not using the posix directory, but some applications or test suites might produce some failures.
            + zic -L leapseconds ... : This creates right time zones, including leap seconds. On an embedded system, where space is tight and you do not intend to ever update the time zones, or care about the correct time, you could save 1.9MB by omitting the right directory.
            + zic ... -p ... : This creates the posixrules file. We use New York because POSIX requires the daylight savings time rules to be in accordance with US rules.
        ```console
        tar -xf ../../tzdata2023c.tar.gz

        ZONEINFO=/usr/share/zoneinfo
        mkdir -pv $ZONEINFO/{posix,right}

        for tz in etcetera southamerica northamerica europe africa antarctica  \
                  asia australasia backward; do
            zic -L /dev/null   -d $ZONEINFO       ${tz}
            zic -L /dev/null   -d $ZONEINFO/posix ${tz}
            zic -L leapseconds -d $ZONEINFO/right ${tz}
        done

        cp -v zone.tab zone1970.tab iso3166.tab $ZONEINFO
        zic -d $ZONEINFO -p America/New_York
        unset ZONEINFO
        ```

    - Check for your region and city timezone
        - Region
            ```console
            ls /usr/share/zoneinfo/[Region]
            ```
        - City
            ```console
            ls /usr/share/zoneinfo/[Region]/[City]
            ```

    - Determine the region local time zone
        - Using tzselect
            - After answering a few questions about the location, 
                + the script will output the name of the time zone (e.g., America/Edmonton). 
            - There are also some other possible time zones listed in /usr/share/zoneinfo such as Canada/Eastern or EST5EDT 
                + that are not identified by the script but can be used.
            ```conslole
            tzselect
            ```
        - Create the '/etc/localtime' file
            ```console
            ln -sfv /usr/share/zoneinfo/[Region]/[City] /etc/localtime
            ```

- Configuring the Dynamic Loader
    - Information
        - By default, the dynamic loader (/lib/ld-linux.so.2) searches through '/usr/lib' for dynamic libraries that are needed by programs as they are run. 
            - However, if there are libraries in directories other than /usr/lib, 
                + these need to be added to the /etc/ld.so.conf file in order for the dynamic loader to find them. 
            - Two directories that are commonly known to contain additional libraries are /usr/local/lib and /opt/lib, 
                + so add those directories to the dynamic loader's search path
    - Create a new '/etc/ld.so.conf' file
        - Append directory paths into the Dynamic Loader's search path
            ```console
            cat > /etc/ld.so.conf << "EOF"
            # Begin /etc/ld.so.conf
            /usr/local/lib
            /opt/lib

            EOF
            ```

    - (Optional) If desired, the dynamic loader can also search a directory and include the contents of files found there
        + Generally the files in this include directory are one line specifying the desired library path
        - Append line to include all configuration files within the Dynamic Loader source configuratin directory
            ```console
            cat >> /etc/ld.so.conf << "EOF"
            # Add an include directory
            include /etc/ld.so.conf.d/*.conf

            EOF
            ```
    - Create the Dynamic Loader configuration directory
        ```
        mkdir -pv /etc/ld.so.conf.d
        ```

#### Zlib
- Information
    + File Name: zlib-[version].tar.xz
    + Estimated required disk space: 6.2MB
    - Description: 
    - Package Contents
        + compression and decompression routines used by some programs.
    - Installed
        - Libraries
            + libz.so

- Extract tar file
    ```console
    tar -xvf zlib-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd zlib-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr
    ```

- Compile the package
    ```console
    make
    ```

- Test the result
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    ```

- Remove a useless static library
    ```console
    rm -fv /usr/lib/libz.a
    ```

#### Bzip2
- Information
    + File Name: bzip2-[version].tar.gz
    + Estimated required disk space: 7.2MB
    - Description: 
    - Package Contents
        - programs for compressing and decompressing files. 
            + Compressing text files with bzip2 yields a much better compression percentage than with the traditional gzip.
    - Installed
        - Programs: bunzip2 (link to bzip2), bzcat (link to bzip2), bzcmp (link to bzdiff), bzdiff, bzegrep (link to bzgrep), bzfgrep (link to bzgrep), bzgrep, bzip2, bzip2recover, bzless (link to bzmore), and bzmore
        - Libraries: libbz2.so
        - Directory: /usr/share/doc/bzip2-1.0.8

- Extract tar file
    ```console
    tar -xvzf bzip2-[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd bzip2-[version]
    ```

- Apply a patch that will install the documentation for this package
    ```console
    patch -Np1 -i ../bzip2-1.0.8-install_docs-1.patch
    ```

- Ensures installation of symbolic links are relative
    ```console
    sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile
    ```

- Ensure the man pages are installed into the correct location
    ```console
    sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile
    ```

- Configure and prepare for compilation
    - Parameters
        + -f Makefile-libbz2_so : This will cause Bzip2 to be built using a different Makefile file, in this case the Makefile-libbz2_so file, which creates a dynamic libbz2.so library and links the Bzip2 utilities against it
    ```console
    make -f Makefile-libbz2_so
    make clean
    ```

- Compile the package
    ```console
    make
    ```

- Install the package
    ```console
    make PREFIX=/usr install
    ```

- Install the shared library
    ```console
    cp -av libbz2.so.* /usr/lib
    ln -sv libbz2.so.1.0.8 /usr/lib/libbz2.so
    ```

- Install the shared 'bzip2' binary into the '/usr/bin' directory
    ```console
    cp -v bzip2-shared /usr/bin/bzip2
    ```
- Replace 2 copies of 'bzip2' with symlinks
    ```console
    for i in /usr/bin/{bzcat,bunzip2}; do
      ln -sfv bzip2 $i
    done
    ```

- Remove a useless static library
    ```console
    rm -fv /usr/lib/libbz2.a
    ```

#### Xz - Pass 2
- Information
    + File Name: xz-[version].tar.xz
    + Estimated required disk space: 24MB
    - Description: 
        + More Information: [Section 8.8.2, “Contents of Xz.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/xz.html#contents-xz)
    - Package Contents
        + programs for compressing and decompressing files. 
        - It provides capabilities for the lzma and the newer xz compression formats. 
            + Compressing text files with xz yields a better compression percentage than with the traditional gzip or bzip2 commands
    - Installed
        + Programs: lzcat (link to xz), lzcmp (link to xzdiff), lzdiff (link to xzdiff), lzegrep (link to xzgrep), lzfgrep (link to xzgrep), lzgrep (link to xzgrep), lzless (link to xzless), lzma (link to xz), lzmadec, lzmainfo, lzmore (link to xzmore), unlzma (link to xz), unxz (link to xz), xz, xzcat (link to xz), xzcmp (link to xzdiff), xzdec, xzdiff, xzegrep (link to xzgrep), xzfgrep (link to xzgrep), xzgrep, xzless, and xzmore
        + Libraries: liblzma.so
        + Directories: /usr/include/lzma and /usr/share/doc/xz-5.4.4

- Prepare source environment from scratch
    - Notes
        + Do this if you have removed the previous extracted directory

    - Extract tar file
        ```console
        tar -xvf xz-[version].tar.xz
        ```

- Change directory into source file
    ```console
    cd xz-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr    \
                --disable-static \
                --docdir=/usr/share/doc/xz-5.4.4
    ```

- Compile the package
    ```console
    make
    ```

- Test the result
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    ```

#### Zstd
- Information
    + File Name: zstd-[version].tar.gz
    + Estimated required disk space: 77MB
    - Description: Zstandard is a real-time compression algorithm, providing high compression ratios. It offers a very wide range of compression / speed trade-offs, while being backed by a very fast decoder.
    - Package Contents
        + libzstd   : The library implementing lossless data compression, using the ZSTD algorithm
        + zstd      : Compresses or decompresses files using the ZSTD format
        + zstdgrep  : Runs grep on ZSTD compressed files
        + zstdless  : Runs less on ZSTD compressed files
    - Installed
        + Programs: zstd, zstdcat (link to zstd), zstdgrep, zstdless, zstdmt (link to zstd), and unzstd (link to zstd)
        + Libraries: libzstd.so
        + Directories: 

- Extract tar file
    ```console
    tar -xvzf zstd-[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd zstd-[version]
    ```

- Compile the package
    ```console
    make prefix=/usr
    ```

- Test the result
    - Notes
        - In the test output there are several places that indicate 'failed'. 
            + These are expected and only 'FAIL' is an actual test failure. 
            + There should be no test failures.
    ```console
    make check
    ```

- Install the package
    ```console
    make prefix=/usr install
    ```

- Remove the static library
    ```console
    rm -v /usr/lib/libzstd.a
    ```

#### File - Pass 2
- Information
    + File Name: file-[version].tar.gz
    + Estimated required disk space: 17MB
    - Description: 
        + More Information: [Section 8.10.2, “Contents of File.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/file.html#contents-file)
    - Package Contents
        + utility for determining the type of a given file or files
    - Installed
        + Programs: file
        + Libraries: libmagic.so

- Prepare source environment from scratch
    - Notes
        + Do this if you have removed the previous extracted directory

    - Extract tar file
        ```console
        tar -xvzf file-[version].tar.gz
        ```

- Change directory into source file
    ```console
    cd file-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr
    ```

- Compile the package
    ```console
    make
    ```

- Test the result
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    ```

#### Readline
- Information
    + File Name: readline-[version].tar.gz
    + Estimated required disk space: 16MB
    - Description: 
    - Package Contents
        + a set of libraries that offer command-line editing and history capabilities
    - Installed
        + Libraries: libhistory.so and libreadline.so
        + Directories: /usr/include/readline and /usr/share/doc/readline-8.2

- Extract tar file
    ```console
    tar -xvzf readline-[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd readline-[version]
    ```

- Fix linking bug in ldconfig
    - Reinstalling Readline will cause the old libraries to be moved to <libraryname>.old. 
        + While this is normally not a problem, in some cases it can trigger a linking bug in ldconfig.
    ```console
    sed -i '/MV.*old/d' Makefile.in
    sed -i '/{OLDSUFF}/c:' support/shlib-install
    ```

- Fix a problem identified upstream
    ```console
    patch -Np1 -i ../readline-8.2-upstream_fix-1.patch
    ```

- Configure and prepare for compilation
    - New Configure Options
        + --with-curses : This option tells Readline that it can find the termcap library functions in the curses library, not a separate termcap library. This will generate the correct readline.pc file.
    ```console
    ./configure --prefix=/usr    \
                --disable-static \
                --with-curses    \
                --docdir=/usr/share/doc/readline-8.2
    ```

- Compile the package
    - Make options
        + SHLIB_LIBS="-lncursesw" : This option forces Readline to link against the libncursesw library
    ```console
    make SHLIB_LIBS="-lncursesw"
    ```

- Install the package
    ```console
    make SHLIB_LIBS="-lncursesw" install
    ```

- (Optional) Install the documentation
    ```console
    install -v -m644 doc/*.{ps,pdf,html,dvi} /usr/share/doc/readline-8.2
    ```

#### M4 - Pass 2
- Information
    + File Name: m4-[version].tar.xz
    + Estimated required disk space: 49MB
    - Description: 
        + More Information: [Section 8.12.2, “Contents of M4.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/m4.html#contents-m4)
    - Package Contents
        + Macro processor
    - Installed
        - Program: 
            + m4 : Copies the given files while expanding the macros that they contain. These macros are either built-in or user-defined and can take any number of arguments. Besides performing macro expansion, m4 has built-in functions for including named files, running Unix commands, performing integer arithmetic, manipulating text, recursion, etc. The m4 program can be used either as a front end to a compiler or as a macro processor in its own right

- Prepare source environment from scratch
    - Notes
        + Do this if you have removed the previous extracted directory

    - Extract tar file
        ```console
        tar -xvf m4-[version].tar.xz
        ```

- Change directory into source file
    ```console
    cd m4-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr
    ```

- Compile the package
    ```console
    make
    ```

- Test the result
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    ```

#### Bc
- Information
    + File Name: bc-[version].tar.xz
    + Estimated required disk space: 7.7MB
    - Description: 
    - Package Contents
        + an arbitrary precision numeric processing language
    - Installed
        - Programs: 
            + bc : Command Line Calculator 
            + dc : A reverse-polish command line calculator

- Extract tar file
    ```console
    tar -xvf bc-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd bc-[version]
    ```

- Configure and prepare for compilation
    - Configure Options
        + CC=gcc : This parameter specifies the compiler to use.
        + -G : Omit parts of the test suite that won't work until the bc program has been installed.
        + -O3 : Specify the optimization to use.
        + -r : Enable the use of Readline to improve the line editing feature of bc.
    ```console
    CC=gcc ./configure --prefix=/usr -G -O3 -r
    ```

- Compile the package
    ```console
    make
    ```

- Test the result
    ```console
    make test
    ```

- Install the package
    ```console
    make install
    ```

#### Flex
- Information
    + File Name: flex-[version].tar.gz
    + Estimated required disk space: 33MB
    - Description: 
    - Package Contents
        + a utility for generating programs that recognize patterns in text.
    - Installed
        - Programs: flex, flex++ (link to flex), and lex (link to flex)
        - Libraries: libfl.so
        - Directories: /usr/share/doc/flex-2.6.4

- Extract tar file
    ```console
    tar -xvzf flex-[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd flex-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr \
                --docdir=/usr/share/doc/flex-2.6.4 \
                --disable-static
    ```

- Compile the package
    ```console
    make
    ```

- Test the result
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    ```

- A few programs do not know about flex yet and try to run its predecessor, lex.
    - Explanation
        + This is to support those programs
    - Create a symbolic link named lex that runs flex in lex emulation mode and
        ```console
        ln -sv flex   /usr/bin/lex
        ```
    - Create the man page of lex as a symlink
        ```
        ln -sv flex.1 /usr/share/man/man1/lex.1
        ```

#### Tcl
- Information
    + File Name: tcl[version]-src.tar.gz
    + Estimated required disk space: 89MB
    - Description: The Tool Command Language, a robust general-purpose scripting language. 
        + The Expect package is written in Tcl (pronounced "tickle").
    - Package Contents
    - Installed
        - Programs: tclsh (link to tclsh8.6) and tclsh8.6
        - Libraries: libtcl8.6.so and libtclstub8.6.a
        - Directories: 

- Note
    - This package and the next two (Expect and DejaGNU) are installed to support running the test suites for Binutils, GCC and other packages. 
        + Installing three packages for testing purposes may seem excessive, but it is very reassuring, if not essential, to know that the most important tools are working properly.

- Extract tar file
    ```console
    tar -xvzf tcl[version]-src.tar.gz
    ```

- Change directory into source file
    ```console
    cd tcl[version]
    ```

- Configure and prepare for compilation
    ```console
    SRCDIR=$(pwd)
    cd unix
    ./configure --prefix=/usr           \
                --mandir=/usr/share/man
    ```

- Compile the package
    - Explanation
        - The various “sed” instructions after the “make” command remove references to the build directory from the configuration files and replace them with the install directory. 
            + This is not mandatory for the remainder of LFS, but may be needed if a package built later uses Tcl.
    ```console
    make

    sed -e "s|$SRCDIR/unix|/usr/lib|" \
        -e "s|$SRCDIR|/usr/include|"  \
        -i tclConfig.sh

    sed -e "s|$SRCDIR/unix/pkgs/tdbc1.1.5|/usr/lib/tdbc1.1.5|" \
        -e "s|$SRCDIR/pkgs/tdbc1.1.5/generic|/usr/include|"    \
        -e "s|$SRCDIR/pkgs/tdbc1.1.5/library|/usr/lib/tcl8.6|" \
        -e "s|$SRCDIR/pkgs/tdbc1.1.5|/usr/include|"            \
        -i pkgs/tdbc1.1.5/tdbcConfig.sh

    sed -e "s|$SRCDIR/unix/pkgs/itcl4.2.3|/usr/lib/itcl4.2.3|" \
        -e "s|$SRCDIR/pkgs/itcl4.2.3/generic|/usr/include|"    \
        -e "s|$SRCDIR/pkgs/itcl4.2.3|/usr/include|"            \
        -i pkgs/itcl4.2.3/itclConfig.sh

    unset SRCDIR
    ```

- Test the result
    ```console
    make test
    ```

- Install the package
    ```console
    make install
    ```

- Make the installed library writable so debugging symbols can be removed later
    ```console
    chmod -v u+w /usr/lib/libtcl8.6.so
    ```

- Install Tcl's headers
    + The next package, Expect, requires them.
    ```console
    make install-private-headers
    ```

- Make a necessary symbolic link
    ```console
    ln -sfv tclsh8.6 /usr/bin/tclsh
    ```

- Rename a man page that conflicts with a Perl man page
    ```console
    mv /usr/share/man/man3/{Thread,Tcl_Thread}.3
    ```

- (Optional) Install the documentation
    ```console
    cd ..
    tar -xf ../tcl8.6.13-html.tar.gz --strip-components=1
    mkdir -v -p /usr/share/doc/tcl-8.6.13
    cp -v -r  ./html/* /usr/share/doc/tcl-8.6.13
    ```

#### Expect
- Information
    + File Name: expect[version].tar.gz
    + Estimated required disk space: 3.9MB
    - Description: 
    - Package Contents
        - tools for automating, via scripted dialogues, interactive applications such as telnet, ftp, passwd, fsck, rlogin, and tip. 
            + Expect is also useful for testing these same applications as well as easing all sorts of tasks that are prohibitively difficult with anything else. 
            + The DejaGnu framework is written in Expect.
    - Installed
        - Programs: 
            + expect : Communicates with other interactive programs according to a script
        - Libraries: 
            + libexpect-5.45.4.so : Contains functions that allow Expect to be used as a Tcl extension or to be used directly from C or C++ (without Tcl)
        - Directories: 

- Extract tar file
    ```console
    tar -xvzf expect[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd expect[version]
    ```

- Configure and prepare for compilation
    - Configure Options
        + --with-tcl=/usr/lib : This parameter is needed to tell configure where the tclConfig.sh script is located.
        + --with-tclinclude=/usr/include : This explicitly tells Expect where to find Tcl's internal headers.
    ```console
    ./configure --prefix=/usr           \
                --with-tcl=/usr/lib     \
                --enable-shared         \
                --mandir=/usr/share/man \
                --with-tclinclude=/usr/include
    ```

- Compile the package
    ```console
    make
    ```

- Test the result
    - Notes
        + The test suite for Expect is considered critical. Do not skip it under any circumstances.
        - If any test fails with the message “The system has no more ptys. Ask your system administrator to create more”, 
            + it indicates you've not mounted the devpts file system correctly.
            - You need to exit from the chroot environment, 
                - read Section 7.3, “Preparing Virtual Kernel File Systems” again, and 
                    + ensure the devpts file system (and other virtual kernel file systems) mounted correctly.
            - Then reenter the chroot environment following Section 7.4, “Entering the Chroot Environment”. 
                + This issue needs to be resolved before continuing
    ```console
    make test
    ```

- Install the package
    ```console
    make install
    ln -svf expect5.45.4/libexpect5.45.4.so /usr/lib
    ```

#### DejaGNU
- Information
    + File Name: dejagnu-[version].tar.gz
    + Estimated required disk space: 6.9MB
    - Description: 
    - Package Contents
        - a framework for running test suites on GNU tools. 
            + It is written in expect, which itself uses Tcl (Tool Command Language).
    - Installed
        - Programs: 
            + dejagnu : DejaGNU auxiliary command launcher
            + runtest : A wrapper script that locates the proper expect shell and then runs DejaGNU
        - Libraries: 
        - Directories: 

- Extract tar file
    ```console
    tar -xvzf dejagnu-[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd dejagnu-[version]
    ```

- Create directory 'build'
    ```console
    mkdir -pv build
    ```

- Change directory into 'build'
    ```console
    cd build
    ```

- Configure and prepare for compilation
    ```console
    ../configure --prefix=/usr
    makeinfo --html --no-split -o doc/dejagnu.html ../doc/dejagnu.texi
    makeinfo --plaintext       -o doc/dejagnu.txt  ../doc/dejagnu.texi
    ```

- Compile and Install the package
    ```console
    make install
    install -v -dm755  /usr/share/doc/dejagnu-1.6.3
    install -v -m644   doc/dejagnu.{html,txt} /usr/share/doc/dejagnu-1.6.3
    ```

- Test the result
    ```console
    make check
    ```

#### Binutils - Pass 3
- Information
    + File Name: binutils-[version].tar.xz
    + Estimated required disk space: 2.7GB
    - Description: 
        + More Information: [Section 8.18.2, “Contents of Binutils.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/binutils.html#contents-binutils)
    - Package Contents
        + Linker
        + Assembler
        - Other tools for handling object files
    - Installed
        + Programs: addr2line, ar, as, c++filt, dwp, elfedit, gprof, gprofng, ld, ld.bfd, ld.gold, nm, objcopy, objdump, ranlib, readelf, size, strings, and strip
        + Libraries: libbfd.so, libctf.so, libctf-nobfd.so, libgprofng.so, libopcodes.so, and libsframe.so
        + Directory: /usr/lib/ldscripts

- Prepare source environment from scratch
    - Notes
        + Do this if you have removed the previous extracted directory

    - Extract tar file
        ```console
        tar -xvf binutils-[version].tar.xz
        ```

- Change directory into binutils
    ```console
    cd binutils-[version]
    ```

- Create a separate 'build' directory
    ```console
    mkdir -pv build-pass-3
    ```

- Change directory into 'build'
    ```console
    cd build-pass-3
    ```

- Configure and prepare for compilation
    - New Options
        + --enable-gold : Build the gold linker and install it as ld.gold (alongside the default linker).
        + --enable-ld=default : Build the original bfd linker and install it as both ld (the default linker) and ld.bfd.
        + --enable-plugins : Enables plugin support for the linker.
        + --enable-64-bit-bfd : Enables 64-bit support (on hosts with narrower word sizes). May not be needed on 64-bit systems, but does no harm.
        + --with-system-zlib : Use the installed zlib library instead of building the included version.
    ```console
    ../configure --prefix=/usr       \
                 --sysconfdir=/etc   \
                 --enable-gold       \
                 --enable-ld=default \
                 --enable-plugins    \
                 --enable-shared     \
                 --disable-werror    \
                 --enable-64-bit-bfd \
                 --with-system-zlib
    ```

- Compile the package
    - Parameter
        + tooldir=/usr : Normally, the tooldir (the directory where the executables will ultimately be located) is set to $(exec_prefix)/$(target_alias). For example, x86_64 machines would expand that to /usr/x86_64-pc-linux-gnu. Because this is a custom system, this target-specific directory in /usr is not required. $(exec_prefix)/$(target_alias) would be used if the system were used to cross-compile (for example, compiling a package on an Intel machine that generates code that can be executed on PowerPC machines).
    ```console
    make tooldir=/usr
    ```

- Test the result
    - Notes
        + The test suite for Binutils in this section is considered critical. Do not skip it under any circumstances.
        + Twelve tests fail in the gold test suite when the --enable-default-pie and --enable-default-ssp options are passed to GCC.
        + Three tests in the gprofng suite are also known to fail.
        - For a list of failed tests, run:
            ```console
            grep '^FAIL:' $(find -name '*.log')
            ```
    ```console
    make -k check
    ```

- Install the package
    ```console
    make tooldir=/usr install
    ```

- Remove the useless static libraries
    ```console
    rm -fv /usr/lib/lib{bfd,ctf,ctf-nobfd,gprofng,opcodes,sframe}.a
    ```

#### Gmp
- Information
    + File Name: gmp-[version].tar.xz
    + Estimated required disk space: 54MB
    - Description: 
    - Package Contents
        - math libraries. 
            + These have useful functions for arbitrary precision arithmetic.
    - Installed
        + Programs: 
        - Libraries: 
            + libgmp.so : Contains precision math functions
            + libgmpxx.so : Contains C++ precision math functions
        + Directory: /usr/share/doc/gmp-6.3.0

- Extract tar file
    ```console
    tar -xvf gmp-[version].tar.xz
    ```

- Change directory into source files
    ```console
    cd gmp-[version]
    ```

- Configure and prepare for compilation
    - Notes
        - The default settings of GMP produce libraries optimized for the host processor. 
            - If libraries suitable for processors less capable than the host's CPU are desired, 
                + generic libraries can be created by appending the '--host=none-linux-gnu' option to the configure command.
        - If you are building for 32-bit x86, but you have a CPU which is capable of running 64-bit code and you have specified CFLAGS in the environment, 
            + the configure script will attempt to configure for 64-bits and fail.    
            - Avoid this by prepending the configure command with 'ABI=32'
                ```console
                ABI=32 ./configure ...
                ```
    - Configuration Options
        + --enable-cxx : This parameter enables C++ support
        + --docdir=/usr/share/doc/gmp-6.3.0 : This variable specifies the correct place for the documentation.
    ```console
    ./configure --prefix=/usr    \
                --enable-cxx     \
                --disable-static \
                --docdir=/usr/share/doc/gmp-6.3.0
    ```

- Compile the package
    ```console
    make
    ```

- Generate the HTML documentation
    ```console
    make html
    ```

- Test the result
    - Notes
        + The test suite in this section is considered critical. Do not skip it under any circumstances.
    ```console
    make check 2>&1 | tee gmp-check-log
    ```

- Check the results and ensure that at least 199 tests in the test suite passed
    ```console
    awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log
    ```

- Install the package
    ```console
    make install
    ```

- Install the documentation
    ```console
    make install-html
    ```

#### MPFR
- Information
    + File Name: mpfr-[version].tar.xz
    + Estimated required disk space: 43MB
    - Description: 
    - Package Contents
        - functions for multiple precision math
    - Installed
        + Programs: 
        - Libraries: 
            + libmpfr.so : Contains multiple-precision math functions
        + Directory: /usr/share/doc/mpfr-4.2.0

- Extract tar file
    ```console
    tar -xvf mpfr-[version].tar.xz
    ```

- Change directory into source files
    ```console
    cd mpfr-[version]
    ```

- Fix a test case based on a bug of old Glibc releases:
    ```console
    sed -e 's/+01,234,567/+1,234,567 /' \
        -e 's/13.10Pd/13Pd/'            \
        -i tests/tsprintf.c
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr        \
                --disable-static     \
                --enable-thread-safe \
                --docdir=/usr/share/doc/mpfr-4.2.0
    ```

- Compile the package
    ```console
    make
    ```

- Generate the HTML documentation
    ```console
    make html
    ```

- Test the result
    - Notes
        + The test suite in this section is considered critical. Do not skip it under any circumstances.
        + ensure that all 197 tests passed
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    ```

- Install the documentation
    ```console
    make install-html
    ```

#### MPC
- Information
    + File Name: mpc-[version].tar.gz
    + Estimated required disk space: 22MB
    - Description: 
    - Package Contents
        - library for the arithmetic of complex numbers with arbitrarily high precision and correct rounding of the result
    - Installed
        + Programs: 
        - Libraries: 
            + libmpc.so : Contains complex math functions
        + Directory: /usr/share/doc/mpc-1.3.1

- Extract tar file
    ```console
    tar -xvzf mpc-[version].tar.gz
    ```

- Change directory into source files
    ```console
    cd mpc-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr    \
                --disable-static \
                --docdir=/usr/share/doc/mpc-1.3.1
    ```

- Compile the package
    ```console
    make
    ```

- Generate the HTML documentation
    ```console
    make html
    ```

- Test the result
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    ```

- Install the documentation
    ```console
    make install-html
    ```

#### Attr
- Information
    + File Name: attr-[version].tar.gz
    + Estimated required disk space: 4.1MB
    - Description: 
    - Package Contents
        - utilities to administer the extended attributes of filesystem objects
    - Installed
        - Programs: 
            + attr      : Extends attributes on filesystem objects
            + getfattr  : Gets the extended attributes of filesystem objects
            + setfattr  : Sets the extended attributes of filesystem objects
        - Libraries: 
            + libattr.so : Contains the library functions for manipulating extended attributes
        + Directory: /usr/include/attr and /usr/share/doc/attr-2.5.1

- Extract tar file
    ```console
    tar -xvzf attr-[version].tar.gz
    ```

- Change directory into source files
    ```console
    cd attr-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr     \
                --disable-static  \
                --sysconfdir=/etc \
                --docdir=/usr/share/doc/attr-2.5.1
    ```

- Compile the package
    ```console
    make
    ```

- Test the result
    + The tests must be run on a filesystem that supports extended attributes such as the ext2, ext3, or ext4 filesystems.
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    ```

#### Acl
- Information
    + File Name: acl-[version].tar.xz
    + Estimated required disk space: 6.1MB
    - Description: 
    - Package Contents
        - utilities to administer Access Control Lists, 
            + which are used to define fine-grained discretionary access rights for files and directories
    - Installed
        - Programs: 
            + chacl   : Changes the access control list of a file or directory
            + getfacl : Gets file access control lists
            + setfacl : Sets file access control lists
        - Libraries: 
            + libacl.so : Contains the library functions for manipulating Access Control Lists
        + Directory: /usr/include/acl and /usr/share/doc/acl-2.3.1

- Extract tar file
    ```console
    tar -xvf acl-[version].tar.xz
    ```

- Change directory into source files
    ```console
    cd acl-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr         \
                --disable-static      \
                --docdir=/usr/share/doc/acl-2.3.1
    ```

- Compile the package
    ```console
    make
    ```

- (Optional) Test the result
    - The Acl tests must be run on a filesystem that supports access controls, but not until the Coreutils package has been built, using the Acl libraries. 
        + If desired, return to this package and run make check after the Coreutils package has been built.
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    ```

#### Libcap
- Information
    + File Name: libcap-[version].tar.xz
    + Estimated required disk space: 2.9MB
    - Description: implements the userspace interface to the POSIX 1003.1e capabilities available in Linux kernels. 
        + These capabilities partition the all-powerful root privilege into a set of distinct privileges.
    - Package Contents
    - Installed
        - Programs: 
            + capsh : A shell wrapper to explore and constrain capability support
            + getcap : Examines file capabilities
            + getpcaps : Displays the capabilities of the queried process(es)
            + setcap : Sets file capabilities
        - Libraries: 
            + libcap.so : Contains the library functions for manipulating POSIX 1003.1e capabilities
            + libpsx.so : Contains functions to support POSIX semantics for syscalls associated with the pthread library
        + Directory: 

- Extract tar file
    ```console
    tar -xvf libcap-[version].tar.xz
    ```

- Change directory into source files
    ```console
    cd libcap-[version]
    ```

- Prevent static libraries from being installed
    ```console
    sed -i '/install -m.*STA/d' libcap/Makefile
    ```

- Compile the package
    - Make Options
        + lib=lib : This parameter sets the library directory to /usr/lib rather than /usr/lib64 on x86_64. It has no effect on x86.
    ```console
    make prefix=/usr lib=lib
    ```

- Test the result
    ```console
    make test
    ```

- Install the package
    ```console
    make prefix=/usr lib=lib install
    ```

#### Libxcrypt
- Information
    + File Name: libxcrypt-[version].tar.xz
    + Estimated required disk space: 15MB
    - Description: a modern library for one-way hashing of passwords
    - Package Contents
    - Installed
        - Programs: 
        - Libraries: 
            + libcrypt.so : Contains functions to hash passwords
        + Directory: 

- Extract tar file
    ```console
    tar -xvf libxcrypt-[version].tar.xz
    ```

- Change directory into source files
    ```console
    cd libxcrypt-[version]
    ```

- Configure and prepare for compilation
    - Configure Options
        + --enable-hashes=strong,glibc : Build strong hash algorithms recommended for security use cases, and the hash algorithms provided by traditional Glibc libcrypt for compatibility.
        + --enable-obsolete-api=no : Disable obsolete API functions. They are not needed for a modern Linux system built from source.
        + --disable-failure-tokens : Disable failure token feature. It's needed for compatibility with the traditional hash libraries of some platforms, but a Linux system based on Glibc does not need it.
    ```console
    ./configure --prefix=/usr                \
                --enable-hashes=strong,glibc \
                --enable-obsolete-api=no     \
                --disable-static             \
                --disable-failure-tokens
    ```

- Compile the package
    ```console
    make
    ```

- (Optional) If you must have such functions because of some binary-only application or to be compliant with LSB, build the package again with the following commands
    - Explanation
        - The above instructions have disabled obsolete API functions since no package installed by compiling from sources would link against them at runtime. 
            + However, the only known binary-only applications that link against these functions require ABI version 1
    ```console
    make distclean
    ./configure --prefix=/usr                \
                --enable-hashes=strong,glibc \
                --enable-obsolete-api=glibc  \
                --disable-static             \
                --disable-failure-tokens
    make
    cp -av .libs/libcrypt.so.1* /usr/lib
    ```

- Test the result
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    ```

#### Shadow
- Information
    + File Name: shadow-[version].tar.xz
    + Estimated required disk space: 46MB
    - Description: 
    - Package Contents
        + programs for handling passwords in a secure way
    - Installed
        - Programs: chage, chfn, chgpasswd, chpasswd, chsh, expiry, faillog, getsubids, gpasswd, groupadd, groupdel, groupmems, groupmod, grpck, grpconv, grpunconv, lastlog, login, logoutd, newgidmap, newgrp, newuidmap, newusers, nologin, passwd, pwck, pwconv, pwunconv, sg (link to newgrp), su, useradd, userdel, usermod, vigr (link to vipw), and vipw
        - Libraries: libsubid.so
        + Directory: /etc/default and /usr/include/shadow

- Extract tar file
    ```console
    tar -xvf shadow-[version].tar.xz
    ```

- Change directory into source files
    ```console
    cd shadow-[version]
    ```

- Disable the installation of the groups program and its man pages, as Coreutils provides a better version. 
    + Also, prevent the installation of manual pages that were already installed in [8.3. Man-pages](#man-pages)
    ```console
    sed -i 's/groups$(EXEEXT) //' src/Makefile.in
    find man -name Makefile.in -exec sed -i 's/groups\.1 / /'   {} \;
    find man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {} \;
    find man -name Makefile.in -exec sed -i 's/passwd\.5 / /'   {} \;
    ```

- Instead of using the default crypt method, use the much more secure YESCRYPT method of password encryption, which also allows passwords longer than 8 characters. 
    - It is also necessary to change the obsolete /var/spool/mail location for user mailboxes that Shadow uses by default to the /var/mail location used currently. 
        + And, remove /bin and /sbin from the PATH, since they are simply symlinks to their counterparts in /usr
    - Notes
        - If you wish to include /bin and/or /sbin in the PATH for some reason, 
            + modify the PATH in .bashrc after LFS has been built.
    ```console
    sed -e 's:#ENCRYPT_METHOD DES:ENCRYPT_METHOD YESCRYPT:' \
        -e 's:/var/spool/mail:/var/mail:'                   \
        -e '/PATH=/{s@/sbin:@@;s@/bin:@@}'                  \
        -i etc/login.defs
    ```

- (Optional) If you chose to build Shadow with Cracklib support
    ```console
    sed -i 's:DICTPATH.*:DICTPATH\t/lib/cracklib/pw_dict:' etc/login.defs
    ```

- Configure and prepare for compilation
    - Configure Options
        + touch /usr/bin/passwd : The file /usr/bin/passwd needs to exist because its location is hardcoded in some programs; if it does not already exist, the installation script will create it in the wrong place.
        + --with-{b,yes}crypt : The shell expands this to two switches, --with-bcrypt and --with-yescrypt. They allow shadow to use the Bcrypt and Yescrypt algorithms implemented by Libxcrypt for hashing passwords. These algorithms are more secure (in particular, much more resistant to GPU-based attacks) than the traditional SHA algorithms.
        + --with-group-name-max-length=32 : The longest permissible user name is 32 characters. Make the maximum length of a group name the same.
    - Notes
        + This is where you create the '/etc/passwd' authentication and authorization file and the '/etc/shadow' hashed password file that linux uses
        - If you would like to enforce the use of strong passwords, 
             - refer to https://www.linuxfromscratch.org/blfs/view/12.0/postlfs/cracklib.html for installing CrackLib prior to building Shadow. 
                 + Then add --with-libcrack to the configure command below.
    ```console
    touch /usr/bin/passwd
    ./configure --sysconfdir=/etc   \
                --disable-static    \
                --with-{b,yes}crypt \
                --with-group-name-max-length=32
    ```

- Compile the package
    ```console
    make
    ```

- Install the package
    ```console
    make exec_prefix=/usr install
    make -C man install-man
    ```

- Configuring Shadow
    - Introduction
        - This package contains utilities to add, modify, and delete users and groups; set and change their passwords; and perform other administrative tasks. 
            + For a full explanation of what password shadowing means, see the 'doc/HOWTO' file within the unpacked source tree. 
            + If you use Shadow support, keep in mind that programs which need to verify passwords (display managers, FTP programs, pop3 daemons, etc.) must be Shadow-compliant. That is, they must be able to work with shadowed passwords

    - Enable shadowed passwords
        ```console
        pwconv
        ```
    - Enable shadowed group passwords
        ```console
        grpconv
        ```
    - Changing Shadow's default configuration
        - Shadow's default configuration for the 'useradd' utility
            - the default action for the useradd utility is to create the user and a group with the same name as the user.
            - By default
                - The user ID (UID) and group ID (GID) numbers will begin at 1000
                    - This means that if you do not pass extra parameters to 'useradd'
                        + Each user will be a member of a unique group on the system
                    - If this behaviour is undesirable, you'll need to 
                        + pass either the '-g' or '-N' parameter to 'useradd'
                        + or else change the settings of 'USERGROUPS_ENAB' in '/etc/login.defs'
                        + see 'useradd(8)' for more information
                            ```console
                            man useradd(8)
                            ```
        - To change the default parameters
            - The file '/etc/default/useradd' must be created and tailored to suit your particular needs
                - /etc/default/useradd parameter explanations
                    - `GROUP=999` : This parameter sets the beginning of the group numbers used in the /etc/group file. 
                        - The particular value 999 comes from the --gid parameter above. 
                            + You may set it to any desired value. 
                        - Note that 
                            - useradd will never reuse a UID or GID. 
                                + If the number identified in this parameter is used, it will use the next available number. 
                            - if you don't have a group with an ID equal to this number on your system, then 
                                - the first time you use useradd without the -g parameter, 
                                    + an error message will be generated—useradd: unknown GID 999, even though the account has been created correctly. 
                                + That is why we created the group users with this group ID in [7.6. Creating Essential Files and Symlinks](#creating-essential-files-and-symlinks).
                    - `CREATE_MAIL_SPOOL=yes` : This parameter causes useradd to create a mailbox file for each new user. 
                        - useradd will assign the group ownership of this file to the mail group with 0660 permissions. 
                            - If you would rather not create these files, issue this command
                                ```console
                                sed -i '/MAIL/s/yes/no/' /etc/default/useradd
                                ```
                ```console
                mkdir -p /etc/default
                useradd -D --gid 999
                ```

- Setting the Root password
    - Notes
       + By default, if username is not set, passwd will set the password for sudo
       + To change the password for user 'root', issue `passwd root`
    ```console
    passwd [username]
    ```

#### GCC - Pass 3
- Information
    + File Name: gcc-[version].tar.xz
    + Estimated required disk space: 5.5GB
    - Description: 
        + More Information: [Section 8.27.2, “Contents of GCC.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/gcc.html#contents-gcc)
    - Package Contents
        - GNU compiler collection
            - i.e.
                + C/C++ compilers (gcc, g++ etc)
    - Installed
        + Programs: c++, cc (link to gcc), cpp, g++, gcc, gcc-ar, gcc-nm, gcc-ranlib, gcov, gcov-dump, gcov-tool, and lto-dump
        + Libraries: libasan.{a,so}, libatomic.{a,so}, libcc1.so, libgcc.a, libgcc_eh.a, libgcc_s.so, libgcov.a, libgomp.{a,so}, libhwasan.{a,so}, libitm.{a,so}, liblsan.{a,so}, liblto_plugin.so, libquadmath.{a,so}, libssp.{a,so}, libssp_nonshared.a, libstdc++.{a,so}, libstdc++exp.a, libstdc++fs.a, libsupc++.a, libtsan.{a,so}, and libubsan.{a,so}
        + Directories: /usr/include/c++, /usr/lib/gcc, /usr/libexec/gcc, and /usr/share/gcc-13.2.0

- Prepare source environment from scratch
    - Notes
        + Do this if you have removed the previous extracted directory

    - Extract GCC tar files
        ```console
        tar -xvf gcc-[version].tar.xz
        ```

    - Extract dependency tar files
        - mpfr
            ```console
            tar -xvf mpfr-[version].tar.xz
            ```
        - gmp
            ```console
            tar -xvf gmp-[version].tar.xz
            ```
        - mpc
            ```console
            tar -xvzf mpc-[version].tar.gz
            ```

    - Change directory into gcc
        ```console
        cd gcc-[version]
        ```

    - Override the building rule of libgcc and libstdc++ headers, 
        + to allow building these libraries with POSIX threads support
        ```console
        sed '/thread_header =/s/@.*@/gthr-posix.h/' -i libgcc/Makefile.in libstdc++-v3/include/Makefile.in
        ```

    - Move the dependency source directories to the gcc source directory
        - mpfr
            ```console
            mv -v ../mpfr-[version] mpfr
            ```
        - gmp
            ```console
            mv -v ../gmp-[version] gmp
            ```
        - mpc
            ```console
            mv -v ../mpc-[version] mpc
            ```

    - On x86_64 hosts, set the default directory name for 64-bit libraries to “lib”:
        ```console
        case $(uname -m) in
          x86_64)
            sed -e '/m64=/s/lib64/lib/' -i.orig gcc/config/i386/t-linux64
            ;;
        esac
        ```

- From an existing source directory
    - Change directory into gcc
        ```console
        cd gcc-[version]
        ```

- Create directory 'build'
    ```console
    mkdir -pv build-pass-3
    ```

- Change directory into 'build'
    ```console
    cd build-pass-3
    ```

- Configure and prepare for compilation
    - Notes
        + GCC supports seven different computer languages, but the prerequisites for most of them have not yet been installed. See the [BLFS Book GCC page](https://www.linuxfromscratch.org/blfs/view/12.0/general/gcc.html) for instructions on how to build all of GCC's supported languages.
        - PIE (position-independent executables) are binary programs that can be loaded anywhere in memory. 
            - Without PIE, the security feature named ASLR (Address Space Layout Randomization) can be applied for the shared libraries, 
                + but not for the executables themselves. 
            - Enabling PIE allows ASLR for the executables in addition to the shared libraries, 
                + and mitigates some attacks based on fixed addresses of sensitive code or data in the executables.
        - SSP (Stack Smashing Protection) is a technique to ensure that the parameter stack is not corrupted. 
            - Stack corruption can, 
                - for example, 
                    - alter the return address of a subroutine, 
                       + thus transferring control to some dangerous code (existing in the program or shared libraries, or injected by the attacker somehow).
    - Explanations
        - New Parameters
            + LD=ld : This parameter makes the configure script use the ld program installed by the Binutils package built earlier in this chapter, rather than the cross-built version which would otherwise be used.
            + --disable-fixincludes : By default, during the installation of GCC some system headers would be “fixed” to be used with GCC. This is not necessary for a modern Linux system, and potentially harmful if a package is reinstalled after installing GCC. This switch prevents GCC from “fixing” the headers.
            + --with-system-zlib : This switch tells GCC to link to the system installed copy of the Zlib library, rather than its own internal copy.
    ```console
    ../configure --prefix=/usr            \
                 LD=ld                    \
                 --enable-languages=c,c++ \
                 --enable-default-pie     \
                 --enable-default-ssp     \
                 --disable-multilib       \
                 --disable-bootstrap      \
                 --disable-fixincludes    \
                 --with-system-zlib
    ```

- Compile the package
    ```console
    make
    ```

- Increase the stack size prior to running the tests
    - Explanation
        + One set of tests in the GCC test suite is known to exhaust the default stack
    ```console
    ulimit -s 32768
    ```

- Test the results as a non-privileged user, but do not stop at errors
    - Notes
        - In this section, the test suite for GCC is considered important, but it takes a long time. 
            - First-time builders are encouraged to run the test suite. 
                - The time to run the tests can be reduced significantly by adding -jx to the make -k check command below, 
                    + where x is the number of CPU cores on your system.
    ```console
    chown -Rv tester .
    su tester -c "PATH=$PATH make -k check"
    ```

- (Optional) To extract a summary of the test suite results
    - Notes
        - Results can be compared with those located at 
            + [Linux From Scratch (LFS) Book - lfs - build-logs - 12.0](https://www.linuxfromscratch.org/lfs/build-logs/12.0/) and 
            + [GNU - GCC - Test Results](https://gcc.gnu.org/ml/gcc-testresults/).
        - Two tests named copy.cc and pr56837.c are known to fail. 
            + Additionally, several tests in the vect directory are known to fail if the hardware does not support AVX.
        - With Glibc-2.38, the analyzer tests named data-model-4.c and conftest-1.c are known to fail. 
            - In the asan tests, several tests in asan_test.C are known to fail. 
                + The test named interception-malloc-test-1.C is known to fail.
        - A few unexpected failures cannot always be avoided. 
            - The GCC developers are usually aware of these issues, but have not resolved them yet. 
                + Unless the test results are vastly different from those at the above URL, it is safe to continue.
    ```console
    ../contrib/test_summary
    ```
    - To filter out only the summaries, pipe the output through 'grep -A7 Summ'.
        ```console
        ../contrib/test_summary | grep -A7 Summ
        ```

- Install the package
    ```console
    make install
    ```

- Change the ownership to the root user and group
    - Explanation
        - The GCC build directory is owned by tester now, 
            + and the ownership of the installed header directory (and its content) is incorrect. 
    ```console
    chown -v -R root:root \
        /usr/lib/gcc/$(gcc -dumpmachine)/13.2.0/include{,-fixed}
    ```

- Create a symlink required by the [FHS](https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch03s09.html) for "historical" reasons.
    ```console
    ln -svr /usr/bin/cpp /usr/lib
    ```

- Create a Symbolic Link (symlink) of the man page
    - Explanation
        - Many packages use the name cc to call the C compiler. 
            + We've already created cc as a symlink in gcc-pass2
    ```console
    ln -sv gcc.1 /usr/share/man/man1/cc.1
    ```

- Add a compatibility symlink to enable building programs with Link Time Optimization (LTO)
    ```console
    ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/13.2.0/liblto_plugin.so \
            /usr/lib/bfd-plugins/
    ```

- Perform some sanity checks
    - Explanation
        - Now that our final toolchain is in place, 
            + it is important to again ensure that compiling and linking will work as expected
    - Notes
        - There should be no errors, and the output of the last command will be (allowing for platform-specific differences in the dynamic linker name):
            + [Requesting program interpreter: /lib64/ld-linux-x86-64.so.2]
    ```console
    echo 'int main(){}' > dummy.c
    cc dummy.c -v -Wl,--verbose &> dummy.log
    readelf -l a.out | grep ': /lib'
    ```

- Now make sure that we're set up to use the correct start files
    - Notes
        - The output of the last command should be:
            ```
            /usr/lib/gcc/x86_64-pc-linux-gnu/13.2.0/../../../../lib/Scrt1.o succeeded
            /usr/lib/gcc/x86_64-pc-linux-gnu/13.2.0/../../../../lib/crti.o succeeded
            /usr/lib/gcc/x86_64-pc-linux-gnu/13.2.0/../../../../lib/crtn.o succeeded
            ```
            - Depending on your machine architecture, the above may differ slightly. 
                + The difference will be the name of the directory after /usr/lib/gcc. 
                + The important thing to look for here is that gcc has found all three crt*.o files under the /usr/lib directory.
    ```console
    grep -E -o '/usr/lib.*/S?crt[1in].*succeeded' dummy.log
    ```

- Verify that the compiler is searching for the correct header files
    - Notes
        - This command should return following output
            ```
            #include <...> search starts here:
             /usr/lib/gcc/x86_64-pc-linux-gnu/13.2.0/include
             /usr/local/include
             /usr/lib/gcc/x86_64-pc-linux-gnu/13.2.0/include-fixed
             /usr/include
            ```
            + Again, the directory named after your target triplet may be different than the above, depending on your system architecture.
    ```console
    grep -B4 '^ /usr/include' dummy.log
    ```

- Verify that the new linker is being used with the correct search paths
    - Notes
        - References to paths that have components with '-linux-gnu' should be ignored, but otherwise the output of the last command should be:
            - 64-bit system
                ```
                SEARCH_DIR("/usr/x86_64-pc-linux-gnu/lib64")
                SEARCH_DIR("/usr/local/lib64")
                SEARCH_DIR("/lib64")
                SEARCH_DIR("/usr/lib64")
                SEARCH_DIR("/usr/x86_64-pc-linux-gnu/lib")
                SEARCH_DIR("/usr/local/lib")
                SEARCH_DIR("/lib")
                SEARCH_DIR("/usr/lib");
                ```
            - 32-bit system (i686 machine):
                ```
                SEARCH_DIR("/usr/i686-pc-linux-gnu/lib32")
                SEARCH_DIR("/usr/local/lib32")
                SEARCH_DIR("/lib32")
                SEARCH_DIR("/usr/lib32")
                SEARCH_DIR("/usr/i686-pc-linux-gnu/lib")
                SEARCH_DIR("/usr/local/lib")
                SEARCH_DIR("/lib")
                SEARCH_DIR("/usr/lib");
                ```
    ```console
    grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'
    ```

- Make sure that we're using the correct libc
    - Notes
        - The output of the last command should be:
            ```
            attempt to open /usr/lib/libc.so.6 succeeded
            ```
    ```console
    grep "/lib.*/libc.so.6 " dummy.log
    ```

- Make sure GCC is using the correct dynamic linker
    - Notes
        - The output of the last command should be:
            ```
            found ld-linux-x86-64.so.2 at /usr/lib/ld-linux-x86-64.so.2
            ```
            - If the output does not appear as shown above or is not received at all, then something is seriously wrong. 
                + Investigate and retrace the steps to find out where the problem is and correct it. 
                + Any issues should be resolved before continuing with the process.
    ```console
    grep found dummy.log
    ```

- Once everything is working correctly, clean up the test files
    ```console
    rm -v dummy.c a.out dummy.log
    ```

- Move a misplaced file
    ```console
    mkdir -pv /usr/share/gdb/auto-load/usr/lib
    mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib
    ```

#### Pkgconf
- Information
    + File Name: pkgconf-[version].tar.xz
    + Estimated required disk space: 4.6MB
    - Description: The pkgconf package is a successor to pkg-config
    - Package Contents
        + contains a tool for passing the include path and/or library paths to build tools during the configure and make phases of package installations.
    - Installed
        - Programs: 
            + pkgconf : Returns meta information for the specified library or package
            + pkg-config (link to pkgconf)
            + bomtool : Generates a Software Bill Of Materials from pkg-config .pc files
        - Libraries: 
            + libpkgconf.so : Contains most of pkgconf's functionality, while allowing other tools like IDEs and compilers to use its frameworks
        + Directory: /usr/share/doc/pkgconf-2.0.1

- Extract tar file
    ```console
    tar -xvf pkgconf-[version].tar.xz
    ```

- Change directory into source files
    ```console
    cd pkgconf-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr              \
                --disable-static           \
                --docdir=/usr/share/doc/pkgconf-2.0.1
    ```

- Compile the package
    ```console
    make
    ```

- Install the package
    ```console
    make install
    ```

- Create 2 symbolic links
    - Explanation
        + To maintain compatibility with the original Pkg-config
    ```console
    ln -sv pkgconf   /usr/bin/pkg-config
    ln -sv pkgconf.1 /usr/share/man/man1/pkg-config.1
    ```

#### Ncurses - Pass 2
- Information
    + File Name: ncurses-[version].tar.gz
    + Estimated required disk space: 45MB
    - Description: 
        + More Information: [Section 8.29.2, “Contents of Ncurses.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/ncurses.html#contents-ncurses)
    - Package Contents
        + libraries for terminal-independent handling of character screens
    - Dependencies
        + gawk
    - Installed
        - Programs: captoinfo (link to tic), clear, infocmp, infotocap (link to tic), ncursesw6-config, reset (link to tset), tabs, tic, toe, tput, and ts
        - Libraries: libcursesw.so (symlink and linker script to libncursesw.so), libformw.so, libmenuw.so, libncursesw.so, libncurses++w.so, libpanelw.so, and their non-wide-character counterparts without "w" in the library names
        - Directories: /usr/share/tabset, /usr/share/terminfo, and /usr/share/doc/ncurses-6.4

- Prepare source environment from scratch
    - Notes
        + Do this if you have removed the previous extracted directory

    - Extract tar file
        ```console
        tar -xvzf ncurses-[version].tar.gz
        ```

    - Extract dependency tar files
        - gawk
            ```console
            tar -xvf gawk-[version].tar.xz
            ```

    - Change directory into source file
        ```console
        cd ncurses-[version]
        ```

    - Ensure that gawk is found
        ```console
        sed -i s/mawk// configure
        ```

    - Build the "tic" program on the build host
        ```console
        mkdir build
        pushd build
          ../configure
          make -C include
          make -C progs tic
        popd
        ```

- Else if it already exists
    - Change directory into source file
        ```console
        cd ncurses-[version]
        ```

- Configure and prepare for compilation
    - Options
        + --with-shared : This makes Ncurses build and install shared C libraries.
        + --without-normal : This prevents Ncurses building and installing static C libraries.
        + --without-debug : This prevents Ncurses building and installing debug libraries.
        + --with-cxx-shared : This makes Ncurses build and install shared C++ bindings. It also prevents it building and installing static C++ bindings.
        + --enable-pc-files : This switch generates and installs .pc files for pkg-config.
        + --enable-widec : This switch causes wide-character libraries (e.g., libncursesw.so.6.4) to be built instead of normal ones (e.g., libncurses.so.6.4). These wide-character libraries are usable in both multibyte and traditional 8-bit locales, while normal libraries work properly only in 8-bit locales. Wide-character and normal libraries are source-compatible, but not binary-compatible.
    ```console
    ./configure --prefix=/usr           \
                --mandir=/usr/share/man \
                --with-shared           \
                --without-debug         \
                --without-normal        \
                --with-cxx-shared       \
                --enable-pc-files       \
                --enable-widec          \
                --with-pkg-config-libdir=/usr/lib/pkgconfig
    ```

- Compile the package
    ```console
    make
    ```

- Install the package with DESTDIR, and replace the library file correctly using the install command
    - Explanation
        - The installation of this package will overwrite libncursesw.so.6.4 in-place. 
            + It may crash the shell process which is using code and data from the library file. 
    ```console
    make DESTDIR=$PWD/dest install
    install -vm755 dest/usr/lib/libncursesw.so.6.4 /usr/lib
    rm -v  dest/usr/lib/libncursesw.so.6.4
    cp -av dest/* /
    ```

- (Optional) Test install
    - This package has a test suite, 
        + but it can only be run after the package has been installed. 
        + The tests reside in the test/ directory. 
        + See the README file in that directory for further details.
    ```console
    TBC
    ```

- Many applications still expect the linker to be able to find non-wide-character Ncurses libraries. 
    + Trick such applications into linking with wide-character libraries by means of symlinks and linker scripts:
    ```console
    for lib in ncurses form panel menu ; do
        rm -vf                    /usr/lib/lib${lib}.so
        echo "INPUT(-l${lib}w)" > /usr/lib/lib${lib}.so
        ln -sfv ${lib}w.pc        /usr/lib/pkgconfig/${lib}.pc
    done
    ```

- Ensure that old applications that look for -lcurses at build time are still buildable
    ```console
    rm -vf                     /usr/lib/libcursesw.so
    echo "INPUT(-lncursesw)" > /usr/lib/libcursesw.so
    ln -sfv libncurses.so      /usr/lib/libcurses.so
    ```

- (Optional) Install the Ncurses documentation
    ```console
    cp -v -R doc -T /usr/share/doc/ncurses-6.4
    ```

- (Optional) The instructions above don't create non-wide-character Ncurses libraries since no package installed by compiling from sources would link against them at runtime. 
    + However, the only known binary-only applications that link against non-wide-character Ncurses libraries require version 5. 
    - If you must have such libraries because of some binary-only application or to be compliant with LSB, 
        + build the package again with the following commands:
        ```console
        make distclean
        ./configure --prefix=/usr    \
                    --with-shared    \
                    --without-normal \
                    --without-debug  \
                    --without-cxx-binding \
                    --with-abi-version=5
        make sources libs
        cp -av lib/lib*.so.5* /usr/lib
        ```

#### Sed - Pass 2
- Information
    + File Name: sed-[version].tar.xz
    + Estimated required disk space: 30MB
    - Description: 
        + More Information: [Section 8.30.2, “Contents of Sed.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/sed.html#contents-sed)
    - Package Contents
        + Stream Editor (sed)
    - Installed
        - Programs: 
            + sed : Filters and transforms text files in a single pass
        + Libraries:
        + Directories: /usr/share/doc/sed-4.9

- Prepare source environment from scratch
    - Notes
        + Do this if you have removed the previous extracted directory

    - Extract tar file
        ```console
        tar -xvf sed-[version].tar.xz
        ```

- Change directory into source file
    ```console
    cd sed-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr
    ```

- Compile the package
    ```console
    make
    ```

- Generate the HTML documentation
    ```console
    make html
    ```

- Test the result
    ```console
    chown -Rv tester .
    su tester -c "PATH=$PATH make check"
    ```

- Install the package
    ```console
    make install
    install -d -m755           /usr/share/doc/sed-4.9
    install -m644 doc/sed.html /usr/share/doc/sed-4.9
    ```

#### Psmisc
- Information
    + File Name: psmisc-[version].tar.xz
    + Estimated required disk space: 6.6MB
    - Description: 
    - Package Contents
        + contains programs for displaying information about running processes
    - Installed
        - Programs: 
            + fuser : Reports the Process IDs (PIDs) of processes that use the given files or file systems
            + killall : Kills processes by name; it sends a signal to all processes running any of the given commands
            + peekfd : Peek at file descriptors of a running process, given its PID
            + prtstat : Prints information about a process
            + pslog : Reports current logs path of a process
            + pstree : Displays running processes as a tree
            + pstree.x11 : Same as pstree, except that it waits for confirmation before exiting
        + Libraries:
        + Directories:

- Extract tar file
    ```console
    tar -xvf psmisc-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd psmisc-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr
    ```

- Compile the package
    ```console
    make
    ```

- Run the test suite
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    ```

#### Gettext - Pass 2
- Information
    + File Name: gettext-[version].tar.xz
    + Estimated required disk space: 250MB
    - Description: 
        + More Information: [Section 8.32.2, “Contents of Gettext.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/gettext.html#contents-gettext)
    - Package Contents
        - utilities for internationalization and localization. 
            - These allow programs to be compiled with NLS (Native Language Support), 
                + enabling them to output messages in the user's native language.
    - Installed
        + Programs: autopoint, envsubst, gettext, gettext.sh, gettextize, msgattrib, msgcat, msgcmp, msgcomm, msgconv, msgen, msgexec, msgfilter, msgfmt, msggrep, msginit, msgmerge, msgunfmt, msguniq, ngettext, recode-sr-latin, and xgettext
        + Libraries: libasprintf.so, libgettextlib.so, libgettextpo.so, libgettextsrc.so, libtextstyle.so, and preloadable_libintl.so
        + Directories: /usr/lib/gettext, /usr/share/doc/gettext-0.22, /usr/share/gettext, and /usr/share/gettext-0.22

- Prepare source environment from scratch
    - Notes
        + Do this if you have removed the previous extracted directory

    - Extract tar file
        ```console
        tar -xvf gettext-[version].tar.xz
        ```

- Change directory into source file
    ```console
    cd gettext-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr    \
                --disable-static \
                --docdir=/usr/share/doc/gettext-0.22
    ```

- Compile the package
    - Notes
        - If you encountered build errors, 
            - Either delete this folder and re-extract a new copy or
            - Perform `make clean`
    ```console
    make
    ```

- To test the results (this takes a long time, around 3 SBUs)
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    chmod -v 0755 /usr/lib/preloadable_libintl.so
    ```

#### Bison - Pass 2
- Information
    + File Name: bison-[version].tar.xz
    + Estimated required disk space: 62MB
    - Description: 
        + More Information: [Section 8.33.2, “Contents of Bison.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/bison.html#contents-bison)
    - Package Contents
        - parser generator
    - Installed
        - Programs:
            + bison : Generates, from a series of rules, a program for analyzing the structure of text files; Bison is a replacement for Yacc (Yet Another Compiler Compiler)
            + yacc : A wrapper for bison, meant for programs that still call yacc instead of bison; it calls bison with the -y option
        - Libraries:
            + liby.a : The Yacc library containing implementations of Yacc-compatible yyerror and main functions; this library is normally not very useful, but POSIX requires it
        - Directories: /usr/share/bison

- Prepare source environment from scratch
    - Notes
        + Do this if you have removed the previous extracted directory

    - Extract tar file
        ```console
        tar -xvf bison-[version].tar.xz
        ```

- Change directory into source file
    ```console
    cd bison-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr \
                --docdir=/usr/share/doc/bison-3.8.2
    ```

- Compile the package
    - Notes
        - If you encountered build errors, 
            - Either delete this folder and re-extract a new copy or
            - Perform `make clean`
    ```console
    make
    ```

- Test the results (about 5.5 SBU)
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    ```

#### Grep - Pass 2
- Information
    + File Name: grep-[version].tar.xz
    + Estimated required disk space: 39MB
    - Description: 
        + More Information: [Section 8.34.2, “Contents of Grep.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/grep.html#contents-grep)
    - Package Contents
        + programs for searching through the contents of files
    - Installed
        - Programs:
            + egrep : Prints lines matching an extended regular expression. It is obsolete, use grep -E instead
            + fgrep : Prints lines matching a list of fixed strings. It is obsolete, use grep -F instead
            + grep : Prints lines matching a basic regular expression
        + Libraries:
        + Directories:

- Prepare source environment from scratch
    - Notes
        + Do this if you have removed the previous extracted directory

    - Extract tar file
        ```console
        tar -xvf grep-[version].tar.xz
        ```

- Change directory into source file
    ```console
    cd grep-[version]
    ```

- Remove a warning about using egrep and fgrep that makes tests on some packages fail:
    ```console
    sed -i "s/echo/#echo/" src/egrep.sh
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr
    ```

- Compile the package
    - Notes
        - If you encountered build errors, 
            - Either delete this folder and re-extract a new copy or
            - Perform `make clean`
    ```console
    make
    ```

- Test the results
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    ```

#### Bash - Pass 2
- Information
    + File Name: bash-[version].tar.gz
    + Estimated required disk space: 52MB
    - Description: 
        + More Information: [Section 8.35.2, “Contents of Bash.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/bash.html#contents-bash)
    - Package Contents
        + Bourne-Again Shell
    - Installed
        - Programs:
            + bash : A widely-used command interpreter; it performs many types of expansions and substitutions on a given command line before executing it, thus making this interpreter a powerful tool
            + bashbug : A shell script to help the user compose and mail standard formatted bug reports concerning bash
            + sh : A symlink to the bash program; when invoked as sh, bash tries to mimic the startup behavior of historical versions of sh as closely as possible, while conforming to the POSIX standard as well
        + Libraries:
        + Directories: /usr/include/bash, /usr/lib/bash, and /usr/share/doc/bash-5.2.15

- Prepare source environment from scratch
    - Notes
        + Do this if you have removed the previous extracted directory

    - Extract tar file
        ```console
        tar -xvzf bash-[version].tar.gz
        ```

    - Change directory into source file
        ```console
        cd bash-[version]
        ```

- If you are continuing from an existing directory
    - Change directory into source file
        ```console
        cd bash-[version]
        ```

    - Clean the repository
        ```console
        make clean
        ```

- Configure and prepare for compilation
    - Options
        + --with-installed-readline : This option tells Bash to use the readline library that is already installed on the system rather than using its own readline version.
    ```console
    ./configure --prefix=/usr             \
                --without-bash-malloc     \
                --with-installed-readline \
                --docdir=/usr/share/doc/bash-5.2.15
    ```

- Compile the package
    ```console
    make
    ```

- (Optional) Prepare the tests
    - Ensure that the 'tester' user can write to the sources tree
        ```console
        chown -Rv tester .
        ```
    - Spawn a new pseudo terminal using Expect and run the tests as the tester user
        - Explanation
            + The test suite of this package is designed to be run as a non-root user who owns the terminal connected to standard input. 
            + This is to satisfy that requirement
        - Notes
            - The test suite uses diff to detect the difference between test script output and the expected output. 
                - Any output from diff (prefixed with < and >) indicates a test failure, 
                    + unless there is a message saying the difference can be ignored. 
                + One test named run-builtins is known to fail on some host distros with a difference on the first line of the output.
        ```console
        su -s /usr/bin/expect tester << EOF
        set timeout -1
        spawn make tests
        expect eof
        lassign [wait] _ _ _ value
        exit $value
        EOF
        ```

- Install the package
    ```console
    make install
    ```

- Run the newly compiled bash program (replacing the one that is currently being executed)
    ```console
    exec /usr/bin/bash --login
    ```

#### Libtool
- Information
    + File Name: libtool-[version].tar.xz
    + Estimated required disk space: 45MB
    - Description: 
    - Package Contents
        - the GNU generic library support script.
            + It makes the use of shared libraries simpler with a consistent, portable interface
    - Installed
        - Programs:
            + libtool : Provides generalized library-building support services
            + libtoolize : Provides a standard way to add libtool support to a package
        - Libraries: 
            + libltdl : Hides the various difficulties of opening dynamically loaded libraries
        + Directories: /usr/include/libltdl and /usr/share/libtool

- Extract tar file
    ```console
    tar -xvf libtool-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd libtool-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr
    ```

- Compile the package
    ```console
    make
    ```

- Test the results
    - Explanation
        - Parameters
            + -k : Continue even if errors are encountered
    - Notes
        - The test time for Libtool can be reduced significantly on a system with multiple cores. 
            - To do this, append `TESTSUITEFLAGS=-j<N>` to the check. 
                + For instance, using -j4 can reduce the test time by over 60 percent.
        - Five tests are known to fail in the LFS build environment due to a circular dependency, 
            + but these tests pass if rechecked after automake has been installed. 
            + Additionally, with grep-3.8, two tests will trigger a warning for non-POSIX regular expressions and fail.
    ```console
    make -k check
    ```

- Install the package
    ```console
    make install
    ```

- Remove a useless static library
    ```console
    rm -fv /usr/lib/libltdl.a
    ```

#### GDBM
- Information
    + File Name: gdbm-[version].tar.gz
    + Estimated required disk space: 13MB
    - Description: the GNU Database Manager. 
        + It is a library of database functions that uses extensible hashing and works like the standard UNIX dbm. 
        - The library provides primitives for storing key/data pairs, 
            + searching and retrieving the data by its key and deleting a key along with its data
    - Package Contents
    - Installed
        - Programs:
            + gdbm_dump : Dumps a GDBM database to a file
            + gdbm_load : Recreates a GDBM database from a dump file
            + gdbmtool : Tests and modifies a GDBM database
        - Libraries: 
            + libgdbm : Contains functions to manipulate a hashed database
            + libgdbm_compat : Compatibility library containing older DBM functions
        + Directories: 

- Extract tar file
    ```console
    tar -xvzf gdbm-[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd gdbm-[version]
    ```

- Configure and prepare for compilation
    - Explanation
        - Parameters
            + --enable-libgdbm-compat : This switch enables building the libgdbm compatibility library. Some packages outside of LFS may require the older DBM routines it provides.
    ```console
    ./configure --prefix=/usr    \
                --disable-static \
                --enable-libgdbm-compat
    ```

- Compile the package
    ```console
    make
    ```

- Test the results
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    ```

#### Gperf
- Information
    + File Name: gperf-[version].tar.gz
    + Estimated required disk space: 6.1MB
    - Description: Gperf generates a perfect hash function from a key set.
    - Package Contents
    - Installed
        - Programs:
            + gperf : Generates a perfect hash from a key set
        - Libraries: 
        + Directories: /usr/share/doc/gperf-3.1

- Extract tar file
    ```console
    tar -xvzf gperf-[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd gperf-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr \
                --docdir=/usr/share/doc/gperf-3.1
    ```

- Compile the package
    ```console
    make
    ```

- Test the results
    - Notes
        + The tests are known to fail if running multiple simultaneous tests (-j option greater than 1)
    ```console
    make -j1 check
    ```

- Install the package
    ```console
    make install
    ```

#### Expat
- Information
    + File Name: expat-[version].tar.xz
    + Estimated required disk space: 12MB
    - Description: a stream oriented C library for parsing XML
    - Package Contents
    - Installed
        - Programs:
            + xmlwf : Is a non-validating utility to check whether or not XML documents are well formed
        - Libraries: 
            + libexpat.so : Contains API functions for parsing XML
        + Directories: /usr/share/doc/expat-2.5.0

- Extract tar file
    ```console
    tar -xvf expat-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd expat-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr    \
                --disable-static \
                --docdir=/usr/share/doc/expat-2.5.0
    ```

- Compile the package
    ```console
    make
    ```

- Test the results
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    ```

- (Optional) Install the documentation
    ```console
    install -v -m644 doc/*.{html,css} /usr/share/doc/expat-2.5.0
    ```

#### Inetutils
- Information
    + File Name: inetutils-[version].tar.xz
    + Estimated required disk space: 31MB
    - Description:
    - Package Contents
        + programs for basic networking
    - Installed
        - Programs: dnsdomainname, ftp, ifconfig, hostname, ping, ping6, talk, telnet, tftp, and traceroute
        - Libraries: 
        + Directories: 

- Extract tar file
    ```console
    tar -xvf inetutils-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd inetutils-[version]
    ```

- Configure and prepare for compilation
    - Explanation
        - Configure Options
            + --disable-logger : This option prevents Inetutils from installing the logger program, which is used by scripts to pass messages to the System Log Daemon. Do not install it because Util-linux installs a more recent version.
            + --disable-whois : This option disables the building of the Inetutils whois client, which is out of date. Instructions for a better whois client are in the BLFS book.
            + --disable-r* : These parameters disable building obsolete programs that should not be used due to security issues. The functions provided by these programs can be provided by the openssh package in the BLFS book.
            + --disable-servers : This disables the installation of the various network servers included as part of the Inetutils package. These servers are deemed not appropriate in a basic LFS system. Some are insecure by nature and are only considered safe on trusted networks. Note that better replacements are available for many of these servers.
    ```console
    ./configure --prefix=/usr        \
                --bindir=/usr/bin    \
                --localstatedir=/var \
                --disable-logger     \
                --disable-whois      \
                --disable-rcp        \
                --disable-rexec      \
                --disable-rlogin     \
                --disable-rsh        \
                --disable-servers
    ```

- Compile the package
    ```console
    make
    ```

- Test the results
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    ```

- Move a program to the proper location
    ```console
    mv -v /usr/{,s}bin/ifconfig
    ```

#### Less
- Information
    + File Name: less-[version].tar.gz
    + Estimated required disk space: 12MB
    - Description: a text file viewer
    - Package Contents
    - Installed
        - Programs:
            + less : A file viewer or pager; it displays the contents of the given file, letting the user scroll, find strings, and jump to marks
            + lessecho : Needed to expand meta-characters, such as * and ?, in filenames on Unix systems
            + lesskey : Used to specify the key bindings for less
        - Libraries: 
        + Directories: 

- Extract tar file
    ```console
    tar -xvzf less-[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd less-[version]
    ```

- Configure and prepare for compilation
    - Explanation
        - Configure Options
            + --sysconfdir=/etc : This option tells the programs created by the package to look in /etc for the configuration files.
    ```console
    ./configure --prefix=/usr \
                --sysconfdir=/etc
    ```

- Compile the package
    ```console
    make
    ```

- Test the results
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    ```

#### Perl - Pass 2
- Information
    + File Name: perl-[version].tar.xz
    + Estimated required disk space: 239MB
    - Description: 
        + More Information: [Section 8.42.2, “Contents of Perl.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/perl.html#contents-perl)
    - Package Contents
        - the Practical Extraction and Report Language (Perl)
    - Installed
        + Programs: corelist, cpan, enc2xs, encguess, h2ph, h2xs, instmodsh, json_pp, libnetcfg, perl, perl5.38.0 (hard link to perl), perlbug, perldoc, perlivp, perlthanks (hard link to perlbug), piconv, pl2pm, pod2html, pod2man, pod2text, pod2usage, podchecker, podselect, prove, ptar, ptardiff, ptargrep, shasum, splain, xsubpp, and zipdetails
        + Libraries: Too Many
        + Directories: /usr/lib/perl5

- Prepare source environment from scratch
    - Notes
        + Do this if you have removed the previous extracted directory

    - Extract tar file
        ```console
        tar -xvf perl-[version].tar.xz
        ```

- Change directory into source file
    ```console
    cd perl-[version]
    ```

- This version of Perl builds the Compress::Raw::Zlib and Compress::Raw::BZip2 modules. 
   + By default Perl will use an internal copy of the sources for the build. 
   + Issue the following command so that Perl will use the libraries installed on the system:
   ```console
   export BUILD_ZLIB=False
   export BUILD_BZIP2=0
   ```

- Configure and prepare for compilation
    - Configure Options
        + -Dvendorprefix=/usr : This ensures perl knows how to tell packages where they should install their Perl modules.
        + -Dpager="/usr/bin/less -isR" : This ensures that less is used instead of more.
        + -Dman1dir=/usr/share/man/man1 -Dman3dir=/usr/share/man/man3 : Since Groff is not installed yet, Configure will not create man pages for Perl. These parameters override this behavior.
        + -Duseshrplib : Build a shared libperl needed by some Perl modules.
        + -Dusethreads : Build Perl with support for threads.
        + -Dprivlib,-Darchlib,-Dsitelib,... : These settings define where Perl looks for installed modules. The LFS editors chose to put them in a directory structure based on the MAJOR.MINOR version of Perl (5.38) which allows upgrading Perl to newer patch levels (the patch level is the last dot separated part in the full version string like 5.38.0) without reinstalling all of the modules.
    - Notes
        - To have full control over the way Perl is set up, you can 
            + remove the “-des” options from the following command and hand-pick the way this package is built. 
            + Alternatively, use the command exactly as shown below to use the defaults that Perl auto-detects
    ```console
    sh Configure -des                                         \
                 -Dprefix=/usr                                \
                 -Dvendorprefix=/usr                          \
                 -Dprivlib=/usr/lib/perl5/5.38/core_perl      \
                 -Darchlib=/usr/lib/perl5/5.38/core_perl      \
                 -Dsitelib=/usr/lib/perl5/5.38/site_perl      \
                 -Dsitearch=/usr/lib/perl5/5.38/site_perl     \
                 -Dvendorlib=/usr/lib/perl5/5.38/vendor_perl  \
                 -Dvendorarch=/usr/lib/perl5/5.38/vendor_perl \
                 -Dman1dir=/usr/share/man/man1                \
                 -Dman3dir=/usr/share/man/man3                \
                 -Dpager="/usr/bin/less -isR"                 \
                 -Duseshrplib                                 \
                 -Dusethreads
       ```

- Compile the package
    ```console
    make
    ```

- Test the results (Approximately 11 SBU)
    ```console
    make test
    ```

- Install the package
    ```console
    make install
    ```

- Clean up
    ```console
    unset BUILD_ZLIB BUILD_BZIP2
    ```

#### XML::Parser
- Information
    + File Name: XML-Parser-[version].tar.gz
    + Estimated required disk space: 2.3MB
    - Description: The XML::Parser module is a Perl interface to James Clark's XML parser, Expat.
    - Package Contents
    - Installed
        + Programs:
        - Module
            + Expat.so : provides the Perl Expat interface
        + Libraries: 
        + Directories: 

- Extract tar file
    ```console
    tar -xvzf XML-Parser-[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd XML-Parser-[version]
    ```

- Configure and prepare for compilation
    ```console
    perl Makefile.PL
    ```

- Compile the package
    ```console
    make
    ```

- Test the results
    ```console
    make test
    ```

- Install the package
    ```console
    make install
    ```

#### Intltool
- Information
    + File Name: intltool-[version].tar.gz
    + Estimated required disk space: 1.5MB
    - Description: The Intltool is an internationalization tool used for extracting translatable strings from source files.
    - Package Contents
    - Installed
        + Programs: intltool-extract, intltool-merge, intltool-prepare, intltool-update, and intltoolize
        + Libraries: 
        + Directories: /usr/share/doc/intltool-0.51.0 and /usr/share/intltool

- Extract tar file
    ```console
    tar -xvzf intltool-[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd intltool-[version]
    ```

- Fix a warning that is caused by perl-5.22 and later
    - Explanation
        - The regular expression looks unusual because of all the backslashes. 
            + What it does is add a backslash before the right brace character in the sequence '\${' resulting in '\$\{'.
    ```console
    sed -i 's:\\\${:\\\$\\{:' intltool-update.in
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr
    ```

- Compile the package
    ```console
    make
    ```

- Test the results
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    install -v -Dm644 doc/I18N-HOWTO /usr/share/doc/intltool-0.51.0/I18N-HOWTO
    ```

#### Autoconf
- Information
    + File Name: autoconf-[version].tar.xz
    + Estimated required disk space: 24MB
    - Description: 
    - Package Contents
        + programs for producing shell scripts that can automatically configure source code
    - Installed
        + Programs: autoconf, autoheader, autom4te, autoreconf, autoscan, autoupdate, and ifnames
        + Libraries: 
        + Directories: /usr/share/autoconf

- Extract tar file
    ```console
    tar -xvf autoconf-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd autoconf-[version]
    ```

- Fix several problems with the tests caused by bash-5.2 and later
    ```console
    sed -e 's/SECONDS|/&SHLVL|/'               \
        -e '/BASH_ARGV=/a\        /^SHLVL=/ d' \
        -i.orig tests/local.at
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr
    ```

- Compile the package
    ```console
    make
    ```

- Test the results
    - Notes
       - The test time for autoconf can be reduced significantly on a system with multiple cores. 
           - To do this, append `TESTSUITEFLAGS=-j<N>` to the make command. 
               + For instance, using -j4 can reduce the test time by over 60 percent.
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    ```

#### Automake
- Information
    + File Name: automake-[version].tar.xz
    + Estimated required disk space: 114MB
    - Description: 
    - Package Contents
        + contains programs for generating Makefiles for use with Autoconf
    - Installed
        + Programs: aclocal, aclocal-1.16 (hard linked with aclocal), automake, and automake-1.16 (hard linked with automake)
        + Libraries: 
        + Directories: /usr/share/aclocal-1.16, /usr/share/automake-1.16, and /usr/share/doc/automake-1.16.5

- Extract tar file
    ```console
    tar -xvf automake-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd automake-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr \
                --docdir=/usr/share/doc/automake-1.16.5
    ```

- Compile the package
    ```console
    make
    ```

- Test the results
    - Notes
        + Using the -j4 make option speeds up the tests, even on systems with only one processor, due to internal delays in individual tests
        + The test t/subobj.sh is known to fail.
    ```console
    make -j4 check
    ```

- Install the package
    ```console
    make install
    ```

#### OpenSSL
- Information
    + File Name: openssl-[version].tar.gz
    + Estimated required disk space: 587MB
    - Description: 
    - Package Contents
        - contains management tools and libraries relating to cryptography. 
            - These are useful for providing cryptographic functions to other packages, such as 
                + OpenSSH, 
                + email applications, and 
                + web browsers (for accessing HTTPS sites)
    - Installed
        - Programs: 
            + c_rehash : is a Perl script that scans all files in a directory and adds symbolic links to their hash values. Use of c_rehash is considered obsolete and should be replaced by openssl rehash command
            + openssl : is a command-line tool for using the various cryptography functions of OpenSSL's crypto library from the shell. It can be used for various functions which are documented in man 1 openssl
        - Libraries: 
            + libcrypto.so : implements a wide range of cryptographic algorithms used in various Internet standards. The services provided by this library are used by the OpenSSL implementations of SSL, TLS and S/MIME, and they have also been used to implement OpenSSH, OpenPGP, and other cryptographic standards
            + libssl.so : implements the Transport Layer Security (TLS v1) protocol. It provides a rich API, documentation on which can be found by running man 7 ssl
        + Directories: /etc/ssl, /usr/include/openssl, /usr/lib/engines and /usr/share/doc/openssl-3.1.2

- Extract tar file
    ```console
    tar -xvzf openssl-[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd openssl-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./config --prefix=/usr         \
             --openssldir=/etc/ssl \
             --libdir=lib          \
             shared                \
             zlib-dynamic
    ```

- Compile the package
    ```console
    make
    ```

- Test the results
    - Notes
        - One test, 30-test_afalg.t, is known to fail if the host kernel does not have CONFIG_CRYPTO_USER_API_SKCIPHER enabled, or does not have any options providing an AES with CBC implementation (for example, the combination of CONFIG_CRYPTO_AES and CONFIG_CRYPTO_CBC, or CONFIG_CRYPTO_AES_NI_INTEL if the CPU supports AES-NI) enabled. 
            + If it fails, it can safely be ignored.
    ```console
    make test
    ```

- Install the package
    ```console
    sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
    make MANSUFFIX=ssl install
    ```

- Add the version to the documentation directory name, to be consistent with other packages
    ```console
    mv -v /usr/share/doc/openssl /usr/share/doc/openssl-3.1.2
    ```

- (Optional) Install some additional documentation
    ```console
    cp -vfr doc/* /usr/share/doc/openssl-3.1.2
    ```

- Important Notes
    - You should update OpenSSL when a new version which fixes vulnerabilities is announced. 
        - Since OpenSSL 3.0.0, the OpenSSL versioning scheme follows the MAJOR.MINOR.PATCH format. 
            + API/ABI compatibility is guaranteed for the same MAJOR version number. 
        - Because LFS installs only the shared libraries, 
            + there is no need to recompile packages which link to libcrypto.so or libssl.so when upgrading to a version with the same MAJOR version number.
        - If OpenSSH is installed, it will be an exception of the general rule above. 
            - It contains an over-restrictive OpenSSL version check, so both SSH client and SSH server will refuse to start if OpenSSL is updated with MAJOR version number unchanged but MINOR version number changed. 
                + You need to rebuild OpenSSH after such an upgrade. 
            - If OpenSSH is being used to access the system, 
                + you must rebuild and reinstall it after upgrading OpenSSL to a new MINOR version number before logout or you won't be able to login via SSH anymore.
        - However, any running programs linked to those libraries need to be stopped and restarted. 
            + Read the related entries in Section 8.2.1, “Upgrade Issues” for details.

#### Kmod
- Information
    + File Name: kmod-[version].tar.xz
    + Estimated required disk space: 12MB
    - Description: 
    - Package Contents
        + contains libraries and utilities for loading kernel modules
    - Installed
        - Programs: depmod (link to kmod), insmod (link to kmod), kmod, lsmod (link to kmod), modinfo (link to kmod), modprobe (link to kmod), and rmmod (link to kmod)
        - Libraries: libkmod.so
        + Directories: 

- Extract tar file
    ```console
    tar -xvf kmod-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd kmod-[version]
    ```

- Configure and prepare for compilation
    - Configure Options
        + --with-openssl : This option enables Kmod to handle PKCS7 signatures for kernel modules.
        + --with-xz, --with-zlib, and --with-zstd : These options enable Kmod to handle compressed kernel modules.
    ```console
    ./configure --prefix=/usr          \
                --sysconfdir=/etc      \
                --with-openssl         \
                --with-xz              \
                --with-zstd            \
                --with-zlib
    ```

- Compile the package
    ```console
    make
    ```

- Test the results (Post-Base Installation)
    - Notes
        - The test suite of this package requires raw kernel headers (not the “sanitized” kernel headers installed earlier), 
            + which are beyond the scope of LFS.

- Install the package
    ```console
    make install
    ```

- Create symlinks for compatibility with Module-Init-Tools (the package that previously handled Linux kernel modules)
    ```console
    for target in depmod insmod modinfo modprobe rmmod; do
      ln -sfv ../bin/kmod /usr/sbin/$target
    done

    ln -sfv kmod /usr/bin/lsmod
    ```

#### Libelf from Elfutils
- Information
    + File Name: elfutils-[version].tar.bz2
    + Estimated required disk space: 122MB
    - Description: Libelf is a library for handling ELF (Executable and Linkable Format) files.
    - Package Contents
        + Libelf is part of the elfutils-0.189 package
    - Installed
        - Programs: 
        - Libraries:
            + libelf.so : Contains API functions to handle ELF object files
        + Directories: /usr/include/elfutils

- Extract tar file
    ```console
    tar -xvf elfutils-[version].tar.bz2
    ```

- Change directory into source file
    ```console
    cd elfutils-[version]
    ```

- Configure and prepare for compilation
    - Configure Options
        + --with-openssl : This option enables Kmod to handle PKCS7 signatures for kernel modules.
        + --with-xz, --with-zlib, and --with-zstd : These options enable Kmod to handle compressed kernel modules.
    ```console
    ./configure --prefix=/usr                \
                --disable-debuginfod         \
                --enable-libdebuginfod=dummy
    ```

- Compile the package
    ```console
    make
    ```

- Test the results
    ```console
    make check
    ```

- Install only Libelf
    ```console
    make -C libelf install
    install -vm644 config/libelf.pc /usr/lib/pkgconfig
    rm /usr/lib/libelf.a
    ```

#### Libffi
- Information
    + File Name: libffi-[version].tar.gz
    + Estimated required disk space: 11MB
    - Description: The Libffi library provides a portable, high level programming interface to various calling conventions. 
        + This allows a programmer to call any function specified by a call interface description at run time.
        + FFI stands for Foreign Function Interface. 
        - An FFI allows a program written in one language to call a program written in another language. 
            + Specifically, Libffi can provide a bridge between an interpreter like Perl, or Python, and shared library subroutines written in C, or C++.
    - Package Contents
    - Installed
        - Programs: 
        - Libraries: 
            + libffi.so : Contains the foreign function interface API functions
        + Directories: 

- Extract tar file
    ```console
    tar -xvzf libffi-[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd libffi-[version]
    ```

- Configure and prepare for compilation
    - Configure Options
        + --with-gcc-arch=native : Ensure GCC optimizes for the current system. If this is not specified, the system is guessed and the code generated may not be correct. If the generated code will be copied from the native system to a less capable system, use the less capable system as a parameter. For details about alternative system types, see the [x86 options in the GCC manual](https://gcc.gnu.org/onlinedocs/gcc-13.2.0/gcc/x86-Options.html).
    - Notes
        - Like GMP, Libffi builds with optimizations specific to the processor in use. 
            + If building for another system, change the value of the --with-gcc-arch= parameter in the following command to an architecture name fully implemented by the CPU on that system. If this is not done, all applications that link to libffi will trigger Illegal Operation Errors.
    ```console
    ./configure --prefix=/usr          \
                --disable-static       \
                --with-gcc-arch=native
    ```

- Compile the package
    ```console
    make
    ```

- Test the results
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    ```

#### Python - Pass 2
- Information
    + File Name: Python-[version].tar.xz
    + Estimated required disk space: 370MB
    - Description: 
        + More Information: [Section 8.51.2, “Contents of Python 3.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/Python.html#contents-python)
    - Package Contents
        - the Python development environment. 
            + It is useful for object-oriented programming, writing scripts, prototyping large programs, and developing entire applications. 
            + Python is an interpreted computer language
    - Installed
        + Programs: 2to3, idle3, pip3, pydoc3, python3, and python3-config
        + Libraries: libpython3.11.so and libpython3.so
        + Directories: /usr/include/python3.11, /usr/lib/python3, and /usr/share/doc/python-3.11.4

- Prepare source environment from scratch
    - Notes
        + Do this if you have removed the previous extracted directory

    - Extract tar file
        ```console
        tar -xvf Python-[version].tar.xz
        ```

- Change directory into source file
    ```console
    cd Python-[version]
    ```

- Configure and prepare for compilation
    - Configure Options
        + --with-system-expat : This switch enables linking against the system version of Expat.
        + --with-system-ffi : This switch enables linking against the system version of libffi.so.
        + --enable-optimizations : This switch enables extensive, but time-consuming, optimization steps. The interpreter is built twice; tests performed on the first build are used to improve the optimized final version.
    ```console
    ./configure --prefix=/usr        \
                --enable-shared      \
                --with-system-expat  \
                --with-system-ffi    \
                --enable-optimizations
    ```

- Compile the package
    ```console
    make
    ```

- (Optional) Test the results
    + Running the tests at this point is not recommended. 
    + The tests are known to hang indefinitely in the partial LFS environment. 
    - If desired, 
        + the tests can be rerun at the end of this chapter, or when Python 3 is reinstalled in BLFS. 
    + To run the tests anyway, issue 
    ```console
    make test
    ```

- Install the package
    ```console
    make install
    ```

- (Optional) We use the pip3 command to install Python 3 programs and modules for all users as root in several places in this book. 
    - This conflicts with the Python developers' recommendation: to install packages into a virtual environment, or into the home directory of a regular user (by running pip3 as this user). 
        + A multi-line warning is triggered whenever pip3 is issued by the root user.
    - The main reason for the recommendation is to avoid conflicts with the system's package manager (dpkg, for example). 
        - LFS does not have a system-wide package manager, so this is not a problem. 
            + Also, pip3 will check for a new version of itself whenever it's run. 
    - Since domain name resolution is not yet configured in the LFS chroot environment, 
        + pip3 cannot check for a new version of itself, and will produce a warning.
    - After we boot the LFS system and set up a network connection, 
        - a different warning will be issued, 
            + telling the user to update pip3 from a pre-built wheel on PyPI (whenever a new version is available). 
            + But LFS considers pip3 to be a part of Python 3, so it should not be updated separately. 
        - Also, an update from a pre-built wheel would deviate from our objective: to build a Linux system from source code. 
            + So the warning about a new version of pip3 should be ignored as well. 
    - If you wish, you can suppress all these warnings by running the following command, which creates a configuration file:
        ```console
        cat > /etc/pip.conf << EOF
        [global]
        root-user-action = ignore
        disable-pip-version-check = true
        EOF
        ```

- Important Notes
   - In LFS and BLFS we normally build and install Python modules with the pip3 command. 
       - Please be sure that the pip3 install commands in both books are run as the root user (unless it's for a Python virtual environment). 
           + Running pip3 install as a non-root user may seem to work, but it will cause the installed module to be inaccessible by other users.
       - pip3 install will not reinstall an already installed module automatically. 
           - When using the pip3 install command to upgrade a module (for example, from meson-0.61.3 to meson-0.62.0), 
               + insert the option --upgrade into the command line. 
           - If it's really necessary to downgrade a module, or reinstall the same version for some reason, 
               + insert --force-reinstall --no-deps into the command line.

- (Optional) Install the preformatted documentation
    - Documentation Install Commands
        + --no-same-owner and --no-same-permissions : Ensure the installed files have the correct ownership and permissions. Without these options, tar will install the package files with the upstream creator's values.
    ```console
    install -v -dm755 /usr/share/doc/python-3.11.4/html

    tar --strip-components=1  \
        --no-same-owner       \
        --no-same-permissions \
        -C /usr/share/doc/python-3.11.4/html \
        -xvf ../python-3.11.4-docs-html.tar.bz2
    ```

#### Flit-Core
- Information
    + File Name: flit_core-[version].tar.gz
    + Estimated required disk space: 1.7MB
    - Description: Flit-core is the distribution-building parts of Flit (a packaging tool for simple Python modules).
    - Package Contents
    - Installed
        - Programs: 
        - Libraries: 
        + Directories: /usr/lib/python3.11/site-packages/flit_core and /usr/lib/python3.11/site-packages/flit_core-3.9.0.dist-info

- Extract tar file
    ```console
    tar -xvzf flit_core-[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd flit_core-[version]
    ```

- Build/Compile the package
    - pip3 configuration options and commands:
        + wheel : This command builds the wheel archive for this package.
        + -w dist : Instructs pip to put the created wheel into the dist directory.
        + --no-build-isolation, --no-deps, and --no-index : These options prevent fetching files from the online package repository (PyPI). If packages are installed in the correct order, pip won't need to fetch any files in the first place; these options add some safety in case of user error.
    ```console
    pip3 wheel -w dist --no-build-isolation --no-deps $PWD
    ```

- Install the package
    - pip3 installation options
        + install : This command installs the package.
        + --find-links dist : Instructs pip to search for wheel archives in the dist directory.
    ```console
    pip3 install --no-index --no-user --find-links dist flit_core
    ```

#### Wheel
- Information
    + File Name: wheel-[version].tar.gz
    + Estimated required disk space: 1.5MB
    - Description: Wheel is a Python library that is the reference implementation of the Python wheel packaging standard.
    - Package Contents
    - Installed
        - Programs: 
            + wheel : is a utility to unpack, pack, or convert wheel archives
        - Libraries: 
        + Directories: /usr/lib/python3.11/site-packages/wheel and /usr/lib/python3.11/site-packages/wheel-0.41.1.dist-info

- Extract tar file
    ```console
    tar -xvzf wheel-[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd wheel-[version]
    ```

- Build/Compile the package
    ```console
    pip3 wheel -w dist --no-build-isolation --no-deps $PWD
    ```

- Install the package
    ```console
    pip3 install --no-index --find-links=dist wheel
    ```

#### Ninja
- Information
    + File Name: ninja-[version].tar.gz
    + Estimated required disk space: 75MB
    - Description: Ninja is a small build system with a focus on speed.
    - Package Contents
    - Installed
        - Programs: 
            + ninja : is the Ninja build system
        - Libraries: 
        + Directories: 

- Extract tar file
    ```console
    tar -xvzf ninja-[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd ninja-[version]
    ```

- Set Environment Variables
    - Explanation
        - When run, ninja normally utilizes the greatest possible number of processes in parallel. 
            + By default this is the number of cores on the system, plus two. 
            + This may overheat the CPU, or make the system run out of memory. 
        - When ninja is invoked from the command line, passing the -jN parameter will limit the number of parallel processes. 
            + Some packages embed the execution of ninja, and do not pass the -j parameter on to it.
        - Using the optional procedure below allows a user to limit the number of parallel processes via an environment variable, NINJAJOBS.
           - i.e.
              + `NINJAJOBS=4` will limit ninja to four parallel processes.
    ```console
    export NINJAJOBS=4
    ```

- (Optional) Make ninja recognize the environment variable NINJAJOBS by running the stream editor
    ```console
    sed -i '/int Guess/a \
      int   j = 0;\
      char* jobs = getenv( "NINJAJOBS" );\
      if ( jobs != NULL ) j = atoi( jobs );\
      if ( j > 0 ) return j;\
    ' src/ninja.cc
    ```

- Build/Compile the package
    - Build Options
        + --bootstrap : This parameter forces Ninja to rebuild itself for the current system.
    ```console
    python3 configure.py --bootstrap
    ```

- Test the results
    ```console
    ./ninja ninja_test
    ./ninja_test --gtest_filter=-SubprocessTest.SetWithLots
    ```

- Install the package
    ```console
    install -vm755 ninja /usr/bin/
    install -vDm644 misc/bash-completion /usr/share/bash-completion/completions/ninja
    install -vDm644 misc/zsh-completion  /usr/share/zsh/site-functions/_ninja
    ```

#### Meson
- Information
    + File Name: meson-[version].tar.gz
    + Estimated required disk space: 42MB
    - Description: Meson is an open source build system designed to be both extremely fast and as user friendly as possible.
    - Package Contents
    - Installed
        - Programs: 
            + meson : A high productivity build system
        - Libraries: 
        + Directories: /usr/lib/python3.11/site-packages/meson-1.2.1.dist-info and /usr/lib/python3.11/site-packages/mesonbuild

- Extract tar file
    ```console
    tar -xvzf meson-[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd meson-[version]
    ```

- Compile the package
    ```console
    pip3 wheel -w dist --no-build-isolation --no-deps $PWD
    ```

- Testing
    + The test suite requires some packages outside the scope of LFS.

- Install the package
    - Installation Parameters
        + -w dist : Puts the created wheels into the dist directory.
        + --find-links dist : Installs wheels from the dist directory.
    ```console
    pip3 install --no-index --find-links dist meson
    install -vDm644 data/shell-completions/bash/meson /usr/share/bash-completion/completions/meson
    install -vDm644 data/shell-completions/zsh/_meson /usr/share/zsh/site-functions/_meson
    ```

#### Coreutils - Pass 2
- Information
    + File Name: coreutils-[version].tar.xz
    + Estimated required disk space: 165MB
    - Description: 
        + More Information: [Section 8.56.2, “Contents of Coreutils.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/coreutils.html#contents-coreutils)
    - Package Contents
        + basic utility programs needed by every operating system
    - Installed
        + Programs: [, b2sum, base32, base64, basename, basenc, cat, chcon, chgrp, chmod, chown, chroot, cksum, comm, cp, csplit, cut, date, dd, df, dir, dircolors, dirname, du, echo, env, expand, expr, factor, false, fmt, fold, groups, head, hostid, id, install, join, link, ln, logname, ls, md5sum, mkdir, mkfifo, mknod, mktemp, mv, nice, nl, nohup, nproc, numfmt, od, paste, pathchk, pinky, pr, printenv, printf, ptx, pwd, readlink, realpath, rm, rmdir, runcon, seq, sha1sum, sha224sum, sha256sum, sha384sum, sha512sum, shred, shuf, sleep, sort, split, stat, stdbuf, stty, sum, sync, tac, tail, tee, test, timeout, touch, tr, true, truncate, tsort, tty, uname, unexpand, uniq, unlink, users, vdir, wc, who, whoami, and yes
        + Libraries: libstdbuf.so (in /usr/libexec/coreutils)
        + Directories: /usr/libexec/coreutils

- Prepare source environment from scratch
    - Notes
        + Do this if you have removed the previous extracted directory

    - Extract tar file
        ```console
        tar -xvf coreutils-[version].tar.xz
        ```

- Change directory into source file
    ```console
    cd coreutils-[version]
    ```

- Apply a patch that will fixes the non-compliance and other internationalization-related bugs.
    - Explanation
        + POSIX requires that programs from Coreutils recognize character boundaries correctly even in multibyte locales. 
    - Notes
        + Many bugs have been found in this patch. When reporting new bugs to the Coreutils maintainers, please check first to see if those bugs are reproducible without this patch.
    ```console
    patch -Np1 -i ../coreutils-9.3-i18n-1.patch
    ```

- Configure and prepare for compilation
    - Options
        + autoreconf : The patch for internationalization has modified the build system, so the configuration files must be regenerated.
        + FORCE_UNSAFE_CONFIGURE=1 : This environment variable allows the package to be built by the root user.
        + --enable-no-install-program=kill,uptime : The purpose of this switch is to prevent Coreutils from installing programs that will be installed by other packages.
    ```console
    autoreconf -fiv
    FORCE_UNSAFE_CONFIGURE=1 ./configure \
                --prefix=/usr            \
                --enable-no-install-program=kill,uptime
    ```

- Compile the package
    ```console
    make
    ```

- (Optional) Run Testsuites
    - Notes
        + Skip down to “Install the package” if not running the test suite.
    - Run the tests that are meant to be run as user root
        ```console
        make NON_ROOT_USERNAME=tester check-root
        ```
    - Add a temporary group and make the user tester a part of it
        - Explanation
             - Because we are going to run the remainder of the tests as the tester user. 
                 + Certain tests require that the user be a member of more than one group. 
                 + Add a temporary group so that these tests are not skipped
        ```console
        groupadd -g 102 dummy -U tester
        ```
    - Fix some of the permissions so that the non-root user can compile and run the tests
        ```console
        chown -Rv tester . 
        ```
    - Run the tests
        - Notes
            + The test-getlogin test may fail in the LFS chroot environment.
        ```console
        su tester -c "PATH=$PATH make RUN_EXPENSIVE_TESTS=yes check"
        ```
    - Remove the temporary group
        ```console
        groupdel dummy
        ```

- Install the package
    ```console
    make install
    ```

- Move programs to the locations specified by the FHS
    ```console
    mv -v /usr/bin/chroot /usr/sbin
    mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
    sed -i 's/"1"/"8"/' /usr/share/man/man8/chroot.8
    ```

#### Check
- Information
    + File Name: check-[version].tar.gz
    + Estimated required disk space: 12MB
    - Description: Check is a unit testing framework for C.
    - Package Contents
    - Installed
        - Programs: 
            + checkmk : Awk script for generating C unit tests for use with the Check unit testing framework
        - Libraries: 
            + libcheck.so : Contains functions that allow Check to be called from a test program
        + Directories: 

- Extract tar file
    ```console
    tar -xvzf check-[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd check-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr \
                --disable-static
    ```

- Build/Compile the package
    ```console
    make
    ```

- Test the results
    ```console
    make check
    ```

- Install the package
    ```console
    make docdir=/usr/share/doc/check-0.15.2 install
    ```

#### Diffutils - Pass 2
- Information
    + File Name: diffutils-[version].tar.xz
    + Estimated required disk space: 36MB
    - Description: 
        + More Information: [Section 8.58.2, “Contents of Diffutils.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/diffutils.html#contents-diffutils)
    - Package Contents
        + programs that show the differences between files or directories
    - Installed
        - Programs:
            + cmp : Compares two files and reports any differences byte by byte
            + diff : Compares two files or directories and reports which lines in the files differ
            + diff3 : Compares three files line by line
            + sdiff : Merges two files and interactively outputs the results
        + Libraries:
        + Directories:

- Prepare source environment from scratch
    - Notes
        + Do this if you have removed the previous extracted directory

    - Extract tar file
        ```console
        tar -xvf diffutils-[version].tar.xz
        ```

    - Change directory into source file
        ```console
        cd diffutils-[version]
        ```

- If you are continuing from an existing directory
    - Change directory into source file
        ```console
        cd diffutils-[version]
        ```

    - Clean the repository
        ```console
        make clean
        ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr
    ```

- Compile the package
    ```console
    make
    ```

- Test the results
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    ```

#### Gawk - Pass 2
- Information
    + File Name: gawk-[version].tar.xz
    + Estimated required disk space: 46MB
    - Description: 
        + More Information: [Section 8.59.2, “Contents of Gawk.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/gawk.html#contents-gawk)
    - Package Contents
        + programs for manipulating text files
    - Installed
        - Programs:
            + awk : A link to gawk
            + gawk : A program for manipulating text files; it is the GNU implementation of awk
            + gawk-5.2.2 : A hard link to gawk
        + Libraries: filefuncs.so, fnmatch.so, fork.so, inplace.so, intdiv.so, ordchr.so, readdir.so, readfile.so, revoutput.so, revtwoway.so, rwarray.so, and time.so (all in /usr/lib/gawk)
        + Directories: /usr/lib/gawk, /usr/libexec/awk, /usr/share/awk, and /usr/share/doc/gawk-5.2.2

- Prepare source environment from scratch
    - Notes
        + Do this if you have removed the previous extracted directory

    - Extract tar file
        ```console
        tar -xvf gawk-[version].tar.xz
        ```

- Change directory into source file
    ```console
    cd gawk-[version]
    ```

- Ensure that some unneeded files are not installed
    ```console
    sed -i 's/extras//' Makefile.in
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr
    ```

- Compile the package
    ```console
    make
    ```

- Test the results
    ```console
    chown -Rv tester .
    su tester -c "PATH=$PATH make check"
    ```

- Install the package
    - Make overriden variable
        + LN='ln -f' : This variable ensures that the previous hard link installed in Section 6.9, “Gawk-5.2.2” is updated here.
    ```console
    make LN='ln -f' install
    ```

- Create a symbolic link to the awk man page
    - Explanation
        + The installation process already created awk as a symlink to gawk
        + create its man page as a symlink as well
    ```console
    ln -sv gawk.1 /usr/share/man/man1/awk.1
    ```

- (Optional) Install the documentation
    ```console
    mkdir -pv                                   /usr/share/doc/gawk-5.2.2
    cp    -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-5.2.2
    ```

#### Findutils - Pass 2
- Information
    + File Name: findutils-[version].tar.xz
    + Estimated required disk space: 51MB
    - Description: 
        + More Information: [Section 8.60.2, “Contents of Findutils.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/findutils.html#contents-findutils)
    - Package Contents
        - Programs to find files. 
        - Programs are provided to search through all the files in a directory tree and to create, maintain, and search a database (often faster than the recursive find, but unreliable unless the database has been updated recently). 
        - Findutils also supplies the xargs program, which can be used to run a specified command on each file selected by a search
    - Installed
        - Programs:
            + find : Searches given directory trees for files matching the specified criteria
            + locate : Searches through a database of file names and reports the names that contain a given string or match a given pattern
            + updatedb : Updates the locate database; it scans the entire file system (including other file systems that are currently mounted, unless told not to) and puts every file name it finds into the database
            + xargs : Can be used to apply a given command to a list of files
        + Libraries:
        + Directories: /var/lib/locate

- Prepare source environment from scratch
    - Notes
        + Do this if you have removed the previous extracted directory

    - Extract tar file
        ```console
        tar -xvf findutils-[version].tar.xz
        ```

    - Change directory into source file
        ```console
        cd findutils-[version]
        ```

- If you are continuing from an existing directory
    - Change directory into source file
        ```console
        cd findutils-[version]
        ```

    - Clean the repository
        ```console
        make clean
        ```

- Configure and prepare for compilation
    - Configuration Options
        + --localstatedir : This option moves the locate database to /var/lib/locate, which is the FHS-compliant location.
    ```console
    ./configure --prefix=/usr \
                --localstatedir=/var/lib/locate
    ```

- Compile the package
    ```console
    make
    ```

- Test the results
    ```console
    chown -Rv tester .
    su tester -c "PATH=$PATH make check"
    ```

- Install the package
    ```console
    make install
    ```

#### Groff
- Information
    + File Name: groff-[version].tar.gz
    + Estimated required disk space: 107MB
    - Description: 
    - Package Contents
        + contains programs for processing and formatting text and images
    - Installed
        + Programs: addftinfo, afmtodit, chem, eqn, eqn2graph, gdiffmk, glilypond, gperl, gpinyin, grap2graph, grn, grodvi, groff, groffer, grog, grolbp, grolj4, gropdf, grops, grotty, hpftodit, indxbib, lkbib, lookbib, mmroff, neqn, nroff, pdfmom, pdfroff, pfbtops, pic, pic2graph, post-grohtml, preconv, pre-grohtml, refer, roff2dvi, roff2html, roff2pdf, roff2ps, roff2text, roff2x, soelim, tbl, tfmtodit, and troff
        + Libraries:
        + Directories: /usr/lib/groff and /usr/share/doc/groff-1.23.0, /usr/share/groff

- Extract tar file
    ```console
    tar -xvzf groff-[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd groff-[version]
    ```

- Configure and prepare for compilation
    - Notes
        - Groff expects the environment variable 'PAGE' to contain the default paper size. 
            - For users in the United States, 'PAGE=letter' is appropriate. 
                + Elsewhere, 'PAGE=A4' may be more suitable. 
            - While the default paper size is configured during compilation, 
                + it can be overridden later by echoing either “A4” or “letter” to the /etc/papersize file.
                ```console
                echo -e "{A4|letter}" > /etc/papersize
                ```
    ```console
    PAGE=<paper_size> ./configure --prefix=/usr
    ```

- Build/Compile the package
    ```console
    make
    ```

- Test the results
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    ```

#### GRUB
- Information
    + File Name: grub-[version].tar.xz
    + Estimated required disk space: 161MB
    - Description: GRUB is a Bootloader system software
    - Package Contents
        + contains the GRand Unified Bootloader
    - Installed
        + Programs: grub-bios-setup, grub-editenv, grub-file, grub-fstest, grub-glue-efi, grub-install, grub-kbdcomp, grub-macbless, grub-menulst2cfg, grub-mkconfig, grub-mkimage, grub-mklayout, grub-mknetdir, grub-mkpasswd-pbkdf2, grub-mkrelpath, grub-mkrescue, grub-mkstandalone, grub-ofpathname, grub-probe, grub-reboot, grub-render-label, grub-script-check, grub-set-default, grub-sparc64-setup, and grub-syslinux2cfg
        + Libraries:
        + Directories: /usr/lib/grub, /etc/grub.d, /usr/share/grub, and /boot/grub (when grub-install is first run)

- Extract tar file
    ```console
    tar -xvf grub-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd grub-[version]
    ```

- Pre-Requisite
    - If your system has UEFI support and you wish to boot LFS with UEFI, 
        - you can skip this package in LFS, and 
            + install GRUB with UEFI support (and its dependencies) by following the instructions on the [BLFS - GRUB UEFI page](https://www.linuxfromscratch.org/blfs/view/12.0/postlfs/grub-efi.html)
    - Unset any environment variables which may affect the build
        - Don't try “tuning” this package with custom compilation flags. 
            + This package is a bootloader. 
            + The low-level operations in the source code may be broken by aggressive optimization.
        ```console
        unset {C,CPP,CXX,LD}FLAGS
        ```

- Apply a patch that will fix an issue causing grub-install to fail when the /boot partition (or the root partition if /boot is not a separate partition) is created by e2fsprogs-1.47.0 or later
    ```console
    patch -Np1 -i ../grub-2.06-upstream_fixes-1.patch
    ```

- Configure and prepare for compilation
    - New Configuration Options
        + --disable-werror : This allows the build to complete with warnings introduced by more recent versions of Flex.
        + --disable-efiemu : This option minimizes what is built by disabling a feature and eliminating some test programs not needed for LFS.
    ```console
    ./configure --prefix=/usr          \
                --sysconfdir=/etc      \
                --disable-efiemu       \
                --disable-werror
    ```

- Build/Compile the package
    ```console
    make
    ```

- (Optional) Test the results
    - The test suite for this packages is not recommended. 
        + Most of the tests depend on packages that are not available in the limited LFS environment. 
    + To run the tests anyway, run the following
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions
    ```

- Post-Installation
    + Making your LFS system bootable with GRUB will be discussed in [Section 10.4, “Using GRUB to Set Up the Boot Process”](#using-grub-to-setup-the-boot-process).

#### Gzip - Pass 2
- Information
    + File Name: gzip-[version].tar.xz
    + Estimated required disk space: 21MB
    - Description: 
        + More Information: [Section 8.63.2, “Contents of Gzip.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/gzip.html#contents-gzip)
    - Package Contents
        + programs for compressing and decompressing files
    - Installed
        + Programs: gunzip, gzexe, gzip, uncompress (hard link with gunzip), zcat, zcmp, zdiff, zegrep, zfgrep, zforce, zgrep, zless, zmore, and znew
        + Libraries:
        + Directories: 

- Prepare source environment from scratch
    - Notes
        + Do this if you have removed the previous extracted directory

    - Extract tar file
        ```console
        tar -xvf gzip-[version].tar.xz
        ```

- Change directory into source file
    ```console
    cd gzip-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr
    ```

- Compile the package
    ```console
    make
    ```

- Test the results
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    ```

#### IPRoute2
- Information
    + File Name: iproute2-[version].tar.xz
    + Estimated required disk space: 17MB
    - Description: 
    - Package Contents
        + contains programs for basic and advanced IPV4-based networking
    - Installed
        + Programs: bridge, ctstat (link to lnstat), genl, ifstat, ip, lnstat, nstat, routel, rtacct, rtmon, rtpr, rtstat (link to lnstat), ss, and tc
        + Libraries:
        + Directories: /etc/iproute2, /usr/lib/tc, and /usr/share/doc/iproute2-6.4.0

- Extract tar file
    ```console
    tar -xvf iproute2-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd iproute2-[version]
    ```

- Prevent the installation of the directory and man page for arpd
    - Explanation
        - The arpd program included in this package will not be built since it depends on Berkeley DB, which is not installed in LFS. 
            + However, a directory and a man page for arpd will still be installed. 
            + Prevent this by running the commands shown. 
            - If the arpd program is needed, 
                + instructions for compiling Berkeley DB can be found in the BLFS book at [BLFS - Berkeley DB](https://www.linuxfromscratch.org/blfs/view/12.0/server/db.html.)
    ```console
    sed -i /ARPD/d Makefile
    rm -fv man/man8/arpd.8
    ```

- Compile the package
    ```console
    make NETNS_RUN_DIR=/run/netns
    ```

- Testing
    + This package does not have a working test suite.

- Install the package
    ```console
    make SBINDIR=/usr/sbin install
    ```

- (Optional) Install the documentation
    ```console
    mkdir -pv             /usr/share/doc/iproute2-6.4.0
    cp -v COPYING README* /usr/share/doc/iproute2-6.4.0
    ```

#### Kbd
- Information
    + File Name: kbd-[version].tar.xz
    + Estimated required disk space: 35MB
    - Description: 
    - Package Contents
        + contains key-table files, console fonts, and keyboard utilities
    - Installed
        + Programs: chvt, deallocvt, dumpkeys, fgconsole, getkeycodes, kbdinfo, kbd_mode, kbdrate, loadkeys, loadunimap, mapscrn, openvt, psfaddtable (link to psfxtable), psfgettable (link to psfxtable), psfstriptable (link to psfxtable), psfxtable, setfont, setkeycodes, setleds, setmetamode, setvtrgb, showconsolefont, showkey, unicode_start, and unicode_stop
        + Libraries:
        + Directories: /usr/share/consolefonts, /usr/share/consoletrans, /usr/share/keymaps, /usr/share/doc/kbd-2.6.1, and /usr/share/unimaps

- Extract tar file
    ```console
    tar -xvf kbd-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd kbd-[version]
    ```

- Apply a patch that will fix the issue for i386 keymaps where the behavior of the backspace and delete keys is not consistent across the keymaps in the Kbd package.
    - Notes
        + After patching, the backspace key generates the character with code 127, and the delete key generates a well-known escape sequence.
    ```console
    patch -Np1 -i ../kbd-2.6.1-backspace-1.patch
    ```

- Remove the redundant resizecons program together with its manpage.
    - Explanation
        + it requires the defunct svgalib to provide the video mode files - for normal use setfont sizes the console appropriately
    ```console
    sed -i '/RESIZECONS_PROGS=/s/yes/no/' configure
    sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in
    ```

- Configure and prepare for compilation
    - Configuration Options
        + --disable-vlock : This option prevents the vlock utility from being built because it requires the PAM library, which isn't available in the chroot environment.
    ```console
    ./configure --prefix=/usr --disable-vlock
    ```

- Compile the package
    ```console
    make
    ```

- Test the results
    ```console
    make check
    ```

- Install the package
    - Notes
        - For some languages (e.g., Belarusian) the Kbd package doesn't provide a useful keymap where the stock “by” keymap assumes the ISO-8859-5 encoding, and the CP1251 keymap is normally used. 
            + Users of such languages have to download working keymaps separately.
    ```console
    make install
    ```

- (Optional) Install the documentation
    ```console
    cp -R -v docs/doc -T /usr/share/doc/kbd-2.6.1
    ```

#### Libpipeline
- Information
    + File Name: libpipeline-[version].tar.gz
    + Estimated required disk space: 10MB
    - Description: 
    - Package Contents
        + contains a library for manipulating pipelines of subprocesses in a flexible and convenient way.
    - Installed
        + Programs: 
        - Libraries:
            + libpipeline.so : This library is used to safely construct pipelines between subprocesses
        + Directories: 

- Extract tar file
    ```console
    tar -xvzf libpipeline-[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd libpipeline-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr
    ```

- Compile the package
    ```console
    make
    ```

- Test the results
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    ```

#### Make - Pass 2
- Information
    + File Name: make-[version].tar.gz
    + Estimated required disk space: 13MB
    - Description: 
        + More Information: [Section 8.67.2, “Contents of Make.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/make.html#contents-make)
    - Package Contents
        + program for controlling the generation of executables and other non-source files of a package from source files
    - Installed
        - Programs: 
            + make : Automatically determines which pieces of a package need to be (re)compiled and then issues the relevant commands
        + Libraries:
        + Directories: 

- Prepare source environment from scratch
    - Notes
        + Do this if you have removed the previous extracted directory

    - Extract tar file
        ```console
        tar -xvzf make-[version].tar.gz
        ```

- Change directory into source file
    ```console
    cd make-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr
    ```

- Compile the package
    ```console
    make
    ```

- Test the results
    ```console
    chown -Rv tester .
    su tester -c "PATH=$PATH make check"
    ```

- Install the package
    ```console
    make install
    ```

#### Patch - Pass 2
- Information
    + File Name: patch-[version].tar.xz
    + Estimated required disk space: 12MB
    - Description: 
        + More Information: [Section 8.68.2, “Contents of Patch.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/patch.html#contents-patch)
    - Package Contents
        + program for modifying or creating files by applying a “patch” file typically created by the diff program
    - Installed
        - Programs: 
            + patch : Modifies files according to a patch file (A patch file is normally a difference listing created with the diff program. By applying these differences to the original files, patch creates the patched versions.)
        - Libraries:
        + Directories: 

- Prepare source environment from scratch
    - Notes
        + Do this if you have removed the previous extracted directory

    - Extract tar file
        ```console
        tar -xvf patch-[version].tar.xz
        ```

    - Change directory into source file
        ```console
        cd patch-[version]
        ```

- If you are continuing from an existing directory
    - Change directory into source file
        ```console
        cd patch-[version]
        ```

    - Clean the repository
        ```console
        make clean
        ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr
    ```

- Compile the package
    ```console
    make
    ```

- Test the results
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    ```

#### Tar - Pass 2
- Information
    + File Name: tar-[version].tar.xz
    + Estimated required disk space: 43MB
    - Description: 
        + More Information: [Section 8.69.2, “Contents of Tar.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/tar.html#contents-tar)
    - Package Contents
        + the ability to create tar archives as well as perform various other kinds of archive manipulation. 
        - Tar can be used on previously created archives 
            + to extract files, 
            + to store additional files, or 
            + to update or list files which were already stored.
    - Installed
        - Programs: 
            + tar : Creates, extracts files from, and lists the contents of archives, also known as tarballs
        - Libraries:
        + Directories: /usr/share/doc/tar-1.35

- Prepare source environment from scratch
    - Notes
        + Do this if you have removed the previous extracted directory

    - Extract tar file
        ```console
        tar -xvf tar-[version].tar.xz
        ```

    - Change directory into source file
        ```console
        cd tar-[version]
        ```

- If you are continuing from an existing directory
    - Change directory into source file
        ```console
        cd tar-[version]
        ```

    - Clean the repository
        ```console
        make clean
        ```

- Configure and prepare for compilation
    - Configuration Options
        + FORCE_UNSAFE_CONFIGURE=1 : This forces the test for mknod to be run as root. It is generally considered dangerous to run this test as the root user, but as it is being run on a system that has only been partially built, overriding it is OK.
    ```console
    FORCE_UNSAFE_CONFIGURE=1 ./configure --prefix=/usr
    ```

- Compile the package
    ```console
    make
    ```

- Test the results
    - Notes
        - The test time for Tar can be reduced significantly on a system with multiple cores. 
            - To do this, append 'TESTSUITEFLAGS=-j<N>' to the check command. 
                - For instance, 
                    + using -j4 can reduce the test time by over 70 percent.
        - One test, capabilities: binary store/restore, is known to fail if it is run because LFS lacks selinux, 
            + but will be skipped if the host kernel does not support extended attributes or security labels on the filesystem used for building LFS.
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    make -C doc install-html docdir=/usr/share/doc/tar-1.35
    ```

#### Texinfo - Pass 2
- Information
    + File Name: texinfo-[version].tar.xz
    + Estimated required disk space: 128MB
    - Description: 
        + More Information: [Section 8.70.2, “Contents of Texinfo.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/texinfo.html#contents-texinfo)
    - Package Contents
         - programs for reading, writing, and converting info pages
    - Installed
        - Programs: info, install-info, makeinfo (link to texi2any), pdftexi2dvi, pod2texi, texi2any, texi2dvi, texi2pdf, and texindex
        - Libraries: MiscXS.so, Parsetexi.so, and XSParagraph.so (all in /usr/lib/texinfo)
        + Directories: /usr/share/texinfo and /usr/lib/texinfo

- Prepare source environment from scratch
    - Notes
        + Do this if you have removed the previous extracted directory

    - Extract tar file
        ```console
        tar -xvf texinfo-[version].tar.xz
        ```

- Change directory into source file
    ```console
    cd texinfo-[version]
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr
    ```

- Compile the package
    ```console
    make
    ```

- Test the results
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    ```

- (Optional) Install the components belonging in a TeX installation
    - Make Parameters
        + TEXMF=/usr/share/texmf : The TEXMF makefile variable holds the location of the root of the TeX tree if, for example, a TeX package will be installed later.
    ```console
    make TEXMF=/usr/share/texmf install-tex
    ```

- (Optional) The Info documentation system uses a plain text file to hold its list of menu entries. 
    + The file is located at /usr/share/info/dir. 
    - Unfortunately, due to occasional problems in the Makefiles of various packages, 
        + it can sometimes get out of sync with the info pages installed on the system. 
    - If the /usr/share/info/dir file ever needs to be recreated, 
        + the following optional commands will accomplish the task:
        ```console
        pushd /usr/share/info
          rm -v dir
          for f in *
            do install-info $f dir 2>/dev/null
          done
        popd
        ```

#### Vim
- Information
    + File Name: vim-[version].tar.gz
    + Estimated required disk space: 229MB
    - Description: Vim - The Vi Improved project - is a powerful modular text editor
    - Package Contents
    - Installed
        - Programs: ex (link to vim), rview (link to vim), rvim (link to vim), vi (link to vim), view (link to vim), vim, vimdiff (link to vim), vimtutor, and xxd
        - Libraries: 
        + Directories: /usr/share/vim

- Notes
    - If you prefer another editor—such as Emacs, Joe, or Nano
        + please refer to [PostLFS - Editors](https://www.linuxfromscratch.org/blfs/view/12.0/postlfs/editors.html) for suggested installation instructions.

- Extract tar file
    ```console
    tar -xvzf vim-[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd vim-[version]
    ```

- Change the default location of the vimrc configuration file to /etc
    ```console
    echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h
    ```

- Configure and prepare for compilation
    ```console
    ./configure --prefix=/usr
    ```

- Compile the package
    ```console
    make
    ```

- Prepare the tests
    - Ensure that user tester can write to the source tree
        ```console
        chown -Rv tester .
        ```

    - Run the tests as user 'tester'
        - Notes
            - The test suite outputs a lot of binary data to the screen. 
                + This can cause issues with the settings of the current terminal. 
                - The problem can be avoided by redirecting the output to a log file as shown. 
                    + A successful test will result in the words "ALL DONE" in the log file at completion.
        ```console
        su tester -c "LANG=en_US.UTF-8 make -j1 test" &> vim-test.log
        ```

- Install the package
    ```console
    make install
    ```

- Create a symlink for both the binary and the man page in the provided languages
    - Explanation
         - Many users reflexively type vi instead of vim. 
             + Create a symlink for both the binary and the man page in the provided languages to allow execution of vim when users habitually enter vi
    ```console
    ln -sv vim /usr/bin/vi
    for L in  /usr/share/man/{,*/}man1/vim.1; do
        ln -sv vim.1 $(dirname $L)/vi.1
    done
    ```

- Create a symlink to allows the documentation to be accessed via /usr/share/doc/vim-9.0.1677, making it consistent with the location of documentation for other packages
    - Explanation
        + By default, Vim's documentation is installed in /usr/share/vim
    ```console
    ln -sv ../vim/vim90/doc /usr/share/doc/vim-9.0.1677
    ```

- Post-Installation Notes
    - If an X Window System is going to be installed on the LFS system, 
        - it may be necessary to recompile Vim after installing X. 
            + Vim comes with a GUI version of the editor that requires X and some additional libraries to be installed. 
        - For more information on this process, 
            + refer to the Vim documentation and the Vim installation page in the BLFS book at https://www.linuxfromscratch.org/blfs/view/12.0/postlfs/vim.html.

- Configuring Vim
    - By default, vim runs in vi-incompatible mode. 
        + This may be new to users who have used other editors in the past. 
        - The “nocompatible” setting is included below to highlight the fact that a new behavior is being used. 
            - It also reminds those who would change to “compatible” mode that it should be the first setting in the configuration file. 
                + This is necessary because it changes other settings, and overrides must come after this setting. 
    - Create a default vim configuration file by running the following
        ```console
        cat > /etc/vimrc << "EOF"
        " Begin /etc/vimrc

        " Ensure defaults are set before customizing settings, not after
        source $VIMRUNTIME/defaults.vim
        let skip_defaults_vim=1

        set nocompatible
        set backspace=2
        set mouse=
        syntax on
        if (&term == "xterm") || (&term == "putty")
          set background=dark
        endif
        
        " End /etc/vimrc
        EOF
        ```

    - Notes
        - The 'set nocompatible' setting makes vim behave in a more useful way (the default) than the vi-compatible manner. 
            + Remove the “no” to keep the old vi behavior. 
            + The 'set backspace=2' setting allows backspacing over line breaks, autoindents, and the start of an insert. 
            + The 'syntax on' parameter enables vim's syntax highlighting. 
            + The 'set mouse=' setting enables proper pasting of text with the mouse when working in chroot or over a remote connection. 
            - Finally, the if statement with the 'set background=dark' setting corrects vim's guess about the background color of some terminal emulators. 
                + This gives the highlighting a better color scheme for use on the black background of these programs.
        - Documentation for other available options can be obtained by running the following command:
            ```console
            vim -c ':options'
            ```
        - By default, vim only installs spell-checking files for the English language. 
            - To install spell-checking files for your preferred language, 
                + copy the .spl and optionally, the .sug files for your language and character encoding from runtime/spell into /usr/share/vim/vim90/spell/.
        - To use these spell-checking files, some configuration in /etc/vimrc is needed, e.g.:
            + `set spelllang=en,ru`
            + `set spell`
        + For more information, see 'runtime/spell/README.txt'

#### MarkupSafe
- Information
    + File Name: MarkupSafe-[version].tar.gz
    + Estimated required disk space: 548KB
    - Description: MarkupSafe is a Python module that implements an XML/HTML/XHTML Markup safe string.
    - Package Contents
    - Installed
        - Programs: 
        - Libraries: 
        + Directories: /usr/lib/python3.11/site-packages/MarkupSafe-2.1.3.dist-info

- Extract tar file
    ```console
    tar -xvzf MarkupSafe-[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd MarkupSafe-[version]
    ```

- Build/Compile the package
    ```console
    pip3 wheel -w dist --no-build-isolation --no-deps $PWD
    ```

- Install the package
    ```console
    pip3 install --no-index --no-user --find-links dist Markupsafe
    ```

#### Jinja2
- Information
    + File Name: Jinja2-[version].tar.gz
    + Estimated required disk space: 3.4MB
    - Description: Jinja2 is a Python module that implements a simple pythonic template language.
    - Package Contents
    - Installed
        - Programs: 
        - Libraries: 
        + Directories: /usr/lib/python3.11/site-packages/Jinja2-3.1.2.dist-info

- Extract tar file
    ```console
    tar -xvzf Jinja2-[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd Jinja2-[version]
    ```

- Build/Compile the package
    ```console
    pip3 wheel -w dist --no-build-isolation --no-deps $PWD
    ```

- Install the package
    ```console
    pip3 install --no-index --no-user --find-links dist Jinja2
    ```

#### Udev from Systemd
- Information
    + File Name: systemd-[version].tar.gz
    + Estimated required disk space: 138MB
    - Description: Udev is part of the systemd-[version] package
    - Package Contents
        + The Udev package contains programs for dynamic creation of device nodes.
    - Installed
        - Programs: 
            + udevadm : Generic udev administration tool: controls the udevd daemon, provides info from the Udev database, monitors uevents, waits for uevents to finish, tests Udev configuration, and triggers uevents for a given device
            + udevd : A daemon that listens for uevents on the netlink socket, creates devices and runs the configured external programs in response to these uevents
            + udev-hwdb : Updates or queries the hardware database.
        - Libraries: 
            + libudev.so : A library interface to udev device information
        - Directories: 
            + /etc/udev : Contains Udev configuration files, device permissions, and rules for device naming

- Extract tar file
    ```console
    tar -xvzf systemd-[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd systemd-[version]
    ```

- Remove two unneeded groups, render and sgx, from the default udev rules
    ```console
    sed -i -e 's/GROUP="render"/GROUP="video"/' \
           -e 's/GROUP="sgx", //' rules.d/50-udev-default.rules.in
    ```

- Remove one udev rule requiring a full Systemd installation:
    ```console
    sed '/systemd-sysctl/s/^/#/' -i rules.d/99-systemd.rules.in
    ```

- Create directory 'build'
    ```console
    mkdir -pv build
    ```

- Change directory into 'build'
    ```console
    cd build
    ```

- Configure and prepare for compilation
    - Meson Options
        + --buildtype=release : This switch overrides the default buildtype (“debug”), which produces unoptimized binaries.
        + -Dmode=release : Disable some features considered experimental by upstream.
        + -Ddev-kvm-mode=0660 : The default udev rule would allow all users to access /dev/kvm. The editors consider it dangerous. This option overrides it.
        + -Dlink-udev-shared=false : This option prevents udev from linking to the internal systemd shared library, libsystemd-shared. This library is designed to be shared by many Systemd components and it's too overkill for a udev-only installation.
    ```console
    meson setup \
          --prefix=/usr                 \
          --buildtype=release           \
          -Dmode=release                \
          -Ddev-kvm-mode=0660           \
          -Dlink-udev-shared=false      \
          ..
    ```

- Only build/compile the components needed for udev
    ```console
    ninja udevadm systemd-hwdb \
          $(grep -o -E "^build (src/libudev|src/udev|rules.d|hwdb.d)[^:]*" \
            build.ninja | awk '{ print $2 }')                              \
          $(realpath libudev.so --relative-to .)
    ```

- Remove one udev rule file requiring a full Systemd installation
    ```console
    rm rules.d/90-vconsole.rules
    ```

- Install the package
    ```console
    install -vm755 -d {/usr/lib,/etc}/udev/{hwdb,rules}.d
    install -vm755 -d /usr/{lib,share}/pkgconfig
    install -vm755 udevadm                     /usr/bin/
    install -vm755 systemd-hwdb                /usr/bin/udev-hwdb
    ln      -svfn  ../bin/udevadm              /usr/sbin/udevd
    cp      -av    libudev.so{,*[0-9]}         /usr/lib/
    install -vm644 ../src/libudev/libudev.h    /usr/include/
    install -vm644 src/libudev/*.pc            /usr/lib/pkgconfig/
    install -vm644 src/udev/*.pc               /usr/share/pkgconfig/
    install -vm644 ../src/udev/udev.conf       /etc/udev/
    install -vm644 rules.d/* ../rules.d/{*.rules,README} /usr/lib/udev/rules.d/
    install -vm644 hwdb.d/*  ../hwdb.d/{*.hwdb,README}   /usr/lib/udev/hwdb.d/
    install -vm755 $(find src/udev -type f | grep -F -v ".") /usr/lib/udev
    ```

- Install some custom rules and support files useful in an LFS environment
    ```console
    tar -xvf ../../udev-lfs-20230818.tar.xz
    make -f udev-lfs-20230818/Makefile.lfs install
    ```

- Install the man pages
    ```console
    tar -xf ../../systemd-man-pages-254.tar.xz                            \
        --no-same-owner --strip-components=1                              \
        -C /usr/share/man --wildcards '*/udev*' '*/libudev*'              \
                                      '*/systemd-'{hwdb,udevd.service}.8
    sed 's/systemd\(\\\?-\)/udev\1/' /usr/share/man/man8/systemd-hwdb.8   \
                                   > /usr/share/man/man8/udev-hwdb.8
    sed 's|lib.*udevd|sbin/udevd|'                                        \
        /usr/share/man/man8/systemd-udevd.service.8                       \
      > /usr/share/man/man8/udevd.8
    rm  /usr/share/man/man8/systemd-*.8
    ```

- Configuring Udev
    - Create the initial database
        - Explanation
            - Information about hardware devices is maintained in the /etc/udev/hwdb.d and /usr/lib/udev/hwdb.d directories. 
                + Udev needs that information to be compiled into a binary database /etc/udev/hwdb.bin
        - Note
            + This command needs to be run each time the hardware information is updated.
        ```console
        udev-hwdb update
        ```

#### Man-DB
- Information
    + File Name: man-db-[version].tar.xz
    + Estimated required disk space: 40MB
    - Description: 
    - Package Contents
        + contains programs for finding and viewing man pages.
    - Installed
        + Programs: accessdb, apropos (link to whatis), catman, lexgrog, man, man-recode, mandb, manpath, and whatis
        + Libraries: libman.so and libmandb.so (both in /usr/lib/man-db)
        + Directories: /usr/lib/man-db, /usr/libexec/man-db, and /usr/share/doc/man-db-2.11.2

- Extract tar file
    ```console
    tar -xvf man-db-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd man-db-[version]
    ```

- Configure and prepare for compilation
    - Configuration Options
        + --disable-setuid : This disables making the man program setuid to user man.
        + --enable-cache-owner=bin : This changes ownership of the system-wide cache files to user bin.
        + --with-... : These three parameters are used to set some default programs. lynx is a text-based web browser (see BLFS for installation instructions), vgrind converts program sources to Groff input, and grap is useful for typesetting graphs in Groff documents. The vgrind and grap programs are not normally needed for viewing manual pages. They are not part of LFS or BLFS, but you should be able to install them yourself after finishing LFS if you wish to do so.
        + --with-systemd... : These parameters prevent installing unneeded systemd directories and files.
    ```console
    ./configure --prefix=/usr                         \
                --docdir=/usr/share/doc/man-db-2.11.2 \
                --sysconfdir=/etc                     \
                --disable-setuid                      \
                --enable-cache-owner=bin              \
                --with-browser=/usr/bin/lynx          \
                --with-vgrind=/usr/bin/vgrind         \
                --with-grap=/usr/bin/grap             \
                --with-systemdtmpfilesdir=            \
                --with-systemdsystemunitdir=
    ```

- Compile the package
    ```console
    make
    ```

- Test the results
    - Notes
        + One test named man1/lexgrog.1 is known to fail.
    ```console
    make -k check
    ```

- Install the package
    ```console
    make install
    ```

- Non-English Manual Pages in LFS
    - Please refer to the section '8.75.2. Non-English Manual Pages in LFS' for
        - A table showing the character set that Man-DB assumes manual pages installed under /usr/share/man/<ll> will be encoded with. 
            + In addition to this, Man-DB correctly determines if manual pages installed in that directory are UTF-8 encoded.
            + Manual pages in languages not in the list are not supported.

#### Procps-ng
- Information
    + File Name: procps-ng-[version].tar.xz
    + Estimated required disk space: 25MB
    - Description: 
    - Package Contents
        + contains programs for monitoring processes
    - Installed
        + Programs: free, pgrep, pidof, pkill, pmap, ps, pwdx, slabtop, sysctl, tload, top, uptime, vmstat, w, and watch
        + Libraries: libproc-2.so
        + Directories: /usr/include/procps and /usr/share/doc/procps-ng-4.0.3

- Extract tar file
    ```console
    tar -xvf procps-ng-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd procps-ng-[version]
    ```

- Configure and prepare for compilation
    - Configuration Options
        + --disable-kill : This switch disables building the kill command; it will be installed from the Util-linux package.
    ```console
    ./configure --prefix=/usr                           \
                --docdir=/usr/share/doc/procps-ng-4.0.3 \
                --disable-static                        \
                --disable-kill
    ```

- Compile the package
    ```console
    make
    ```

- Test the results
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    ```

#### Util-linux - Pass 2
- Information
    + File Name: util-linux-[version].tar.xz
    + Estimated required disk space: 310MB
    - Description: 
        + More Information: [Section 8.77.2, “Contents of Util-linux.”](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/util-linux.html#contents-utillinux)
    - Package Contents
         - miscellaneous utility programs
             + Among them are utilities for handling file systems, consoles, partitions, and messages
    - Installed
        + Programs: addpart, agetty, blkdiscard, blkid, blkzone, blockdev, cal, cfdisk, chcpu, chmem, choom, chrt, col, colcrt, colrm, column, ctrlaltdel, delpart, dmesg, eject, fallocate, fdisk, fincore, findfs, findmnt, flock, fsck, fsck.cramfs, fsck.minix, fsfreeze, fstrim, getopt, hardlink, hexdump, hwclock, i386 (link to setarch), ionice, ipcmk, ipcrm, ipcs, irqtop, isosize, kill, last, lastb (link to last), ldattach, linux32 (link to setarch), linux64 (link to setarch), logger, look, losetup, lsblk, lscpu, lsipc, lsirq, lsfd, lslocks, lslogins, lsmem, lsns, mcookie, mesg, mkfs, mkfs.bfs, mkfs.cramfs, mkfs.minix, mkswap, more, mount, mountpoint, namei, nsenter, partx, pivot_root, prlimit, readprofile, rename, renice, resizepart, rev, rfkill, rtcwake, script, scriptlive, scriptreplay, setarch, setsid, setterm, sfdisk, sulogin, swaplabel, swapoff, swapon, switch_root, taskset, uclampset, ul, umount, uname26 (link to setarch), unshare, utmpdump, uuidd, uuidgen, uuidparse, wall, wdctl, whereis, wipefs, x86_64 (link to setarch), and zramctl
        + Libraries: libblkid.so, libfdisk.so, libmount.so, libsmartcols.so, and libuuid.so
        + Directories: /usr/include/blkid, /usr/include/libfdisk, /usr/include/libmount, /usr/include/libsmartcols, /usr/include/uuid, /usr/share/doc/util-linux-2.39.1, and /var/lib/hwclock

- Prepare source environment from scratch
    - Notes
        + Do this if you have removed the previous extracted directory

    - Extract tar file
        ```console
        tar -xvf util-linux-[version].tar.xz
        ```

- Change directory into source file
    ```console
    cd util-linux-[version]
    ```

- Disable a problem test
    ```console
    sed -i '/test_mkfds/s/^/#/' tests/helpers/Makemodule.am
    ```

- Configure and prepare for compilation
    - Options
        + The --disable and --without options prevent warnings about building components that either require packages not in LFS, or are inconsistent with programs installed by other packages.
    ```console
    ./configure ADJTIME_PATH=/var/lib/hwclock/adjtime \
            --bindir=/usr/bin    \
            --libdir=/usr/lib    \
            --runstatedir=/run   \
            --sbindir=/usr/sbin  \
            --disable-chfn-chsh  \
            --disable-login      \
            --disable-nologin    \
            --disable-su         \
            --disable-setpriv    \
            --disable-runuser    \
            --disable-pylibmount \
            --disable-static     \
            --without-python     \
            --without-systemd    \
            --without-systemdsystemunitdir \
            --docdir=/usr/share/doc/util-linux-2.39.1
    ```

- Compile the package
    ```console
    make
    ```

- (Optional) Run the test suite as a non-root user
    - Warning
        - Running the test suite as the root user can be harmful to your system. 
            - To run it, the CONFIG_SCSI_DEBUG option for the kernel must be available in the currently running system and must be built as a module. 
                + Building it into the kernel will prevent booting. 
            + For complete coverage, other BLFS packages must be installed. 
            - If desired, this test can be run by booting into the completed LFS system and running:
                ```console
                bash tests/run.sh --srcdir=$PWD --builddir=$PWD
                ```
    - Notes
        - The hardlink tests will fail if the host's kernel does not have the option CONFIG_CRYPTO_USER_API_HASH enabled or does not have any options providing a SHA256 implementation (for example, CONFIG_CRYPTO_SHA256, or CONFIG_CRYPTO_SHA256_SSSE3 if the CPU supports Supplemental SSE3) enabled. 
            + In addition, two sub-tests from misc: mbsencode and one sub-test from script: replay are known to fail.
    ```console
    chown -Rv tester .
    su tester -c "make -k check"
    ```

- Install the package
    ```console
    make install
    ```

#### E2fsprogs
- Information
    + File Name: e2fsprogs-[version].tar.gz
    + Estimated required disk space: 95MB
    - Description: 
    - Package Contents
        + contains the utilities for handling the ext2 file system. It also supports the ext3 and ext4 journaling file systems
    - Installed
        + Programs: badblocks, chattr, compile_et, debugfs, dumpe2fs, e2freefrag, e2fsck, e2image, e2label, e2mmpstatus, e2scrub, e2scrub_all, e2undo, e4crypt, e4defrag, filefrag, fsck.ext2, fsck.ext3, fsck.ext4, logsave, lsattr, mk_cmds, mke2fs, mkfs.ext2, mkfs.ext3, mkfs.ext4, mklost+found, resize2fs, and tune2fs
        + Libraries: libcom_err.so, libe2p.so, libext2fs.so, and libss.so
        + Directories: /usr/include/e2p, /usr/include/et, /usr/include/ext2fs, /usr/include/ss, /usr/lib/e2fsprogs, /usr/share/et, and /usr/share/ss

- Extract tar file
    ```console
    tar -xvzf e2fsprogs-[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd e2fsprogs-[version]
    ```

- Create directory 'build'
    ```console
    mkdir -pv build
    ```

- Change directory into 'build'
    ```console
    cd build
    ```

- Configure and prepare for compilation
    - Configuration Options
        + --enable-elf-shlibs : This creates the shared libraries which some programs in this package use.
        + --disable-* : These prevent building and installing the libuuid and libblkid libraries, the uuidd daemon, and the fsck wrapper; util-linux installs more recent versions.
    ```console
    ../configure --prefix=/usr           \
                 --sysconfdir=/etc       \
                 --enable-elf-shlibs     \
                 --disable-libblkid      \
                 --disable-libuuid       \
                 --disable-uuidd         \
                 --disable-fsck
    ```

- Compile the package
    ```console
    make
    ```

- Test the results
    - Notes
        + One test named 'm_assume_storage_prezeroed' is known to fail.
    ```console
    make check
    ```

- Install the package
    ```console
    make install
    ```

- Remove useless static libraries
    ```console
    rm -fv /usr/lib/{libcom_err,libe2p,libext2fs,libss}.a
    ```

- Unzip the installed gzipped .info file and then update the system dir file
    - Explanation
        - This package installs a gzipped .info file but doesn't update the system-wide dir file. 
            + Unzip this file and then update the system dir file
    ```console
    gunzip -v /usr/share/info/libext2fs.info.gz
    install-info --dir-file=/usr/share/info/dir /usr/share/info/libext2fs.info
    ```

- (Optional) Create and install some additional documentation
    ```console
    makeinfo -o      doc/com_err.info ../lib/et/com_err.texinfo
    install -v -m644 doc/com_err.info /usr/share/info
    install-info --dir-file=/usr/share/info/dir /usr/share/info/com_err.info
    ```

- Configuring E2fsprogs
    - '/etc/mke2fs.conf' contains the default value of various command line options of mke2fs. 
        - You may edit the file to make the default values suitable for your need. 
            - For example, 
                + some utilities (not in LFS or BLFS) cannot recognize a ext4 file system with metadata_csum_seed feature enabled.
    - (Optional) If you need such an utility, you may remove the feature from the default ext4 feature list with the command
        + Read the man page mke2fs.conf(5) for details
        ```console
        sed 's/metadata_csum_seed,//' -i /etc/mke2fs.conf
        ```

#### Sysklogd
- Information
    + File Name: sysklogd-[version].tar.gz
    + Estimated required disk space: 680KB
    - Description: 
    - Package Contents
        + contains programs for logging system messages, such as those emitted by the kernel when unusual things happen.
    - Installed
        - Programs: 
            + klogd : A system daemon for intercepting and logging kernel messages
            + syslogd : Logs the messages that system programs offer for logging [Every logged message contains at least a date stamp and a hostname, and normally the program's name too, but that depends on how trusting the logging daemon is told to be.]
        + Libraries: 
        + Directories: 

- Extract tar file
    ```console
    tar -xvzf sysklogd-[version].tar.gz
    ```

- Change directory into source file
    ```console
    cd sysklogd-[version]
    ```

- Fix a problem that causes a segmentation fault in klogd under some conditions
    ```console
    sed -i '/Error loading kernel symbols/{n;n;d}' ksym_mod.c
    ```

- Fix an obsolete program construct
    ```console
    sed -i 's/union wait/int/' syslogd.c
    ```

- Compile the package
    ```console
    make
    ```

- Testing
    + This package does not come with a test suite

- Install the package
    ```console
    make BINDIR=/sbin install
    ```

- Configuring Sysklogd
    - Create a new /etc/syslog.conf file
        ```console
        cat > /etc/syslog.conf << "EOF"
        # Begin /etc/syslog.conf
        
        auth,authpriv.* -/var/log/auth.log
        *.*;auth,authpriv.none -/var/log/sys.log
        daemon.* -/var/log/daemon.log
        kern.* -/var/log/kern.log
        mail.* -/var/log/mail.log
        user.* -/var/log/user.log
        *.emerg *
        
        # End /etc/syslog.conf
        EOF
        ```

#### Sysvinit
- Information
    + File Name: sysvinit-[version].tar.xz
    + Estimated required disk space: 4.5MB
    - Description: 
    - Package Contents
        + contains programs for controlling the startup, running, and shutdown of the system
    - Installed
        + Programs: bootlogd, fstab-decode, halt, init, killall5, poweroff (link to halt), reboot (link to halt), runlevel, shutdown, and telinit (link to init)
        + Libraries: 
        + Directories: 

- Extract tar file
    ```console
    tar -xvf sysvinit-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd sysvinit-[version]
    ```

- Apply a patch that removes several programs installed by other packages, clarifies a message, and fixes a compiler warning
    ```console
    patch -Np1 -i ../sysvinit-3.07-consolidated-1.patch
    ```

- Compile the package
    ```console
    make
    ```

- Testing
    + This package does not come with a test suite

- Install the package
    ```console
    make install
    ```

### About Debugging Symbols
- Most programs and libraries are, by default, compiled with debugging symbols included (with gcc's -g option). 
    - This means that when debugging a program or library that was compiled with debugging information, 
        + the debugger can provide not only memory addresses, but also the names of the routines and variables.
- The inclusion of these debugging symbols enlarges a program or library significantly. 
    - Examples of the amount of space these symbols occupy:
        + A bash binary with debugging symbols: 1200 KB
        + A bash binary without debugging symbols: 480 KB (60% smaller)
        + Glibc and GCC files (/lib and /usr/lib) with debugging symbols: 87 MB
        + Glibc and GCC files without debugging symbols: 16 MB (82% smaller)
- Sizes will vary depending on which compiler and C library were used, 
    - but a program that has been stripped of debugging symbols is usually some 50% to 80% smaller than its unstripped counterpart. 
        + Because most users will never use a debugger on their system software, a lot of disk space can be regained by removing these symbols. 
        + The next section shows how to strip all debugging symbols from the programs and libraries.

### Stripping
+ This section is optional. 

- If the intended user is not a programmer and does not plan to do any debugging of the system software, 
    + the system's size can be decreased by some 2 GB by removing the debugging symbols, and some unnecessary symbol table entries, from binaries and libraries. 
    + This causes no real inconvenience for a typical Linux user.

- Most people who use the commands mentioned below do not experience any difficulties. 
    - However, it is easy to make a mistake and render the new system unusable. 
        + So before running the strip commands, it is a good idea to make a backup of the LFS system in its current state.

- A strip command with the --strip-unneeded option removes all debug symbols from a binary or library. 
    + It also removes all symbol table entries not needed by the linker (for static libraries) or dynamic linker (for dynamically linked binaries and shared libraries).

- The debugging symbols from selected libraries are preserved in separate files. 
    + That debugging information is needed to run regression tests with valgrind or gdb later, in BLFS.

- Note 
    - strip will overwrite the binary or library file it is processing. 
        - This can crash the processes using code or data from the file. 
            + If the process running strip is affected, the binary or library being stripped can be destroyed; this can make the system completely unusable. 
        - To avoid this problem we copy some libraries and binaries into /tmp, strip them there, then reinstall them with the install command. (The related entry in Section 8.2.1, “Upgrade Issues” gives the rationale for using the install command here.)
            - Notes
                + The ELF loader's name is ld-linux-x86-64.so.2 on 64-bit systems and ld-linux.so.2 on 32-bit systems. The construct below selects the correct name for the current architecture, excluding anything ending with “g”, in case the commands below have already been run.
            - Important
                - If there is any package whose version is different from the version specified by the book (either following a security advisory or satisfying personal preference), 
                    + it may be necessary to update the library file name in save_usrlib or online_usrlib. 
                    + Failing to do so may render the system completely unusable.
            - Output Warnings
                - A large number of files will be flagged as errors because their file format is not recognized. 
                    + These warnings can be safely ignored. They indicate that those files are scripts, not binaries.
            ```console
            save_usrlib="$(cd /usr/lib; ls ld-linux*[^g])
                         libc.so.6
                         libthread_db.so.1
                         libquadmath.so.0.0.0
                         libstdc++.so.6.0.32
                         libitm.so.1.0.0
                         libatomic.so.1.2.0"
            
            cd /usr/lib
            
            for LIB in $save_usrlib; do
                objcopy --only-keep-debug $LIB $LIB.dbg
                cp $LIB /tmp/$LIB
                strip --strip-unneeded /tmp/$LIB
                objcopy --add-gnu-debuglink=$LIB.dbg /tmp/$LIB
                install -vm755 /tmp/$LIB /usr/lib
                rm /tmp/$LIB
            done
            
            online_usrbin="bash find strip"
            online_usrlib="libbfd-2.41.so
                           libsframe.so.1.0.0
                           libhistory.so.8.2
                           libncursesw.so.6.4
                           libm.so.6
                           libreadline.so.8.2
                           libz.so.1.2.13
                           $(cd /usr/lib; find libnss*.so* -type f)"
            
            for BIN in $online_usrbin; do
                cp /usr/bin/$BIN /tmp/$BIN
                strip --strip-unneeded /tmp/$BIN
                install -vm755 /tmp/$BIN /usr/bin
                rm /tmp/$BIN
            done
            
            for LIB in $online_usrlib; do
                cp /usr/lib/$LIB /tmp/$LIB
                strip --strip-unneeded /tmp/$LIB
                install -vm755 /tmp/$LIB /usr/lib
                rm /tmp/$LIB
            done
            
            for i in $(find /usr/lib -type f -name \*.so* ! -name \*dbg) \
                     $(find /usr/lib -type f -name \*.a)                 \
                     $(find /usr/{bin,sbin,libexec} -type f); do
                case "$online_usrbin $online_usrlib $save_usrlib" in
                    *$(basename $i)* )
                        ;;
                    * ) strip --strip-unneeded $i
                        ;;
                esac
            done
            
            unset BIN LIB save_usrlib online_usrbin online_usrlib
            ```

### Cleaning Up
- Clean up some extra files left over from running tests
    ```console
    rm -rf /tmp/*
    ```

- Remove '*.la' files from '/usr/lib' and '/usr/libexec'
    - Explanation
        - There are also several files in the /usr/lib and /usr/libexec directories with a file name extension of .la
            + These are "libtool archive" files. 
            - On a modern Linux system the libtool .la files are only useful for libltdl
                + No libraries in LFS are expected to be loaded by libltdl, and it's known that some .la files can break BLFS package builds. 
    - Notes
        - For more information about libtool archive files, see the [BLFS section "About Libtool Archive (.la) files"](https://www.linuxfromscratch.org/blfs/view/12.0/introduction/la-files.html).
    ```console
    find /usr/lib /usr/libexec -name \*.la -delete
    ```

- Remove the compiler built in Chapter 6 and Chapter 7
    - Explanation
        + The compiler built in [Chapter 6](https://www.linuxfromscratch.org/lfs/view/12.0/chapter06/chapter06.html) and [Chapter 7](https://www.linuxfromscratch.org/lfs/view/12.0/chapter07/chapter07.html) is still partially installed and not needed anymore.
    ```console
    find /usr -depth -name $(uname -m)-lfs-linux-gnu\* | xargs rm -rf
    ```

- Remove the temporary 'tester' user account created at the beginning of the previous chapter.
    ```console
    userdel -r tester
    ```

## System Configuration
### Table of Contents 
- [Notes](#notes)
- [9.1. Introduction](#introduction)

### Notes
- The following chapter is primarily information about how the Linux kernel and the Operating System and Applications layer communicates, 
    + and information to take note of
    + The following are very important if you plan on performing Systems Programming for Operating Systems and Kernel-level applications

- The following chapter is also where the various LFS Book separates
    + [Stable/Default](https://www.linuxfromscratch.org/lfs/view/12.0): Uses the 'sysv' init system
    + [Systemd](https://www.linuxfromscratch.org/lfs/view/12.0-systemd): Uses the 'systemd' init system

### Introduction
- Summary
    - Booting a Linux system involves several tasks. 
        - The process must 
            + mount both virtual and real file systems, 
            + initialize devices, 
            + check file systems for integrity, 
            + mount and activate any swap partitions or files, 
            + set the system clock, 
            + bring up networking, 
            + start any daemons required by the system, and 
            + accomplish any other custom tasks specified by the user. 
        + This process must be organized to ensure the tasks are performed in the correct order and executed as quickly as possible.

### Init Systems

### Using Systemd


### Using SysV
#### SystemV
+ aka SysV

- Background
    + System V is the classic boot process that has been used in Unix and Unix-like systems such as Linux since about 1983. 
    - It consists of a small program, init, that sets up basic processes such as login (via getty) and runs a script. 
        + This script, usually named rc, controls the execution of a set of additional scripts that perform the tasks required to initialize the system.
        - The init program is controlled by the /etc/inittab file and is organized into run levels that can be chosen by the user. 
            - In LFS, they are used as follows:
                + 0 — halt
                + 1 — Single user mode
                + 2 — User definable
                + 3 — Full multiuser mode
                + 4 — User definable
                + 5 — Full multiuser mode with display manager
                + 6 — reboot
            + The usual default run level is 3 or 5.

- Advantages
    + Established, well understood system.
    + Easy to customize.
- Disadvantages
    - May be slower to boot. 
        + A medium speed base LFS system takes 8-12 seconds where the boot time is measured from the first kernel message to the login prompt. 
        + Network connectivity is typically established about 2 seconds after the login prompt.
    - Serial processing of boot tasks. 
        + This is related to the previous point. 
        + A delay in any process, such as a file system check, will delay the entire boot process.
    + Does not directly support advanced features like control groups (cgroups) and per-user fair share scheduling.
    + Adding scripts requires manual, static sequencing decisions.

### LFS Bootscripts
- Information
    + File Name: lfs-bootscripts-[version].tar.xz
    + Estimated required disk space: 244KB
    - Description: 
    - Package Contents
        + contains a set of scripts to start/stop the LFS system at bootup/shutdown. The configuration files and procedures needed to customize the boot process are described in the following sections.
    - Installed
        + Scripts: checkfs, cleanfs, console, functions, halt, ifdown, ifup, localnet, modules, mountfs, mountvirtfs, network, rc, reboot, sendsignals, setclock, ipv4-static, swap, sysctl, sysklogd, template, udev, and udev_retry
        + Libraries: 
        + Directories: /etc/rc.d, /etc/init.d (symbolic link), /etc/sysconfig, /lib/services, /lib/lsb (symbolic link)

- Extract tar file
    ```console
    tar -xvf lfs-bootscripts-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd lfs-bootscripts-[version]
    ```

- Install the package
    ```console
    make install
    ```

### Overview of Device and Module Handling
- Implementation of Udev
    - Sysfs
    - Device Node Creation
    - Module Loading
    - Handling Hotpluggable/Dynamic Devices
- Problems with Loading Modules and Creating Devices
    - A Kernel module is not loaded automatically
    - A Kernel module is not loaded automatically, and Udev is not intended to load it
    - Udev Loads Some Unwanted Module
    - Udev Creates a Device Incorrectly, or Makes the Wrong Symlink
    - Udev Rule Works Unreliably
    - Udev Does Not Create a Device
    - Device Naming Order Changes Randomly After Rebooting
- Useful Resources
    - [Userspace Implementation of devfs](http://www.kroah.com/linux/talks/ols_2003_udev_paper/Reprint-Kroah-Hartman-OLS2003.pdf)
    - [The sysfs Filesystem](https://www.kernel.org/pub/linux/kernel/people/mochel/doc/papers/ols-2005/mochel.pdf)

### Managing Devices

#### Network Devices
- Disabling Persistent Naming on the Kernel Command Line
- Creating Custom Udev Rules
    - Generate the initial rules
        - Explanation
            - The naming scheme can be customized by creating custom udev rules. 
                + A script has been included that generates the initial rules.
        ```console
        bash /usr/lib/udev/init-net-rules.sh
        ```
    - Inspect the /etc/udev/rules.d/70-persistent-net.rules file
        - Explanation
            + To find out which name was assigned to which network device
        - Notes
            - In some cases, such as when MAC addresses have been assigned to a network card manually, or in a virtual environment such as Qemu or Xen, 
                - the network rules file may not be generated because addresses are not consistently assigned. 
                    + In these cases, this method cannot be used.
        ```console
        cat /etc/udev/rules.d/70-persistent-net.rules
        ```
    - The file begins with a comment block, followed by two lines for each NIC. 
        - The first line for each NIC is a commented description showing its hardware IDs (e.g. its PCI vendor and device IDs, if it's a PCI card), 
            + along with its driver (in parentheses, if the driver can be found). 
            + Neither the hardware ID nor the driver is used to determine which name to give an interface; this information is only for reference. 
        - The second line is the udev rule that matches this NIC and actually assigns it a name.
            + All udev rules are made up of several keywords, separated by commas and optional whitespace. 
            - Here are the keywords, and an explanation of each one:
                + `SUBSYSTEM=="net"` : This tells udev to ignore devices that are not network cards.
                + `ACTION=="add"` :  This tells udev to ignore this rule for a uevent that isn't an add ("remove" and "change" uevents also happen, but don't need to rename network interfaces).
                + `DRIVERS=="?*"` : This exists so that udev will ignore VLAN or bridge sub-interfaces (because these sub-interfaces do not have drivers). These sub-interfaces are skipped because the name that would be assigned would collide with the parent devices.
                + `ATTR{address}` : The value of this keyword is the NIC's MAC address.
                + `ATTR{type}=="1"` : This ensures the rule only matches the primary interface in the case of certain wireless drivers which create multiple virtual interfaces. The secondary interfaces are skipped for the same reason that VLAN and bridge sub-interfaces are skipped: there would be a name collision otherwise.
                + `NAME` : The value of this keyword is the name that udev will assign to this interface.
            - The value of NAME is the important part. 
                - Make sure you know which name has been assigned to each of your network cards before proceeding, and 
                    + be sure to use that NAME value when creating your network configuration files.

#### CD-ROM Symlinks
- Some software that you may want to install later (e.g., various media players) expects the /dev/cdrom and /dev/dvd symlinks to exist, and to point to a CD-ROM or DVD-ROM device. 
    + Also, it may be convenient to put references to those symlinks into /etc/fstab. 
    - Udev comes with a script that will generate rules files to create these symlinks for you, depending on the capabilities of each device, 
        + but you need to decide which of two modes of operation you wish to have the script use.

- First, the script can operate in “by-path” mode (used by default for USB and FireWire devices), 
    + where the rules it creates depend on the physical path to the CD or DVD device. 

- Second, it can operate in “by-id” mode (default for IDE and SCSI devices), 
    + where the rules it creates depend on identification strings stored on the CD or DVD device itself. 
    + The path is determined by udev's path_id script, and the identification strings are read from the hardware by its ata_id or scsi_id programs, depending on which type of device you have.

- There are advantages to each approach; the correct approach depends on what kinds of device changes may happen. 
    + If you expect the physical path to the device (that is, the ports and/or slots that it plugs into) to change, 
        - for example 
            - because you plan on moving the drive to a different IDE port or a different USB connector, 
                + then you should use the “by-id” mode. 
    - On the other hand, if you expect the device's identification to change, 
        - for example 
            - because it may die, and you intend to replace it with a different device that plugs into the same connectors, 
                + then you should use the “by-path” mode.

+ If either type of change is possible with your drive, then choose a mode based on the type of change you expect to happen more often.

- Important
    + External devices (for example, a USB-connected CD drive) should not use by-path persistence, because each time the device is plugged into a new external port, its physical path will change. 
    + All externally-connected devices will have this problem if you write udev rules to recognize them by their physical path; the problem is not limited to CD and DVD drives.

- (Optional) If you wish to see the values that the udev scripts will use, then for the appropriate CD-ROM device, 
    + find the corresponding directory under /sys (e.g., this can be /sys/block/hdd) and 
    + run a command similar to the following
    ```console
    udevadm test /sys/block/hdd
    ```

- Look at the lines containing the output of various *_id programs. 
    + The “by-id” mode will use the ID_SERIAL value if it exists and is not empty, otherwise it will use a combination of ID_MODEL and ID_REVISION. 
    + The “by-path” mode will use the ID_PATH value.

- If the default mode is not suitable for your situation,
    + then the following modification can be made to the /etc/udev/rules.d/83-cdrom-symlinks.rules file, as follows (where mode is one of “by-id” or “by-path”):
    ```console
    sed -e 's/"write_cd_rules"/"write_cd_rules mode"/' \
        -i /etc/udev/rules.d/83-cdrom-symlinks.rules
    ```
    - Note that it is not necessary to create the rules files or symlinks at this time because you have bind-mounted the host's /dev directory into the LFS system and we assume the symlinks exist on the host. 
        + The rules and symlinks will be created the first time you boot your LFS system.

- However, if you have multiple CD-ROM devices, then the symlinks generated at that time may point to different devices than they point to on your host because devices are not discovered in a predictable order. 
    + The assignments created when you first boot the LFS system will be stable, so this is only an issue if you need the symlinks on both systems to point to the same device. 
    + If you need that, then inspect (and possibly edit) the generated /etc/udev/rules.d/70-persistent-cd.rules file after booting, to make sure the assigned symlinks match your needs.

#### Dealing with Duplicate Devices
- As explained in Section 9.3, “Overview of Device and Module Handling” of the book, 
    - the order in which devices with the same function appear in /dev is essentially random. 
        - E.g., 
            - if you have a USB web camera and a TV tuner, sometimes /dev/video0 refers to the camera and /dev/video1 refers to the tuner, and sometimes after a reboot the order changes. 
                + For all classes of hardware except sound cards and network cards, this is fixable by creating udev rules to create persistent symlinks. 
                + The case of network cards is covered separately in Section 9.5, “General Network Configuration”, and sound card configuration can be found in BLFS.

- For each of your devices that is likely to have this problem (even if the problem doesn't exist in your current Linux distribution), 
    - find the corresponding directory under /sys/class or /sys/block. 
        - i.e.
            + For video devices, this may be /sys/class/video4linux/videoX. 
    - Figure out the attributes that identify the device uniquely (usually, vendor and product IDs and/or serial numbers work):
        ```console
        udevadm info -a -p /sys/class/video4linux/video0
        ```
    - Then write rules that create the symlinks, e.g.:
        ```console
        cat > /etc/udev/rules.d/83-duplicate_devs.rules << "EOF"
        
        # Persistent symlinks for webcam and tuner
        KERNEL=="video*", ATTRS{idProduct}=="1910", ATTRS{idVendor}=="0d81", SYMLINK+="webcam"
        KERNEL=="video*", ATTRS{device}=="0x036f",  ATTRS{vendor}=="0x109e", SYMLINK+="tvtuner"
        
        EOF
        ```
     - The result is that /dev/video0 and /dev/video1 devices still refer randomly to the tuner and the web camera (and thus should never be used directly), 
         + but there are symlinks /dev/tvtuner and /dev/webcam that always point to the correct device.

### General Network Configuration
#### Creating Network Interface Configuration Files
- Introduction
    - The files in /etc/sysconfig/ usually determine which interfaces are brought up and down by the network script. 
        - This directory should contain a file for each interface to be configured, such as ifconfig.xyz, where “xyz” describes the network card. 
            + The interface name (e.g. eth0) is usually appropriate. 
            - Each file contains the attributes of one interface, such as its IP address(es), subnet masks, and so forth. 
                + The stem of the filename must be ifconfig.
                - Note
                    + If the procedure in the previous section was not used, udev will assign network card interface names based on system physical characteristics such as enp2s1. If you are not sure what your interface name is, you can always run ip link or ls /sys/class/net after you have booted your system.
                    + The interface names depend on the implementation and configuration of the udev daemon running on the system. The udev daemon for LFS (installed in Section 8.74, “Udev from Systemd-254”) will not run until the LFS system is booted. So the interface names in the LFS system cannot always be determined by running those commands on the host distro, even in the chroot environment.

- Creates a sample file for the eth0 device with a static IP address:
    - Information
        - Example File Name:
            + /etc/sysconfig/eth0
            + /etc/sysconfig/wlan0
        + The values in italics must be changed in each file, to set the interfaces up correctly.
        - If the ONBOOT variable is set to “yes” the System V network script will bring up the Network Interface Card (NIC) during the system boot process. 
            + If set to anything besides “yes”, the NIC will be ignored by the network script and will not be started automatically. 
            + Interfaces can be manually started or stopped with the ifup and ifdown commands.
        - The IFACE variable defines the interface name, for example, eth0. 
            + It is required for all network device configuration files. 
            + The filename extension must match this value.
        - The SERVICE variable defines the method used for obtaining the IP address. 
            + The LFS-Bootscripts package has a modular IP assignment format, and creating additional files in the /lib/services/ directory allows other IP assignment methods. 
            + This is commonly used for Dynamic Host Configuration Protocol (DHCP), which is addressed in the BLFS book.
        - The GATEWAY variable should contain the default gateway IP address, if one is present. 
            + If not, then comment out the variable entirely.
        - The PREFIX variable specifies the number of bits used in the subnet. 
            - Each segment of an IP address is 8 bits. 
                + If the subnet's netmask is 255.255.255.0, then it is using the first three segments (24 bits) to specify the network number. 
                + If the netmask is 255.255.255.240, the subnet is using the first 28 bits. 
                + Prefixes longer than 24 bits are commonly used by DSL and cable-based Internet Service Providers (ISPs). 
            - In this example (PREFIX=24), 
                + the netmask is 255.255.255.0. Adjust the PREFIX variable according to your specific subnet. 
                + If omitted, the PREFIX defaults to 24.
        + For more information see the 'ifup' man page.
        ```console
        cd /etc/sysconfig/
        cat > ifconfig.eth0 << "EOF"
ONBOOT=yes
IFACE=eth0
SERVICE=ipv4-static
IP=192.168.1.2
GATEWAY=192.168.1.1
PREFIX=24
BROADCAST=192.168.1.255
EOF
        ```

#### Creating the /etc/resolv.conf File
- Introduction
    - The system will need some means of obtaining Domain Name Service (DNS) name resolution to resolve Internet domain names to IP addresses, and vice versa. 
        + This is best achieved by placing the IP address of the DNS server, available from the ISP or network administrator, into /etc/resolv.conf. 
    
- Create the file
    - Information
        - The domain statement can be omitted or replaced with a search statement. 
            + See the man page for resolv.conf for more details.
        - Replace <IP address of the nameserver> with the IP address of the DNS most appropriate for the setup. 
            + There will often be more than one entry (requirements demand secondary servers for fallback capability). 
            - If you only need or want one DNS server, remove the second nameserver line from the file. 
                + The IP address may also be a router on the local network.
    - Note
        + The Google Public IPv4 DNS addresses are 8.8.8.8 and 8.8.4.4.
    - /etc/resolv.conf Format
        ```
        domain <Your Domain Name>
        nameserver <IP address of your primary nameserver>
        nameserver <IP address of your secondary nameserver>
        ```
    ```console
    cat > /etc/resolv.conf << "EOF"
# Begin /etc/resolv.conf
    
domain 127.0.0.1
nameserver 192.168.1.1
nameserver 192.168.1.254
    
# End /etc/resolv.conf
EOF
    ```

#### Configuring the System Hostname
- Introduction
    + During the boot process, the file /etc/hostname is used for establishing the system's hostname.

- Create the /etc/hostname file and enter a hostname
    - Explanation
        - <lfs> needs to be replaced with the name given to the computer. 
            + Do not enter the Fully Qualified Domain Name (FQDN) here. 
            + That information goes in the /etc/hosts file.
    ```console
    echo "<lfs>" > /etc/hostname
    ```

#### Customizing the /etc/hosts File
- Introduction
    - Decide on the IP address, fully-qualified domain name (FQDN), and possible aliases for use in the /etc/hosts file. 
        + The syntax is: `IP_address myhost.example.org aliases`
    - Unless the computer is to be visible to the Internet (i.e., there is a registered domain and a valid block of assigned IP addresses—most users do not have this), 
        + make sure that the IP address is in the private network IP address range. 
        - Valid ranges are:
            - Explanations
                + x can be any number in the range 16-31. y can be any number in the range 0-255.
                + A valid private IP address could be 192.168.1.1. A valid FQDN for this IP could be lfs.example.org.
                - Even if not using a network card, a valid FQDN is still required. 
                    + This is necessary for certain programs to operate correctly.
            ```
            Private Network Address Range      Normal Prefix
            10.0.0.1 - 10.255.255.254           8
            172.x.0.1 - 172.x.255.254           16
            192.168.y.1 - 192.168.y.254         24
            ```

- Create the /etc/hosts file
    - Explanation
        + The <192.168.1.1>, <FQDN>, and <HOSTNAME> values need to be changed for specific uses or requirements (if assigned an IP address by a network/system administrator and the machine will be connected to an existing network). 
        + The optional alias name(s) can be omitted.
    ```console
    cat > /etc/hosts << "EOF"
# Begin /etc/hosts
    
127.0.0.1 localhost.localdomain localhost
127.0.1.1 <FQDN> <HOSTNAME>

# <192.168.1.1> <FQDN> <HOSTNAME> [alias1] [alias2 ...]
::1       localhost ip6-localhost ip6-loopback
ff02::1   ip6-allnodes
ff02::2   ip6-allrouters
    
# End /etc/hosts
EOF
    ```

### System V Bootscript Usage and Configuration
#### How Do the System V Bootscripts Work?
- This version of LFS uses a special booting facility named SysVinit, based on a series of run levels. 
    - The boot procedure can be quite different from one system to another; 
       + the fact that things worked one way in a particular Linux distribution does not guarantee they will work the same way in LFS. 
    + LFS has its own way of doing things, but it does respect generally accepted standards.

- There is an alternative boot procedure called [systemd](#using-systemd). 
    + For a detailed description visit https://www.linux.com/training-tutorials/understanding-and-using-systemd/.

- SysVinit (which will be referred to as “init” from now on) uses a run levels scheme. 
    + There are seven run levels, numbered 0 to 6. (Actually, there are more run levels, but the others are for special cases and are generally not used. See init(8) for more details.) 
    - Each one of the seven corresponds to actions the computer is supposed to perform when it starts up or shuts down. 
        + The default run level is 3. 
        - Classically, run level 2 above was defined as "multi-user mode without networking", but this was only the case many years ago when multiple users could connect to a system via serial ports. 
            + In today's environment it makes no sense, and we now say it is "reserved".
    - Here are the descriptions of the different run levels as they are implemented in LFS:
        + 0: halt the computer
        + 1: single-user mode
        + 2: reserved for customization, otherwise the same as 3
        + 3: multi-user mode with networking
        + 4: reserved for customization, otherwise the same as 3
        + 5: same as 4, it is usually used for GUI login (like GNOME's gdm or LXDE's lxdm)
        + 6: reboot the computer

#### Configuring Sysvinit
- Introduction
    - During kernel initialization, the first program that is run (if not overridden on the command line) is init. 
        + This program reads the initialization file /etc/inittab. 

- Create the '/etc/inittab' file
    - Explanation 
        + An explanation of this initialization file is in the man page for inittab. 
        - In LFS, 
            + the key command is rc. 
            - The initialization file above instructs rc to run all the scripts starting with an S in the '/etc/rc.d/rcS.d' directory 
                + followed by all the scripts starting with an S in the '/etc/rc.d/rc?.d' directory where the question mark is specified by the initdefault value.
        - As a convenience, the rc script reads a library of functions in /lib/lsb/init-functions. 
            + This library also reads an optional configuration file, /etc/sysconfig/rc.site. 
            - Any of the system configuration parameters described in subsequent sections can be placed in this file, 
                + allowing consolidation of all system parameters in this one file.
        - As a debugging convenience, the functions script also logs all output to /run/var/bootlog. 
            - Since the /run directory is a tmpfs, this file is not persistent across boots; 
                + however, it is appended to the more permanent file /var/log/boot.log at the end of the boot process.
    ```console
    cat > /etc/inittab << "EOF"
# Begin /etc/inittab
   
id:3:initdefault:
    
si::sysinit:/etc/rc.d/init.d/rc S
    
l0:0:wait:/etc/rc.d/init.d/rc 0
l1:S1:wait:/etc/rc.d/init.d/rc 1
l2:2:wait:/etc/rc.d/init.d/rc 2
l3:3:wait:/etc/rc.d/init.d/rc 3
l4:4:wait:/etc/rc.d/init.d/rc 4
l5:5:wait:/etc/rc.d/init.d/rc 5
l6:6:wait:/etc/rc.d/init.d/rc 6
    
ca:12345:ctrlaltdel:/sbin/shutdown -t1 -a -r now
    
su:S06:once:/sbin/sulogin
s1:1:respawn:/sbin/sulogin
    
1:2345:respawn:/sbin/agetty --noclear tty1 9600
2:2345:respawn:/sbin/agetty tty2 9600
3:2345:respawn:/sbin/agetty tty3 9600
4:2345:respawn:/sbin/agetty tty4 9600
5:2345:respawn:/sbin/agetty tty5 9600
6:2345:respawn:/sbin/agetty tty6 9600
    
# End /etc/inittab
EOF
    ```

#### Changing Run Levels
- Changing run levels is done with init <runlevel>, 
    + where <runlevel> is the target run level. 
    - For example, 
        - to reboot the computer, a user could issue the init 6 command, 
            + which is an alias for the reboot command. 
        + Likewise, init 0 is an alias for the halt command.

- There are a number of directories under /etc/rc.d that look like 'rc?.d' (where ? is the number of the run level) and rcS.d, all containing a number of symbolic links. 
    - Some links begin with a K; the others begin with an S, and all of them have two numbers following the initial letter. 
        + The K means to stop (kill) a service and the S means to start a service. 
        + The numbers determine the order in which the scripts are run, from 00 to 99—the smaller the number, the sooner the script runs. 
    + When init switches to another run level, the appropriate services are either started or stopped, depending on the run level chosen.

- The real scripts are in /etc/rc.d/init.d. 
    + They do the actual work, and the symlinks all point to them. 
    - K links and S links point to the same script in /etc/rc.d/init.d. 
        + This is because the scripts can be called with different parameters like start, stop, restart, reload, and status. 
        + When a K link is encountered, the appropriate script is run with the stop argument. 
        + When an S link is encountered, the appropriate script is run with the start argument.
    - These are descriptions of what the arguments make the scripts do:
        + start : The service is started.
        + stop : The service is stopped.
        + restart : The service is stopped and then started again.
        + reload : The configuration of the service is updated. This is used after the configuration file of a service was modified, when the service does not need to be restarted.
        + status : Tells if the service is running and with which PIDs.
    - Feel free to modify the way the boot process works (after all, it is your own LFS system). 
        + The files given here are an example of how it can be done.

#### Udev Bootscripts
+ The /etc/rc.d/init.d/udev initscript starts udevd, triggers any "coldplug" devices that have already been created by the kernel, and waits for any rules to complete. The script also unsets the uevent handler from the default of /sbin/hotplug . This is done because the kernel no longer needs to call an external binary. Instead, udevd will listen on a netlink socket for uevents that the kernel raises.
+ The /etc/rc.d/init.d/udev_retry script takes care of re-triggering events for subsystems whose rules may rely on file systems that are not mounted until the mountfs script is run (in particular, /usr and /var may cause this). This script runs after the mountfs script, so those rules (if re-triggered) should succeed the second time around. It is configured by the /etc/sysconfig/udev_retry file; any words in this file other than comments are considered subsystem names to trigger at retry time. To find the subsystem of a device, use udevadm info --attribute-walk <device> where <device> is an absolute path in /dev or /sys, such as /dev/sr0, or /sys/class/rtc.
+ For information on kernel module loading and udev, see Section 9.3.2.3, “Module Loading”.

#### Configuring the System Clock
- The setclock script reads the time from the hardware clock, also known as the BIOS or Complementary Metal Oxide Semiconductor (CMOS) clock. 
    + If the hardware clock is set to UTC, this script will convert the hardware clock's time to the local time using the /etc/localtime file (which tells the hwclock program which time zone to use). 
    + There is no way to detect whether or not the hardware clock is set to UTC, so this must be configured manually.

- The 'setclock' program is run via udev when the kernel detects the hardware capability upon boot. 
    + It can also be run manually with the stop parameter to store the system time to the CMOS clock.

- If you cannot remember whether or not the hardware clock is set to UTC, find out by running the `hwclock --localtime --show` command. 
    - This will display what the current time is according to the hardware clock. 
        + If this time matches whatever your watch says, then the hardware clock is set to local time. 
        - If the output from hwclock is not local time, chances are it is set to UTC time. 
            - Verify this by adding or subtracting the proper number of hours for your time zone to the time shown by hwclock. 
                + For example, if you are currently in the MST time zone, which is also known as GMT -0700, add seven hours to the local time.
            + Change the value of the UTC variable below to a value of 0 (zero) if the hardware clock is NOT set to UTC time.

- Create a new file '/etc/sysconfig/clock'
    - Notes
        - A good hint explaining how to deal with time on LFS is available at https://www.linuxfromscratch.org/hints/downloads/files/time.txt. 
            + It explains issues such as time zones, UTC, and the TZ environment variable.
        + The CLOCKPARAMS and UTC parameters may also be set in the /etc/sysconfig/rc.site file.
    ```console
    cat > /etc/sysconfig/clock << "EOF"
# Begin /etc/sysconfig/clock
    
UTC=1
    
# Set this to any options you might need to give to hwclock,
# such as machine hardware clock type for Alphas.
CLOCKPARAMS=
    
# End /etc/sysconfig/clock
EOF
    ```

#### Configuring the Linux Console
- This section discusses how to configure the console bootscript that sets up the keyboard map, console font, and console kernel log level. 
    + If non-ASCII characters (e.g., the copyright sign, the British pound sign, and the Euro symbol) will not be used and the keyboard is a U.S. one, much of this section can be skipped. 
    + Without the configuration file, (or equivalent settings in rc.site), the console bootscript will do nothing.

- The console script reads the /etc/sysconfig/console file for configuration information. 
    - Decide which keymap and screen font will be used. 
        + Various language-specific HOWTOs can also help with this; see https://tldp.org/HOWTO/HOWTO-INDEX/other-lang.html. 
    - If still in doubt, look in the /usr/share/keymaps and /usr/share/consolefonts directories for valid keymaps and screen fonts. 
        + Read the loadkeys(1) and setfont(8) manual pages to determine the correct arguments for these programs.

- The /etc/sysconfig/console file should contain lines of the form: VARIABLE="value". 
    - The following variables are recognized:
        + LOGLEVEL : This variable specifies the log level for kernel messages sent to the console as set by dmesg -n. Valid levels are from "1" (no messages) to "8". The default level is "7".
        + KEYMAP : This variable specifies the arguments for the loadkeys program, typically, the name of the keymap to load, e.g., “it”. If this variable is not set, the bootscript will not run the loadkeys program, and the default kernel keymap will be used. Note that a few keymaps have multiple versions with the same name (cz and its variants in qwerty/ and qwertz/, es in olpc/ and qwerty/, and trf in fgGIod/ and qwerty/). In these cases the parent directory should also be specified (e.g. qwerty/es) to ensure the proper keymap is loaded.
        + KEYMAP_CORRECTIONS : This (rarely used) variable specifies the arguments for the second call to the loadkeys program. This is useful if the stock keymap is not completely satisfactory and a small adjustment has to be made. E.g., to include the Euro sign into a keymap that normally doesn't have it, set this variable to “euro2”.
        + FONT : This variable specifies the arguments for the setfont program. Typically, this includes the font name, “-m”, and the name of the application character map to load. E.g., in order to load the “lat1-16” font together with the “8859-1” application character map (appropriate in the USA), set this variable to “lat1-16 -m 8859-1”. In UTF-8 mode, the kernel uses the application character map to convert 8-bit key codes to UTF-8. Therefore the argument of the "-m" parameter should be set to the encoding of the composed key codes in the keymap.
        + UNICODE : Set this variable to “1”, “yes”, or “true” in order to put the console into UTF-8 mode. This is useful in UTF-8 based locales and harmful otherwise.
        + LEGACY_CHARSET : For many keyboard layouts, there is no stock Unicode keymap in the Kbd package. The console bootscript will convert an available keymap to UTF-8 on the fly if this variable is set to the encoding of the available non-UTF-8 keymap.
    - Some examples:
        - For a non-Unicode setup, only the KEYMAP and FONT variables are generally needed. E.g., for a Polish setup, one would use:
            + As mentioned above, it is sometimes necessary to adjust a stock keymap slightly. 
            ```console
            cat > /etc/sysconfig/console << "EOF"
# Begin /etc/sysconfig/console
            
KEYMAP="pl2"
FONT="lat2a-16 -m 8859-2"
            
# End /etc/sysconfig/console
EOF
            ```

        - The following example adds the Euro symbol to the German keymap:
            ```console
            cat > /etc/sysconfig/console << "EOF"
# Begin /etc/sysconfig/console
            
KEYMAP="de-latin1"
KEYMAP_CORRECTIONS="euro2"
FONT="lat0-16 -m 8859-15"
UNICODE="1"
            
# End /etc/sysconfig/console
EOF
            ```

        - The following is a Unicode-enabled example for Bulgarian, where a stock UTF-8 keymap exists:
            ```console
            cat > /etc/sysconfig/console << "EOF"
# Begin /etc/sysconfig/console
            
UNICODE="1"
KEYMAP="bg_bds-utf8"
FONT="LatArCyrHeb-16"
            
# End /etc/sysconfig/console
EOF

        - Due to the use of a 512-glyph LatArCyrHeb-16 font in the previous example, bright colors are no longer available on the Linux console unless a framebuffer is used. If one wants to have bright colors without a framebuffer and can live without characters not belonging to his language, it is still possible to use a language-specific 256-glyph font, as illustrated below:
            ```console
            cat > /etc/sysconfig/console << "EOF"
# Begin /etc/sysconfig/console
            
UNICODE="1"
KEYMAP="bg_bds-utf8"
FONT="cyr-sun16"
            
# End /etc/sysconfig/console
EOF

        - The following example illustrates keymap autoconversion from ISO-8859-15 to UTF-8 and enabling dead keys in Unicode mode:
            ```console
            cat > /etc/sysconfig/console << "EOF"
# Begin /etc/sysconfig/console
            
UNICODE="1"
KEYMAP="de-latin1"
KEYMAP_CORRECTIONS="euro2"
LEGACY_CHARSET="iso-8859-15"
FONT="LatArCyrHeb-16 -m 8859-15"
            
# End /etc/sysconfig/console
EOF
            ```

        + Some keymaps have dead keys (i.e., keys that don't produce a character by themselves, but put an accent on the character produced by the next key) or define composition rules (such as: “press Ctrl+. A E to get Æ” in the default keymap). Linux-6.4.12 interprets dead keys and composition rules in the keymap correctly only when the source characters to be composed together are not multibyte. This deficiency doesn't affect keymaps for European languages, because there accents are added to unaccented ASCII characters, or two ASCII characters are composed together. However, in UTF-8 mode it is a problem; e.g., for the Greek language, where one sometimes needs to put an accent on the letter “alpha”. The solution is either to avoid the use of UTF-8, or to install the X window system, which doesn't have this limitation, in its input handling.
        - For Chinese, Japanese, Korean, and some other languages, the Linux console cannot be configured to display the needed characters. Users who need such languages should install the X Window System, fonts that cover the necessary character ranges, and the proper input method (e.g., SCIM supports a wide variety of languages).
            - Note
                + The /etc/sysconfig/console file only controls the Linux text console localization. It has nothing to do with setting the proper keyboard layout and terminal fonts in the X Window System, with ssh sessions, or with a serial console. In such situations, limitations mentioned in the last two list items above do not apply.

#### Creating Files at Boot
- At times, it is desirable to create files at boot time. 
    + For instance, the /tmp/.ICE-unix directory is often needed. 

- This can be done by creating an entry in the /etc/sysconfig/createfiles configuration script. 
   + The format of this file is embedded in the comments of the default configuration file.

#### Configuring the Sysklogd Script
- Introduction
   - The sysklogd script invokes the syslogd program as a part of System V initialization. 
       + The -m 0 option turns off the periodic timestamp mark that syslogd writes to the log files every 20 minutes by default. 
   - If you want to turn on this periodic timestamp mark, edit /etc/sysconfig/rc.site and define the variable SYSKLOGD_PARMS to the desired value. 
       - For instance, to remove all parameters, set the variable to a null value:
           + See man syslogd for more options.
       ```
       SYSKLOGD_PARMS=
       ```

#### The rc.site File
- Introduction
    - The optional /etc/sysconfig/rc.site file contains settings that are automatically set for each SystemV boot script. 
       - It can alternatively set the values specified in the hostname, console, and clock files in the /etc/sysconfig/ directory. 
           + If the associated variables are present in both these separate files and rc.site, the values in the script-specific files take effect.

    - rc.site also contains parameters that can customize other aspects of the boot process. 
        + Setting the IPROMPT variable will enable selective running of bootscripts. 
        + Other options are described in the file comments. 
        - The default version of the file is as follows:
            ```
            # rc.site
            # Optional parameters for boot scripts.
            
            # Distro Information
            # These values, if specified here, override the defaults
            #DISTRO="Linux From Scratch" # The distro name
            #DISTRO_CONTACT="lfs-dev@lists.linuxfromscratch.org" # Bug report address
            #DISTRO_MINI="LFS" # Short name used in filenames for distro config
            
            # Define custom colors used in messages printed to the screen
            
            # Please consult `man console_codes` for more information
            # under the "ECMA-48 Set Graphics Rendition" section
            #
            # Warning: when switching from a 8bit to a 9bit font,
            # the linux console will reinterpret the bold (1;) to
            # the top 256 glyphs of the 9bit font.  This does
            # not affect framebuffer consoles
            
            # These values, if specified here, override the defaults
            #BRACKET="\\033[1;34m" # Blue
            #FAILURE="\\033[1;31m" # Red
            #INFO="\\033[1;36m"    # Cyan
            #NORMAL="\\033[0;39m"  # Grey
            #SUCCESS="\\033[1;32m" # Green
            #WARNING="\\033[1;33m" # Yellow
            
            # Use a colored prefix
            # These values, if specified here, override the defaults
            #BMPREFIX="      "
            #SUCCESS_PREFIX="${SUCCESS}  *  ${NORMAL} "
            #FAILURE_PREFIX="${FAILURE}*****${NORMAL} "
            #WARNING_PREFIX="${WARNING} *** ${NORMAL} "

            # Manually set the right edge of message output (characters)
            # Useful when resetting console font during boot to override
            # automatic screen width detection
            #COLUMNS=120
            
            # Interactive startup
            #IPROMPT="yes" # Whether to display the interactive boot prompt
            #itime="3"    # The amount of time (in seconds) to display the prompt
            
            # The total length of the distro welcome string, without escape codes
            #wlen=$(echo "Welcome to ${DISTRO}" | wc -c )
            #welcome_message="Welcome to ${INFO}${DISTRO}${NORMAL}"
            
            # The total length of the interactive string, without escape codes
            #ilen=$(echo "Press 'I' to enter interactive startup" | wc -c )
            #i_message="Press '${FAILURE}I${NORMAL}' to enter interactive startup"
            
            # Set scripts to skip the file system check on reboot
            #FASTBOOT=yes
            
            # Skip reading from the console
            #HEADLESS=yes
            
            # Write out fsck progress if yes
            #VERBOSE_FSCK=no
            
            # Speed up boot without waiting for settle in udev
            #OMIT_UDEV_SETTLE=y
            
            # Speed up boot without waiting for settle in udev_retry
            #OMIT_UDEV_RETRY_SETTLE=yes
            
            # Skip cleaning /tmp if yes
            #SKIPTMPCLEAN=no
            
            # For setclock
            #UTC=1
            #CLOCKPARAMS=
            
            # For consolelog (Note that the default, 7=debug, is noisy)
            #LOGLEVEL=7
            
            # For network
            #HOSTNAME=mylfs
            
            # Delay between TERM and KILL signals at shutdown
            #KILLDELAY=3

            # Optional sysklogd parameters
            #SYSKLOGD_PARMS="-m 0"
            
            # Console parameters
            #UNICODE=1
            #KEYMAP="de-latin1"
            #KEYMAP_CORRECTIONS="euro2"
            #FONT="lat0-16 -m 8859-15"
            #LEGACY_CHARSET=
            ```

#### Customizing the Boot and Shutdown Scripts
- The LFS boot scripts boot and shut down a system in a fairly efficient manner, 
    + but there are a few tweaks you can make in the rc.site file to improve speed even more, and to adjust messages according to your preferences. 
    + To do this, adjust the settings in the /etc/sysconfig/rc.site file.

- During the boot script udev, there is a call to udev settle that requires some time to complete. 
    + This time may or may not be required depending on the devices in the system. 
    - If you only have simple partitions and a single ethernet card, the boot process will probably not need to wait for this command. 
        + To skip it, set the variable `OMIT_UDEV_SETTLE=y`.

- The boot script udev_retry also runs 'udev settle' by default. 
    + This command is only needed if the /var directory is separately mounted, because the clock needs the /var/lib/hwclock/adjtime file. 
    - Other customizations may also need to wait for udev to complete, but in many installations it is not necessary. 
        + Skip the command by setting the variable `OMIT_UDEV_RETRY_SETTLE=y`.

- By default, the file system checks are silent. 
    + This can appear to be a delay during the bootup process. 
    + To turn on the fsck output, set the variable `VERBOSE_FSCK=y`.

- When rebooting, you may want to skip the filesystem check, fsck, completely. 
    - To do this, 
        - either create the file '/fastboot' or reboot the system with the command `/sbin/shutdown -f -r now`. 
            + Setting the variable FASTBOOT=y will disable fsck during the boot process until it is removed. This is not recommended on a permanent basis.
        + On the other hand, you can force all file systems to be checked by creating /forcefsck or running shutdown with the -F parameter instead of -f.

- Normally, all files in the /tmp directory are deleted at boot time.
    - Depending on the number of files or directories present, this can cause a noticeable delay in the boot process. 
        + To skip removing these files set the variable `SKIPTMPCLEAN=y`.

- During shutdown, the init program sends a TERM signal to each program it has started (e.g. agetty), waits for a set time (default 3 seconds), then sends each process a KILL signal and waits again. 
    + This process is repeated in the sendsignals script for any processes that are not shut down by their own scripts. 
    - The delay for init can be set by passing a parameter. 
        + For example to remove the delay in init, pass the -t0 parameter when shutting down or rebooting (e.g. /sbin/shutdown -t0 -r now). 
        + The delay for the sendsignals script can be skipped by setting the parameter KILLDELAY=0.

### Bash Shell Startup Files
- Introduction
    + The files /etc/profile and ~/.bash_profile are read when the shell is invoked as an interactive login shell.
    - The base /etc/profile below sets some environment variables necessary for native language support. 
        - Setting them properly results in:
            + The output of programs translated into the native language
            + Correct classification of characters into letters, digits and other classes. This is necessary for bash to properly accept non-ASCII characters in command lines in non-English locales
            + The correct alphabetical sorting order for the country
            + Appropriate default paper size
            + Correct formatting of monetary, time, and date values
        - Replace <ll> below with the two-letter code for the desired language (e.g., “en”) and <CC> with the two-letter code for the appropriate country (e.g., “GB”). 
            + <charmap> should be replaced with the canonical charmap for your chosen locale. 
            + Optional modifiers such as “@euro” may also be present.

- The list of all locales supported by Glibc can be obtained by running the following command:
    ```console
    locale -a
    ```

- Determine the canonical name
    - Explanation
        - Charmaps can have a number of aliases, e.g., “ISO-8859-1” is also referred to as “iso8859-1” and “iso88591”. 
        - Some applications cannot handle the various synonyms correctly (e.g., require that “UTF-8” is written as “UTF-8”, not “utf8”), 
            + so it is safest in most cases to choose the canonical name for a particular locale.
    - Notes
        - <locale name> is the output given by locale -a for your preferred locale (“en_GB.iso88591” in our example)
    - Examples
        + “en_GB.iso88591” locale will print: ISO-8859-1
    ```console
    LC_ALL=<locale name> locale charmap
    ```

- Test the locale found before it is added to the Bash startup files
    - Explanation
        - The commands should print the language name, the character encoding used by the locale, the local currency, and the prefix to dial before the telephone number in order to get into the country. 
    ```console
    LC_ALL=<locale name> locale language
    LC_ALL=<locale name> locale charmap
    LC_ALL=<locale name> locale int_curr_symbol
    LC_ALL=<locale name> locale int_prefix
    ```
    - If any of the commands above fail with a message similar to the following, 
        + this means that your locale was either not installed in Section 8.5, “Glibc-2.38” or is not supported by the default installation of Glibc.
        ```
        locale: Cannot set LC_* to default locale: No such file or directory
        ```
    - If this happens, you should either install the desired locale using the localedef command, or consider choosing a different locale. 
        + Further instructions assume that there are no such error messages from Glibc.
        - Other packages may also function incorrectly (but will not necessarily display any error messages) if the locale name does not meet their expectations. 
            + In such cases, investigating how other Linux distributions support your locale might provide some useful information.

- Once the proper locale settings have been determined, create the /etc/profile file
    ```console
    cat > /etc/profile << "EOF"
# Begin /etc/profile
    
export LANG=<ll>_<CC>.<charmap><@modifiers>
    
# End /etc/profile
EOF
    ```

- Notes
    - The “C” (default) and “en_US.utf8” (the recommended one for United States English users) locales are different. 
        + “C” uses the US-ASCII 7-bit character set, and treats bytes with the high-order bit set “on” as invalid characters. 
    - That's why, 
        - e.g., 
            + the ls command displays them as question marks in that locale. 
            - Also, an attempt to send mail with such characters from Mutt or Pine results in non-RFC-conforming messages being sent (the charset in the outgoing mail is indicated as “unknown 8-bit”). 
                + So you can only use the “C” locale if you are sure you will never need 8-bit characters.
    - UTF-8 based locales are not supported well by some programs. 
        + Work is in progress to document and, if possible, fix such problems. 
        + See https://www.linuxfromscratch.org/blfs/view/12.0/introduction/locale-issues.html.

### Creating the /etc/inputrc File
- Introduction
    - The inputrc file is the configuration file for the readline library, 
        + which provides editing capabilities while the user is entering a line from the terminal. 
        + It works by translating keyboard inputs into specific actions. 
        + Readline is used by bash and most other shells as well as many other applications.

    - Most people do not need user-specific functionality so the command below creates a global /etc/inputrc used by everyone who logs in. 
        - If you later decide you need to override the defaults on a per user basis, 
            + you can create a .inputrc file in the user's home directory with the modified mappings.

- For more information on how to edit the inputrc file, 
    + see info bash under the Readline Init File section. 
    + info readline is also a good source of information.

- Below is a generic global inputrc along with comments to explain what the various options do. 
    - Note
        + comments cannot be on the same line as commands. 

> Create the /etc/inputrc file:
```console
cat > /etc/inputrc << "EOF"
# Begin /etc/inputrc
# Modified by Chris Lynn <roryo@roryo.dynup.net>
  
# Allow the command prompt to wrap to the next line
set horizontal-scroll-mode Off
 
# Enable 8-bit input
set meta-flag On
set input-meta On
   
# Turns off 8th bit stripping
set convert-meta Off
  
# Keep the 8th bit for display
set output-meta On
  
# none, visible or audible
set bell-style none
  
# All of the following map the escape sequence of the value
# contained in the 1st argument to the readline specific functions
"\eOd": backward-word
"\eOc": forward-word

# for linux console
"\e[1~": beginning-of-line
"\e[4~": end-of-line
"\e[5~": beginning-of-history
"\e[6~": end-of-history
"\e[3~": delete-char
"\e[2~": quoted-insert

# for xterm
"\eOH": beginning-of-line
"\eOF": end-of-line

# for Konsole
"\e[H": beginning-of-line
"\e[F": end-of-line

# End /etc/inputrc
EOF

### Creating the /etc/shells File
- Introduction
    + The shells file contains a list of login shells on the system. 
    + Applications use this file to determine whether a shell is valid. 
    - For each shell a single line should be present, 
        + consisting of the shell's path relative to the root of the directory structure (/).

    - For example, 
        + this file is consulted by chsh to determine whether an unprivileged user may change the login shell for her own account. 
        + If the command name is not listed, the user will be denied the ability to change shells.

    - It is a requirement for applications such as GDM which does not populate the face browser if it can't find /etc/shells, 
        + or FTP daemons which traditionally disallow access to users with shells not included in this file.

> Create the file
```
cat > /etc/shells << "EOF"
# Begin /etc/shells

/bin/sh
/bin/bash

# End /etc/shells
EOF
```

## Making the LFS System Bootable
### Table of Contents 
- [Notes](#notes)
- [10.1. Introduction](#introduction)
- [10.2. Creating the /etc/fstab File](#creating-the-/etc/fstab-file)
- [10.3. Linux](#linux-kernel)
- [10.4. Using GRUB to Set Up the Boot Process](#using-grub-to-set-up-the-boot-process)

### Notes

### Introduction
- It is time to make the LFS system bootable. 
- This chapter discusses 
    + creating the /etc/fstab file, 
    + building a kernel for the new LFS system, and 
    + installing the GRUB boot loader so that the LFS system can be selected for booting at startup.

### Creating the /etc/fstab file
- Information
    - The /etc/fstab file is used by some programs to determine 
        + where file systems are to be mounted by default, 
        + in which order, and 
        + which must be checked (for integrity errors) prior to mounting. 

> Create a new file systems table
- Information
    - Replace <xxx>, <yyy>, and <fff> with the values appropriate for the system, 
        - for example, 
            + sda2, 
            + sda5, and 
            + ext4. 
        + For details on the six fields in this file, see `man 5 fstab`.

```console
cat > /etc/fstab << "EOF"
# Begin /etc/fstab

# file system  mount-point    type     options             dump  fsck
#                                                                order

/dev/<xxx>     /              <fff>    defaults            1     1
/dev/<yyy>     swap           swap     pri=1               0     0
proc           /proc          proc     nosuid,noexec,nodev 0     0
sysfs          /sys           sysfs    nosuid,noexec,nodev 0     0
devpts         /dev/pts       devpts   gid=5,mode=620      0     0
tmpfs          /run           tmpfs    defaults            0     0
devtmpfs       /dev           devtmpfs mode=0755,nosuid    0     0
tmpfs          /dev/shm       tmpfs    nosuid,nodev        0     0
cgroup2        /sys/fs/cgroup cgroup2  nosuid,noexec,nodev 0     0

# End /etc/fstab
EOF
```

- Filesystems with MS-DOS or Windows origin (i.e. vfat, ntfs, smbfs, cifs, iso9660, udf) need a special option, utf8, in order for non-ASCII characters in file names to be interpreted properly. 
    - For non-UTF-8 locales, 
        + the value of iocharset should be set to be the same as the character set of the locale, adjusted in such a way that the kernel understands it. 
    - This works if the relevant character set definition (found under File systems -> Native Language Support when configuring the kernel) has been compiled into the kernel or built as a module. 
        - However, if the character set of the locale is UTF-8, the corresponding option iocharset=utf8 would make the file system case sensitive. 
            - To fix this, use the special option 'utf8' instead of 'iocharset=utf8', for UTF-8 locales. 
                + The “codepage” option is also needed for vfat and smbfs filesystems. 
                - It should be set to the codepage number used under MS-DOS in your country. 
                     - For example, 
                         + in order to mount USB flash drives, a `ru_RU.KOI8-R` user would need the following in the options portion of its mount line in /etc/fstab:
                             ```
                             noauto,user,quiet,showexec,codepage=866,iocharset=koi8r
                             ```
                         + The corresponding options fragment for ru_RU.UTF-8 users is:
                             ```
                             noauto,user,quiet,showexec,codepage=866,utf8
                             ```
                     - Note that using iocharset is the default for iso8859-1 (which keeps the file system case insensitive), 
                         + and the utf8 option tells the kernel to convert the file names using UTF-8 so they can be interpreted in the UTF-8 locale.

- It is also possible to specify default codepage and iocharset values for some filesystems during kernel configuration. 
    - The relevant parameters are named 
        + “Default NLS Option” (CONFIG_NLS_DEFAULT), 
        + “Default Remote NLS Option” (CONFIG_SMB_NLS_DEFAULT), 
        + “Default codepage for FAT” (CONFIG_FAT_DEFAULT_CODEPAGE), and 
        + “Default iocharset for FAT” (CONFIG_FAT_DEFAULT_IOCHARSET). 
    + There is no way to specify these settings for the ntfs filesystem at kernel compilation time.

- It is possible to make the ext3 filesystem reliable across power failures for some hard disk types. 
    + To do this, add the 'barrier=1' mount option to the appropriate entry in /etc/fstab. 
    - To check if the disk drive supports this option, run hdparm on the applicable disk drive. 
        - For example,
            - if `hdparm -I /dev/sda | grep NCQ` returns non-empty output, the option is supported.
        - Note: 
            + Logical Volume Management (LVM) based partitions cannot use the barrier option.

### Linux Kernel
#### Installation
- Information
    + File Name: linux-[version].tar.xz
    + Estimated required disk space: 1200-8800 MB
    - Description: This is the Linux kernel
    - Package Contents
    - Installed
        - Files: 
            + config-6.4.12 : Contains all the configuration selections for the kernel
            + vmlinuz-6.4.12-lfs-12.0 : The engine of the Linux system. When turning on the computer, the kernel is the first part of the operating system that gets loaded. It detects and initializes all components of the computer's hardware, then makes these components available as a tree of files to the software and turns a single CPU into a multitasking machine capable of running scores of programs seemingly at the same time
            + System.map-6.4.12 : A list of addresses and symbols; it maps the entry points and addresses of all the functions and data structures in the kernel
        + Libraries: 
        + Directories: /lib/modules, /usr/share/doc/linux-6.4.12

- Important
    - Building the linux kernel for the first time is one of the most challenging tasks in LFS. 
        + Getting it right depends on the specific hardware for the target system and your specific needs. 
    - There are almost 12,000 configuration items that are available for the kernel although only about a third of them are needed for most computers. 
        + The LFS editors recommend that users not familiar with this process follow the procedures below fairly closely. 
    - The objective is to get an initial system to a point where you can log in at the command line when you reboot later in Section 11.3, “Rebooting the System”. 
        + At this point optimization and customization is not a goal.
    - For general information on kernel configuration see [LFS - kernel-configuration.txt](https://www.linuxfromscratch.org/hints/downloads/files/kernel-configuration.txt). 
        + Additional information about configuring and building the kernel can be found at https://anduin.linuxfromscratch.org/LFS/kernel-nutshell/. 
        + These references are a bit dated, but still give a reasonable overview of the process.
    - If all else fails, you can ask for help on the [lfs-support](https://www.linuxfromscratch.org/mail.html) mailing list. 
        + Note that subscribing is required in order for the list to avoid spam.

- Extract tar file
    ```console
    tar -xvf linux-[version].tar.xz
    ```

- Change directory into source file
    ```console
    cd linux-[version]
    ```

- Configure and prepare for compilation
    - Explanation
        + This ensures that the kernel tree is absolutely clean. 
        + The kernel team recommends that this command be issued prior to each kernel compilation. 
        + Do not rely on the source tree being clean after un-tarring.
    ```console
    make mrproper
    ```

- There are several ways to configure the kernel options. 
    - Usually, This is done through a menu-driven interface, for example:
        - menuconfig
            - Optional make Environment Variables
                - `LANG=<host_LANG_value> LC_ALL=` : This establishes the locale setting to the one used on the host. 
                    + This may be needed for a proper menuconfig ncurses interface line drawing on a UTF-8 linux text console.
                    - If used, be sure to replace '<host_LANG_value>' by the value of the $LANG variable from your host. 
                        + You can alternatively use instead the host's value of $LC_ALL or $LC_CTYPE.
                - `make menuconfig` : This launches an ncurses menu-driven interface. For other (graphical) interfaces, type make help.
            - Notes
                - A good starting place for setting up the kernel configuration is to run make defconfig. 
                    + This will set the base configuration to a good state that takes your current system architecture into account.
                - Be sure to enable/disable/set the following features or the system might not work correctly or boot at all:
                    ```
General setup --->
  [ ] Compile the kernel with warnings as errors                        [WERROR]
  CPU/Task time and stats accounting --->
    [*] Pressure stall information tracking                                [PSI]
    [ ]   Require boot parameter to enable pressure stall information tracking
                                                     ...  [PSI_DEFAULT_DISABLED]
  < > Enable kernel headers through /sys/kernel/kheaders.tar.xz      [IKHEADERS]
  [*] Control Group support --->                                       [CGROUPS]
    [*] Memory controller                                                [MEMCG]
  [ ] Configure standard kernel features (expert users) --->            [EXPERT]

Processor type and features --->
  [*] Build a relocatable kernel                                   [RELOCATABLE]
  [*]   Randomize the address of the kernel image (KASLR)       [RANDOMIZE_BASE]

General architecture-dependent options --->
  [*] Stack Protector buffer overflow detection                 [STACKPROTECTOR]
  [*]   Strong Stack Protector                           [STACKPROTECTOR_STRONG]

Device Drivers --->
  Generic Driver Options --->
    [ ] Support for uevent helper                                [UEVENT_HELPER]
    [*] Maintain a devtmpfs filesystem to mount at /dev               [DEVTMPFS]
    [*]   Automount devtmpfs at /dev, after the kernel mounted the rootfs
                                                           ...  [DEVTMPFS_MOUNT]
  Graphics support --->
    Frame buffer Devices --->
      <*> Support for frame buffer devices --->                             [FB]
    Console display driver support --->
      [*] Framebuffer Console support                      [FRAMEBUFFER_CONSOLE]
                    ```
                - Enable some additional features if you are building a 64-bit system. 
                    - If you are using menuconfig, enable them in the order of 
                        1. CONFIG_PCI_MSI then 
                        2. CONFIG_IRQ_REMAP, 
                        3. CONFIG_X86_X2APIC 
                    + because an option only shows up after its dependencies are selected.
                    ```
Processor type and features --->
  [*] Support x2apic                                                [X86_X2APIC]

Device Drivers --->
  [*] PCI support --->                                                     [PCI]
    [*] Message Signaled Interrupts (MSI and MSI-X)                    [PCI_MSI]
  [*] IOMMU Hardware Support --->                                [IOMMU_SUPPORT]
    [*] Support for Interrupt Remapping                              [IRQ_REMAP]
                    ```
                - If you are building a 32-bit system running on a hardware with RAM more than 4GB, 
                    + adjust the configuration so the kernel will be able to use up to 64GB physical RAM:
                    ```
Processor type and features --->
  High Memory Support --->
    (X) 64GB                                                        [HIGHMEM64G]
                    ```
                - If the partition for the LFS system is in a NVME SSD (i. e. the device node for the partition is /dev/nvme* instead of /dev/sd*), enable NVME support or the LFS system won't boot:
                    ```console
Device Drivers --->
  NVME Support --->
    <*> NVM Express block device                                  [BLK_DEV_NVME]
                    ```
                - There are several other options that may be desired depending on the requirements for the system. 
                    + For a list of options needed for BLFS packages, see the [BLFS Index of Kernel Settings](https://www.linuxfromscratch.org/blfs/view/12.0/longindex.html#kernel-config-index).
                - If your host hardware is using UEFI and you wish to boot the LFS system with it, 
                    + you should adjust some kernel configuration following the [BLFS page](https://www.linuxfromscratch.org/blfs/view/12.0/postlfs/grub-setup.html#uefi-kernel) even if you'll use the UEFI bootloader from the host distro.
            - The rationale for the above configuration items:
                + Randomize the address of the kernel image (KASLR) : Enable ASLR for kernel image, to mitigate some attacks based on fixed addresses of sensitive data or code in the kernel.
                + Compile the kernel with warnings as errors : This may cause building failure if the compiler and/or configuration are different from those of the kernel developers.
                + Enable kernel headers through /sys/kernel/kheaders.tar.xz : This will require cpio building the kernel. cpio is not installed by LFS.
                + Configure standard kernel features (expert users) : This will make some options show up in the configuration interface but changing those options may be dangerous. Do not use this unless you know what you are doing.
                + Strong Stack Protector : Enable SSP for the kernel. We've enabled it for the entire userspace with --enable-default-ssp configuring GCC, but the kernel does not use GCC default setting for SSP. We enable it explicitly here.
                + Support for uevent helper : Having this option set may interfere with device management when using Udev.
                + Maintain a devtmpfs : This will create automated device nodes which are populated by the kernel, even without Udev running. Udev then runs on top of this, managing permissions and adding symlinks. This configuration item is required for all users of Udev.
                + Automount devtmpfs at /dev : This will mount the kernel view of the devices on /dev upon switching to root filesystem just before starting init.
                + Framebuffer Console support : This is needed to display the Linux console on a frame buffer device. To allow the kernel to print debug messages at an early boot stage, it shouldn't be built as a kernel module unless an initramfs will be used. And, if CONFIG_DRM (Direct Rendering Manager) is enabled, it's likely CONFIG_DRM_FBDEV_EMULATION (Enable legacy fbdev support for your modesetting driver) should be enabled as well.
                + Support x2apic : Support running the interrupt controller of 64-bit x86 processors in x2APIC mode. x2APIC may be enabled by firmware on 64-bit x86 systems, and a kernel without this option enabled will panic on boot if x2APIC is enabled by firmware. This option has has no effect, but also does no harm if x2APIC is disabled by the firmware
            ```console
            make menuconfig
            ```

        - Alternatively, make oldconfig may be more appropriate in some situations. 
            + See the README file (in the package) for more information.

        - (Optional) Skip kernel configuration by 
            + copying the kernel config file, .config, from the host system (assuming it is available) to the unpacked linux-6.4.12 directory. 
            - However, we do not recommend this option. 
                + It is often better to explore all the configuration menus and create the kernel configuration from scratch.

- Compile the kernel image and modules
    ```console
    make
    ```

- Unless module support has been disabled in the kernel configuration, install the modules
    - Explanation
        - If using kernel modules, module configuration in /etc/modprobe.d may be required. 
            - Information pertaining to modules and kernel configuration is located in Section 9.3, “Overview of Device and Module Handling” and in the kernel documentation in the linux-6.4.12/Documentation directory. 
                + Also, modprobe.d(5) may be of interest.
    ```console
    make modules_install
    ```

- Copy some files to the '/boot' directory
    - Explanation
        - After kernel compilation is complete, additional steps are required to complete the installation. 
            + Some files need to be copied to the /boot directory.
    - Caution
        - If you've decided to use a separate /boot partition for the LFS system (maybe sharing a /boot partition with the host distro), 
            + the files copied below should go there. 
            - The easiest way to do that is to 
                1. create the entry for '/boot' in '/etc/fstab' first (read the previous section for details), then
                    ```
                    # /boot
                    /boot ...
                    ```
                2. issue the following command as the root user in the **chroot environment**:
                    + The path to the device node is omitted in the command because mount can read it from /etc/fstab.
                    ```console
                    mount /boot
                    ```
    - Copy Kernel Image
        - Explanation
            + The path to the kernel image may vary depending on the platform being used. 
            + The filename below can be changed to suit your taste, but the stem of the filename should be 'vmlinuz' to be compatible with the automatic setup of the boot process described in the next section. 
        - Architecture support
            - x86 architecture
                ```console
                cp -iv arch/x86/boot/bzImage /boot/vmlinuz-6.4.12-lfs-12.0
                ```

- Install the map file
    - Explanation
        + System.map is a symbol file for the kernel. 
        + It maps the function entry points of every function in the kernel API, 
            + as well as the addresses of the kernel data structures for the running kernel. 
        + It is used as a resource when investigating kernel problems.
    ```console
    cp -iv System.map /boot/System.map-6.4.12
    ```

- Keep the kernel configuration file '.config' for future reference
    - Explanation
        + The kernel configuration file .config produced by the make menuconfig step above contains all the configuration selections for the kernel that was just compiled.
        + It is a good idea to keep this file for future reference
    ```console
    cp -iv .config /boot/config-6.4.12
    ```

- Install the documentation for the Linux kernel
    ```console
    cp -r Documentation -T /usr/share/doc/linux-6.4.12
    ```

- Important Notes
    - the files in the kernel source directory are not owned by root. 
        - Whenever a package is unpacked as user root (like we did inside chroot), 
            + the files have the user and group IDs of whatever they were on the packager's computer. 
        - This is usually not a problem for any other package to be installed because the source tree is removed after the installation. 
            - However, the Linux source tree is often retained for a long time. 
                - Because of this, there is a chance that whatever user ID the packager used will be assigned to somebody on the machine. 
                    + That person would then have write access to the kernel source.
    - In many cases, the configuration of the kernel will need to be updated for packages that will be installed later in BLFS. 
        + Unlike other packages, it is not necessary to remove the kernel source tree after the newly built kernel is installed.
    - If the kernel source tree is going to be retained, 
        + run `chown -R 0:0` on the linux-6.4.12 directory to ensure all files are owned by user root.

- Warnings
    - Some kernel documentation recommends creating a symlink from '/usr/src/linux' pointing to the kernel source directory. 
        + This is specific to kernels prior to the 2.6 series and must not be created on an LFS system as it can cause problems for packages you may wish to build once your base LFS system is complete
    - The headers in the system's include directory (/usr/include) should always be the ones against which Glibc was compiled, that is, the sanitised headers installed in Section 5.4, “Linux-6.4.12 API Headers”. 
        + Therefore, they should never be replaced by either the raw kernel headers or any other kernel sanitized headers.

#### Configuring Linux Module Load Order
- Information
    - Most of the time Linux modules are loaded automatically, but sometimes it needs some specific direction. 
        - The program that loads modules, modprobe or insmod, uses '/etc/modprobe.d/usb.conf' for this purpose. 
            - This file needs to be created so that if the USB drivers (ehci_hcd, ohci_hcd and uhci_hcd) have been built as modules, 
                + they will be loaded in the correct order; ehci_hcd needs to be loaded prior to ohci_hcd and uhci_hcd in order to avoid a warning being output at boot time.

- Create a new file /etc/modprobe.d/usb.conf
    ```console
    install -v -m755 -d /etc/modprobe.d
    cat > /etc/modprobe.d/usb.conf << "EOF"
    # Begin /etc/modprobe.d/usb.conf
    
    install ohci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i ohci_hcd ; true
    install uhci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i uhci_hcd ; true
    
    # End /etc/modprobe.d/usb.conf
    EOF
    ```

### Using GRUB to Set Up the Boot Process
- Note
    - If your system has UEFI support and you wish to boot LFS with UEFI, 
         - you should skip the instructions in this page but 
             + still learn the syntax of grub.cfg and the method to specify a partition in the file from this page, 
             + and configure GRUB with UEFI support using the instructions provided in the [BLFS page](https://www.linuxfromscratch.org/blfs/view/12.0/postlfs/grub-setup.html).

#### Optional Dependency Documentation
- INFORMATION
    + This section is optional.
    - The pre-requisite setup may potentially require some optional dependencies on their own if you need features
        + This header block contains setup for some of these pre-requisites.
    + Please head to the following Pre-Requisites before referring to this

- Optional dependencies
    - Download (optional) dependency tarballs in the host
        - Doxygen
            ```console
            wget https://doxygen.nl/files/doxygen-1.9.7.src.tar.gz
            ```
        - Tk
            ```console
            wget https://downloads.sourceforge.net/tcl/tk8.6.13-src.tar.gz
            ```
        - libjte
            ```console
            wget https://www.einval.com/~steve/software/JTE/download/jigit-1.22.tar.xz
            ```

    - Copy dependency tarballs into your LFS sources directory
        - Note
            + Ensure that the Environment Variable '$LFS' is set to your LFS filesystem root partition mount point
        ```console
        cp {doxygen-1.9.7.src,tk8.6.13-src}.tar.gz $LFS/sources
        cp jigit-1.22.tar.xz $LFS/sources
        ```

- (Optional) Install doxygen
    - Information
        + File Name: doxygen-[version].src.tar.gz
        + Current Version: 1.9.7
        + MD5 Sum: 95008edf2d84aeefb7c65a6a4857dc2c
        + Estimated required download size: 5.5MB
        + Estimated required disk space: 240MB
        - Dependencies
            + [CMake-3.27.2](https://www.linuxfromscratch.org/blfs/view/12.0/general/cmake.html) : To generate HTML documentation
            + git-2.41.0
            - Optionals
                + Graphviz-8.1.0
                + ghostscript-10.01.2
                + libxml2-2.10.4 : required for the tests
                + LLVM-16.0.5 (with clang)
                + Qt-5.15.10 or qt-alternate-5.15.10 : for doxywizard
                + texlive-20230313 or install-tl-unx 
                + xapian-1.4.23 : for doxyindexer
                + javacc
        - Description: The Doxygen package contains a documentation system for C++, C, Java, Objective-C, Corba IDL and to some extent PHP, C# and D. It is useful for generating HTML documentation and/or an off-line reference manual from a set of documented source files. There is also support for generating output in RTF, PostScript, hyperlinked PDF, compressed HTML, and Unix man pages. The documentation is extracted directly from the sources, which makes it much easier to keep the documentation consistent with the source code.
            + You can also configure Doxygen to extract the code structure from undocumented source files. This is very useful to quickly find your way in large source distributions. Used along with Graphviz, you can also visualize the relations between the various elements by means of include dependency graphs, inheritance diagrams, and collaboration diagrams, which are all generated automatically.
            + This package is known to build and work properly using an LFS 12.0 platform.
        - Package Contents
        - Installed
            - Programs: 
                + doxygen : is a command-line based utility used to generate template configuration files and then generate documentation from these templates. Use doxygen --help for an explanation of the command-line parameters
                + doxywizard : is a GUI front-end for configuring and running doxygen
                + doxyindexer : generates a search index called doxysearch.db from one or more search data files produced by doxygen. See, e.g. https://javacc.github.io/javacc/
                + doxysearch.cgi : is a CGI program to search the data indexed by doxyindexer
            - Libraries: 
            + Directories: /usr/share/doc/doxygen-1.9.7

    - Extract tar file
        - Notes
            - When untarring this package, you may see messages such as “Ignoring unknown extended header keyword 'LIBARCHIVE.xattr.com.apple.TextEncoding'”. 
                + These messages are harmless, and can be safely ignored.
        ```console
        tar -xvzf doxygen-[version].src.tar.gz
        ```

    - Change directory into source file
        ```console
        cd doxygen-[version].src
        ```
 
    - Fix up some python scripts
        ```console
        grep -rl '^#!.*python$' | xargs sed -i '1s/python/&3/'
        ```

    - Create directory 'build'
        ```console
        mkdir -pv build
        ```

    - Change directory into 'build'
        ```console
        cd build
        ```

    - Configure and prepare for compilation
        ```console
        cmake -G "Unix Makefiles"         \
              -DCMAKE_BUILD_TYPE=Release  \
              -DCMAKE_INSTALL_PREFIX=/usr \
              -Wno-dev ..
        ```

    - Compile the package
        ```console
        make
        ```

    - Test the results
        - Notes
            + One test, 061_UÌnicodâ‚¬_file, is known to fail
        ```console
        make tests
        ```

    - (Optional) If you wish to generate the package documentation
        - Explanations
            + -Dbuild_wizard=ON: Use this switch if Qt5 is installed and you wish to build the GUI front-end.
            + -Dbuild_search=ON: Use this switch if xapian is installed and you wish to build external search tools (doxysearch.cgi and doxyindexer).
            + -Duse_libclang=ON: Use this switch if llvm with clang are installed, to add support for libclang parsing
        - Pre-Requisite
            + you must have Python, TeX Live (for HTML docs) and Ghostscript (for PDF docs) installed
        ```console
        cmake -DDOC_INSTALL_DIR=share/doc/doxygen-1.9.7 -Dbuild_doc=ON .. &&
        make docs
        ```

    - Install the package and documentations as the 'root' user
        ```console
        make install &&
        install -vm644 ../doc/*.1 /usr/share/man/man1
        ```

- (Optional) Install Tk
    - Information
        + File Name: tk[version]-src.tar.gz
        + Current Version: 8.6.13
        + MD5 Sum: 95adc33d55a133ee29bc9f81efdf31b2
        + Estimated required download size: 4.3MB
        + Estimated required disk space: 25MB
        - Dependencies
            + [Xorg Libraries](https://www.linuxfromscratch.org/blfs/view/12.0/x/x7lib.html)
        - Description: The Tk package contains a TCL GUI Toolkit.
            + This package is known to build and work properly using an LFS 12.0 platform.
        - Package Contents
        - Installed
            - Programs: 
                + wish : is a symlink to the wish8.6 program
                + wish8.6 : is a simple shell containing the Tk toolkit that creates a main window and then processes Tcl commands
            - Libraries: 
                + libtk8.6.so : contains the API functions required by Tk
            + Directories: /usr/lib/tk8.6

    - Extract tar file
        ```console
        tar -xvzf tk[version]-src.tar.gz
        ```

    - Change directory into source file
        ```console
        cd tk[version]-src
        ```

    - Configure and prepare for compilation
        - Explanation
            + $([ $(uname -m) = x86_64 ] && echo --enable-64bit): This switch is used to enable 64 bit support in Tk on 64 bit operating systems.
        ```console
        cd unix &&
        ./configure --prefix=/usr \
                    --mandir=/usr/share/man \
                    $([ $(uname -m) = x86_64 ] && echo --enable-64bit) &&
        ```

    - Compile the package
        ```console
        make
        ```

    - Removes the references to the build directory and replaces them with saner system-wide locations.
        - Explanation
            + sed -e ... tkConfig.sh: The Tk package expects that its source tree is preserved so that packages depending on it for their compilation can utilize it. This sed removes the references to the build directory and replaces them with saner system-wide locations.
        ```console
        sed -e "s@^\(TK_SRC_DIR='\).*@\1/usr/include'@" \
            -e "/TK_B/s@='\(-L\)\?.*unix@='\1/usr/lib@" \
            -i tkConfig.sh
        ```

    - Test the results
        - Note
            + Running the tests is not recommended. 
            + Failures will be reported during the tests, depending on the screen resolution/capabilities, fonts installed and other X related parameters, but the end report can show 0 failures. Some tests will steal focus and some might crash your X Server. 
            + Ensure you run it from an X Window display device with the GLX extensions loaded, but even so, tests might hang
        - To test the results anyway
            ```console
            make test
            ```

    - Install the package as the 'root' user
        - Explanation
            + make install-private-headers: This command is used to install the Tk library interface headers used by other packages if they link to the Tk library.
            + ln -v -sf wish8.6 /usr/bin/wish: This command is used to create a compatibility symbolic link to the wish8.6 file as many packages expect a file named wish.
        ```console
        make install &&
        make install-private-headers &&
        ln -v -sf wish8.6 /usr/bin/wish &&
        chmod -v 755 /usr/lib/libtk8.6.so
        ```

#### Pre-Requisites
> In order for the procedure below to work, you need to jump ahead to BLFS and install xorriso from the [libisoburn](https://www.linuxfromscratch.org/blfs/view/12.0/multimedia/libisoburn.html) package.

- User Management
    - Change user to 'lfs'
        ```console
        su - lfs
        ```

    - Source the .bashrc file
        ```console
        source ~/.bashrc
        ```

- Download dependency tarballs in the host
    - libburn
        ```console
        wget https://files.libburnia-project.org/releases/libburn-1.5.6.tar.gz
        ```
    - libisofs
        ```console
        wget https://files.libburnia-project.org/releases/libisofs-1.5.6.tar.gz
        ```
    - libisoburn
        ```console
        wget https://files.libburnia-project.org/releases/libisoburn-1.5.6.tar.gz
        ```

- Copy dependency tarballs into your LFS sources directory
    - Note
        + Ensure that the Environment Variable '$LFS' is set to your LFS filesystem root partition mount point
    ```console
    cp {libburn-1.5.6,libisofs-1.5.6,libisoburn-1.5.6}.tar.gz $LFS/sources
    ```

- Mount and Change Root into the LFS chroot
    ```console
    sudo mount -v --bind /dev $LFS/dev

    # Mount remaining virtual kernel filesystem
    sudo mount -v --bind /dev/pts $LFS/dev/pts
    sudo mount -vt proc proc $LFS/proc
    sudo mount -vt sysfs sysfs $LFS/sys
    sudo mount -vt tmpfs tmpfs $LFS/run

    # Mount temporary filesystem
    if [ -h $LFS/dev/shm ]; then
        sudo mkdir -pv $LFS/$(readlink $LFS/dev/shm)
    else
        sudo mount -t tmpfs -o nosuid,nodev tmpfs $LFS/dev/shm
    fi

    sudo chroot "$LFS" /usr/bin/env -i   \
             HOME=/root                  \
             TERM="$TERM"                \
             PS1='(lfs chroot) \u:\w\$ ' \
             PATH=/usr/bin:/usr/sbin     \
             /bin/bash --login
    ```

- Install libburn
    - Information
        + File Name: libburn-[version].tar.gz
        + Current Version: 1.5.6
        + MD5 Sum: cf9852f3b71dbc2b6c9e76f6eb0474f0
        + Estimated required download size: 972KB
        + Estimated required disk space: 17MB
        - Dependencies
            - Optionals
                + Doxygen-1.9.7 : To generate HTML documentation
        - Description: libburn is a library for writing preformatted data onto optical media: CD, DVD and BD (Blu-Ray).
            + This package is known to build and work properly using an LFS 12.0 platform.
        - Package Contents
        - Installed
            - Programs: 
                + cdrskin : burns preformatted data to CD, DVD, and BD via libburn
            - Libraries: 
                + libburn.so : contains the libburn API functions
            + Directories: /usr/include/libburn

    - Extract tar file
        ```console
        tar -xvzf libburn-[version].tar.gz
        ```

    - Change directory into source file
        ```console
        cd libburn-[version]
        ```

    - Configure and prepare for compilation
        ```console
        ./configure --prefix=/usr --disable-static
        ```

    - Compile the package
        ```console
        make
        ```

    - (Optional) If you have installed Doxygen and wish to generate the HTML documentation
        ```console
        doxygen doc/doxygen.conf
        ```

    - Test the results
        + This package does not come with a test suite

    - Install the package as the 'root' user
        ```console
        make install
        ```

    - (Optional) If you have built the HTML documentation, install the HTML documentation
        ```console
        install -v -dm755 /usr/share/doc/libburn-1.5.6 &&
        install -v -m644 doc/html/* /usr/share/doc/libburn-1.5.6
        ```

- Install libisofs
    - Information
        + File Name: libisofs-[version].tar.gz
        + Current Version: 1.5.6
        + MD5 Sum: 9f996b317f622802f12d28d27891709f
        + Estimated required download size: 858KB
        + Estimated required disk space: 14MB
        - Dependencies
            - Optionals
                + Doxygen-1.9.7 : To generate HTML documentation
                + libjte
        - Description: libisofs is a library to create an ISO-9660 filesystem with extensions like RockRidge or Joliet.
            + This package is known to build and work properly using an LFS 12.0 platform.
        - Package Contents
        - Installed
            + Programs: 
            - Libraries: 
                + libisofs.so : contains the libisofs API functions
            + Directories: /usr/include/libisofs

    - Extract tar file
        ```console
        tar -xvzf libisofs-[version].tar.gz
        ```

    - Change directory into source file
        ```console
        cd libisofs-[version]
        ```

    - Configure and prepare for compilation
        - Configuration Options
            + --disable-static: This switch prevents installation of static versions of the libraries.
        ```console
        ./configure --prefix=/usr --disable-static
        ```

    - Compile the package
        ```console
        make
        ```

    - (Optional) If you have installed Doxygen and wish to generate the HTML documentation
        ```console
        doxygen doc/doxygen.conf
        ```

    - Test the results
        + This package does not come with a test suite

    - Install the package as the 'root' user
        ```console
        make install
        ```

    - (Optional) If you have built the HTML documentation, install the HTML documentation
        ```console
        install -v -dm755 /usr/share/doc/libisofs-1.5.6 &&
        install -v -m644 doc/html/* /usr/share/doc/libisofs-1.5.6
        ```

- Install libisoburn
    - Information
        + File Name: libisoburn-[version].tar.gz
        + Current Version: 1.5.6
        + MD5 Sum: efb19f7f718f0791f717b2c6094995ec
        + Estimated required download size: 1.5 MB
        + Estimated required disk space: 0.2 MB
        - Dependencies
            + libburn-1.5.6
            + libisofs-1.5.6
            - Optionals
                + Doxygen-1.9.7 : To generate HTML documentation
                + Tk-8.6.13 : For xorriso-tcltk
                + libjte
        - Description: libisoburn is a frontend for libraries libburn and libisofs which enables creation and expansion of ISO-9660 filesystems on all CD/DVD/BD media supported by libburn. 
            + This includes media like DVD+RW, which do not support multi-session management on media level and even plain disk files or block devices.
            + This package is known to build and work properly using an LFS 12.0 platform.
        - Package Contents
        - Installed
            + Programs: osirrox, xorrecord, xorriso, xorriso-dd-target, xorrisofs, and xorriso-tcltk
            + Libraries: libisoburn.so
            + Directories: /usr/include/libisoburn and /usr/share/doc/libisoburn-1.5.6

    - Extract tar file
        ```console
        tar -xvzf libisoburn-[version].tar.gz
        ```

    - Change directory into source file
        ```console
        cd libisoburn-[version]
        ```

    - Configure and prepare for compilation
        - Configuration Options
            + --disable-static: This switch prevents installation of static versions of the libraries.
            + --enable-pkg-check-modules: Enable pkg-config check for libburn and libisofs.
        ```console
        ./configure --prefix=/usr              \
                    --disable-static           \
                    --enable-pkg-check-modules
        ```

    - Compile the package
        ```console
        make
        ```

    - (Optional) If you have installed Doxygen and wish to generate the HTML documentation
        ```console
        doxygen doc/doxygen.conf
        ```

    - Test the results
        + This package does not come with a test suite

    - Install the package as the 'root' user
        ```console
        make install
        ```

    - (Optional) If you have built the HTML documentation, install the HTML documentation
        ```console
        install -v -dm755 /usr/share/doc/libisoburn-1.5.6 &&
        install -v -m644 doc/html/* /usr/share/doc/libisoburn-1.5.6
        ```

#### Introduction
- Warning
    + Configuring GRUB incorrectly can render your system inoperable without an alternate boot device such as a CD-ROM or bootable USB drive. 
    + This section is not required to boot your LFS system. 
    + You may just want to modify your current boot loader, e.g. Grub-Legacy, GRUB2, or LILO.

- Create a Bootable Rescue Disk Image (LiveISO/USB)
    + Ensure that an emergency boot disk is ready to “rescue” the computer if the computer becomes unusable (un-bootable). 
    + If you do not already have a boot device, you can create one. 
    ```console
    cd /tmp
    grub-mkrescue --output=grub-img.iso
    xorriso -as cdrecord -v dev=/dev/cdrw blank=as_needed grub-img.iso
    ```

#### GRUB Naming Conventions
- GRUB uses its own naming structure for drives and partitions in the form of (hdn,m), 
    - where 
        + n is the hard drive number and 
        + m is the partition number. 
    - The hard drive numbers start from zero, but 
        + the partition numbers start from one for normal partitions (from five for extended partitions). 

- Note that this is different from earlier versions where both numbers started from zero. 
    - For example, 
        + partition sda1 is (hd0,1) to GRUB and sdb3 is (hd1,3). 

- In contrast to Linux, 
    - GRUB does not consider CD-ROM drives to be hard drives. 
        - For example, 
            + if using a CD on hdb and a second hard drive on hdc, that second hard drive would still be (hd1).

#### Setting Up the Configuration
- GRUB works by writing data to the first physical track of the hard disk. 
    + This area is not part of any file system. 
    + The programs there access GRUB modules in the boot partition. 
    + The default location is '/boot/grub/'.

- The location of the boot partition is a choice of the user that affects the configuration. 
    - One recommendation is to have a separate small (suggested size is 200 MB) partition just for boot information. 
         + That way each build, whether LFS or some commercial distro, can access the same boot files and access can be made from any booted system. 
         - If you choose to do this, 
             - you will need to 
                 + mount the separate partition, 
                 + move all files in the current /boot directory (e.g. the Linux kernel you just built in the previous section) to the new partition. 
                 + You will then need to unmount the partition and remount it as /boot. 
             + If you do this, be sure to update /etc/fstab.
    - Leaving /boot on the current LFS partition will also work, 
        + but configuration for multiple systems is more difficult.
    - Using the above information, 
        + determine the appropriate designator for the root partition (or boot partition, if a separate one is used). 

- Install the GRUB files into /boot/grub and set up the boot track:
    - Synopsis/Syntax
        ```console
        grub-install [disk-label]
        ```
    - Notes
        - If the system has been booted using UEFI, grub-install will try to install files for the x86_64-efi target, 
            + but those files have not been installed in Chapter 8. If this is the case, add --target i386-pc to the command above.
    - Warning
        - The following command will overwrite the current boot loader. 
            - Do not run the command if this is not desired, 
                - for example, 
                    + if using a third party boot manager to manage the Master Boot Record (MBR).
    - Explanation
        - For the following example, 
            + it is assumed that the root (or separate boot) partition is sda2.
    ```console
    grub-install /dev/sda
    ```

#### Creating the GRUB Configuration File
> Generate `/boot/grub/grub.cfg`
- Explanation
    - The insmod commands load the GRUB modules named part_gpt and ext2. 
        - Despite the naming, 
            + ext2 actually supports ext2, ext3, and ext4 filesystems. 
        - The grub-install command has embedded some modules into the main GRUB image (installed into the MBR or the GRUB BIOS partition) to access the other modules (in /boot/grub/i386-pc) without a chicken-or-egg issue, 
            - so with a typical configuration these two modules are already embedded and those two insmod commands will do nothing. 
                + But they do no harm anyway, and they may be needed with some rare configurations.

- Manually
```console
cat > /boot/grub/grub.cfg << "EOF"
# Begin /boot/grub/grub.cfg
set default=0
set timeout=5

insmod part_gpt
insmod ext2
set root=(hd0,2)

menuentry "GNU/Linux, Linux 6.4.12-lfs-12.0" {
        linux   /boot/vmlinuz-6.4.12-lfs-12.0 root=/dev/sda2 ro
}
EOF
```
- Using grub-mkconfig (Automatically)
    - grub-mkconfig writes a GRUB configuration file automatically. 
        + It uses a set of scripts in /etc/grub.d/ and will destroy any customizations that you make. 
        + These scripts are designed primarily for non-source distributions and are not recommended for LFS. 
        - If you install a commercial Linux distribution and/or a non-LFS distribution in general (ArchLinux, Debian etc), 
            + there is a good chance that this program will be run. 
        + Be sure to back up your grub.cfg file if you are using this.
    ```console
    grub-mkconfig -o /boot/grub/grub.cfg
    ```

- Notes
    - From GRUB's perspective, the kernel files are relative to the partition used. 
        + If you used a separate /boot partition, remove /boot from the above linux line. 
        + You will also need to change the set root line to point to the boot partition.
    - The GRUB designator for a partition may change if you added or removed some disks (including removable disks like USB thumb devices). 
        - The change may cause boot failure because grub.cfg refers to some “old” designators. 
            - If you wish to avoid such a problem, 
                + you may use the UUID of a partition and the UUID of a filesystem instead of a GRUB designator to specify a device. 
                + Run `lsblk -o UUID,PARTUUID,PATH,MOUNTPOINT` to show the UUIDs of your filesystems (in the UUID column) and partitions (in the PARTUUID column). 
                - Then replace `set root=(hdx,y)` with `search --set=root --fs-uuid <UUID of the filesystem where the kernel is installed>`, 
                    + and replace `root=/dev/sda2` with `root=PARTUUID=<UUID of the partition where LFS is built>`.
    - Note that the UUID of a partition is completely different from the UUID of the filesystem in this partition. 
        - Some online resources may instruct you to use root=UUID=<filesystem UUID> instead of root=PARTUUID=<partition UUID>, 
            + but doing so will require an initramfs, which is beyond the scope of LFS.
    - The name of the device node for a partition in /dev may also change (this is less likely than a GRUB designator change). 
        + You can also replace paths to device nodes like /dev/sda1 with PARTUUID=<partition UUID>, in /etc/fstab, to avoid a potential boot failure in case the device node name has changed
    - GRUB is an extremely powerful program and 
        + it provides a tremendous number of options for booting from a wide variety of devices, operating systems, and partition types. 
        - There are also many options for customization such as graphical splash screens, playing sounds, mouse input, etc. 
            + The details of these options are beyond the scope of this introduction.

## The End

### Table of Contents 
- [Notes](#notes)
- [11.1. The End](#the-end)
- [11.3. Rebooting the System](#rebooting-the-system)

### Notes

### The End
+ The new LFS system is installed

- (Optional) Create an '/etc/lfs-release' file
    - Explanation
        + It may be a good idea to create an /etc/lfs-release file. 
        + By having this file, it is very easy for you to find out which LFS version is installed on the system.
    ```console
    echo 12.0 > /etc/lfs-release
    ```

- Two files describing the installed system may be used by packages that can be installed on the system later, either in binary form or by building them.
    - Create '/etc/lsb-release' file
        - Explanation
            + This file shows the status of your new system with respect to the Linux Standards Base (LSB).
        - Notes
            + Be sure to customize the fields 'DISTRIB_CODENAME' and 'VERSION_CODENAME' to make the system uniquely yours.
        ```console
cat > /etc/lsb-release << "EOF"
DISTRIB_ID="Linux From Scratch"
DISTRIB_RELEASE="12.0"
DISTRIB_CODENAME="<your name here>"
DISTRIB_DESCRIPTION="Linux From Scratch"
EOF
        ```
    - Create '/etc/os-release' file
        - Explanation
            + This file contains roughly the same information, and is used by systemd and some graphical desktop environments
        - Notes
            + Be sure to customize the fields 'DISTRIB_CODENAME' and 'VERSION_CODENAME' to make the system uniquely yours.
        ```console
cat > /etc/os-release << "EOF"
NAME="Linux From Scratch"
VERSION="12.0"
ID=lfs
PRETTY_NAME="Linux From Scratch 12.0"
VERSION_CODENAME="<your name here>"
EOF
        ```

### Rebooting the System
- there are still a few things to check. Here are some suggestions:
    + Install any firmware needed if the kernel driver for your hardware requires some firmware files to function properly.
    + Ensure a password is set for the root user.
    - A review of the following configuration files is also appropriate at this point.
        + /etc/bashrc
        + /etc/dircolors
        + /etc/fstab
        + /etc/hosts
        + /etc/inputrc
        + /etc/profile
        + /etc/resolv.conf
        + /etc/vimrc
        + /root/.bash_profile
        + /root/.bashrc
        + /etc/sysconfig/ifconfig.eth0

- After checking, exit from the chroot environment
    ```console
    logout
    ```

- unmount the virtual file systems:
    ```console    
    umount -v $LFS/dev/pts
    mountpoint -q $LFS/dev/shm && umount $LFS/dev/shm
    umount -v $LFS/dev
    umount -v $LFS/run
    umount -v $LFS/proc
    umount -v $LFS/sys
    ```

- If multiple partitions were created, unmount the other partitions before unmounting the main one
    ```console
    umount -v $LFS/home
    umount -v $LFS
    ```

- Unmount the LFS file system itself
    ```console
    umount -v $LFS
    ```

- reboot the system
    - Using systemd
        ```console
        reboot now
        ```

- Post-Reboot
    - Assuming the GRUB boot loader was set up as outlined earlier, the menu is set to boot LFS 12.0 automatically.
        + When the reboot is complete, the LFS system is ready for use. 
        - What you will see is a simple “login: ” prompt. 
            + At this point, you can proceed to the [BLFS Book](https://www.linuxfromscratch.org/blfs/view/12.0/) where you can add more software to suit your needs.
    - If your reboot is not successful, 
        - Troubleshoot 
            + For hints on solving initial booting problems, see https://www.linuxfromscratch.org/lfs/troubleshooting.html.

## Documentations
### Build Process
1. Place all the sources and patches in a directory that will be accessible from the chroot environment, such as /mnt/lfs/sources/.
2. Change to the /mnt/lfs/sources/ directory.
3. For each package:
    - Using the tar program, extract the package to be built. In Chapter 5 and Chapter 6, ensure you are the lfs user when extracting the package.
        - Do not use any method except the tar command to extract the source code. 
        - Notably, using the cp -R command to copy the source code tree somewhere else can destroy links and timestamps in the source tree, and cause the build to fail.
    - Change to the directory created when the package was extracted.
    - Follow the instructions for building the package.
    - Change back to the sources directory when the build is complete.
    - Delete the extracted source directory unless instructed otherwise.

### Suspending and Resuming session
- In the case where you wish to stop your current session and want to resume later on
    + You need to repeat these steps

- Mount your LFS mount partition
    ```console
    mount [disk-label]{mount-partition} [mount-point]
    ```

- Change user to user 'lfs'
    ```console
    su - lfs
    ```

- Set environment variables
    - LFS : Set this as your LFS mount point
        ```console
        export LFS=[mount-point]
        ```

- Validate/Verify pre-requisites
    - Environment Variables
        + LFS
        + LFS_TGT

    - If the above Environment Variables are not set, source the .bashrc file
        ```console
        source ~/.bashrc
        ```

- After Section 7
    - Before re-entering chroot
        - If you leave this environment for any reason (rebooting for example), 
            - ensure that the virtual kernel filesystems are mounted as explained in 
                - [Section 7.3.1, “Mounting and Populating /dev”](#preparing-virtual-kernel-file-systems) and 
                    ```console
                    mount -v --bind /dev $LFS/dev
                    ```
                - [Section 7.3.2, “Mounting Virtual Kernel File Systems”](#preparing-virtual-kernel-file-systems) and enter 
                    ```console
                    # Mount remaining virtual kernel filesystem
                    mount -v --bind /dev/pts $LFS/dev/pts
                    mount -vt proc proc $LFS/proc
                    mount -vt sysfs sysfs $LFS/sys
                    mount -vt tmpfs tmpfs $LFS/run

                    # Mount temporary filesystem
                    if [ -h $LFS/dev/shm ]; then
                        mkdir -pv $LFS/$(readlink $LFS/dev/shm)
                    else
                        mount -t tmpfs -o nosuid,nodev tmpfs $LFS/dev/shm
                    fi
                    ```
                - chroot again before continuing with the installation.
                    ```console
                    chroot "$LFS" /usr/bin/env -i   \
                            HOME=/root                  \
                            TERM="$TERM"                \
                            PS1='(lfs chroot) \u:\w\$ ' \
                            PATH=/usr/bin:/usr/sbin     \
                            /bin/bash --login
                    ```

## Wiki

### Learning points
+ Use 'unset [variable-name]' to unset and remove the variable

### Tips and Tricks
- To find and check if a package exists (or to just check the filename)
    ```console
    ls -lha $LFS/sources | grep [application-name]
    ```

- To check the general disk sizes for each disks
    ```console
    df -h [disk-name|partition|mount-point]
    ```

- To check the size of a specific directory
    ```console
    du -sh [directory]
    ```

- To backup and restore linux tarballs
    - Backup
        - Pre-Requisites
            - Unmount temporary Virtual Kernel File Systems
                ```console 
                umount -l $LFS/{dev,proc,sys,run}
                ```
        - Compress the target root mount point/directory you want to archive as a distributable tarball
            - Parameters
                - lfs-version : This is the LFS Book version you used/followed to build this root filesystem (i.e. 12.0)
                - date : Specify the date you generated this archive; Format: yyyymmdd
                - time : Specify the time you generated this archive; Format: (HHMM)H
            - Options
                + -c : Compress targets to archive
                + -v : Verbose
                + `-f [filename]` : Specify output file name
            - Make output directory
                ```console
                mkdir -pv /path/to/output/dist/tarballs
                ```
            - Compress using 'xz'
                + -J : Compress using '-xz'
                ```console
                tar -cJvf /path/to/output/dist/tarballs/linux-[lfs-version]-[date]-[time]-[status].tar.xz $LFS
                ```
            - Compress using 'gzip'
                + -z : Compress using 'gzip'
                ```console
                tar -cvzf /path/to/output/dist/tarballs/linux-[lfs-version]-[date]-[time]-[status].tar.gz $LFS
                ```
        - Verify the gzip tar archive
            - If compressed using gzip ('-z')
                ```console
                gunzip -t linux-[lfs-version]-[date]-[time]-[status].tar.gz
                ```

    - Restore
        - Pre-Requisites
            - Set environment variables
                - LFS : Set this as your LFS mount point (i.e. /mnt/lfs)
                    ```console
                    export LFS=[mount-point]
                    ```
        - Create a root partition to mount your root filesystem
            - Example filesystem partition layout
                + Bootloader Filesystem Layout: BIOS
                + Filesystem Label : MSDOS/MBR
                + Root Partition Filesystem : ext4
            ```console
            parted /dev/[disk-label] mklabel msdos
            parted /dev/[disk-label] mkpart primary ext4 0% 100%
            mkfs.ext4 /dev/[disk-label]{root-partition-number}
            ```
        - Create a mount point/directory to mount the root partition to
            ```console
            mkdir -pv $LFS
            ```
        - Mount the root partition to the mount point/directory
            ```console
            mount /dev/[disk-label]{root-partition-number} $LFS
            ```
        - Change directory to root mount point
            ```console
            cd $LFS
            ```
        - Extract the LFS distributable tarball to the directory
            - Compressed using '-J' or '-xz'
                ```console
                tar -xvf linux-[lfs-version]-[date]-[time]-[status].tar.xz
                ```
            - Compressed using 'gzip' or '-z'
                ```console
                tar -xvzf linux-[lfs-version]-[date]-[time]-[status].tar.gz
                ```
    - Usage
        - (Optional) If you want to install the tarball as a usable multiple-partition system via bootstrap
            - Examples
                - 3-Partition Filesystem Layout
                    - Information
                        + Disk Label: /dev/sdX
                        + Filesystem Label: MSDOS/MBR
                        + Bootloader Filesystem Label: BIOS
                        - Partition Scheme
                            1. Boot Partition
                                + Partition Type: primary
                                + Partition Filesystem: ext4
                                + Start Size: 0% 
                                + End Size: 1024MiB
                                + Mount Point: /mnt/boot
                            2. Root Partition
                                + Partition Type: primary
                                + Partition Filesystem: ext4
                                + Start Size: 10234MiB 
                                + End Size: 50%
                                + Mount Point: /mnt
                            3. Home Partition
                                + Partition Type: primary
                                + Partition Filesystem: ext4
                                + Start Size: 50% 
                                + End Size: 100%
                                + Mount Point: /mnt/home
                    - Pre-Requisites
                        - Set environment variables
                            - LFS : Set this as your LFS mount point (i.e. /mnt/lfs)
                                ```console
                                export LFS=[mount-point]
                                ```
                    - Format disk image/drive filesystem
                        ```console
                        parted /dev/[disk-label] mklabel msdos
                        ```
                    - Create a partitions to mount your directories
                        - Boot
                            - Create Partition
                                ```console
                                parted /dev/[disk-label] mkpart primary ext4 0% 1024MiB
                                ```
                            - Format partition with filesystem
                                ```console
                                mkfs.ext4 /dev/[disk-label]{boot-partition-number}
                                ```
                            - Set partition as bootable
                                ```console
                                parted /dev/[disk-label] set [boot-partition-number] boot on
                                ```
                        - Root
                            - Create Partition
                                ```console
                                parted /dev/[disk-label] mkpart primary ext4 1024MiB 50%
                                ```
                            - Format partition with filesystem
                                ```console
                                mkfs.ext4 /dev/[disk-label]{root-partition-number}
                                ```
                        - Home
                            - Create Partition
                                ```console
                                parted /dev/[disk-label] mkpart primary ext4 50% 100%
                                ```
                            - Format partition with filesystem
                                ```console
                                mkfs.ext4 /dev/[disk-label]{home-partition-number}
                                ```
                    - Create a mount point/directory to mount the root partition in
                        ```console
                        mkdir -pv $LFS
                        ```
                    - Mount the root partition to the mount point/directory
                        ```console
                        mount /dev/[disk-label]{root-partition-number} $LFS
                        ```
                    - Create a mount point/directory for the boot and home partition(s)
                        ```console
                        mkdir -pv $LFS/{boot,home}
                        ```
                    - Mount the boot partition to the mount point/directory
                        ```console
                        mount /dev/[disk-label]{boot-partition-number} $LFS/boot
                        ```
                    - Mount the home partition to the mount point/directory
                        ```console
                        mount /dev/[disk-label]{home-partition-number} $LFS/home
                        ```
                    - Change directory to root mount point
                        ```console
                        cd $LFS
                        ```
                    - Extract the LFS distributable tarball to the directory
                        ```console
                        tar -xvzf linux-[lfs-version]-[date]-[time]-[status].tar.gz
                        ```

## Resources
+ [GNU GCC - Install - Configure](https://gcc.gnu.org/install/configure.html)
+ [Linux From Scratch (LFS) Downloads](https://www.linuxfromscratch.org/lfs/downloads/)
+ [Linux From Scratch (LFS) Downloads - Patches](https://www.linuxfromscratch.org/patches/downloads/)
+ [Linux From Scratch (LFS) Books](https://www.linuxfromscratch.org/lfs/view/)
+ [Linux From Scratch (LFS) Book - Stable](https://www.linuxfromscratch.org/lfs/view/stable/)
+ [Linux From Scratch (LFS) Book - version 12.0](https://www.linuxfromscratch.org/lfs/view/12.0/)
+ [Linux From Scratch (LFS) Mirrors](https://www.linuxfromscratch.org/mirrors.html#files)

## References
+ [Linux From Scratch (LFS) Book - version 12.0 - Chapter 5: Compiling a Cross-Toolchain - Binutils Pass 1](https://www.linuxfromscratch.org/lfs/view/12.0/chapter05/binutils-pass1.html)
+ [Linux From Scratch (LFS) Book - version 12.0 - Chapter 5: Compiling a Cross-Toolchain - GCC Pass 1](https://www.linuxfromscratch.org/lfs/view/12.0/chapter05/gcc-pass1.html)
+ [Linux From Scratch (LFS) Book - version 12.0 - Chapter 8: Installing Basic System Software - Package Management](https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/pkgmgt.html)
+ [Linux Questions - Linux From Scratch 13 - Gettext Compile error during 'make'](https://www.linuxquestions.org/questions/linux-from-scratch-13/gettext-compile-error-during-%27make%27-124810/)

## Remarks

