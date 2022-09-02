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
        # (Do not add this line) Optionals
        restart: {always}
        networks:
            [network-name]:
                ipv4_address: static-ip-address
        depends_on:
            - [dependency_image]
        environment:
            [VARIABLE_NAME]: value
        volumes:
            - [host-directory-path]:[docker-directory]
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
    - [container-name] : Specify your container to create in the compose environment, all keys under here are specific to this container only
        + image : The image to pull/use as this container's base image
        + ports : Define all your Host-Container port mapping/forwarding here; You can add multiple ports, just add the following on a newline : '- "host-port:container-port"'
            - *- "host-port:container-port"*
        #### Optionals
        > These are all options/keys you can add to a container/service
        + restart : What the containers should do if the machine reboots/restarts
            - Values
                + always : Always start back up if the machine reboots
        + networks : To assign the container into a specified network
            - [network-name] : To specify the network name to assign the container to
                + ipv4_address : Specify the static IP address for the container in the network
        + depends_on : Specify dependencies required by the container; This basically tells docker-compose to build these images here first before building this main container - because this main container depends on the specified images
            - [dependency-image] : Specify the image this container depends/requires
                - *- [depedency-image]*
        + environment : Set Environment Variables; Place each environment variable in a new line
            - [VARIABLE_NAME]: value
        + volumes : Docker Volume; Maps a docker directory/folder in the container to a directory/folder volume in the host system. This means that if the container goes down, dies or is restarted, that directory's data still exists on the host - Important for things like a database.
            - *- [host-directory-path]:[docker-directory]*
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

## Resources
+ [Vulhub - Pre-Built Vulnerable Environments Based on Docker-Compose](https://github.com/vulhub/vulhub)

## Remarks
