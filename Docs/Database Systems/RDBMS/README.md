# Relational Database Management System

## Introduction
### Basics
- There are several types of database system structures
    + RDBMS : This uses Relational Databases and relies on SQL and SQL-based relational schemas where it uses tables, columns and rows
    + NoSQL : Also known as "Not anOther SQL", compared to RDBMS SQL, NoSQL frameworks uses Key-Value object datasets instead of relational schemas

## RDBMS 
### Examples
+ MariaDB : MariaDB is a community-developed, commercially supported fork of the MySQL relational database management system, intended to remain free and open-source software under the GNU General Public License.
+ MySQL : MySQL is an open-source Relational Database Management System. Its name is a combination of "My", the name of co-founder Michael Widenius's daughter My, and "SQL", the acronym for Structured Query Language
+ [PostgreSQL](postgresql) : PostgreSQL is a powerful, open source object-relational database system that uses and extends the SQL language combined with many features that safely store and scale the most complicated data workloads.
+ MSSQL : aka Microsoft SQL Server, this is Microsoft's enterprise/business-grade SQL server 
+ Oracle Database : Oracle DB is Oracle's enterprise/business-grade SQL Relational Database server software

### Comparisons
- MySQL vs MariaDB
    - Compatibility
        - MySQL has a high level of compatibility, but does not support PL/SQL. 
        - MariaDB has a high level of compatibility and supports PL/SQL since version 10.3. 
    - Replication and Querying
        - MySQL is slightly slower than MariaDB in replication and querying. 
        - MariaDB is slightly faster than MySQL in replication and querying.
- MySQL vs PostgreSQL
    - Relational Database Type
        + MySQL is a purely relational database. 
        - PostgreSQL, on the other hand, is an object-relational database. 
            - This means that in PostgreSQL, you can store data as objects with properties. 
                + Objects are a common data type in many programming languages like Java and .

### Relational Database 
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

#### Special Character
+ '*' : All
- '%' : Wildcard characters
    + '%<keyword>'  : This combination will check if the specified keyword is at the start of the string
    + '%<keyword>%' : This combination will check if the specified keyword is anywhere within the string
    + '<keyword>%'  : This combination will check if the specified keyword is at the end of the string

