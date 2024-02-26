# Usage and Implementation - C Programming

## Setup
### Dependencies
+ git
- Build Development Tools
    + apt: build-essential
    + pacman: base-devel

### Pre-Requisites

### Build From Source
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

## Snippets
- Import/Include libraries
    ```c
    #include <sqlite3.h>
    ```

- Declare and Initialize Variables
    - SQLite3 database file pointer
        ```c
        sqlite3 *db;
        ```
    - Error Message String
        ```c
        char *zErrMsg = 0;
        ```
    - Return/Result Code
        ```c
        int rc;
        ```
    - SQL statement string
        ```c
        char *sql;
        ```
    - data string when callback function is called
        ```c
        const char* data = "Callback function called";
        ```
    - Prepared Statement objecto
        ```c
        sqlite3_stmt *stmt;
        ```

- Connect to the Database
    - Explanation
        - System will try to connect to the provided database file and 
            + place the database stream object into memory in the sqlite3 db pointer object
        - Parameters
            - db_filename : Specify the target database file to open
                + Type: String
            - `&db` : The database pointer container being referenced by the value of its memory address; When you place some data into this variable, the value will be placed into the memory address pointed by the pointer 
                + Type: sqlite3* 
    - Notes
        + On success, there should be no standard output message
    ```c
    rc = sqlite3_open(db_filename, &db);
    ```

- Check if opening was successful
    - Explanation
        + Check if the database file opening was successful
    ```c
    if( rc ) {
        fprintf(stderr, "Can't open database: %s\n", sqlite3_errmsg(db));
        return(0);
    } else {
        fprintf(stderr, "Opened database successfully\n");
    }
    ```

- Prepare callback function to be executed if a non-select event is triggered
    - Notes
        + This function is design with the context that its not used with a SELECT query function
        + If SELECT queries are required, the first 'NotUsed' void pointer will be replaced with a data pointer for storing the queries
    ```c
    static int callback(void *NotUsed, int argc, char **argv, char **azColName) {
       int i;
       for(i = 0; i<argc; i++) {
          printf("%s = %s\n", azColName[i], argv[i] ? argv[i] : "NULL");
       }
       printf("\n");
       return 0;
    }
    ```

- Execute SQL statements
    - Explanation
        + Execute the specified SQL statements into the provided database object
        - Parameters
            - db : The database object to execute in
                + Type: sqlite3 *
            - sql_stmt : The SQL statement command string you wish to execute
                + Type: char *
            - callback : A callback function to be executed if an event is activated/triggered during the command's call-time
                + Type: static int callback(void *NotUsed, int argc, char **argv, char **azColName);
            - &zErrMsg : Pass-by Reference the error message string into the function so that the function can write the error message (if any) into this variable directly without having to return
                + Type: char *
    - Notes
        + On success, there should be no standard output message
    ```c
    rc = sqlite3_exec(db, sql_stmt, callback, 0, &zErrMsg);
    ```

- Verify/Validate if the SQL statement was executed successfully
    - Explanation
        + Check if the return code was 'SQLITE_OK', 
        - if not, the SQL statement had an error
            + Print out the error message
            + Free the memory allocation of the zErrMsg memory address and the values
    ```c
    if( rc != SQLITE_OK ){
      fprintf(stderr, "SQL error: %s\n", zErrMsg);
      sqlite3_free(zErrMsg);
    } else {
      fprintf(stdout, "Table created successfully\n");
    }
    ```

- Prepare a structure of type int (*sqlite3_callback)
    - Explanation
        - This callback is necessary for SELECT query operations
            + Because it provides a way to obtain results from SELECT statements
        - If the above callback is provided in sqlite_exec() routine as the third argument, 
            + SQLite will call this callback function for each record processed in each SELECT statement executed within the SQL argument.
    ```c
    typedef int (*sqlite3_callback)(
        void*,    /* Data provided in the 4th argument of sqlite3_exec() */
        int,      /* The number of columns in row */
        char**,   /* An array of strings representing fields in the row */
        char**    /* An array of strings representing column names */
    );
    ```

- Prepare callback function to be executed if a select event is triggered
    - Notes
        + This function is design with the context that its used with a SELECT query function
        + The first argument - *data - is used as a container to hold the returned/fetched rows from the SELECT query
    ```c
    static int callback(void *data, int argc, char **argv, char **azColName){
       int i;
       fprintf(stderr, "%s: ", (const char*)data);
       
       for(i = 0; i<argc; i++){
          printf("%s = %s\n", azColName[i], argv[i] ? argv[i] : "NULL");
       }
       
       printf("\n");
       return 0;
    }
    ```

- Execute SELECT/Query statements and fetch records from queries
    - Explanation
        - Execute the specified SQL SELECT statements into the provided database object and
            + Fetch/return the requested rows and
            + Place it into the 'void *data' variable
        - Parameters
            - db : The database object to execute in
                + Type: sqlite3 *
            - sql_stmt : The SQL statement command string you wish to execute
                + Type: char *
            - callback : A callback function to be executed if an event is activated/triggered during the command's call-time
                + Type: static int callback(void *NotUsed, int argc, char **argv, char **azColName);
            - data : Variable to be populated by the records returned by the SELECT query statements
                + Type: void*
            - &zErrMsg : Pass-by Reference the error message string into the function so that the function can write the error message (if any) into this variable directly without having to return
                + Type: char *
    - Notes
        + On success, there should be no standard output message
    ```c
    rc = sqlite3_exec(db, sql, callback, (void*)data, &zErrMsg); 
    ```

- Verify/Validate if the SQL statement was executed successfully
    - Explanation
        + Check if the return code was 'SQLITE_OK', 
        - if not, the SQL statement had an error
            + Print out the error message
            + Free the memory allocation of the zErrMsg memory address and the values
    ```c
    if( rc != SQLITE_OK ){
      fprintf(stderr, "SQL error: %s\n", zErrMsg);
      sqlite3_free(zErrMsg);
    } else {
      fprintf(stdout, "Table created successfully\n");
    }
    ```

- Prepare the SQL statements
    - Notes
        - Prepared statements are SQL statements with substitute filter keyword/characters in it (i.e. ?)
            + Which will be replaced/substituted by variables (i.e. the tuple variable 'values' in the example below)
            + Prepared statements are used to prevent Web Vulnerabilities such as XSS (Cross-Site Scripting) and SQL Injection
    - Parameters
        - db : The handle to your database object to execute in
            + Type: sqlite3 *
        - sql_stmt : The SQL statement command string you wish to execute
            + Type: char *
        - sql_str_len : The length of the SQL statement
            + Type: int
        - stmt : Prepared Statement Object
            + Type: sqlite3_stmt *
        - nullptr : pointer to the tail end of sql statement (when there are multiple statements inside the string; can be null)
            + Type: nullptr
    ```c
    rc = sqlite3_prepare(db, sql, sql_str_len, stmt, nullptr);
    ```

- Bind the parameter texts to the prepared statements
    - Explanation
        - Similar to using str.format() in python, 
            + This is the function used to bind the parameter values to the prepared statement's substitute strings
        + After binding, the prepared statement is ready to be executed
    - Notes
        - when you step through a statement that's supposed to return rows of a result table, 
            - this function will keep returning 
                + SQLITE_ROW as long as there are result rows to process, and 
                + SQLITE_DONE when there are none left.
    - Parameters
        - stmt : The Prepared Statement Object which you will bind the values to
            + Type: sqlite3_stmt *
        - idx : Parameter index, 1-based
            + Type: int
        - data : The data to bind
            + Type: char *
        - data_len : The length of the data
            + Type: int
        - callback_pointer : The pointer to the callback function that frees the data after the call to this function.
            - Notes
                + This can be null if the data doesnt need to be freed,
                    - like in this case
                        + Special value 'SQLITE_STATIC' : the data is managed by the std::string, object and will be freed automatically
    ```c
    rc = sqlite3_bind_text(stmt, idx, data, data_len, callback_pointer);
    ```

- Execute the Sanitized and Prepared Statement
    - Parameters
        - stmt : Prepared Statement Object
            + Type: sqlite3_stmt *
    ```c
    rc = sqlite3_step(stmt);
    ```

- When completed, you finish by destroying the papred statement
    ```c
    sqlite3_finalize(stmt);
    ```

- Begin transactions
    ```c
    rc = sqlite3_exec(db, "BEGIN TRANSACTION;", NULL, NULL, NULL);
    ```

- Commit changes made to the database and tables
    - Notes
        - Similar to a git version control repository
            + A Relational Database needs to 'commit' the transaction/changes made from any interaction to the database tables
            + This is primarily due to safety - in a sense, you should confirm that you really do want to make these changes, as the changes are final
        - In the case whereby you wish to revert the changes/transactions
            + You can rollback by executing the SQL statement 'ROLLBACK;'
            - However, you need to have created a transaction history before making the changes
                + By executing the SQL statement 'transaction'
        + On success, there should be no standard output message
        + END TRANSACTION is just an alias for 'commit'
    ```c
    rc = sqlite3_exec(db, "COMMIT;", NULL, NULL, NULL);
    ```

- End transactions
    - Note:
        + END TRANSACTION is just an alias for 'commit'
    ```c
    rc = sqlite3_exec(db, "BEGIN TRANSACTION;", NULL, NULL, NULL);
    ```

- Close database after usage
    - Explanation
        - System will close the connection to the database file by removing the value from the pointer object and removing the memory allocation
        - Parameters
            - `db` : The database pointer variable holding the database file object
                + Type: sqlite3* 
    - Notes
        + On success, there should be no standard output message
    ```c
    sqlite3_close(db);
    ```

## Documentations

### Library
+ sqlite3.h

### Classes/Structures
- sqlite3

### Functions
- sqlite3_open(db_filename, &db) : Connect to the Database
    - Explanation
        - System will try to connect to the provided database file and 
            + place the database stream object into memory in the sqlite3 db pointer object
        + On success, there should be no standard output message
    - Syntax
        ```c
        rc = sqlite3_open(db_filename, &db);
        ```
    - Parameters
        - db_filename : Specify the target database file to open
            + Type: String
        - `&db` : The database pointer container being referenced by the value of its memory address; When you place some data into this variable, the value will be placed into the memory address pointed by the pointer 
            + Type: sqlite3* 
    - Return
        - rc : The return/result code from opening the database file
            + Type: Integer

- sqlite3_close(db) : Close database after usage
    - Explanation
        - System will close the connection to the database file by removing the value from the pointer object and removing the memory allocation
    - Notes
        + On success, there should be no standard output message
    - Synopsis/Syntax
        ```c
        sqlite3_close(db);
        ```
    - Parameters
        - Positionals
            - `db` : The database pointer variable holding the database file object
                + Type: sqlite3* 
        - Optionals
    - Return
        + Type: Void

- sqlite3_free(zErrMsg) : Free the memory allocation of the zErrMsg memory address and the values
    - Synopsis/Syntax
        ```c
        sqlite3_free(zErrMsg);
        ```
    - Parameters
        - Positionals
            - zErrMsg : Error Message String
                + Type: char *
    - Return
        + Type: Void

- sqlite3_exec(db, sql, callback, (void*)data, &zErrMsg); : Execute SQL statements
    - Explanation
        + set '0' to '(void*)data' if you are executing a non-Query statementy
        - If (void*) data is provided
            - Execute the specified SQL SELECT statements into the provided database object and
                + Fetch/return the requested rows and
                + Place it into the 'void *data' variable
    - Notes
        + On success, there should be no standard output message
    - Parameters
        - db : The handle to the database object to execute in
            + Type: sqlite3 *
        - sql_stmt : The SQL statement command string you wish to execute
            + Type: char *
        - callback : A callback function to be executed if an event is activated/triggered during the command's call-time
            + Type: static int callback(void *NotUsed, int argc, char **argv, char **azColName);
        - data : Variable to be populated by the records returned by the SELECT query statements
            + Type: void*
        - &zErrMsg : Pass-by Reference the error message string into the function so that the function can write the error message (if any) into this variable directly without having to return
            + Type: char *
    ```c
    rc = sqlite3_exec(db, sql, callback, (void*)data, &zErrMsg); 
    ```

### Attributes/Variables
+ SQLITE_OK : Data Type: Integer; Return Code; SQL statement was successfully executed

- Exceptions


## Usage
- Compile database with sqlite3 as a linker
    - gcc
        ```bash
        gcc [source-codes] -l sqlite3
        ```
    - g++
        ```bash
        g++ [source-codes] -l sqlite3
        ```

## Wiki

## Resources

## References
+ [StackOverflow - Questions - 61794729 - How does prepared statements in SQLite C work](https://stackoverflow.com/questions/61794729/how-does-prepared-statements-in-sqlite-c-work)
+ [Tutorialspoint - SQLite3 - C/C++](https://www.tutorialspoint.com/sqlite/sqlite_c_cpp.htm)

## Remarks


