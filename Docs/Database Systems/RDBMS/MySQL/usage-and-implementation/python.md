# Usage and Implementation - Python

## Setup
### Dependencies
+ mysql-connector-python : MySQL driver to access the MySQL database via python programming

### Pre-Requisites
- Setup Virtual Environment
    - Create Virtual Environment
        ```console
        python -m venv database-env
        ```

    - Chroot into Virtual Environment
        - Linux
            ```console
            . database-env/bin/activate
            ```
        - Windows
            ```console
            .\database-env\Scripts\activate
            ```

    - Install dependencies
        ```console
        python -m pip install mysql-connector-python
        ```

    - Check packages
        ```console
        python -m pip freeze list
        ```

## Snippets
- Import package
    ```python
    import mysql.connector
    ```

- Connect to the Database in python
    - Explanation
        + database: specify the database name to which you want to connect.
        + user: specify a user for authentication.
        + password: specify the password to connect to the respective database.
        + host: specify the localhost or IP address.
        + port: specify the port number, “3306” is the default port number.
    - Notes
        + On success, there should be no standard output message
    ```python
    conn = mysql.connector.connect(
        database="your-database-name",
        user="user-to-login-as",
        password="database-password",
        host="database-server-ip|domain",
        port='database-server-port-number (default: 3306)'
    )
    ```

- Create Cursor object
    - Notes
        - The cursor is a 'mouse' or 'pointer' in the database that will effective be your 'arrowhead' whenever you perform any SQL query or commands on the database.
            - For example
                - When Querying a database table
                    - the cursor will go to the database columns and/or rows in the table according to the query specifications and
                        + Select the results
                        + Return the fetched rows to the user
        - With the cursor object created, you can utilize any function of the Cursor class/object
            + Which lets you interact with the database and tables
        + On success, there should be no standard output message
    ```python
    cursor = conn.cursor()
    ```

- Execute SQL statements
    - Explanation
        - Parameters
            - sql_stmt : Specify your SQL statement to execute here
                + Type: String
    - Notes
        + On success, there should be no standard output message
    ```python
    cursor.execute(sql_stmt)
    ```

- Execute Sanitized and Prepared SQL statements
    - Notes
        - Prepared statements are SQL statements with substitute filter keyword/characters in it (i.e. %s)
            + Which will be replaced/substituted by variables (i.e. the tuple variable 'values' in the example below)
            + Prepared statements are used to prevent Web Vulnerabilities such as XSS (Cross-Site Scripting) and SQL Injection
    ```python
    sql = "INSERT INTO [table-name] (columns, ...) VALUES (%s, %s)"
    values = ("value-1", "value-2")
    cursor.execute(sql, values)
    ```

- Execute prepared statements multiple times for a list of values
    ```python
    sql = "INSERT INTO [table-name] (columns, ...) VALUES (%s, %s)"
    values = [
        ("value-1", "value-2"),
        ("value-2", "value-3"),
        ("value-4", "value-5"),
        ("value-6", "value-7"),
        ("value-8", "value-9"),
        ("value-10", "value-11"),
    ]
    cursor.executemany(sql, values)
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
    ```python
    conn.commit()
    ```

- Fetch records from queries
    - Fetch all records
        - Notes
            - cursor.fetchall() will return a list containing all the fetched rows
                + With each row (element) being a tuple data
        ```python
        result = cursor.fetchall()
        ```
    - Fetch only one record
        - Notes
            - cursor.fetchone() will return a list containing only the first row (tuple)
        ```python
        result = cursor.fetchone()
        ```

- Obtain number of rows affected by the SQL statement
    - Explanation
        + You can obtain attributes from the database cursor object
        - To obtain the number of rows affected by that cursor, 
            + you can access the attribute 'rowcount'
    ```python
    rows_affected_count = cursor.rowcount
    ```

- Check if database exists
    - Explanation
        + You can check if a database exist by listing all databases in your system by using the "SHOW DATABASES" statement
    - Execute query statement 'SHOW DATABASES'
        ```python
        cursor.execute("SHOW DATABASES")
        ```
    - Iterate and print out all of the fetched rows in the cursor object
        ```python
        for rows in cursor:
            print(rows)
        ```

- Check if table exists
    - Explanation
        + You can check if a table exist by listing all tables in your database with the "SHOW TABLES" statement:
    - Execute query statement 'SHOW TABLES'
        ```python
        cursor.execute("SHOW TABLES")
        ```
    - Iterate and print out all of the fetched rows in the cursor object
        ```python
        for rows in cursor:
            print(rows)
        ```

## Documentations

### Package
+ mysql

### Modules/Libraries
- mysql
    + connector : Library/Module that contains functions to handle connection to the Database server

### Classes
- mysql
    - .connector
        - .connection_cext : Connection Context object
            + CMySQLConnection() : SQL Database server connection stream; Contains the connection object
        - CMySQLCursor : Cursor object pointing to a SQL Database server connection stream object

### Functions
- mysql.connector
    - .connect(host, user, password) : Attempt to connect to the Database server interface; The function will return the database connection socket object
        - Syntax
            ```python
            db_conn = mysql.connector.connect(host="hostname", user="username", pass="password", database="database-name", port='3306', ...)
            ```
        - Parameters
            - Optionals
                - host : Specify the database server's hostname/ip address that you want to connect
                    + Type: String
                - username : Specify the username you want to authenticate and login to the database with
                    + Type: String
                - password : Specify the password of the specified user
                    + Type: String
                - database: specify the database name to which you want to connect.
                    + Type: String
                - port: specify the port number, “3306” is the default port number.
                    + Type: String
        - Return
            - db_conn : The database connection object
                + Type: mysql.connector.connection_cext.CMySQLConnection()

- mysql.connector.connection_cext.CMySQLConnection()
    - .commit() : Commit all changes/transactions made to the database (typically the write operations such as INSERT, UPDATE, DELETE etc)
        - Synopsis/Syntax
            ```python
            conn.commit()
            ```
        - Return
            + Type: Void

    - .cursor() : Generate a Cursor object from a database connector object
        - Synopsis/Syntax
            ```python
            cursor = conn.cursor()
            ```
        - Return: 
            - cursor : The cursor generated from a database connection
                + Type: mysql.connector.CMySQLCursor()

- mysql.connector.CMySQLCursor()
    - .execute(sql_stmt, values) : Execute the specified SQL statement in the connected database
        - Synopsis/Syntax
            ```python
            cursor.execute(sql_stmt, values)
            ```
        - Parameters
            - Positionals
                - sql_stmt : Specify the SQL statement to execute
                    + Type: String
            - Optionals
                - values : Specify all values you want to substitute into the provided SQL statement (if it is a sanitized/prepared statement with '%s' or similar filter characters)
                    + Type: Tuple
        - Return
            + Type: Void

    - .executemany(sql_stmt, values) : The provided SQL statement will be executed for all elements in the provided list of value tuples (that will be used as the values in the prepared statements) in the connected database
        - Synopsis/Syntax
            ```python
            cursor.executemany(sql_stmt, values)
            ```
        - Parameters
            - Positionals
                - sql_stmt : Specify the SQL statement to execute; This SQL statement will be executed for all elements in the provided values list
                    + Type: String
            - Optionals
                - values : A list of tuples in which, each tuple contains the values which you want to substitute into the provided SQL statement (if it is a sanitized/prepared statement with '%s' or similar filter characters). The SQL statement provided will be executed for all elements in this list
                    + Type: List of Tuples
        - Return
            + Type: Void

    - .fetchall() : Fetch all records returned by a query SQL statement (i.e. SELECT); cursor.fetchall() will return a list containing all the fetched rows, with each row (element) being a tuple data
        - Synopsis/Syntax
            ```python
            result = cursor.fetchall()
            ```
        - Return
            - result : list containing all the fetched rows, with each row (element) being a tuple data
                + Type: List

    - .fetchone() : Fetch only one record returned by a query SQL statement (i.e. SELECT); cursor.fetchone() will return a list containing only the first row (tuple)
        - Synopsis/Syntax
            ```python
            result = cursor.fetchone()
            ```
        - Return
            - result : list containing only the first row (tuple)
                + Type: List

### Attributes/Variables
- mysql.connector.CMySQLCursor()
    - .rowcount : Obtain the number of rows affected by that cursor from the last transaction/statement
        - Synopsis/Syntax
            ```python
            rows_affected_count = cursor.rowcount
            ```
        - Return
            + Type: Integer
    - .lastrowid : Obtain the 'ROW ID' of the last row; If used with an INSERT statement, This will be the ID returned by the last inserted row
        - Synopsis/Syntax
            ```python
            last_row_id = cursor.lastrowid
            ```
        - Return
            + Type: Integer

- Exceptions


## Wiki

## Resources

## References
+ [MySQL Developers Documentation - Python MySQL Connector](https://dev.mysql.com/doc/connector-python/en/)
+ [PyPI projects - mysql-connector-python](https://pypi.org/project/mysql-connector-python/)

## Remarks

