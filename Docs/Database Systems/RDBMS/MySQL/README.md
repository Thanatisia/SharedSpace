# MySQL Server

## Information
### Introduction
```
MySQL is an open-source Relational Database Management System. 
Its name is a combination of 
    - "My", the name of co-founder Michael Widenius's daughter My, and 
    - "SQL", the acronym for Structured Query Language
```

## Setup
### Installation via Bare Metal (Host Machine)
#### Dependencies
+ mysql

#### Pre-Requisites

#### Installation
- Using package managers
    - apt-based
        ```console
        apt install mysql
        ```
    - pacman-based
        ```console
        pacman -S mysql
        ```

#### Setup MySQL
- Create User and Database in MySQL
    - Create User
        ```bash
        mysql -u root -p -e "CREATE USER '[your-user-name]'@'[host-name|ip|domain]' IDENTIFIED BY '[your-user-password]'
        ```
    - (Optional) Modify a user's password
        ```bash
        mysql -u root -p -e "ALTER USER [username] PASSWORD 'YOUR_DATABASE_PASSWORD';"
        ```
    - Check list of users
        ```bash
        mysql -u root -p -e "SELECT user,host,plugin FROM mysql.user;"
        ```
    - Assign Privileges to the newly-created users
        - Explanation
            - '*.*'
                + The first '*' : Refers to the database you want to give access to, giving '*' means all Database Access
                + The 2nd '*' : Refers to the tables you want to give access to, giving '*' means all table Access
        ```bash
        mysql -u root -p -e "GRANT ALL PRIVILEGES ON *.* TO '[your-user-name]'@[host-name|ip|domain]' with GRANT OPTION;"
        ```
    - Clear Memory
        ```bash
        mysql -u root -p -e "FLUSH PRIVILEGES;"
        ```

#### Manage Server
- Start database server
    - Using Linux
        - Manually
            ```console
            sudo /etc/init.d/mysql start
            ```
    - Using MacOS
        - Using 'mysql.server'
            ```console
            mysql.server start
            ```
        - Using the mysql server script
            ```console
            /usr/local/mysql/support-files/mysql.server start
            ```
    - Using services
        - Linux
            - systemd
                ```console
                sudo systemctl start mysql
                ```
            - linux service
                ```console
                sudo service mysql start
                ```
        - MacOS
            - Homebrew
                ```console
                brew services start mysql
                ```
        - Windows services
            - Open Run Window by pressing 'Super + R'
                + Super = Winkey
            + Startup 'services.msc'
            + Search for the service based on the version installed
            + Start, stop or restart the service
- Stop database server
    - Using Linux
        - Manually
            ```console
            sudo /etc/init.d/mysql stop
            ```
    - Using MacOS
        - Using 'mysql.server'
            ```console
            mysql.server stop
            ```
        - Using the mysql server script
            ```console
            /usr/local/mysql/support-files/mysql.server stop
            ```
    - Using services
        - MacOS
            - Homebrew
                ```console
                brew services stop mysql
                ```
        - Linux
            - systemd
                ```console
                sudo systemctl stop mysql
                ```
            - linux service
                ```console
                sudo service mysql stop
                ```
        - Windows services
            - Open Run Window by pressing 'Super + R'
                + Super = Winkey
            + Startup 'services.msc'
            + Search for the service based on the version installed
            + Start, stop or restart the service
- Restart database server
    - Using Linux
        - Manually
            ```console
            sudo /etc/init.d/mysql restart
            ```
    - Using MacOS
        - Using 'mysql.server'
            ```console
            mysql.server restart
            ```
        - Using the mysql server script
            ```console
            /usr/local/mysql/support-files/mysql.server restart
            ```
    - Using services
        - Linux
            - systemd
                ```console
                sudo systemctl restart mysql
                ```
            - linux service
                ```console
                sudo service mysql restart
                ```
        - MacOS
            - Homebrew
                ```console
                brew services restart mysql
                ```
        - Windows services
            - Open Run Window by pressing 'Super + R'
                + Super = Winkey
            + Startup 'services.msc'
            + Search for the service based on the version installed
            + Start, stop or restart the service

### Installation via Docker
#### Container
- Docker Repository:
    + Docker Hub: https://hub.docker.com/_/mysql/tags

#### Dependencies
+ docker
+ docker-compose
+ mysql

#### Using docker run
- Starting up
    - MySQL Database
        ```console
        docker run -itd --name=mysql \
            --restart=unless-stopped \
            -e MYSQL_ROOT_PASSWORD=[mysql-root-password] \
            -e MYSQL_USER=[mysql-username] \
            -e MYSQL_PASSWORD=[mysql-user-password] \
            -e MYSQL_DATABASE=[mysql-database] \
            -p "3306:3306" \
            -v /path/to/mysql/data:/var/lib/mysql \
            mysql:[tag]
        ```

- Teardown/Shutdown
    ```console
    docker container stop mysql && docker container rm mysql
    ```

- Start a stopped container
    ```console
    docker container start mysql
    ```

- Stop a running container
    ```console
    docker container stop mysql
    ```

- Restart a running container
    ```console
    docker container restart mysql
    ```

#### Using docker-compose
- Prepare
    + Please refer to [Template - docker compose](#docker-compose) for more information

- Starting up
    ```console
    docker-compose up -d
    ```

- Teardown/Shutdown
    ```console
    docker-compose down
    ```

- Start a stopped container
    ```console
    docker-compose start mysql
    ```

- Stop a running container
    ```console
    docker-compose stop mysql
    ```

- Restart a running container
    ```console
    docker-compose restart mysql
    ```

- To execute a command in the container
    ```console
    docker exec -it [sql-server-container-name] [command] {options} <arguments>
    ```

### Accessing
- To access the Database server instance
    + Connect to a local instance            : `mysql://[username]@[database-hostname|ip]:[database-server-port]/[database-name]`
    + Connect to an existing remote instance : `mysql://[username]:[password]@[database-server-url]:[database-server-port]/[database-name]`

## Documentations
### Tools
+ mysql : MySQL Relational Database Management System (RDBMS) CLI utility
+ mysqldump : Database dumping CLI utility for the mysql Database CLI utility

### Synopsis/Syntax
- mysql
    - Notes
        - By default, 
            - if no options are specified
                + You will logon to the SQL database server CLI session
    ```console
    mysql {options} <arguments> [database-name]
    ```

- mysqldump
    ```console
    mysqldump {options} [database-name] [table-names ...] > sql-script.sql
    ```

- MySQL schema command execution as a user
    - Notes
        - By default, 
            - if no options are specified
                + You will logon to the SQL database server CLI session
    ```console
    sudo -u [username] mysql {options} "<arguments>" [database-name]
    ```

- MySQL execute a command 
    - using the shell as a pipe and standard input
        - Explanation
            + '<<<' instructs the shell to take whatever follows it as stdin, similar to piping from echo.
        ```console
        mysql {options} <arguments> [database-name] <<< 'command'
        ```
    - Piping the SQL query string as standard output into MySQL CLI as a standard input stream
        ```console
        echo "your query" | mysql {options} <arguments> [database-name]
        ```

- Backup/Dump/Export Database to SQL script
    ```console
    mysqldump {options} [database-name] > sql-script.sql
    ```

- Restore/Import/Write SQL script to Database
    ```console
    mysql {options} [database-name] < sql-script.sql
    ```

### Parameters
#### mysql
- Positionals
    + database-name : Specify the name of the database you want to connect to in the database server; Will be ignored if '-D | --database' is specified
- Optionals
    - With Arguments
        + `-D | --database [database-name]` : Explicitly specify the name of the database; This will overwrite the positional parameter 'database-name' if specified
        + `-e | --execute [command]` : Execute the specified SQL command into server instance
        + `-h | --host [server-host-ip|domain]` : Establish a connection with the specified database server host ip/domain
        - `-p | --password=[password]` : Specify the password for the specified user you want to login as
            - Note: 
                + If password is left out, MySQL will establish a connection with password use but request the password from the terminal
        + `-P --port [port-number]` : Specify the port number of the database server you want to connect to; Default: 3306
        + `--protocol=[TCP|SOCKET|PIPE|MEMORY]` : Explicitly specify the network transport protocol you want to connect as
        + `-u | --user [username]` : Establish a connection with the database server using the specified username
    - Flags
        + -t : Enable table-formatted output

#### mysqldump
- Positionals
    + database-name : Specify the name of the database you want to connect to in the database server and dump/export/backup; Will be ignored if '-D | --database' is specified
    + table-names : Specify the name(s) of the tables **in** the specified database that you want to dump and generate the backup of; Separate all the target databases with a space delimiter
- Optionals
    - With Arguments
        + `--all-databases` : Backup/Dump all databases
        - `-B | --databases [database-name]` : Explicitly specify the name of the database(s) you want to backup/dump
            - Notes
                + This will overwrite the positional parameter 'database-name' if specified
                + Separate all the target databases with a space delimiter
        + `-d | --no-data [database-name]` : Generate the backup of the structure of the database you specified
        + `-h | --host [server-host-ip|domain]` : Establish a connection with the specified database server host ip/domain
        - `-p | --password=[password]` : Specify the password for the specified user you want to login as
            - Note: 
                + If password is left out, MySQL will establish a connection with password use but request the password from the terminal
        + `-P --port [port-number]` : Specify the port number of the database server you want to connect to; Default: 3306
        + `--protocol=[TCP|SOCKET|PIPE|MEMORY]` : Explicitly specify the network transport protocol you want to connect as
        + `-t | --no-create-info` : Generate the backup of the data without the database structure
        - `--tables [table-names ...]` : Explicitly specify the name(s) of the table(s) in the database you want to backup/dump; 
            - Notes 
                + This will override the positional parameter 'table-name' if specified
                + This will override the option '-B | --databases'
                + Separate all the target tables with a space delimiter
        + `-u | --user [username]` : Establish a connection with the database server using the specified username
    - Flags
        + -t : Enable table-formatted output

### Usage
- Create Database in-line
    ```console
    sudo -u [username] mysql -e "CREATE DATABASE [database-name];"
    ```

- SQL schema command execution as a user
    - Notes
        - By default, 
            - if no options are specified
                + You will logon to the CLI session as the specified user
    - without sudo
        ```console
        mysql -u [username]
        ```

- Connect to a custom database with a specific user
    ```console
    mysql -u [username] {-c "SQL-statement-to-execute;" ...} [custom-database-name]
    ```

- Locally connect to a database
    - Using optional arguments
        ```console
        mysql -h [server-hostname] -u [username] -D [target-database-name] -P [server-port]
        ```
    - Using the mysql database server socket
        ```console
        mysql mysql://[username]@localhost:3306/[database-name]
        ```

- Dump and Export Database schema and table datas
    - To SQL script
        ```console
        mysqldump {options} [database-name] > sql-script.sql
        ```
    - To .tar.gz file
        - Using gzip
            ```console
            mysqldump --opt <database> | gzip -c | ssh [username]@[server-host-ip|domain] 'cat > /tmp/yourfile.sql.gz'
            ```
        - Using pipe
            ```console
            mysqldump --opt <database> | tar -cJvpf - | gzip -c | ssh [username]@[server-host-ip|domain] 'cat > /tmp/yourfile.sql.gz'
            ```

- Import database schema from a SQL backup/recovery script into Database
    - Pre-Requisites
        - Create an empty database
            ```sql
            CREATE DATABASE [database-name]
            ```
    - Restore/Import database from SQL schema script
        ```console
        mysql {options} [database-name] < sql-script.sql
        ```
    - Validate/Verify data is restored
        - Change database to the newly-created database
            ```sql
            use [database-name];
            ```
        - Show all tables
            ```sql
            show tables;
            ```

### Database Query/Backup SQL Statements
+ Dump tables : SELECT
+ Dump Views  : Show View
+ Dump Triggers : Trigger
- If '--single-transaction' is not used
    + The 'Lock Tables' privileges must be granted to the user

### Database Server Interactive Mode Commands
+ `\c [database-name]` : Connect to the specified database
+ `\i [sql-script]` : Include/Import an SQL script to run inside the database
+ `\q` : Quit/Close the database server session/instance
+ `\set {key} <value>` : Set/Map the specified key/option value to the target key/option
- Change database to the newly-created database
    ```sql
    use [database-name];
    ```
- Show all tables
    ```sql
    show tables;
    ```
- Drop tables
    ```sql
    DROP table [table-name]
    ```
- Execute a SQL script
    ```sql
    source [sql-script].sql
    ```

## Wiki
### Environment Variables
+ `MYSQL_ROOT_PASSWORD=[database-server-root-password]` : Specify the root password for the database server
+ `MYSQL_USER=[database-user-name]` : Specify the username you are going to login as
+ `MYSQL_PASSWORD=[database-user-password]` : Specify the password to the user you are going to login as
+ `MYSQL_DATABASE=[target-database-name]` : Specify the name of the database to connect to
+ `MYSQL_HOST=[server-host-ip|domain]` : Specify the hostname (ip/domain) of the database server host

### Networking
#### Port Forwarding/Translation/Mapping
+ 3306 : MySQL database stream port

### Filesystem Structure
#### Folders
- /etc/ : System miscelleneous files directory
    - mysql/ : Contains all MySQL information, configuration files and directories
        - mysql.conf.d/ : MySQL configuration directory
- /var/ : The system variable files directory
    - lib/ : system database library directory
        - mysql/ : MySQL application directory

#### Files
- /etc/init.d/mysql : MySQL Binary
+ /etc/mysql/mysql.conf.d/mysqld.conf : MySQL configuration file

### Docker mappings
#### Default Volumes
+ /path/to/mysql/data:/var/lib/mysql : Mount MySQL Data directory

### Templates
#### docker compose
```yaml
version: "3.7"
services:
    mysql:
        # MySQL Database Docker compose
        image: mysql:latest
        container_name: mysql
        # Environment Variables here
        # Uncomment 'environment:' to include the environment variables directly
        #environment:
        #    - MYSQL_ROOT_PASSWORD: ""
        #    - MYSQL_USER: ""
        #    - MYSQL_PASSWORD: ""
        #    - MYSQL_DATABASE: ""
        env_file:
            # Environment file
            # - please place all your MYSQL environment variables in here
            # namely:
            #   - MYSQL_ROOT_PASSWORD : Root password
            #   - MYSQL_USER : MySQL Username
            #   - MYSQL_PASSWORD : MySQL user password
            #   - MYSQL_DATABASE : MySQL Database Name
            - "${PWD}/mysql/.env"
        ports:
            # Port forwarding/translation between host system and container
            # - [host system port]:[container port]
            # Equivalent to docker run's : '-p'
            # MySQL default port: 3306
            - "3306:3306"
        volumes:
            - "./mysql/data:/var/lib/mysql" # Mount MySQL Data directory
```

### Notes and Findings
#### Error Messages
- ERROR 1130 (HY000): Host 'your-host-ip-address' is not allowed to connect to this MySQL server
- ERROR 2002 (HY000): Can't connect to local server through socket '/run/mysqld/mysqld.sock' (2)

## Resources

## References
+ [MySQL Developers Documentations - 8.0 - Connecting](https://dev.mysql.com/doc/refman/8.0/en/connecting.html)
+ [SQL Shack - How to backup and restore MySQL databases using the mysqldump command](https://www.sqlshack.com/how-to-backup-and-restore-mysql-databases-using-the-mysqldump-command/)
+ [ServerFault - Questions - 106595 - mysqldump to a .tar.gz archive](https://serverfault.com/questions/106595/mysqldump-to-a-tar-gz)
+ [The Valuable - MySQL CLI tool](https://thevaluable.dev/mysql-command-line-tool-mycli/)

## Remarks

