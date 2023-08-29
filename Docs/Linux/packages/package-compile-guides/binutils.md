# Compiling binutils

## Information

## Setup
### Dependencies

### Pre-Requisites

#### Obtaining build source file tarballs
1. Select a mirror
    + https://www.linuxfromscratch.org/lfs/mirrors.html#files
    + Refer to the mirrors under 'Files Mirrors'
2. Download packages
    - Download packages individually  
        - Notes
            + Note down the package you wish to build and download from the mirror you selected
            + Recommended to have the page opened to see the tarball extension (e.g. '.tar.gz' or '.tar.xz')
            + Format: [mirror]/pub/lfs/lfs-packages/[version]/[package-name].tar.{gz|xz}
        - Download tarball with wget
            ```console
            wget [mirror]/pub/lfs/lfs-packages/[version]/[package-name].tar.{gz|xz} --directory-prefix=[target-directory]/sources
            ```
3. To extract the package tarballs
    - If the tarball is '.tar.gz': Compressed with gzip
        - Using tar
            ```console
            tar -xvzf [tarball]
            ```
    - If the tarball is '.tar.xz': Not compressed with gzip
        - Using tar
            ```console
            tar -xvf [tarball]
            ```
4. Change directory into the package source file
    ```console
    cd [package-name]
    ```

### Configuration 
- Prepare binutils for compilation
    + --prefix=$LFS/tools : This tells the configure script to prepare to install the Binutils programs in the $LFS/tools directory.
    + --with-sysroot=$LFS : (Optional) For cross compilation; this tells the build system to look in $LFS for the target system libraries as needed.
    + --target=$LFS_TGT   : (Optional) If building from a different machine/chroot (i.e. Linux From Scratch); Because the machine description in the LFS_TGT variable is slightly different than the value returned by the config.guess script, this switch will tell the configure script to adjust binutil's build system for building a cross linker.
    + --disable-nls       : This disables internationalization as i18n is not needed for the temporary tools.
    + --enable-gprofng=no : This disables building gprofng which is not needed for the temporary tools.
    + --disable-werror    : This prevents the build from stopping in the event that there are warnings from the host's compiler.
    ```console
    ../configure --prefix=[path-to-install-to] \
                 --with-sysroot=[target-system-library-directory] \
                 --target=[target-machine]   \
                 --disable-nls       \
                 --enable-gprofng=no \
                 --disable-werror
    ```

### Build/Compilation
- make package
    ```console
    make
    ```

- Install the package
    ```console
    {sudo} make install
    ```

## Documentation


## Wiki

## Resources

## References
+ [Linux From Scratch book - Stable - Chapter 3 - Introduction](https://www.linuxfromscratch.org/lfs/view/stable/chapter03/introduction.html)
+ [Linux From Scratch book - Stable - Chapter 5 - Compiling a Cross-Toolchain - binutils](https://www.linuxfromscratch.org/lfs/view/stable/chapter05/binutils-pass1.html)

## Remarks