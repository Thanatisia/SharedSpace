# Docker - Playbook

## Information
```
A general playbook/walkthrough and snippets for some of the most used features/use cases. 
This includes docker and docker compose
```

## docker
### Basic Controls and Operations
- Startup    
    - Recommended
        + Startup docker container in interactive mode, tty and in the background, with a custom name
        ```console
        docker run -itd --name=[container-name] {-p|--publish "ip-address:host-system-port:container-port"} {-v|--volumes "host-system-volume:container-volume"} ... [image-author/image-name:tag] {commands ...}
        ```
    - Foreground
        + Startup the containers in the docker-compose group in interactive mode
        ```console
        docker run -it --name=[container-name] ... [image-author/image-name:tag] {commands ...}
        ```
    - Background process (as a Daemon)
        + Startup the containers in the docker-compose group in daemon/background mode
        ```console
        docker run -itd ... [image-author/image-name:tag] {commands ...}
        ```

- Start a stopped container
    ```console
    docker container start [container-name]
    ```

- Stop a running container
    ```console
    docker container stop [container-name]
    ```

- Restart a container
    ```console
    docker container restart [container-name]
    ```

- Tear/Shutdown containers in compose group
    + This will stop and remove the containers
    ```console
    docker container stop container-name && docker container rm container-name
    ```

- Remove containers
    - Individual
        ```console
        docker container rm [image-tag/name]
        ```
    - Multiple
        - All
            ```console
            docker container prune --all
            ```
        - General
            ```console
            docker container prune
            ```

- Remove images
    - Individual
        ```console
        docker image rm [image-tag/name]
        ```
    - Multiple
        - All
            ```console
            docker image prune --all
            ```
        - General
            ```console
            docker image prune
            ```

### Analysis
- List images
    - All
        ```console
        docker image ls --all
        ```
    - Currently Running
        ```console
        docker image ls
        ```

- Check container processes
    - All
        ```console
        docker ps --all
        ```
    - Currently Running
        ```console
        docker ps
        ```

- Inspect container internal information
    ```console
    docker inspect [container|image-name]
    ```

- Builders
    - Inspect images and their information
        ```console
        docker buildx imagetools inspect author/repository:version
        ```

### Building
- Build Dockerfile image
    - Default
        ```console
        docker build [context]
        ```
    - Specify a tag (name) for the image
        ```console
        docker build --tag=[author/image:tag] [context]
        ```
    - Specify a target platform (aka custom CPU architecture) to build for
        - Use the '--platform [platform/architecture]' flag
            + You can specify multiple platform and CPU architectures by separating each entry with a ',' delimiter
        ```console
        docker build --platform [platform/architecture,] [context]
        ```

- Push built docker image from local repository to remote repository server (i.e. Dockerhub)
    + Use the '--push' flag' to generate a multi-arch manifest and pushes all the images to the remote repository server
    + Default remote repository server: Dockerhub (you can just use '.')
    - Synopsis/Syntax
        ```console
        docker buildx build -t author/repository:version --platform platform/architecture --push [remote-repository-url (default: '.')]
        ```
    - Push to Dockerhub
        ```console
        docker buildx build -t author/repository:version --platform platform/architecture --push .
        ```
    - Push to GitHub
        ```console
        docker buildx build -t author/repository:version --platform platform/architecture --push github.com/author/repository-name
        ```

## docker compose
### Basic Controls and Operations
- Startup
    + This will startup the docker container
    + Equivalent to 'docker run -itd --name=[container-name] ... [image-author/image-name:tag] {commands ...}
    - Foreground
        + Startup the containers in the docker-compose group in interactive mode
        + This is equivalent to adding the '-it' flags without '-d' in 'docker run'
        ```console
        docker-compose up
        ```
    - Background process (as a Daemon)
        + Startup the containers in the docker-compose group in daemon/background mode
        + This is equivalent to adding the '-d' flags in 'docker run'
        ```console
        docker-compose up -d
        ```
    - Using a custom docker-compose file name
        ```console
        docker-compose up -f [custom-docker-compose-file] -d
        ```
    - Build dockerfile before starting up
        ```console
        docker-compose up -d --build
        ```

- Start a stopped container
    ```console
    docker-compose start [container-name]
    ```

- Stop a running container
    ```console
    docker-compose stop [container-name]
    ```

- Restart a container
    ```console
    docker-compose restart [container-name]
    ```

- Tear/Shutdown containers in compose group
    + This will stop and remove the containers
    + Equivalent to 'docker stop container-name && docker rm container-name'
    ```console
    docker-compose down
    ```

### Analysis
- Check docker-compose group processes
    - Current
        ```console
        docker-compose ps
        ```

### Building
- Build a specific Dockerfile
    ```console
    docker-compose build -i [custom-docker-file] ... [context]
    ```

## Wiki
### Snippets
- Build a custom dockerfile in another directory with docker
    - Assumptions
        + Current Working Directory (aka Context): .
        + Dockerfile location: ./docker/Dockerfile
        + Tag name: "author/image:latest"
    ```console
    docker build --tag author/image:latest -f ./docker/Dockerfile .
    ```

- Multi-architecture image development flow
    - Create image builder
        ```console
        docker buildx create --name mybuilder
        ```
    - Make a development directory and change directory into it
        ```console
        mkdir -p test && dir test
        ```
        + Create your Dockerfile
    - Build your docker image and push to the remote docker container repository server
        + The image should now be available in the remote docker image repository server
        - Push to Dockerhub
            ```console
            docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t author/repository:[version (i.e. latest)] --push .
            ```
        - Push to Github
            ```console
            docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t author/repository:[version (i.e. latest)] --push github.com/author/repository
            ```
    - Inspect image
        ```console
        docker buildx imagetools inspect adamparco/demo:latest
        ```
    - Run and startup docker image to test it and be used anywhere without having to rebuild
        ```console
        docker run -itd --name=[container-name] -p "ip-address:host-system-port:container-port" -v "host-system-volume:container-volume:permissions" author/image:version
        ```

### Terminologies
+ Context : The directory/position where the user is building/starting/referencing from; Typically '.' which is current working directory

### Dockerfile script
- Staged build
    - Specify name for the stage
        + use the "AS" keyword to specify a name for that stage
        ```
        FROM [image] AS [stage-name]
        ```
    - To invoke and use in other stages
        + Use the '--from=[stage-name]' option
        ```
        COPY --from=[stage-name] [host-system-volume-path] [container-volume-path]
        ```

- Cross-Compilation
    - For Multiplatform build
        + Use the '--platform=[target-platform]' option
        ```
        FROM --platform=[target-platform] [image] AS [stage-name]
        ```

### Compose script
- Build a custom dockerfile in another directory with docker compose
    - Assumptions
        + Docker version: 3.7
        + Current Working Directory (aka Context): .
        + Dockerfile location: ./docker/Dockerfile
        + Tag name: "author/image:latest"
    ```yaml
    version: "3.7"
    services:
        service-name:
            image: "author/image:version"
            container_name: "custom-container-name"
            build:
                context: "[your-context]"
                Dockerfile: "[your-dockerfile-path]"
    ```

- Build multiplatform images
    - Linux x86_64 (amd64) CPU
        ```console
        docker build --platform=linux/amd64 [context]
        ```

### Platforms
+ darwin
+ linux

### Computer/CPU Architectures
+ amd64   : 64-bit CPU; Equivalent to 'x86_64'
+ arm32v5 : ARMv5 32-bit CPU; Equivalent to 'arm/v5'
+ arm32v6 : ARMv6 32-bit CPU; Equivalent to 'arm/v6'
+ arm32v7 : ARMv7 32-bit CPU; Equivalent to 'arm/v7'
+ arm64   : General ARM 64-bit CPU
+ arm64v8 : ARMv8 32-bit CPU; Equivalent to 'arm/v8'
+ i386    : generic x86_64 CPU 
+ ppc64le : TBC
+ s390x   : TBC

## Resources

## References
+ [Docker blogs - multi-arch images](https://www.docker.com/blog/multi-arch-images/)
+ [Docker docs - Building - Multiplatform](https://docs.docker.com/build/building/multi-platform/)
+ [Docker docs - Building - Multiplatform - Cross-Compilation](https://docs.docker.com/build/building/multi-platform/#cross-compilation)

## Remarks