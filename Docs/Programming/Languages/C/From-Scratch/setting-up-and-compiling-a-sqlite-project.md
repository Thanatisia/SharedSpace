# C programming - Setting up and compiling a SQLite project from scratch

## Information
+ GitHub: https://github.com/sqlite/sqlite

## Setup
### Dependencies
- Development Essentials
    + make
    + base-devel (ArchLinux) / build-essential (Debian)
    + gcc : For C
    + g++ : For C++
- sqlite
    + sqlite3.h
    + sqlite3.dll

### Building from Source
- Linux
    - Download SQLite Source Code autoconf as an Amalgamation
        - Notes
            + Please refer to [SQLite - Download](https://www.sqlite.org/download.html) for the latest version and year of release in the archive
        + File URL: https://www.sqlite.org/[year]/sqlite-autoconf-[version].tar.gz

    - Untar and extract the repository from the tarball archive
        ```bash
        tar -xvzf sqlite-autoconf-[version].tar.gz
        ```

    - Change directory into extracted directory
        ```bash
        cd sqlite-autoconf-[version]
        ```

    - Make build directory
        ```bash
        mkdir -pv build
        ```

    - Change directory into the build directory
        ```bash
        cd build
        ```

    - Prepare and configure source code
        ```bash
        ../configure
        ```

    - Build source files
        ```bash
        make
        ```

    - Install built SQLite libraries into system
        - Note
            - This will install the sqlite3 libraries into 
                + '/usr/local/lib' : For user-installed libraries
                + '/usr/local/share' : For user-installed shared resources
        ```bash
        (sudo) make install
        ```

    - (Optional) Uninstall installed SQLite libraries from system
        - Note
            - This will install the sqlite3 libraries into 
                + '/usr/local/lib' : For user-installed libraries
                + '/usr/local/share' : For user-installed shared resources
        ```bash
        (sudo) make install
        ```

### Pre-Requisites
- Prepare the SQLite source files
    - Download SQLite Source Code as an Amalgamation
        - Notes
            + Please refer to [SQLite - Download](https://www.sqlite.org/download.html) for the latest version and year of release in the archive
        + File URL: https://www.sqlite.org/[year]/sqlite-amalgamation-[version].zip

    - Unzip the amalgamation source file
        - Contents of the source directory
            + sqlite3.c: The SQLite amalgamation source file
            + sqlite3.h: The header files that accompanies sqlite3.c and defines the C-language interfaces to SQLite.
            + shell.c: The command-line interface program itself. This is the C source code file that contains the definition of the main() routine and the loop that prompts for user input and passes that input into the SQLite database engine for processing.
        ```bash
        unzip sqlite-amalgamation-[version]
        ```

    - Change directory into extracted directory
        ```bash
        cd sqlite-amalgamation-[version]
        ```

    - Compile the SQLite DLL file
        - Notes
            + Please refer to [SQLite - How to compile](https://www.sqlite.org/howtocompile.html) for a full rundown
        - Using gcc/MinGW(-w64)
            ```bash
            gcc -shared sqlite3.c -o sqlite3.dll
            ```
        - Using MSVC cl
            ```bash
            cl sqlite3.c -link -dll -out:sqlite3.dll
            ```

    - (Optional) Compile the SQLite CLI utility
        - Notes
            + Please refer to [SQLite - How to compile](https://www.sqlite.org/howtocompile.html) for a full rundown
        - Using gcc/MinGW(-w64)
            ```bash
            gcc shell.c sqlite3.c -lpthread -ldl -lm -o sqlite3
            ```
        - Using MSVC cl
            ```bash
            cl shell.c sqlite3.c -Fesqlite3.exe
            ```

    - Copy 'sqlite3.h' and 'sqlite3.dll' to your project source code repository
        - Using batch/cmd
            ```batch
            copy sqlite3.h \path\to\project\repository\src\
            copy sqlite3.dll \path\to\project\repository\src\
            ```
        - Using bash
            ```batch
            cp sqlite3.{h,dll} /path/to/project/repository/src
            ```

## Development
### Usage and Integration/Implementation
#### In C project
- Include header file
    - If installed into the system
        ```c
        #include <sqlite3.h>
        ```
    - If embedded locally into the project
        ```c
        #include "path/to/sqlite3.h"
        ```

### Compilation
#### Linux
- Using gcc
    - Compile source files into object files
        ```bash
        gcc -c main.c
        ```
    - Compile object files and all dependencies into the executable
        - Dependencies
            + Source object files (*.o)
        ```bash
        gcc main.o -o main -I /usr/local/include/[your-includes] -l/usr/local/lib/sqlite3.h
        ```

- Using Makefile
    ```makefile
    main.exe: main.o
        ## Compile the executable with the includes and libraries after compiling the object file
        gcc main.o -o main -I /usr/local/include/[your-includes] -l/usr/local/lib/sqlite3.h

    main.o: main.c
        ## Compile the object file from the source file 'main.c'    
        gcc -c main.c
    ```

#### Windows
- Using gcc
    - Compile source files into object files
        ```bash
        gcc -c main.c
        ```
    - Compile object files and all dependencies into the executable
        - Dependencies
            + Source object files (*.o)
            + Dynamic Link Libraries (*.dll)
        ```bash
        gcc main.o sqlite3.dll -o main.exe
        ```

- Using Makefile
    ```makefile
    main.exe: main.o sqlite3.dll
        ## Compile the executable after compiling the object file and preparing the DLL
        gcc main.o sqlite3.dll -o main.exe 

    main.o: main.c
        ## Compile the object file from the source file 'main.c'    
        gcc -c main.c
    ```

## Wiki

## Resources

## References
+ [StackOverflow - Questions - 3540355 - Using SQLite with C on Windows](https://stackoverflow.com/questions/3540355/using-sqlite-with-c-on-windows)

## Remarks
