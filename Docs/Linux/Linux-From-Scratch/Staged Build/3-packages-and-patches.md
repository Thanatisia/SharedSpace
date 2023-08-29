# LFS Staged Build - Building Packages

## Information

## Dependencies

## Pre-Requisites
### Specify System Environment Variables
+ LFS=[LFS-filesystem-path] : Specify the target Linux From Scratch root filesystem path you wish to compile in (i.e. /mnt/root)

### Prepare required directories
- Create folders 
    - '$LFS/sources'
        ```console
        mkdir -pv $LFS/sources
        ```

### Obtaining build source file tarballs
1. Select a mirror
    + https://www.linuxfromscratch.org/lfs/mirrors.html#files
    + Refer to the mirrors under 'Files Mirrors'
2. Download packages
    - Obtain automatically through a wget list
        - Download the wget list from the mirror
            + This wget list contains all the links to the individual tarball source files required to manual compile
            + Format: [mirror]/pub/lfs/lfs-packages/[version]/wget-list
            - Examples
                + LFS stable: https://www.linuxfromscratch.org/lfs/view/stable/wget-list-sysv
                + lfs-matrix FTP server: http://ftp.lfs-matrix.net/pub/lfs/lfs-packages/11.3/wget-list
            ```console
            wget [mirror]/wget-list
            ```
        - Download all build tarballs using wget and the obtained wget-list
            ```console
            wget --input-file=[wget-list-name] --continue --directory-prefix=$LFS/sources
            ```
    - Download packages individually  
        - Notes
            + Note down the package you wish to build and download from the mirror you selected
            + Recommended to have the page opened to see the tarball extension (e.g. '.tar.gz' or '.tar.xz')
            + Format: [mirror]/pub/lfs/lfs-packages/[version]/[package-name].tar.{gz|xz}
        - Download tarball with wget
            ```console
            wget [mirror]/pub/lfs/lfs-packages/[version]/[package-name].tar.{gz|xz} --directory-prefix=$LFS/sources
            ```
3. (Optional) Verify that all the correct packages are available before proceeding
    + Starting with LFS-7.0, there is a separate file [md5sums](https://www.linuxfromscratch.org/lfs/view/stable/md5sums)
    - Download md5sums
        ```console
        wget https://www.linuxfromscratch.org/lfs/view/stable/md5sums --directory-prefix=$LFS/sources
        ```
    - Run through and check the md5sums of all files in '$LFS/sources'
        ```console
        pushd $LFS/sources
            md5sum -c md5sums
        popd
        ```
4. To extract the package tarballs
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
5. Change directory into the package source file
    ```console
    cd [package-name]
    ```

- Proceed to build packages

## Wiki

## Resources

## References
+ [Linux From Scratch book - Stable - Chapter 3 - Introduction](https://www.linuxfromscratch.org/lfs/view/stable/chapter03/introduction.html)

## Remarks