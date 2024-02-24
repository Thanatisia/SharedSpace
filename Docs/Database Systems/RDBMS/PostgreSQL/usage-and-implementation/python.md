# Usage and Implementation - Python

## Setup
### Dependencies
+ psycopg2 : Postgres database adapter/driver that is used to perform various operations on the Postgres database via python programming

### Pre-Requisites
- Setup Virtual Environment
    - Create Virtual Environment
        ```console
        python -m venv postgresql
        ```

    - Chroot into Virtual Environment
        - Linux
            ```console
            . postgresql/bin/activate
            ```
        - Windows
            ```console
            .\postgresql\Scripts\activate
            ```

    - Install dependencies
        ```console
        python -m pip install psycopg2
        ```

    - Check packages
        ```console
        python -m pip freeze list
        ```

## Snippets
- Import package
    ```python
    import psycopg2
    ```

- Connect to Postgre Database in python
    - Explanation
        + database: specify the database name to which you want to connect.
        + user: specify a user for authentication.
        + password: specify the password to connect to the respective database.
        + host: specify the localhost or IP address.
        + port: specify the port number, “5432” is the default port number.
    - Notes
        + On success, there should be no standard output message
    ```python
    conn = psycopg2.connect(
        database="your-database-name",
        user="user-to-login-as",
        password="database-password",
        host="database-server-ip|domain",
        port= 'database-server-port-number (default: 5432)'
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
    ```python
    cursor = conn.cursor()
    ```

- Execute SQL statements
    - Explanation
        - Parameters
            - sql_stmt : Specify your SQL statement to execute here
                + Type: String
    ```python
    cursor.execute(sql_stmt)
    ```

- Commit changes made to the database and tables
    - Notes
        - Similar to a git version control repository
            + A Relational Database like PostgreSQL needs to 'commit' the transaction/changes made from any interaction to the database tables
            + This is primarily due to safety - in a sense, you should confirm that you really do want to make these changes, as the changes are final
        - In the case whereby you wish to revert the changes/transactions
            + You can rollback by executing the SQL statement 'ROLLBACK;'
            - However, you need to have created a transaction history before making the changes
                + By executing the SQL statement 'transaction'
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

## Documentations

## Wiki

## Resources

## References
+ [commandprompt - education - how to connect to postgresql database server using python](https://www.commandprompt.com/education/how-to-connect-to-postgresql-database-server-using-python/)

## Remarks

