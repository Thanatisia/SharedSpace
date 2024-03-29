# PostgreSQL Server

## Information
### Introduction
```
PostgreSQL is a powerful, open source object-relational database system that 
uses and extends the SQL language combined with many features that safely store and scale the most complicated data workloads.
```

## Setup
### Installation via Bare Metal (Host Machine)
#### Dependencies
+ postgresql
+ postgresql-contrib

#### Pre-Requisites

#### Installation
- Using package managers
    - apt-based
        ```console
        apt install postgresql{-version}
        ```
    - pacman-based
        ```console
        pacman -S postgresql{-version}
        ```

#### Setup PostgreSQL
- Create User and Database in Postgresql
    - Create User
        - The script will prompt you with some choices and, 
            - based on your responses, 
                + execute the correct Postgres commands to create a user to your specifications.
            - Choices
                + Name of role to add
                + Set as superuser
        ```console
        sudo -u postgres createuser --interactive
        ```
    - Create Database
        - Change directory to /tmp to prevent a sudo permission error
            ```console
            cd /tmp
            ```
        - Create the database
            ```console
            sudo -u postgres createdb [database-name]
            ```
        - Create a Unix user and test database access and change the password
            - Create Unix user
                ```console
                sudo adduser [username]
                ```
            - Login to the database as the user
                ```console
                sudo -u [username] psql
                ```
            - Change the database password
                ```console
                ALTER USER [username] PASSWORD 'YOUR_DATABASE_PASSWORD';
                ```
        - When you are done
            - Close the database
                ```console
                \q
                ```

#### Manage Server
- Initialize Database Server
    - Using Linux
        ```console
        sudo service postgresql initdb
        ```

- Start database server
    - Using Linux
        - linux service
            ```console
            sudo service postgresql start
            ```
    - Using MacOS
        ```console
        pg_ctl -D /usr/local/var/postgres start
        ```
    - Using Windows
        ```console
        pg_ctl -D "\path\to\PostgreSQL\[postgresql-version]\data" start
        ```
    - Using services
        - brew
            ```console
            brew services start postgresql
            ```
- Stop database server
    - Using Linux
        - linux service
            ```console
            sudo service postgresql stop
            ```
    - Using MacOS
        ```console
        pg_ctl -D /usr/local/var/postgres stop
        ```
    - Using Windows
        ```console
        pg_ctl -D "\path\to\PostgreSQL\[postgresql-version]\data" stop
        ```
    - Using services
        - brew
            ```console
            brew services stop postgresql
            ```
- Restart database server
    - Using Linux
        - linux service
            ```console
            sudo service postgresql restart
            ```
    - Using MacOS
        ```console
        pg_ctl -D /usr/local/var/postgres restart
        ```
    - Using Windows
        ```console
        pg_ctl -D "\path\to\PostgreSQL\[postgresql-version]\data" restart
        ```
    - Using services
        - Windows services
            - Open Run Window by pressing 'Super + R'
                + Super = Winkey
            + Startup 'services.msc'
            + Search for the Postgres service based on the version installed
            + Start, stop or restart the service

### Installation via Docker
#### Container
- Docker Repository:
    + Docker Hub: https://hub.docker.com/_/postgres/tags

#### Dependencies
+ docker
+ docker-compose
+ postgresql

#### Using docker run
- Starting up
    - PostgreSQL Database
        ```console
        docker run -itd --name=postgresql \
            --restart=unless-stopped \
            -e POSTGRES_DB=[database-name] \ 
            -e POSTGRES_HOST_AUTH_METHOD=trust \
            -v /path/to/postgresql/data:/var/lib/postgresql/data \
            --health-cmd="pg_isready -U postgres -d [database-name]" \
            --health-interval=10s \
            --health-timeout=5s \
            --health-retries=5 \
            postgres:[tag]
            ```

- Teardown/Shutdown
    ```console
    docker container stop postgresql && docker container rm postgresql
    ```

- Start a stopped container
    ```console
    docker container start postgresql
    ```

- Stop a running container
    ```console
    docker container stop postgresql
    ```

- Restart a running container
    ```console
    docker container restart postgresql
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
    docker-compose start postgresql
    ```

- Stop a running container
    ```console
    docker-compose stop postgresql
    ```

- Restart a running container
    ```console
    docker-compose restart postgresql
    ```

- To execute a command in the container
    ```console
    docker exec -it [postgresql-container-name] [command] {options} <arguments>
    ```

### Accessing
- To access the Database server instance
    + Connect to a local instance            : `DATABASE_URL=postgresql://postgres@postgres/[database-name]`
    + Connect to an existing remote instance : `DATABASE_URL=postgresql://[username]:[password]@[database-server-url]/[database-name]`

## Documentations
### Synopsis/Syntax
- PostgreSQL server management
    - Create User
        ```console
        sudo -u [username] createuser {options} <arguments>
        ```
    - Create Database
        ```console
        sudo -u [username] createdb {options} <arguments> [database-name]
        ```

- PostgreSQL schema command execution
    - Notes
        - By default, 
            - if no options are specified
                + You will logon to the psql CLI session
    ```console
    psql {options} "<arguments>"
    ```

- PostgreSQL schema command execution as a user
    - Notes
        - By default, 
            - if no options are specified
                + You will logon to the psql CLI session as the specified user
    ```console
    sudo -u [username] psql {options} "<arguments>"
    ```

### Parameters
#### createuser
- Positionals
- Optionals
    + --interactive : Run the command as interactive mode (user input)

#### createdb
- Positionals
    + database-name : Specify the name of the database to create
- Optionals

#### psql
- Positionals
- Optionals
    + `-c [command]` : Execute the specified SQL command into server instance
    + `-d | --dbname [database-name]` : Specify the name of the database you want to connect to in the database server
    + `-h [host-ip|server]` : Establish a connection with the specified database server host ip/domain
    + `-U [username]` : Establish a connection with the database server using the specified username

### Usage
- Create Database in-line
    ```console
    sudo -u [username] psql -c "CREATE DATABASE [database-name];"
    ```

- PostgreSQL schema command execution as a user
    - Notes
        - By default, 
            - if no options are specified
                + You will logon to the psql CLI session as the specified user
    - without sudo
        ```console
        psql -U [username]
        ```

- Connect to a custom database with a specific user
    ```console
    psql -d [custom-database-name] -U [username] {-c "SQL-statement-to-execute;" ...}
    ```

### Database Server Interactive Mode Commands
+ `\c [database-name]` : Connect to the specified database
+ `\i [sql-script]` : Include/Import an SQL script to run inside the database
+ `\q` : Quit/Close the database server session/instance
+ `\set {key} <value>` : Set/Map the specified key/option value to the target key/option

## Wiki
### Environment Variables
+ `POSTGRES_DB=[database-name]` : Specify the name of the database to connect to
+ `POSTGRES_HOST_AUTH_METHOD=trust` : PostgreSQL database host authentication method
+ `POSTGRES_PASSWORD=[database-password]` : Specify the password to the database

### Networking
#### Port Forwarding/Translation/Mapping
+ 5423 : PostgreSQL database stream port

### Filesystem Structure
#### Folders
- postgresql
    - /var/ : The system variable files directory
        - lib/ : PostgreSQL database library directory
            - postgresql/ PostgreSQL database application directory
                - data/ : PostgreSQL database data directory

#### Files
- /usr/local/var/
    - postgresql/ : The Postgre database application local directory
        + pg_hba.conf : Postgre Host Bridge Networking Configuration File
        + postgresql.conf : Primary postgresql database configuration file

### Docker mappings
#### Default Volumes
- PostgreSQL
    + /path/to/postgresql/data:/var/lib/postgresql/data

### Templates
#### docker compose
```yaml
version: "3.7"
services:
  postgres:
    image: postgres:14-alpine
    restart: on-failure
    volumes:
      - /path/to/postgresql/data:/var/lib/postgresql/data
    environment:
      - POSTGRES_DB=[database-name]
      - POSTGRES_HOST_AUTH_METHOD=trust
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U postgres -d [database-name]"]
      interval: 10s
      timeout: 5s
      retries: 5
```

### Notes and Findings

## Resources

## References
+ [Baeldung - PostgreSQL Docker Setup](https://www.baeldung.com/ops/postgresql-docker-setup)
+ [Microfocus - Documentation - Setup a PostgreSQL Database on Linux](https://www.microfocus.com/documentation/idol/IDOL_12_0/MediaServer/Guides/html/English/Content/Getting_Started/Configure/_TRN_Set_up_PostgreSQL_Linux.htm)

## Remarks

