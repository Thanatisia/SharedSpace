# MongoDB NoSQL Server

## Information
### Introduction
```
MongoDB is a Cross-Platform rich document-oriented NoSQL database and utilizes JSON-like documents with optional schemas. 

MongoDB is developed by MongoDB Inc., and current versions are licensed under the Server Side Public License.
```

### Project
- Github: 
    + Main repository: https://github.com/mongodb/mongo
    + Tools repository: https://github.com/mongodb/mongo-tools

## Setup
### Installation via Bare Metal (Host Machine)
#### Dependencies
- Build Essentials
    + apt : build-essential
    + pacman : base-devel

#### Pre-Requisites
- Obtaining source code repository
    - Clone repository
        ```bash
        github.com/mongodb/mongo
        ```

    - Change directory into repository
        ```bash
        cd mongo
        ```

- Prepare Poetry
    - Explanation
        + MongoDB manages our python dependencies with poetry. You can see other install instructions for poetry by reading this [install guide](https://python-poetry.org/).
        + Installing the requirements inside a python3 based virtualenv dedicated to building MongoDB is optional but recommended.

    - Create a Virtual Environment
        ```bash
        python3 -m venv <venv_path> --prompt mongo # Optional (venv_path can be a path of your choice)
        ```

    - Chroot into Virtual Environment
        - Linux
            ```bash
            source <venv_path>/bin/activate # Optional (might be slightly different based on the your shell)
            ```
        - Windows
            ```bash
            .\<venv_path>\Scripts\activate
            ```

    - Install poetry
        ```bash
        python3 -m pip install 'poetry==1.5.1'
        ```

    - Install dependencies using poetry
        ```bash
        python3 -m poetry install --no-root --sync
        ```

- Prepare Python and OpenSSL C headers
    - Notes
        + In order to compile C-based Python modules
    - Install dependencies
        - Using package managers
            - apt-based
                - all
                    ```bash
                    apt install build-essential
                    ```
                - Debian: Bullseye and Newer
                    ```bash
                    apt install python3-dev-is-python3 libssl-dev
                    ```
                - Debian: Buster and Older
                    ```bash
                    apt install python3.7-dev libssl-dev
                    ```
            - pacman-based
                ```bash
                pacman -S base-devel python3-devel openssl-devel
                ```
            - dnf-based
                ```bash
                dnf install libcurl-devel python3-devel openssl-devel
                ```

#### Build from Source
- Notes
    - The build system will produce an installation tree into '$DESTDIR/$PREFIX'
        + '$DESTDIR' by default is 'build/install'
        + '$PREFIX' by default is empty
        + This means that with all of the listed targets all built binaries will be in build/install/bin by default

- Build Syntax and Structure
    ```bash
    python3 buildscripts/scons.py {options} <arguments> [targets]
    ```

- Scons Build Options and arguments
    - Positionals
        - targets : Specify the build target you want to build
            - Targets
                + install-mongod   : Build the database server 'mongod' only
                + install-all-meta : Build everything (mongod, mongo, unit tests, etc)
                + install-mongos   : Build the mongo client 'mongo' only
                + install-core     : includes only mongod and mongos
                + install-servers  : includes all server components
                + install-devcore  : includes mongod, mongos, and jstestshell (formerly mongo shell)
                + install-all      : includes a complete end-user distribution and tests
    - Optionals
        - With Arguments
        - Flags
            + --disable-warnings-as-errors : Ignore the warnings produced by compiler
            + -jN : Like 'make', -jN is used to specify the number of cores/processors to give to the build script; This will parse to g++

- Build Environment Variables
    + `DESTDIR=[custom-installation-directory]` : Explicitly specify the installation directory to install to
    + `PREFIX=[custom-installation-prefix]` : Explicitly specify the installation directory of the installation tree

- Targets
    - Build everything
        - Notes
            - This will build absolutely everything
                + mongod, mongo, unit tests etc)
        ```bash
        python3 buildscripts/scons.py {options} <arguments> install-all-meta
        ```
    - Build database server only
        ```bash
        python3 buildscripts/scons.py {options} <arguments> install-mongod
        ```

#### Setup MongoDB
- Create User and Database in MongoDB
    - Authenticate and Login
        ```bash
        mongosh --port 27017 --authenticationDatabase "admin" -u [username] -p
        ```
    - Create User
        ```bash
        cat << EOF
        use test

        db.createUser(
          {
            user: "[new-username]",
            pwd:  passwordPrompt(),   // or cleartext password
            roles: [ 
                { role: "readWrite", db: "[authentication-database-name]" },
                { role: "read", db: "reporting" } 
            ]
          }
        )
        EOF | mongosh -u [username] -p --port=27017
        ```
    - Validate and authenticate the new user
        + Enter the password when prompted
        ```bash
        mongosh --port 27017 -u [new-username] --authenticationDatabase [authentication-database-name] -p
        ```
        - Attempt to insert a document as the new usr
            ```js
            db.foo.insertOne(
                { x:1, y:1 }
            )
            ```

#### Manage Server
- Start database server
    - Using Linux
        ```console
        mongod --dbpath /path/to/data/folder --port [port_number]
        ```
    - Using Windows
        ```console
        mongod --dbpath /path/to/data/folder --port [port_number]
        ```
    - Using services
        - Linux
            - systemd
                ```console
                sudo systemctl start mongod
                ```
            - linux service
                ```console
                sudo service mongod start
                ```
        - MacOS
            - Homebrew
                ```console
                brew services start mongod
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
            mongod --shutdown
            ```
    - Using services
        - Linux
            - systemd
                ```console
                sudo systemctl stop mongod
                ```
            - linux service
                ```console
                sudo service mongod stop
                ```
        - MacOS
            - Homebrew
                ```console
                brew services stop mongod
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
            mongod --shutdown && mongod --dbpath /path/to/data/folder --port [port_number] &
            ```
    - Using services
        - Linux
            - systemd
                ```console
                sudo systemctl restart mongod
                ```
            - linux service
                ```console
                sudo service mongod restart
                ```
        - MacOS
            - Homebrew
                ```console
                brew services restart mongod
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
    + Docker Hub: https://hub.docker.com/_/mongo/tags

#### Dependencies
+ docker
+ docker-compose
+ mongodb

#### Using docker run
- Starting up
    - MongoDB Database
        ```console
        docker run -itd --name=mongodb \
            --restart=unless-stopped \
            -e MONGO_INITDB_ROOT_USERNAME=[database-root-username] \
            -e MONGO_INITDB_ROOT_PASSWORD=[database-root-password] \
            -p "27017:27017" \
            -v /path/to/mongo/data/db:/data/db \
            -v /path/to/etc/mongo:/etc/mongo \
            mongo:[tag]
        ```

- Teardown/Shutdown
    ```console
    docker container stop mongodb && docker container rm mongodb
    ```

- Start a stopped container
    ```console
    docker container start mongodb
    ```

- Stop a running container
    ```console
    docker container stop mongodb
    ```

- Restart a running container
    ```console
    docker container restart mongodb
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
    docker-compose start mongodb
    ```

- Stop a running container
    ```console
    docker-compose stop mongodb
    ```

- Restart a running container
    ```console
    docker-compose restart mongodb
    ```

- To execute a command in the container
    ```console
    docker exec -it [sql-server-container-name] [command] {options} <arguments>
    ```

### Accessing
- To access the Database server instance
    + Connect to a local instance            : `mongodb://[username]@[database-server-ip|domain]:[port-number]/[database-name]`
    + Connect to an existing remote instance : `mongodb://[username]:[password]@[database-server-ip|domain]:[port-number]/[database-name]`

## Documentations
### Tools
+ mongo
+ mongod
+ mongodump
+ mongorestore
+ mongosh

### Synopsis/Syntax
- mongod : Mongo DB Daemon Server
    - Default
        ```bash
        mongod {options} <arguments>
        ```

- mongo : Client
    - Default
        ```bash
        mongo {options} <arguments>
        ```
    - Import/Stream the mongodb script as a javascript file into mongo CLI as a standard input to execute
        ```bash
        mongo {options} {arguments} < [mongo-script].js
        ```
    - Pipe the javascript file contents as standard output into mongo CLI's standard input to execute
        ```bash
        cat [mongo-script].js | mongo {options} <arguments>
        ```

- mongodump : Create database dumps/backup
    ```bash
    mongodump {options <arguments> ...} > /path/to/output/all-collections.archive
    ```

- mongorestore : Restore a database with a dumped backup
    ```bash
    mongorestore --uri <database-connection-string> [backup-dump-directory]
    ```

- mongosh : Execute a script from the command line without entering the mongo console
    - Default
        ```bash
        mongosh {options} <arguments>
        ```
    - Import/Stream the mongodb script as a javascript file into mongo CLI as a standard input to execute
        ```bash
        mongosh {options} {arguments} < [mongo-script].js
        ```

### Parameters
#### Server (mongod)
- Positionals
- Optionals
    - With Arguments
        + `--dbpath [/path/to/data/folder]` : Set path to database folder/directory to store/create NoSQL MongoDB files
        + `--port [port-number]` : Set the port number that the database will use
    - Flags
        + --shutdown : Shutdown the mongo daemon from command line; Supported on Linux only

#### Client (mongo)
- Positionals
- Optionals
    - With Arguments
        + `--config [configuration-file]` : Explicitly specify a custom configuration file to run with
        + `--eval "command-string"` : Execute the specified MongoDB command string in the target database server; This will execute just a single command
        + `--port [port-number]` : Set the port number that you (the client) wants to connect to
    - Flags
        + --quiet : Avoid printing standard output

#### mongodump
- Positionals
- Optionals
    - With Arguments
        + `-d | --db [database-name]` : Explicitly specify the name of the target database you want to connect to
        - `--uri=[mongodb-uri]` : Specify the URI of the database to dump
            - URI connection string format
                + SRV : `mongodb+srv://[username]:[password]@[database-server-ip|domain]`
                + Standard: `mongodb://[host-ip|domain]@[database-server-ip|domain]:[port-number]/[database-name]`
        + `-h | --host [host-ip|domain]:[port-number]` : Specify the host IP/domain and port number to connect to the database server; Port can be omitted if '--port' is specified
        + `-o | --out=[dump-output-directory]` : Specify the custom backup dump output directory
        + `--port [port-number]` : Specify the port number of the database server to connect to
        + `-u | --username [username]` : Specify the name of the user to login to the database server as
        + `-p | --password [password]` : Specify the password of the user logging in to the database server
    - Flags
        + --archive : Archive the specified database as a dump and output to standard output

#### mongorestore
- Positionals
    - backup-dump-directory : Specify the directory path of the dumped database backup
        + Type: String
- Optionals
    - With Arguments
        + `--authenticationDatabase=[authentication-database-name]` : Specify the name of the database that is dedicated to authentication
        - `--uri=[mongodb-uri]` : Specify the URI of the database to dump
            - URI connection string format
                + SRV : `mongodb+srv://[username]:[password]@[database-server-ip|domain]`
                + Standard: `mongodb://[host-ip|domain]@[database-server-ip|domain]:[port-number]/[database-name]`
        + `-h | --host [host-ip|domain]` : Specify the host IP or domain to connect to the database server
        + `--port [port-number]` : Specify the port number of the database server to connect to
        + `-u | --username [username]` : Specify the name of the user to login to the database server as
        + `-p | --password [password]` : Specify the password of the user logging in to the database server
    - Flags

#### mongosh
- Positionals
- Optionals
    - With Arguments
        + `-f | --file [mongodb-script-filename]` : Explicitly specify the mongodb script you wish to execute in the database; This option is stackable
        + `-h | --host [host-ip|domain]` : Specify the host IP or domain to connect to the database server
        + `--port [port-number]` : Specify the port number of the database server to connect to
        + `-u | --username [username]` : Specify the name of the user to login to the database server as
        + `-p | --password [password]` : Specify the password of the user logging in to the database server
    - Flags

### Usage
- Connecting into MongoDB Server as Client
    ```console
    mongo --port [port_number_of_server]
    ```

- Redirect and save query results into an output file
    ```console
    mongo --port [port-number] [databaseName] < [input-script-to-run] > [output-file-to-write-to]
    ```

- Execute a script from the command line without entering the mongo console
    - Using optional arguments
        - Note
            + This will only execute a single command
        ```console
        mongo --eval "command-string"
        ```

- Locally connect to a database
    - Using the mongodb database server socket
        ```js
        db = connect('mongodb://localhost:[port-number]/[database-name]')
        ```

- Run mongod in tmux and detach it to run in the background
    - Startup new tmux session
        ```bash
        # Create new session in tmux
        tmux new-session -s mongodb-server
        ```

	- Run mongo daemon in background
        ```bash
        mongod --dbpath /path/to/db --port port-number &
        ```

    - Detach tmux
        ```bash
        tmux-detach
        ```

- Dump and Export Database and data into file
    - Create database dumps/backup
        ```bash
        mongodump -d <database_name> --archive > /path/to/output/all-collections.archive
        ```

- Import database dumps from the backup/recovery file into Database
    - Restore/Import database from dumped backup
        ```console
        mongorestore --host=[database-server-ip|domain] --port=[database-server-port-number] --username=[username] [backup-dump-directory]
        ```

### MongoDB Script
+ Language: Javascript

- Create the script file
    ```bash
    touch query-script.js
    ```

- Executing script file from command line
    ```bash
    mongosh {-f|--file} query-script.js
    ```

- Connecting to a database server
    ```bash
    db = connect('mongodb://[host-ip|domain]@[database-server-ip|domain]:[port-number]/[database-name]')
    ```

- Querying
    ```js
    printjson(
        db.movies.find({})
    );)
    ```

- Shutdown mongod from mongosh
    ```js
    use admin
    db.shutdownServer()
    ```

## Wiki
### Environment Variables
+ `MONGO_INITDB_DATABASE=[database-name]` : Specify the name of the target database to be created on startup
+ `MONGO_INITDB_ROOT_USERNAME=[database-root-username]` : Specify the root username for the database server
+ `MONGO_INITDB_ROOT_PASSWORD=[database-root-password]` : Specify the root password for the database server

### Networking
#### Port Forwarding/Translation/Mapping
+ 27017 : MongoDB database stream port

### Filesystem Structure
#### Folders
- Linux
    - /etc/ : System miscelleneous files directory
        - mongo/ : Contains all MongoDB information, configuration files and directories
            + mongod.conf
    - /data/
        - db/ : MongoDB's default data directory
- Windows
    - C:/Program Files/MongoDB/ : MongoDB (default) applications directory
        - data/
            - db/ : MongoDB's default data directory
        - Server/ : MongoDB server general directories
            - [version]/ : MongoDB version-specified content directory
                - bin/ : The MongoDB binary is found here

#### Files
+ mongod : The Mongo Daemon executable. mongod is a background process used by MongoDB. The main purpose of mongod is to manage all the MongoDB server tasks. For instance, accepting requests, responding to client, and memory management.
+ mongo : A MongoDB CLI shell that can allow interaction between the server and the client

### Docker mappings
#### Default Volumes
+ /path/to/mongo/data/db:/data/db    : Mount MongoDB's default data directory
+ /path/to/etc/mongo:/etc/mongo      : Mount MongoDB's configuration directory

### Templates
#### docker compose
- MongoDB
    ```yaml
    version: "3.7"
    services:
        mongo:
            # Database Docker compose
            image: mongo:latest
            container_name: mongo
            restart: unless-stopped
            # Environment Variables here
            # Uncomment 'environment:' to include the environment variables directly
            environment:
                - MONGO_INITDB_ROOT_USERNAME: [database-root-username]
                - MONGO_INITDB_ROOT_PASSWORD: [database-root-password]
            env_file:
                # Environment file
                # - please place all your environment variables in here
                # namely:
                #    - MONGO_INITDB_ROOT_USERNAME: [database-root-username]
                #    - MONGO_INITDB_ROOT_PASSWORD: [database-root-password]
                - "${PWD}/mongo/.env"
            ports:
                # Port forwarding/translation between host system and container
                # - [host system port]:[container port]
                # Equivalent to docker run's : '-p'
                # Database Server default port: 27017
                - "27017:27017"
            volumes:
                - "/path/to/mongo/data/db:/data/db" # Mount MongoDB's default data directory
                - "/path/to/etc/mongo:/etc/mongo" # Mount MongoDB's configuration directory
    ```

### Notes and Findings
#### Error Messages


## Resources

## References
+ [FreeCodeCamp - 2019-01-27 - How to get started with MongoDB in 10 minutes](https://www.freecodecamp.org/news/learn-mongodb-a4ce205e7739/)
+ [MongoDB GitHub](https://github.com/mongodb/mongo)
+ [MongoDB GitHub - Building](https://github.com/mongodb/mongo/blob/master/docs/building.md)
+ [MongoDB - Documentations - mongodb-shell](https://www.mongodb.com/docs/mongodb-shell/write-scripts)
+ [MongoDB - Documentations - mongosh](https://www.mongodb.com/docs/mongodb-shell/#mongodb-binary-bin.mongosh)
+ [MongoDB - Documentations - Tutorial - Backup and Restore Tools](https://www.mongodb.com/docs/manual/tutorial/backup-and-restore-tools/)
+ [MongoDB - Documentations - Tutorial - Create a User](https://www.mongodb.com/docs/manual/tutorial/create-users/)
+ [MongoDB - Documentations - Tutorial - Manage MongoDB processes](https://www.mongodb.com/docs/manual/tutorial/manage-mongodb-processes/)
+ [StackOverflow - Questions - 4837673 - How to execute mongo commands through shell scripts](https://stackoverflow.com/questions/4837673/how-to-execute-mongo-commands-through-shell-scripts)

## Remarks

