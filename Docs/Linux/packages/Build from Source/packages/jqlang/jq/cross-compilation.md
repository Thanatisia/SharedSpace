# jq - Building from Source: Cross-Compilation

## Information/Notes
- To cross compile, 
    + use the --host= and --target= ./configure options to select a cross-compilation environment. 
    + A similar method could be used to cross-compile for OS X on Linux and similar. 
- It is also possible to "cross-compile" for the same OS/platform, 
    + which is helpful for scripting release production as every build can be done the same way, 
    + with the only differences being the $PATH, host triplets, and targets.
- This assumes 
    + /home/build is where cross-compilation tools like MinGW32 are found, as well as jq and Oniguruma workspaces.
    + Pretend : ;  is the shell $PS1 -- this makes it easy to cut-n-paste (because : is the same as true). 
    + Setting $PS1 this way is quite convenient in general. 
    + It also helps to set $PS2 to the empty string, or to a string of whitespace.

## Windows (64-bit)
### Setup
#### Additional Dependencies
+ mingw{-w64} : For Window Cross-Compilation
+ oniguruma

#### Pre-Requisites

#### Configuration
- Generate configuration
    ```console
    autoreconf -fi
    ```
- Configure project
    ```console
    ./configure --with-oniguruma=builtin
    ```
- Clean source project distribution
    ```
    make distclean
    ```
- Install mingw bits into [mingw-build-directory]/build/mingw/mingw-w64-x86_64
- Fetch Oniguruma 5.9.5, untar into [oniguruma-project-directory]/build/ws/onig-5.9.5

- Make a directory for installing cross-built code into
    ```console
    mkdir -p [cross-build-path]/build/proto/win64
    ```

- (OPTIONAL) Set PATH to system environment variable
    ```console
    PATH=/home/build/mingw/mingw-w64-x86_64/bin:$PATH
    ```

#### Compilation
- Build Oniguruma
    - Change directory into oniguruma project directory
        ```console
        cd [oniguruma-project-path]/build/ws/onig-5.9.5
        ```
    - Configure oniguruma for building
        ```console
        ./configure --target=win64-x86_64 --host=x86_64-w64-mingw32 --prefix=[oniguruma-project-directory]/build/proto/win64/usr/local
        ```
    - Build/Compile
        ```console
        make -j16 LDFLAGS=-all-static clean all install
        ```

- Build jq
    - Change directory into 
    ```console
    cd /home/build/ws/jq
    ```
scripts/crosscompile win64 --disable-shared --enable-static --enable-all-static --target=win64-x86_64 --host=x86_64-w64-mingw32 --with-oniguruma=/home/build/proto/win64/usr/local
#### Installation
#### Uninstallation

## Wiki

## Resources

## References
+ [GitHub - jqlang/jq - Wiki - Cross-Compilation](https://github.com/jqlang/jq/wiki/Cross-compilation)

## Remarks
