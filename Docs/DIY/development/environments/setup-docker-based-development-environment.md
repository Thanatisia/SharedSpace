# Setting up a docker-based (remote (aka cloud)/local) development environment

## Information
### Description
- As the name suggests, the goal of this documentation is to create a reference material to setting up a docker-based (remote (aka cloud)/local) development environment like repl.it, 
    + or even a VPS using the same ideologies of basically creating a container for each user when the user requests to create a new project (aka the container)

- For each occasion when the user requests to create a new container/project
    - The system/DOM/input will request user to fill in the following
        + Programming Language / Template of choice (if provided by you - the developer)
        + Project Name: This will be the container name
    - On Submission
        - The system will create a new container 
            + with the provided container name,
            + using the selected Dockerfile/image template as the image and
            + mount the current working directory from the host system and container
        - The system will then chroot/enter into the container's environment and begin development inside the container

### Components
- images
    + Dockerfile
- containers
    + docker compose

### Terminologies
+ Project = Container
+ Project Template = Dockerfile/image template

## Planning
### Overall flow
- Planning
    + Operating System (Windows/Linux)
    - Choose your base image (Distribution)
        + debian
        + archlinux
        + nix
        + voidlinux
    - Project Requirement Documentation
        + Programming Language
        + SDK
        + API
        + Libraries
        + Utilities
    + (Optional) Designing your Dockerfiles : For starting up your exact requirements basing off the image
    + (Optional) Designing your docker compose file : For having multiple images/programming languages/services in 1 compose environment

- User Management
    - Create groups
        ```bash
        groupadd [group-name]
        ```
    - Add new users
        ```bash
        useradd -m -g [primary-group] -G [secondary-groups,...] -d [custom-home-directory] [username]
        ```
    - Set password        
        ```bash
        passwd [username]
        ```

- Build Dockerfile templates to images
    ```bash
    docker build --tag [author/image-name]:[version] {--build-args [argument-variable]=[value]} -f [custom-Dockerfile] [context (default: .)]
    ```

- Startup images to containers
    ```bash
    docker run -itd --name=[container-name] \
        --restart=unless-stopped \
        -e "[ENVIRONMENT_VARIABLE]=[value]" \
        --env-file="environment-variable-file" \
        -p "[host-ip-address]:[host-system-port]:[container-port]" \
        -v "[host-system-volume]:[container-volume]:[permissions]" \
        --devices "[host-system-passthrough-device]:[container-device-mount-point]" \
        [author/image-name]:[version]
    ```

- Startup docker compose environments
    ```bash
    docker-compose up -d --build
    ```

## Setup
### Dependencies
+ git
+ docker
+ (Optional) docker compose

### Pre-Requisites

## Documentations

## Examples
### Setup a python development environment
- Planning Documentations
    + Dockerfile: python.Dockerfile
    + Docker compose file: python.docker-compose
    + Image Name: test/python
    + Image Tag: latest
    + Container Name: test-python
    + Container Tag: latest
    + Context: .

- Simple Dockerfile
    - Select Base Image
        - Official python (specific version) base image
            ```Dockerfile
            FROM python:[python-version] AS base
            ```
        - Official debian base image
            ```Dockerfile
            FROM debian:[latest|debian-version] AS base
            ```
        - Official ArchLinux base image
            ```Dockerfile
            FROM archlinux:[latest|archlinux-version] AS base
            ```
    - Update packages
        - apt-based
            ```Dockerfile
            # Update package manager database, Upgrade packages and Install dependencies
            ## Notes:
            ## - This is the most important step as this is where you install the majority of dependencies that may be used in any development/programming environments
            RUN apt update -y && apt upgrade -y && \
                apt install -y python3 python-pip python3-venv [dependencies]
            ```
        - pacman-based
            ```Dockerfile
            # Update package manager database, Upgrade packages and Install dependencies
            ## Notes:
            ## - This is the most important step as this is where you install the majority of dependencies that may be used in any development/programming environments
            RUN pacman -Syu \
                && pacman -S python3 python-pip python3-venv [dependencies]
            ```
    - Design remaining Dockerfile
        ```Dockerfile
        # Set Arguments (aka local variables for Dockerfiles)
        ## Notes:
        ## - The arguments (variables) specified as ARG are local variables in the Dockerfile
        ##     - To define the arguments during build-time
        ##         - Parse the '--build-args [argument-variable]=[value]' argument
        ##     - To use variables within the dockerfile after definition and initialization
        ##         - Use the '$${variable_name}}' syntax
        ##     - These arguments needs to be reinitialized if used in a multi-stage build
        ARG variable=value
    
        # Set Environment Variables into container
        ## Notes:
        ## - The variables specified by the ENV instructions are environment variables defined in the image itself
        ##     - These will be usable in the image as environment variables
        ENV variable=value

        # Copy your files from the host system into the image
        ## Notes:
        ## - This is done on build time, the COPY instruction will copy the specified files from the host system into the image
        ##     - Whenever the image is used to create a container, the files that was copied into the image will be there on startup
        COPY [host-system-directory (absolute path)] [container-directory (absolute path)

        # Set commands to run
        ## Notes:
        ## - The RUN instructions will only be ran once - during the initial image build process
        RUN "your-command"

        # Set Entrypoints
        ## Notes:
        ## - The command line statements specified within the entry point instruction is looped everytime the container is recreated using the image
        ## Syntax:
        ##     - Shell form: ["command", "arguments", "here"]
        ##     - Runner form: "commands arguments && here"
        ENTRYPOINT "commands-here"
        ```

- Setup simple docker-compose file
    - Explanation
        - build
            + context: The current working directory during the build process; This is equivalent to the [context] in 'docker build [context]'
            + Dockerfile: Specify the name of the custom Dockerfile to use; This is equivalent to '-f [custom-Dockerfile]' argument
    ```yaml
    version: "3.7"
    services:
        service_name:
            image: [author-name]/[your-image-name]:[tag|version]
            container_name: [your-container-name]
            build:
                context: .
                Dockerfile: /path/to/custom/Dockerfile
            restart: unless-stopped
            ports:
                ## Port Forward/Translate/Map
                ## [host-ip-address]:[host-system-port]:[container-port]
            volumes:
                ## Mount volumes from host system into container
                ## [host-system-volume]:[container-volume]:[permissions]
            devices:
                ## (Optional) Passthrough a physical device object/driver/bus file from the host system into container
                ## [host-system-device-file]:[container-mount-volume]
    ```

- Build Dockerfile templates to images
    ```bash
    docker build --tag test/python:latest -f python.Dockerfile .
    ```

- Startup images to containers using docker run
    ```bash
    docker run -itd --name=test-python --restart=unless-stopped test/python:latest
    ```

- Build and Startup docker compose environments
    ```bash
    docker-compose -f python.docker-compose up -d --build
    ```

## Wiki


## Resources

## References
+ [YouTube - ArjanCodes - How to use Docker to make Local Development A Breeze](https://www.youtube.com/watch?v=zkMRWDQV4Tg)
+ [YouTube - Be A Better Dev - How to Setup a Docker Based Linux Development Environment](https://www.youtube.com/watch?v=CGCn0b4FOfs)

## Remarks
