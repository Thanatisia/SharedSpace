# Python Library - sqlite3

## Table of Contents
* [Documentation](#documentation)

## Information
### DESCRIPTION
- sqlite3 is a built-in python library and re-implementation for the SQLite file-based Relational Database Management System (RDBMS) 
    + which works as a portable, small form factor RDBMS like MySQL

## Documentation

### Packages
- sqlite3

### Modules
+ sqlite3 : The SQLite3 database management system re-implementation for Python

### Classes
- sqlite3
    + `.Connection()` : Initializes a new SQLite3 database connection object containing the socket stream of the database
    + `.Cursor()` : Initializes a new SQLite3 database cursor class object for pointing to a database
    - `.Blob()` : Initializes a new Blob class object for handling (Reading and Writing) file objects in an SQLite database
        - Notes
            + The BLOB instance object is like a string, whereby the the bytes can be modified

### Functions
- sqlite3
    - `.connect(database, options)` : Connect to the SQLite database file and return the SQLite3 database connection object
        - Parameter Signature/Header
            - Positionals
                - `database="database-filename"` : Specify the database filename you wish to open
                    + Type: String
                    - Special filenames
                        + ":memory:" : to open a database connection to a database that resides in the RAM instead of on disk
            - Optionals
                - `timeout=[time-to-live (in seconds)]` : Specify the timeout duration (in seconds) before the opening errors out
                    + Type: Float/Double
                    + Default: 5.0 (5 seconds)
        - Return
            - sqlite3_database_conn : Return the SQLite3 database connection socket object
                + Type: SQLite3.Connection()
        - Usage
            ```python
            db_filename = "sqlite.db"
            conn = sqlite3.connect(db_filename)
            ```

- sqlite3.Connection()
    - `.blobopen(table_name, blob_column, row_number)` : Open a BLOB instance (a file-like object that can read and write data in an SQLite BLOB)
        - Parameter Signature/Header
            - table_name : Specify the target database table to write a BLOB object into
                + Type: String
            - blob_column : Specify the column in the target database table containing the BLOB data
                + Type: String
            - row_number : Specify the row number corresponding to the specified blob column in the target database table containing the BLOB data cell
                + Type: Integer
        - Return
            - blob : Return the initializes BLOB instance
                + Type: sqlite3.Blob()
    + `.close()` : Close the database connection object after usage
    - `.cursor(cursor_class)` : Creates a database cursor object which will act as a 'pointer' or 'mouse' moving across the database whenever a query (selection), insert (addition of a new row), update (updating/modification/replacements) or delete (removal) SQL statement is provided
        - Parameter Signature/Header
            - Optionals
                - cursor_class : Specify a custom cursor class that extends `sqlite3.Cursor()`
                    + Type: sqlite3.Cursor()
        - Return
            - cur : Return the initialized SQLite database cursor object
                + Type: SQLite3.Connection().Cursor()
        - Usage
            ```python
            cur = conn.cursor()
            ```
    - `.commit()` : Commit all changes made to the database
        - Explanation
            - Similar to how in 'git' where you need to 'confirm' the changes you have made by committing the changes made into the git repository database
                + RDBMS Databases like SQLite requires committing all changes made to the database as any changes made and actions taken are ephemeral (is temporary) and will revert back when the database is closed without committing
    + `.execute(sql_stmt, parameterized_values, optionals, ...)` : This routine is a shortcut/wrapper of `cursor.execute()` provided by the cursor object, and it creates an intermediate cursor object by calling the `conn.cursor()` function then calls `cur.execute()` with the parameters given

- sqlite3.Cursor()
    + `.close()` : Close the database cursor pointer object after usage
    - `.execute(sql_stmt, parameterized_values, optionals, ...)` : Execute the specified SQL statement using the database cursor to communicate with the database tables
        - Notes
            + The results of the SQL statement will be stored in the cursor object's background state
        - Parameter Signature/Header
            - Positionals
                - sql_stmt : Specify the SQL statement string you wish to execute
                    + Type: String
                - parameterized_values : Specify a tuple containing all the values you wish to substitute into the parameterized query strings in the SQL statement (for SQL prepared statements - statements that have been sanitized for preventing XSS attacks). 
                    - Note: 
                        + Please ensure that the number of elements in the tuple matches the number of '?' in the SQL statements
                    + Type: Tuple
            - Optionals
                - With Arguments
                - Flags
        - Return
            - sql_results : Return the SQL Query statement rows (if any) for processing
                + Type: String
        - Usage
            - Standard execution
                - Query/Select
                    ```python
                    cur.execute("SELECT {} FROM table_name".format("*"))
                    ```
                - Insert
                    ```python
                    cur.execute("INSERT INTO {} VALUES {}".format("table_name", "value-1, value-2"))
                    ```
                - Update
                    ```python
                    cur.execute("UPDATE {} SET {}={} WHERE {}={}".format("table_name", "column_name", "'new_value'", "condition-column", "'filter-value'"))
                    ```
                - Delete
                    ```python
                    cur.execute("DELETE FROM {} WHERE {}={}".format("table_name", "column-name", "value-to-delete"))
                    ```
            - Parameterized/Prepared SQL statement execution
                - Query/Select
                    ```python
                    cur.execute("SELECT (?) FROM table_name", ("*"))
                    ```
                - Insert
                    ```python
                    cur.execute("INSERT INTO (?) VALUES (?,?)", ("table_name", "value-1", "value-2"))
                    ```
                - Update
                    ```python
                    cur.execute("UPDATE {?} SET {?}={?} WHERE {?}={?}", "table_name", "column_name", "'new_value'", "condition-column", "'filter-value'")
                    ```
                - Delete
                    ```python
                    cur.execute("DELETE FROM {?} WHERE {?}={?}", "table_name", "column-name", "value-to-delete")
                    ```
    - `.executemany(sql_stmt, parameter_sequences)` : Execute an SQL statement against all the parameter sequences/mappings found in the SQL statement
        - Parameter Signature/Header
            - Positionals
                - sql_stmt : Specify the SQL statement string you wish to execute
                    + Type: String
                - parameter_sequences : Specify a list of tuple objects in which, each tuple contains the values you wish to pass/substitute into the parameterized/prepared SQL statement that you wish to execute. The specified SQL statement will be executed for every element in the list
                    + Type: List of Tuples
            - Optionals
                - With Arguments
                - Flags
        - Usage
            - Query
                ```python
                columns = [
                    ("column1", ),
                    ("column2", ),
                ]
                cur.executemany("SELECT (?) FROM table_name", columns)
                ```
            - Insert
                ```python
                rows = [
                    ("row1", ),
                    ("row2", ),
                ]
                cur.executemany("INSERT INTO table_name VALUES (?)", rows)
                ```
    - `.fetchall()` : Fetch all results of the SQL query statement in a list of tuples, where each tuple represents each row returned
        + Type: List of Tuples
        + Format: [ (column-1-value, column-2-value, column-3-value), ... ]
    - `.fetchone()` : Fetch the first result returned from the SQL query statement
        + Type: Tuple
        + Format: (column-1-value, column-2-value, column-3-value)
    - `.fetchmany(size)` : Fetch the specified size (number of rows) from the SQL query statement in a list of tuples, where each tuple represents each row returned.
        - Parameter Signature/Header
            - size : Specify the size/number of rows you wish to return
        - Return
            + Type: List of Tuples
            + Format: [(column-1-value, column-2-value, column-3-value), ..., -> <size-number-of-rows>]
            + Note: This returns an empty list if no more rows are available

- sqlite3.Blob()
    - `.close()` : Close the BLOB instance
        - Errors
            + Error/Subclass exception : The BLOB object will be unusable past this point. If any further operations are attempted with th blob
    - `.read()` : Read the contents of the BLOB instance
        - Return
            - blob_data : Return the encoded contents of the BLOB instance. Decode the encoded string using `your_bytes.decode("utf-8")`
                + Type: Bytes
    - `.write(encoded_string)` : Write the specified encoded string into the BLOB object
        - Parameter Signature/Header
            - encoded_string : Specify the encoded string you want to write into the BLOB object (encode using your_string.encode("utf-8"))
                + Type: Bytes
    - `.tell()` : Return the current access position of the BLOB
        - Return
            - curr_access_pos : Return the current access position of the BLOB
                + Type: Integer

### Data Types and Objects

> SQLite and Python Types

----------------------------------------------------------------
| Python Type | SQLite Type    | MySQL                         |
|:-----------:|:--------------:|:-----------------------------:|
| None        | NULL           | NULL                          |
| int         | INTEGER        | int/INTEGER                   |
| float       | REAL           | REAL                          |
| str         | TEXT           | TEXT                          |
|             | VARCHAR(bytes) | VARCHAR(number-of-characters) |
|             |                | NVARCHAR                      |
| bytes       | BLOB           | BLOB                          |
----------------------------------------------------------------

### Attributes/Variables
- sqlite3.Connection()
    - `.total_changes` : This contains the total number of changes the previous SQL statement made to the database table
        + Type: Integer

- sqlite3.Cursor()
    - `.connection` : This contains the SQL Database connection that the cursor object is pointing at (and generated from)
        + Type: String
    - `.description` : This contains the Read-only attribute that provides the column names of the previous SQL query
        + Type: String
    - `.lastrowid` : This is a Read-only attribute that provides the Row ID of the last inserted row. It is only updated after successful `INSERT` or `REPLACE` statements using the `.execute()` method
        + Type: Integer
        + Default: None
    - `.rowcount` : This is a Read-only attribute that provides the number of modified rows for `INSERT`, `UPDATE`, `DELETE` and `REPLACE` statements. It returns '-1' for other statements include CTE queries.
        + Type: Integer

### Usage
- Connect to the SQLite3 database file and return the connection socket object
    ```python
    conn = sqlite3.connect(db_filename)
    ```

- Initialize a database cursor object pointing to the SQLite database connection object
    ```python
    cur = conn.cursor()
    ```

- Execute a SQL statement using the cursor object
    - Query statement
        ```python
        cur.execute("SELECT ({}) FROM table_name".format("*"))
        ```
    - Insert
        ```python
        cur.execute("INSERT INTO ({}) VALUES ({})".format("table_name", "value-1,value-2"))
        ```

- Execute a Prepared SQL statement
    - Query statement
        ```python
        cur.execute("SELECT (?) FROM (?)", "*", "table_name")
        cur.execute("SELECT (?) FROM (?)", ("*", "table_name"))
        ```
    - Insert
        ```python
        cur.execute("INSERT INTO (?) VALUES (?,?)", "table_name", "value-1", "value-2")
        cur.execute("INSERT INTO (?) VALUES (?,?)", ("table_name", "value-1", "value-2"))
        ```

- Execute SQL statements for a list of values/items
    - Query
        ```python
        columns = [
            ("column1", ),
            ("column2", ),
        ]
        cur.executemany("SELECT (?) FROM table_name", columns)
        ```
    - Insert
        ```python
        rows = [
            ("row1", ),
            ("row2", ),
        ]
        cur.executemany("INSERT INTO table_name VALUES (?)", rows)
        ```

- Opening a BLOB instance for handling SQLite BLOB file data
    ```python
    with con.blobopen(table_name, column_name, row_number) as blob:
        # Writing data into blob
        blob.write("your-string".encode("utf-8"))

        # Reading contents of the blob
        contents = blob.read()

        # Close the BLOB after usage
        blob.close()
    ```

- Commit all changes made to the database
    - Explanation
        - Similar to how in 'git' where you need to 'confirm' the changes you have made by committing the changes made into the git repository database
            + RDBMS Databases like SQLite requires committing all changes made to the database as any changes made and actions taken are ephemeral (is temporary) and will revert back when the database is closed without committing
    ```python
    conn.commit()
    ```

- Using the 'with' statement with `sqlite3.connect(db_filename)` for automatic cleanup
    ```python
    with sqlite3.connect(db_filename) as conn:
        # Check if connection is empty
        if conn != None:
            # Generate database cursor object from the database connection
            cursor = conn.cursor()

            # Check if cursor is empty
            if cursor != None:
                # Proceed statements here

                # Close cursor after usage
                cursor.close()

            # Close file after usage
            conn.close()
    ```

### Operational Workflow
- Import package and modules
    ```python
    import sqlite3
    ```

- Initialize Variables
    - File object
        ```python
        db_filename = "sqlite.db"
        ```
    - In-memory database
        ```python
        db_filename = ":memory:"
        ```

- Connect to the SQLite3 database file and return the connection socket object
    ```python
    conn = sqlite3.connect(db_filename)
    ```

- Initialize a database cursor object pointing to the SQLite database connection object
    ```python
    cur = conn.cursor()
    ```

- Create a new database table
    ```python
    cur.execute("CREATE TABLE <table-name> (<column-name> <data-type> <constraints>, ...)")
    ```

- Execute a SQL statement using the cursor object
    - General SQL statement execution
        - Query statement
            ```python
            cur.execute("SELECT ({}) FROM table_name".format("*"))
            ```
        - Insert
            ```python
            cur.execute("INSERT INTO ({}) VALUES ({})".format("table_name", "value-1,value-2"))
            ```
        - Update
            ```python
            cur.execute("UPDATE {} SET {}={} WHERE {}={}".format("table_name", "column_name", "'new_value'", "condition-column", "'filter-value'"))
            ```
        - Delete
            ```python
            cur.execute("DELETE FROM {} WHERE {}={}".format("table_name", "column-name", "value-to-delete"))
            ```
    - Prepared Statements
        - Query statement
            ```python
            cur.execute("SELECT (?) FROM table_name", ("*"))
            ```
        - Insert
            ```python
            cur.execute("INSERT INTO (?) VALUES (?,?)", ("table_name", "value-1", "value-2"))
            ```
        - Update
            ```python
            cur.execute("UPDATE {?} SET {?}={?} WHERE {?}={?}", "table_name", "column_name", "'new_value'", "condition-column", "'filter-value'")
            ```
        - Delete
            ```python
            cur.execute("DELETE FROM {?} WHERE {?}={?}", "table_name", "column-name", "value-to-delete")
            ```

- Execute SQL statements for a list of values/items
    - Query
        ```python
        columns = [
            ("column1", ),
            ("column2", ),
        ]
        cur.executemany("SELECT (?) FROM table_name", columns)
        ```
    - Insert
        ```python
        rows = [
            ("row1", ),
            ("row2", ),
        ]
        cur.executemany("INSERT INTO table_name VALUES (?)", rows)
        ```
    - Update
        ```python
        rows = [
            ("update-column-1", "update-value-1", "condition-column-1", "filter-value-1"),
            ("update-column-2", "update-value-2", "condition-column-2", "filter-value-2"),
            ("update-column-3", "update-value-3", "condition-column-3", "filter-value-3"),
            ("update-column-4", "update-value-4", "condition-column-4", "filter-value-4"),
        ]
        cur.executemany("UPDATE table_name SET (?)=(?) WHERE (?)=(?)", rows)
        ```
    - Delete
        ```python
        rows = [
            ("target-column-1", "target-filter-value-1"),
            ("target-column-2", "target-filter-value-2"),
            ("target-column-3", "target-filter-value-3"),
            ("target-column-4", "target-filter-value-4"),
        ]
        cur.executemany("DELETE FROM table_name WHERE (?)=(?)", rows)
        ```

- Obtain the rows returned from SQL query statements
    - All rows
        ```python
        rows = cur.fetchall()
        ```
    - First row
        ```python
        row = cur.fetchone()
        ```
    - Multiple rows
        ```python
        rows = cur.fetchall(N)
        ```

- Commit all changes made to the database
    - Explanation
        - Similar to how in 'git' where you need to 'confirm' the changes you have made by committing the changes made into the git repository database
            + RDBMS Databases like SQLite requires committing all changes made to the database as any changes made and actions taken are ephemeral (is temporary) and will revert back when the database is closed without committing
    ```python
    conn.commit()
    ```

- Close database cursor pointer object after usage
    ```python
    if cur != None:
        cur.close()
    ```

- Close database connection object after usage
    ```python
    if conn != None:
        conn.close()
    ```

## Wiki

### Terminologies
+ RDBMS : Relational Database Management System (usage of columns, rows and tables to created a relational data structure)

## References

## Resources
+ [DigitalOcean - Community - Tutorials - How to use the SQLite3 module in python3](https://www.digitalocean.com/community/tutorials/how-to-use-the-sqlite3-module-in-python-3)
+ [FreeCodeCamp - News - SQLite3 Python Beginner's Tutorial](https://www.freecodecamp.org/news/sqlite-python-beginners-tutorial/)
+ [GeeksForGeeks - Python SQLite](https://www.geeksforgeeks.org/python-sqlite/)
+ [Python Docs - sqlite3](https://docs.python.org/3/library/sqlite3.html)
+ [Tutorialspoint - SQLite - SQlite Python](https://www.tutorialspoint.com/sqlite/sqlite_python.htm)

## Remarks

