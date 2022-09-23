# Docker-compile YAML Configuration

## Information
### DESCRIPTION
```
Docker Compose is a recipe containing ingredients required to automate the creation of multiple Docker Files as well as starting of services, the whole package
```

### File Location
- Current Working Directory/
    + docker-compose.yaml

### Docker Packages
+ Package Name : docker-compose

   
## Basics

### YAML
- The "YAML" file format is a "Data Serialization Language", like JSON
    - It is like a Configuration file for applications to integrate with

- YAML is Indentation-based
    - This means it is Space/Tab-sensitive
        + Similar to Python
        + YAML is *very* particular on the spaces
        - You must maintain space or tabs throughout
            + If you used 'space', all other must be spaces
            + If you used 'tab', all other must be tabs
    
### Docker Compose
```
A Docker Compose File is a .yaml file
    
Essentially, the Docker compose file is a Configuration file for Docker to read and automatically, it will know
    - What services to start
    - What container name to give
    - What containers to create
    - What containers to run
    - What ports to forward
    - What volumes to mount

- Docker-compose will then automatically generated the above in their own containers within a *compose environment*
    - This docker-compose environment is similar to a python Virtual Environment (venv)
        + In that docker-compose environments are operating in Working Directories
        - They are self-isolated from other docker compose environments, 
            + this means you can just delete the working directory and it is gone
            + This also means it makes your docker container environments portable, just backup the working directory and move

- This will make the generating of multiple Docker containers or multiple Dockerfiles alot easier
```
+ Folder : Create a working directory to store your docker compose resources
+ Filename : You can provide any filename, but recommended to use 'docker-compose.yaml'
+ Command : sudo docker-compose

### Docker vs docker-compose
> Comparison of the steps to generate a docker container vs docker-compose environmnent
- Manually Running a docker container
    - docker
        ```console
        docker run --name web -itd -p 8080:80 nginx
        ```
    - docker-compose
        - Design docker-compose.yaml
            ```
            version: "3"
            services:
                web:
                    image: nginx
                    ports:
                        - "8080:80"
                    restart: always
            ```
        - Startup Docker containers
            ```console
            sudo docker-compose up -d
            ```
            
- Creating a docker network
    - docker
        ```console
        sudo docker network create [network-name] --subnet [subnet-mask/prefix]
        ```
    - docker-compose
        - Design docker-compose.yaml
            ```
            version: "3"
            services:
                web:
                    image: nginx
                    ports:
                        - "8080:80"
                    restart: always
                web2:
                    image: nginx
                    ports:
                        - "8081:80"
                    restart: always
                    networks:
                        [network-name]:
                            ipv4_address: [static-ip-address]
            networks:
                [network-name]:
                    ipam:
                        driver: default
                        config:
                            - subnet: "subnet-mask/prefix"
            ```
        - Startup Docker containers
            ```console
            sudo docker-compose up -d
            ```
        
### Default Behaviour
- Creates a default bridge network for the containers
    + And puts the containers in their default bridge network


## Wiki
### Structure
```
version: "docker-version-number"
services:
    [container-name]:
        image: image-name-to-pull
        ports:
            - "host-port:container-port"
        # Optionals
        build: [dockerfile-directory]
        container_name: [custom-container-name]
        command:
            - command
        entrypoint: ["command", "arguments",]
        hostname: your-host-name
        restart: {always|unless-stopped}
        networks:
            [network-name]:
                ipv4_address: static-ip-address
        depends_on:
            - [dependency_image]
        environment:
            [VARIABLE_NAME]: value
        env_file:
            - [environment_variable_file]
        privileged: {true|false}
        tty: {true|false}
        volumes:
            - [host-directory-path]:[docker-directory]

volumes:
    # To initialize/specify all volumes you want to use
    [host-volume-name]:

networks:
    [network-name]:
        ipam:
            driver: default
            config:
                - subnet: "subnet-mask/prefix"
```
### Docker-compose Key-Values
#### Required
+ version : The Docker Version Number (to be modified if Docker version changes)
+ services : To specify all container services to work with; All containers specified are seperate containers with their own infrastructure/specifications
    - [service-name] : Specify the service to create in the compose environment, all keys under here are specific to this container only; Serves as your container name if 'container_name' subkey is not specified.
        + image : The image to pull/use as this container's base image
        + ports : Define all your Host-Container port mapping/forwarding here; You can add multiple ports, just add the following on a newline : '- "host-port:container-port"'
            - *- "host-port:container-port"*
        #### Optionals
        > These are all options/keys you can add to a container/service
        + build: To specify the directory of the Dockerfile you want to build
            - To build
                ```console
                docker-compose build
                ```
            - Default Value
                + . : Specify current directory
        + command : Type Array; Commands you want to execute when starting up
            - *- command*
        + container_name : To specify the custom container name
        + depends_on : Specify dependencies required by the container; This basically tells docker-compose to build these images here first before building this main container - because this main container depends on the specified images
            - [dependency-image] : Specify the image this container depends/requires
                - *- [depedency-image]*
        + entrypoint: Explicitly specify the entrypoint of the container
            - *[command, arguments,...]*
        + environment : Set Environment Variables; Place each environment variable in a new line
            - [VARIABLE_NAME]: value
        + env_file : Type List; Specify all files containing environment variables to source in the container; Use this if you do not want to explicitly specify under 'environment'
            - *- [env_file_name]*
        + hostname: To specify hostname of the container system
        + restart : What the containers should do if the machine reboots/restarts
            - Values
                + always : Always start back up if the host machine reboots
                + unless-stopped : Only restart if the container is stopped
        + networks : To assign the container into a specified network
            - [network-name] : To specify the network name to assign the container to
                + ipv4_address : Specify the static IP address for the container in the network
        + privileged : To run service as privileged mode (true) or non-privileged (false)
            - Type: Boolean
        + tty: Corresponds to 'docker run -it', setting this to 'true' will prevent the docker container from exitting immediately after creation
            - Type: Boolean
        + volumes : Docker Volume; Maps a docker directory/folder in the container to a directory/folder volume in the host system. This means that if the container goes down, dies or is restarted, that directory's data still exists on the host - Important for things like a database.
            - *- [host-directory-path]:[docker-directory]*
+ volumes : To initialize/specify all volumes you want to use
    - [volume-name] : To specify the volume you want to create in your services and want to mount
+ networks : To generate/create a new network
    - [network-name] : Specify the network to create in the compose environment
        - ipam : Stands for IP Address Management
            - driver: Specify Your network driver
                - driver options
                    + default : In docker, default = bridge network
            - config: Specify Network Configs
                - subnet: Define your subnet address
                    + *- subnet: "subnet-mask/prefix"*
            
## References
+ [YouTube | Full Stack Talks | Create a Development Environment with Docker Compose by Mark Ranallo](https://www.youtube.com/watch?v=Soh2k8lCXCA)
+ [YouTube | NetworkChuck | Docker Compose will BLOW your MIND!! (a tutorial)](https://www.youtube.com/watch?v=DM65_JyGxCo)
+ [yaroslavgrebnov - Docker: Prevent Container From Exiting Immediately After Creation](https://yaroslavgrebnov.com/blog/docker-prevent-container-from-exiting-immediately-after-creation/#:~:text=In%20order%20to%20prevent%20the,d%20container%20status%20is%20Up%20.)

## Resources
+ [Vulhub - Pre-Built Vulnerable Environments Based on Docker-Compose](https://github.com/vulhub/vulhub)

## Remarks
