# Python Library - mysql-connector-python

## Table of Contents
* [Documentation](#documentation)
* [Pre-Requisites](#pre-requisites)
* [Setup](#setup)

## Information
### DESCRIPTION
```
MySQL Connector is a python library that handles communication and connection with a MySQL Database
```

## Documentation
        
### Importing
- Whole Module
    - MySQL connector
        ```python
        import mysql.connector
        ```

- Import class
    ```python
    from mysql.[class] import [functions|class|variables]
    ```
    
### Modules
- mysql.connector : Handles the Connection/Interaction of the MySQL Database as well as executing of statements

### Classes

### Objects
- MySQLDatabase
    - Functions
        - .commit() : Commit all changes made to the database; similar to how you have to commit all changes made to your git repository
            + Return Type: None
        - .cursor() : Generate a database cursor 'pointer' that will point to values in your table
            + Return Type: MySQLCursor

- MySQLCursor
    - Attributes
        - .lastrowid : Get the ID of the row you just inserted
            + Type: Integer
        - .rowcount : Retrieve the number of rows returned/found in the Cursor
            + Type: Integer
    - Functions
        - .execute(sql_stmt, values) : Execute a specified SQL Statement and return result
            + Return Type: Tuple
            - Parameters
                - sql_stmt : The SQL Statement you want to execute
                    + Type: String
                    - NOTES
                        + To form a prepared statement, substitute your values with '%s' keyword, and parse the values in a tuple into the 'values' parameter below
                - values : (OPTIONAL) A Tuple containing all the values you want to parse into the prepared statement; Place multiple tuples into a list to parse multiple rows
                    + Type: Tuple
                    - NOTES
                        + Ensure that the number of values in a tuple is equivalent to the number of '%s' in the prepared statement's values

        - .executemany(sql_stmt, values) : Execute a SQL Statement with multiple rows
            + Return Type: Tuple
            - Parameters
                - sql_stmt : The SQL Statement you want to execute
                    + Type: String
                    - NOTES
                        + To form a prepared statement, substitute your values with '%s' keyword, and parse the values in a tuple into the 'values' parameter below
                - values : (OPTIONAL) A Tuple containing all the values to insert into a new row; Place multiple tuples into a list to parse multiple rows
                    + Type: List of Tuples
                    - NOTES
                        - Each tuple represents one row to insert
                            - Place multiple tuples into a list and parse into 'values' to Insert multiple rows
                        + Ensure that the number of values in a tuple is equivalent to the number of '%s' in the prepared statement's values

        - .fetchall() : Get all rows returned/results from the last executed statement/query
            + Return Type: List of Tuples

        - .fetchone() : Get only the first row returned/results from the last executed statement/query
            + Return Type: Tuple

### Variables

### Functions
- mysql.connector
    - .connect(host, user, password) : Attempt to connect to database
        - Parameters
            - host : The hostname (IP|domain name) of your MySQL Database Server
                + Type: String
            - user : The username of your MySQL Database Server
                + Type: String
            - password : The password of your MySQL Database Server
                + Type: String
            - database : The name of the database you want to use
                + Type: String
      
### Usage

#### Database Connection
- Create Connection
    ```python
    # Import Library
    import mysql.connector

    # Connect Database
    mydb = mysql.connector.connect(
        host="localhost",
        user="username",
        password="password"
    )
    ```

- Generate Cursor
    ```python
    # Import Library
    import mysql.connector

    # Connect Database
    mydb = mysql.connector.connect(
        host="localhost",
        user="username",
        password="password"
    )

    # Generate cursor
    mycursor = mydb.cursor()
    ```

- Execute SQL Statement
    ```python
    # Import Library
    import mysql.connector

    # Connect Database
    mydb = mysql.connector.connect(
        host="localhost",
        user="username",
        password="password"
    )

    # Generate cursor
    mycursor = mydb.cursor()

    # Execute Query
    mycursor.execute("sql-statement")
    ```

- Get all Databases
    ```python
    # Import Library
    import mysql.connector

    # Connect Database
    mydb = mysql.connector.connect(
        host="localhost",
        user="username",
        password="password"
    )

    # Generate cursor
    mycursor = mydb.cursor()

    # Execute Query
    mycursor.execute("SHOW DATABASES")

    # Loop and print all results
    for row in mycursor:
        print(row)
    ```

- Get all Tables
    ```python
    # Import Library
    import mysql.connector

    # Connect Database
    mydb = mysql.connector.connect(
        host="localhost",
        user="username",
        password="password"
    )

    # Generate cursor
    mycursor = mydb.cursor()

    # Execute Query
    mycursor.execute("SHOW TABLES")

    # Loop and print all results
    for row in mycursor:
        print(row)
    ```

#### Queries

- Select columns in a table
    - Columns
        + '*' = Wildcard; Select all
    ```python
    # Import Library
    import mysql.connector

    # Connect Database
    mydb = mysql.connector.connect(
        host="localhost",
        user="username",
        password="password"
    )

    # Generate cursor
    mycursor = mydb.cursor()

    # Execute Query
    mycursor.execute("SELECT [columns] FROM [table_name]")

    # Get all results
    myresults = mycursor.fetchall()

    # Print all results
    for row in myresults:
        print(row)
    ```

- Select columns in a table with condition
    - Columns
        + '*' = Wildcard; Select all
        + '%[letter|phrase]%' = Select the records that starts, includes or ends with the given letter/phrase
        + '%s' = To escape query values; Used to prevent SQL injection; basically use this to create prepared statements
    ```python
    # Import Library
    import mysql.connector

    # Connect Database
    mydb = mysql.connector.connect(
        host="localhost",
        user="username",
        password="password"
    )

    # Generate cursor
    mycursor = mydb.cursor()

    # Execute Query
    mycursor.execute("SELECT [columns] FROM [table_name] WHERE [conditions AND ]")

    # Get all results
    myresults = mycursor.fetchall()

    # Print all results
    for row in myresults:
        print(row)
    ```

- Select columns in a table with filter using Prepared Statements
    ```python
    # Import Library
    import mysql.connector

    # Connect Database
    mydb = mysql.connector.connect(
        host="localhost",
        user="username",
        password="password"
    )

    # Generate cursor
    mycursor = mydb.cursor()

    # Design Prepared Statement
    sql_stmt = "SELECT [columns] FROM [table_name] WHERE condition = %s"
    values = ("condition", )

    # Execute Query
    mycursor.execute(sql_stmt, values)

    # Get all results
    myresults = mycursor.fetchall()

    # Print all results
    for row in myresults:
        print(row)
    ```

- Return only one row from the query
    ```python
    # Import Library
    import mysql.connector

    # Connect Database
    mydb = mysql.connector.connect(
        host="localhost",
        user="username",
        password="password"
    )

    # Generate cursor
    mycursor = mydb.cursor()

    # Execute Query
    mycursor.execute("SELECT [columns] FROM [table_name] WHERE [conditions AND ]")

    # Get all results
    myresults = mycursor.fetchone()

    # Print Row
    print(myresults)
    ```

- Sort the result by Ascending Order (Default)
    + using 'ORDER BY'
    ```python
    # Import Library
    import mysql.connector

    # Connect Database
    mydb = mysql.connector.connect(
        host="localhost",
        user="username",
        password="password"
    )

    # Generate cursor
    mycursor = mydb.cursor()

    # Design Prepared Statement
    sql_stmt = "SELECT [columns] FROM [table] ORDER BY [keyword]"

    # Execute Query
    mycursor.execute(sql_stmt)

    # Get all results
    myresults = mycursor.fetchall()

    # Print all results
    for row in myresults:
        print(row)
    ```

- Sort the result by Descending Order
    ```python
    # Import Library
    import mysql.connector

    # Connect Database
    mydb = mysql.connector.connect(
        host="localhost",
        user="username",
        password="password"
    )

    # Generate cursor
    mycursor = mydb.cursor()

    # Design Prepared Statement
    sql_stmt = "SELECT [columns] FROM [table] ORDER BY [keyword] DESC"

    # Execute Query
    mycursor.execute(sql_stmt)

    # Get all results
    myresults = mycursor.fetchall()

    # Print all results
    for row in myresults:
        print(row)
    ```

- Limit the number of records returned from the query
    + Use 'LIMIT'keyword
    ```python
    # Import Library
    import mysql.connector

    # Connect Database
    mydb = mysql.connector.connect(
        host="localhost",
        user="username",
        password="password"
    )

    # Generate cursor
    mycursor = mydb.cursor()

    # Design Prepared Statement
    sql_stmt = "SELECT [columns] FROM [table] LIMIT [number_of_records]"

    # Execute Query
    mycursor.execute(sql_stmt)

    # Get all results
    myresults = mycursor.fetchall()

    # Print all results
    for row in myresults:
        print(row)
    ```

- Start return from another position
    + Use 'OFFSET' keyword
    ```python
    # Import Library
    import mysql.connector

    # Connect Database
    mydb = mysql.connector.connect(
        host="localhost",
        user="username",
        password="password"
    )

    # Generate cursor
    mycursor = mydb.cursor()

    # Design Prepared Statement
    sql_stmt = "SELECT [columns] FROM [table] LIMIT [number_of_records] OFFSET [index]"

    # Execute Query
    mycursor.execute(sql_stmt)

    # Get all results
    myresults = mycursor.fetchall()

    # Print all results
    for row in myresults:
        print(row)
    ```

- Join multiple tables
    + Combine rows from multiple tables based on a related/similar column/key
    + Use 'JOIN'keyword
    - Inner Join
        + Only shows the records when there is a match
        ```python
        # Import Library
        import mysql.connector

        # Connect Database
        mydb = mysql.connector.connect(
            host="localhost",
            user="username",
            password="password"
        )

        # Generate cursor
        mycursor = mydb.cursor()

        # Design Prepared Statement
        sql_stmt = "SELECT \ 
            [table_1].column AS table_1_alias, \
            [table_2].column AS table_2_alias
            FROM [table] \ 
            INNER JOIN [table_2] ON \ 
            [table_1].primary_key = [table_2].primary_key"

        # Execute Query
        mycursor.execute(sql_stmt)

        # Get all results
        myresults = mycursor.fetchall()

        # Print all results
        for row in myresults:
            print(row)
        ```
    - Left Join
        + Show all users, even if they do not have the column
        ```python
        # Import Library
        import mysql.connector

        # Connect Database
        mydb = mysql.connector.connect(
            host="localhost",
            user="username",
            password="password"
        )

        # Generate cursor
        mycursor = mydb.cursor()

        # Design Prepared Statement
        sql_stmt = "SELECT \ 
            [table_1].column AS table_1_alias, \
            [table_2].column AS table_2_alias
            FROM [table] \ 
            LEFT JOIN [table_2] ON \ 
            [table_1].primary_key = [table_2].primary_key"

        # Execute Query
        mycursor.execute(sql_stmt)

        # Get all results
        myresults = mycursor.fetchall()

        # Print all results
        for row in myresults:
            print(row)
        ```
    - Right Join
        + Return all results, regardless of values found
        ```python
        # Import Library
        import mysql.connector

        # Connect Database
        mydb = mysql.connector.connect(
            host="localhost",
            user="username",
            password="password"
        )

        # Generate cursor
        mycursor = mydb.cursor()

        # Design Prepared Statement
        sql_stmt = "SELECT \ 
            [table_1].column AS table_1_alias, \
            [table_2].column AS table_2_alias
            FROM [table] \ 
            RIGHT JOIN [table_2] ON \ 
            [table_1].primary_key = [table_2].primary_key"

        # Execute Query
        mycursor.execute(sql_stmt)

        # Get all results
        myresults = mycursor.fetchall()

        # Print all results
        for row in myresults:
            print(row)
        ```

#### Create

- Create a database
    ```python
    # Import Library
    import mysql.connector

    # Connect Database
    mydb = mysql.connector.connect(
        host="localhost",
        user="username",
        password="password"
    )

    # Generate cursor
    mycursor = mydb.cursor()

    # Execute Query
    mycursor.execute("CREATE DATABASE [database-name]")
    ```

- Create a table
    ```python
    # Import Library
    import mysql.connector

    # Connect Database
    mydb = mysql.connector.connect(
        host="localhost",
        user="username",
        password="password"
    )

    # Generate cursor
    mycursor = mydb.cursor()

    # Execute Query
    mycursor.execute("CREATE TABLE {IF EXISTS} [table_name] (table_definitions, ...)")
    ```

#### Insert

- Insert into Table
    ```python
    # Import Library
    import mysql.connector

    # Connect Database
    mydb = mysql.connector.connect(
        host="localhost",
        user="username",
        password="password",
        database="mydatabase"
    )

    # Generate cursor
    mycursor = mydb.cursor()

    # Design SQL Statement with Prepared Statements
    sql_stmt = "INSERT INTO [table_name](columns,...) VALUES (%s, %s)"
    values = ("your", "values", ...)

    # Execute Query
    mycursor.execute(sql_stmt, values)

    # Commit the insert values
    # Used in SQLite as well, this is similar to 'committing' in git 
    # whereby, you need to commit to confirm changes made to the table
    mydb.commit()

    # Print confirmation message
    print(mycursor.rowcount, "record inserted")
    ```

- Insert multiple rows into Table
    ```python
    # Import Library
    import mysql.connector

    # Connect Database
    mydb = mysql.connector.connect(
        host="localhost",
        user="username",
        password="password",
        database="mydatabase"
    )

    # Generate cursor
    mycursor = mydb.cursor()

    # Design SQL Statement with Prepared Statements
    sql_stmt = "INSERT INTO [table_name](columns,...) VALUES (%s, %s)"
    values = [
        ("your", "values"), # Row 1
        ("your2", "values2"), # Row 2
        ("your3", "values3"), # Row 3
        ("your4", "values4"), # Row 4
        ...
    ]

    # Execute Query
    mycursor.executemany(sql_stmt, values)

    # Commit the insert values
    # Used in SQLite as well, this is similar to 'committing' in git 
    # whereby, you need to commit to confirm changes made to the table
    mydb.commit()

    # Print confirmation message
    print(mycursor.rowcount, "records inserted")
    ```

- Get Inserted Row ID
    ```python
    # Import Library
    import mysql.connector

    # Connect Database
    mydb = mysql.connector.connect(
        host="localhost",
        user="username",
        password="password",
        database="mydatabase"
    )

    # Generate cursor
    mycursor = mydb.cursor()

    # Design SQL Statement with Prepared Statements
    sql_stmt = "INSERT INTO [table_name](columns,...) VALUES (%s, %s)"
    values = ("your", "values")

    # Execute Query
    mycursor.execute(sql_stmt, values)

    # Commit the insert values
    # Used in SQLite as well, this is similar to 'committing' in git 
    # whereby, you need to commit to confirm changes made to the table
    mydb.commit()

    # Print confirmation message
    print("1 record inserted, ID: ", mycursor.lastrowid)
    ```

#### Update

- Update existing records in Table
    ```python
    # Import Library
    import mysql.connector

    # Connect Database
    mydb = mysql.connector.connect(
        host="localhost",
        user="username",
        password="password",
        database="mydatabase"
    )

    # Generate cursor
    mycursor = mydb.cursor()

    # Design SQL Statement with Prepared Statements
    sql_stmt = "UPDATE [table_name] SET [target_column]=[new_value] WHERE [condition]" # Specify the column and the new value to update; if no WHERE is specified - all records will be updated

    # Execute Query
    mycursor.execute(sql_stmt)

    # Commit the insert values
    # Used in SQLite as well, this is similar to 'committing' in git 
    # whereby, you need to commit to confirm changes made to the table
    mydb.commit()

    # Print confirmation message
    print(mycursor.rowcount, "record(s) affected")
    ```

- Update existing records in Table using Prepared Statements
    + Prevent SQL Injection
    ```python
    # Import Library
    import mysql.connector

    # Connect Database
    mydb = mysql.connector.connect(
        host="localhost",
        user="username",
        password="password",
        database="mydatabase"
    )

    # Generate cursor
    mycursor = mydb.cursor()

    # Design SQL Statement with Prepared Statements
    sql_stmt = "UPDATE [table_name] SET [target_column]=%s WHERE [target_column] = %s" # Specify the column and the new value to update; if no WHERE is specified - all records will be updated
    values = ("new_value", "old-value-to-replace")

    # Execute Query
    mycursor.execute(sql_stmt, values)

    # Commit the insert values
    # Used in SQLite as well, this is similar to 'committing' in git 
    # whereby, you need to commit to confirm changes made to the table
    mydb.commit()

    # Print confirmation message
    print(mycursor.rowcount, "record(s) affected")
    ```


#### Modify

- Alter a table
    ```python
    # Import Library
    import mysql.connector

    # Connect Database
    mydb = mysql.connector.connect(
        host="localhost",
        user="username",
        password="password"
    )

    # Generate cursor
    mycursor = mydb.cursor()

    # Execute Query
    mycursor.execute("ALTER TABLE [table_name] ADD [column definitions]")
    ```

#### Delete/Remove

- Delete Table
    ```python
    # Import Library
    import mysql.connector

    # Connect Database
    mydb = mysql.connector.connect(
        host="localhost",
        user="username",
        password="password"
    )

    # Generate cursor
    mycursor = mydb.cursor()

    # Design Prepared Statements
    sql_stmt = "DROP TABLE [table_name]"

    # Execute Query
    mycursor.execute(sql_stmt) 

    # Commit the change
    mydb.commit()
    ```

- Delete Table only if exists
    ```python
    # Import Library
    import mysql.connector

    # Connect Database
    mydb = mysql.connector.connect(
        host="localhost",
        user="username",
        password="password"
    )

    # Generate cursor
    mycursor = mydb.cursor()

    # Design Prepared Statements
    sql_stmt = "DROP TABLE IF EXISTS [table_name]"

    # Execute Query
    mycursor.execute(sql_stmt) 

    # Commit the change
    mydb.commit()
    ```

- Delete Record from existing table
    ```python
    # Import Library
    import mysql.connector

    # Connect Database
    mydb = mysql.connector.connect(
        host="localhost",
        user="username",
        password="password"
    )

    # Generate cursor
    mycursor = mydb.cursor()

    # Execute Query
    mycursor.execute("DELETE FROM [table_name] WHERE [column]=[values]") # Specify the column to delete; if no WHERE is specified - all records will be deleted

    # Commit the change
    mydb.commit()

    # Print confirmation message
    print(mycursor.rowcount, "record(s) deleted")
    ```

- Delete Record from existing table using Prepared Statements
    + Prevent SQL Injection
    ```python
    # Import Library
    import mysql.connector

    # Connect Database
    mydb = mysql.connector.connect(
        host="localhost",
        user="username",
        password="password"
    )

    # Generate cursor
    mycursor = mydb.cursor()

    # Design Prepared Statements
    sql_stmt = "DELETE FROM [table_name] WHERE [column] = %s" # Specify the column to delete; if no WHERE is specified - all records will be deleted
    values = ("value", )

    # Execute Query
    mycursor.execute(sql_stmt, values) 

    # Commit the change
    mydb.commit()

    # Print confirmation message
    print(mycursor.rowcount, "record(s) deleted")
    ```

    
## Wiki
### Wildcards
+ '*' : Wildcard; Select all
+ '%[letter|phrase]%': Select the records that starts, includes or ends with the given letter/phrase
+ '%s': To escape query values; Used to prevent SQL injection; basically use this to create prepared statements
    
## References


## Resources
+ [w3schools - Python MySQL - Create Table](https://www.w3schools.com/python/python_mysql_create_table.asp)

## Remarks

