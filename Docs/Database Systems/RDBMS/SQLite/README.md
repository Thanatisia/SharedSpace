# SQLite

## Information
### Introduction
```
SQLite is a database engine written in the C programming language. 

It is not a standalone app; rather, it is a library that software developers embed in their apps. 
    - As such, it belongs to the family of embedded databases.

SQLite as a database format is essentially a lightweight disk/file-based Relational Database Management System 
    + where instead of requiring an entirely separate database server process/service
    - Essentially, instead of running 'CREATE DATABASE [database-name]' to create a new database
        + the .db/.sqlite3 files ARE the databases.
```

### Database Layout Structure
- Database Managemnt System/
    - Database/ : on most DBMS, You need to create a database. However, in SQLite3, the file is the database, hence placing the .db/.sqlite3 file into a directory would make that folder the database management system
        - tables/
            - columns : Horizontal indices
                - rows : Vertical indices
                    - cells : aka Values/Data

### Project
+ Project Name: sqlite
- Repositories 
    + GitHub: https://github.com/sqlite/sqlite
    + SQLite Source Repository: https://www.sqlite.org/src/doc/trunk/README.md
- Websites
    + Main Website: https://www.sqlite.org/
    + Source Code Download: https://www.sqlite.org/download.html
    + Obtaining Source Code(s): https://www.sqlite.org/getthecode.html
    + Compilation Steps: https://www.sqlite.org/howtocompile.html

## Setup
### Installation via Bare Metal (Host Machine)
#### Dependencies
+ sqlite3:  The SQLite3 CLI utility/tool/client for access to the SQLite3 database file
- libsqlite3 : Allows access to the <sqlite3.h> header for C/C++
    + apt-based: libsqlite3-dev

#### Pre-Requisites

#### Installation
- Using package managers
    - apt-based
        ```console
        apt install sqlite3 libsqlite3-dev
        ```

#### Build From Source
- SQLite Client CLI utility
    - Information
        + File Name: sqlite-amalgamation-[version].zip
        + URL: https://www.sqlite.org/[year]/sqlite-amalgamation-[version].zip
        - Source Files
            + sqlite3.c: The SQLite amalgamation source file
            + sqlite3.h: The header files that accompanies sqlite3.c and defines the C-language interfaces to SQLite.
            + shell.c: The command-line interface program itself. This is the C source code file that contains the definition of the main() routine and the loop that prompts for user input and passes that input into the SQLite database engine for processing.
    - Download SQLite amalgamation source code zip archive
        ```bash
        wget https://www.sqlite.org/[year]/sqlite-amalgamation-[version].zip
        ```
    - Extract the zip archive
        ```bash
        unzip -xvzf sqlite-amalgamation-[version].zip
        ```
    - Change directory into archive
        ```bash
        cd sqlite-amalgamation-[version]
        ```
    - Compile source code to CLI utility
        - Using gcc
            - For UNIX/Linux systems
                ```bash
                gcc sqlite3.c shell.c -lpthread -ldl -lm -o sqlite3
                ```
            - For Windows
                ```bash
                gcc sqlite3.c shell.c -lpthread -ldl -lm -Fesqlite3.exe
                ```
        - Using MSVC cl.exe
            ```bash
            cl sqlite3.c shell.c -Fesqlite3.exe
            ```
    - Install CLI utility to system
        - Linux
            ```bash
            sudo cp sqlite3 /usr/local/bin
            ```
    - (Optional) Compile a full-featured shell
        - Using gcc
            ```bash
            gcc -Os -I. -DSQLITE_THREADSAFE=0 -DSQLITE_ENABLE_FTS4 \
               -DSQLITE_ENABLE_FTS5 -DSQLITE_ENABLE_JSON1 \
               -DSQLITE_ENABLE_RTREE -DSQLITE_ENABLE_EXPLAIN_COMMENTS \
               -DHAVE_READLINE \
               shell.c sqlite3.c -ldl -lm -lreadline -lncurses -o sqlite3
            ```
    - (optional) Compile source code as as DLL
        - Using gcc
            ```bash
            gcc -shared sqlite3.c -o sqlite3.dll
            ```
        - Using MSVC cl.exe
            ```bash
            cl.exe sqlite3.c -link -dll -out:sqlite3.dll
            ```

- SQLite Library
    - C Programming
        - Download SQLite autoconf source code tarball
            - Information
                + File Name: sqlite-autoconf-[version].tar.gz
                + URL: https://www.sqlite.org/[year]/[file-name]-[version].tar.gz
            ```bash
            wget https://www.sqlite.org/[year]/[file-name]-[version].tar.gz
            ```
        - Untar and extract the tarball archive
            ```bash
            tar -xvzf sqlite-autoconf-[version].tar.gz
            ```
        - Change directory into archive
            ```bash
            cd sqlite-autoconf-[version]
            ```
        - Create a dedicated build directory
            ```bash
            mkdir -pv build
            ```
        - Change directory into build directory
            ```bash
            cd build
            ```
        - Configure and prepare for compilation
            ```bash
            ../configure
            ```
        - Compile source code
            ```bash
            make
            ```
        - Install library to system
            ```bash
            sudo make install
            ```
        - Uninstall library from system
            ```bash
            sudo make uninstall
            ```

#### Setup SQLite3

#### Manage Server

## Documentations
### Tools
+ sqlite3:  The SQLite3 CLI utility/tool/client for access to the SQLite3 database file

### Synopsis/Syntax
- sqlite3
    - Notes
        - By default, 
            - if no options are specified
                + You will logon to the SQL database server CLI session
    ```bash
    sqlite3 {options} <arguments> [database-name]
    ```

- Execute a command from command line
    - Defaut
        ```bash
        sqlite3 {options} <arguments> [command-strings ...]
        ```
    - using the shell as a pipe and standard input
        - Explanation
            + '<<<' instructs the shell to take whatever follows it as stdin, similar to piping from echo.
        ```console
        sqlite3 {options} <arguments> [database-name] - <<< 'command'
        ```
    - Piping the SQL query string as standard output into CLI as a standard input stream
        ```console
        echo "your query" | sqlite3 {options} <arguments> [database-name]
        ```

- Execute multi-line functions
    ```bash
    sqlite3 [database-name] << EOF
        // Your Statements Here
    EOF
    ```

- Write query results to SQL script
    ```bash
    sqlite {options} [database-name] '.output [sql-script].sql' 'your-queries' '...' '.exit'
    ```

- Restore/Import/Write SQL script to Database
    - Windows
        ```bash
        sqlite3 {options} [database-name] '.read [sql-script].sql'
        ```
    - Linux/Unix
        ```bash
        sqlite3 {options} [database-name] < sql-script.sql
        ```

### Parameters
#### sqlite3
- Positionals
    + database-name : Specify the name of the database you want to connect to in the database server
    + command-strings : Specify the command string to execute in the database file; This is stackable, separate all commands with a space-delimiter ('')
- Optionals
    - With Arguments
        + `-init [file]` : Read and execute commands from the specified file , which can contain a mix of SQL statements and meta-commands
    - Flags
        + -echo : Print commands before execution.
        + -interactive : Force TUI interactive I/O mode

### Usage
- In-line execution
    - Print fetched rows/results in standard output with headers turned on and column formatting
        ```bash
        sqlite3 db.sqlite3 ".headers on" ".mode column" "SELECT * FROM auth_user;"
        ```

    - Create Database tables in-line
        ```bash
        sqlite3 db.sqlite3 'CREATE TABLE [table-name] (column-parameters, ...);'
        ```

- Execute multi-line functions
    ```bash
    sqlite3 [database-name] << EOF
        // Your Statements Here
    EOF
    ```

- Backup/Dump/Export Database to SQL script
    ```bash
    sqlite {options} [database-name] '.output [sql-script].sql' '.dump {table-name}' '.exit'
    ```

- Restore/Import/Write SQL script to Database
    - Windows
        ```bash
        sqlite3 {options} [database-name] '.read [sql-script].sql'
        ```
    - Linux/Unix
        ```bash
        sqlite3 {options} [database-name] < sql-script.sql
        ```

### Database Query/Backup SQL Statements
+ Dump tables : SELECT
+ Dump Views  : Show View
+ Dump Triggers : Trigger
- If '--single-transaction' is not used
    + The 'Lock Tables' privileges must be granted to the user

### Database Server Interactive Mode Commands
+ '.dump {table-names}' : Dump/Backup the specified tables within the database as an SQL script; Leave the 'table-names' parameter to dump all tables
+ '.headers [on|off]' : Disable/Enable headers
- '.mode [modes]' : Specify the mode all results will be following
    - Modes
        - Select/Query statements : standard output printing format/mode when dealing with fetch-based results
            + column : Display all fetched rows/results in a column
        - Insert statements
            + insert : Every SELECT statement will issue the result as the INSERT statements instead of pure text standard output
- '.output [output-format]' : Set the output format/stream that the results will follow; Default: print to standard output
    - Output Format
        + sql-script.sql : Specify the name of the target output SQL script file to set the output to a text file
+ '.schema' : Save the SQL database table schema structures
+ '.exit' : Exit from database gracefully

## Wiki

### Filesystem Structure
#### Folders


#### Files

### Notes and Findings
#### Error Messages

## Resources

## References
+ [Linux packages - sqlite3](https://pkgs.org/search/?q=sqlite3)
+ [manpages ubuntu](https://manpages.ubuntu.com/manpages/trusty/en/man1/sqlite3.1.html)

## Remarks

