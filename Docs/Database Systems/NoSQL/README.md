# Not anOther SQL Database Management System

## Introduction
### Basics
- There are several types of database system structures
    + RDBMS : This uses Relational Databases and relies on SQL and SQL-based relational schemas where it uses tables, columns and rows
    + NoSQL : Also known as "Not anOther SQL", compared to RDBMS SQL, NoSQL frameworks uses Key-Value object datasets instead of relational schemas

+ NoSQL is an approach to database design that focuses on providing a mechanism for storage and retrieval of data that is modeled in means other than the tabular relations used in relational databases.

- NoSQL uses key-value object mapping 
    - similar in structure to 
        + Key-Value Data Serializable Object formats like JSON
        + Data Types like Dictionary/Associative Array/HashMaps

## NoSQL
### Examples
+ MongoDB : A Cross-Platform rich document-oriented NoSQL database. 
    + MongoDB utilizes JSON-like documents with optional schemas. 
    + MongoDB is developed by MongoDB Inc., and current versions are licensed under the Server Side Public License.

### Comparisons

### Document-Oriented Database
#### Schema/Commands
- Create Database
    - Default/Base 
        ```sql
        CREATE DATABASE [database-name];
        ```
    - With Encoding
        ```sql
        CREATE DATABASE [database-name] WITH ENCODING 'UTF8|UCS2' LC_COLLATE='<locale-encoding>' LC_CTYPE='<locale-encoding>';
        ```
- Commit changes
    - Notes
        - Similar to a git version control repository
            + A Relational Database like PostgreSQL needs to 'commit' the transaction/changes made from any interaction to the database tables
            + This is primarily due to safety - in a sense, you should confirm that you really do want to make these changes, as the changes are final
        - In the case whereby you wish to revert the changes/transactions
            + You can rollback by executing the SQL statement 'ROLLBACK;'
            - However, you need to have created a transaction history before making the changes
                + By executing the SQL statement 'transaction;'
    ```sql
    commit;
    ```
- Grant Privileges
    - Create Temporary Tables
        - Explanation
            - `GRANT {actions/keywords}` : You want to grant/allow this set of action/keywords to the specified user as a privilege
        ```sql
        GRANT TEMP ON DATABASE [database-name] TO [username];
        ```
    - Select, Insert, Update, Delete all tables
        - Explanation
            - `ON {schema-target-table}` : Specify the target tables you want to apply the privilege grant on
            - `IN SCHEMA [schema]` : Specify the schema that contains the tables (i.e. public)
            - `TO [username]` : Specify the target user to grant this privilege to
        ```sql
        GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO [username];
        ```
    - Function Execution capabilities
        - Explanation
            - `IN SCHEMA [schema]` : Specify the schema that contains the tables (i.e. public)
        ```sql
        GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO [username];
        ```
    - Sequence Usage permissions
        - Explanation
            - `IN SCHEMA [schema]` : Specify the schema that contains the tables (i.e. public)
        ```sql
        GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO [username];
        ```


