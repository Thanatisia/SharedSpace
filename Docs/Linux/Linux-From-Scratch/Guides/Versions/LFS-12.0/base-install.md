# LFS 

## Information
+ Current Version: 12.0

## Setup
### Pre-Requisites
#### Host System
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
    pushd $LFS/sources
        md5sum -c md5sums
    popd
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

### Setup
- Change directory to '$LFS/sources'
    ```console
    cd $LFS/sources
    ```

### Pass 1
#### Binutils
- Information
    + Estimated required disk space: 647MB
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

- Compile the package
    ```console
    make install
    ```

#### GCC
- Information
    + Estimated required disk space: 4.2GB
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

- Create directory 'build'
    ```console
    mkdir -pv build
    ```

- Remove version number from folder name and move to gcc source directory
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

- Change directory into 'build'
    ```console
    cd build
    ```

- Configure and prepare for compilation
    - Notes
        - Optional Parameters
            - '--enable-multilib' : Add this flag if you are using and/or with to compile for x86 (32-bit) architecture CPU
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

- Compile the package
    ```console
    make install
    ```

- Create a full version of the internal header using a command that is identical to what the GCC build system does in normal circumstances
    ```console
    cd ..
    cat gcc/limitx.h gcc/glimits.h gcc/limity.h > `dirname $($LFS_TGT-gcc -print-libgcc-file-name)`/include/limits.h
    ```

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


## Wiki

## Resources

## References
+ [Linux From Scratch (LFS) Book - version 12.0 - Chapter 5: Compiling a Cross-Toolchain - Binutils Pass 1](https://www.linuxfromscratch.org/lfs/view/12.0/chapter05/binutils-pass1.html)
+ [Linux From Scratch (LFS) Book - version 12.0 - Chapter 5: Compiling a Cross-Toolchain - GCC Pass 1](https://www.linuxfromscratch.org/lfs/view/12.0/chapter05/gcc-pass1.html)

## Remarks

