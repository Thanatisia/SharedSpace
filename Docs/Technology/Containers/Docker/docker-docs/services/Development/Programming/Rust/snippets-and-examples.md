# Snippets and Examples 

* Various example use cases of the Rust official docker image without using docker compose

## Snippets
1. Cargo new project workspace
    - Build dockerfile into image
        ```console
        docker build -t [new-docker-image-name] [path-to-dockerfile (i.e. '.')]
        ```
    - docker run and startup a container using built Dockerfile image 
        + with Volume mounting : This is like using the key 'volume:' in a docker-compose environment to mount a folder in your host system to the container
            + This lets you effectively get the files that will be output by rust, as well as let the docker environment see your source files
        ```console
        docker run -itd -v $(pwd)/rust/app/src:/rust/app/src --name [container-name] [docker-image-name]
        ```
    - Execute commands in container
        - Create new project workspace
            + Because you mounted the source file volume directory, the outputted project workspace is also found there
            ```console
            docker exec -it [container-name] /bin/bash -c "cargo new [project-name]"
            ```
    - Stop docker container
        ```console
        docker container stop [container-name]
        ```
    - Remove docker container
        ```console
        docker container rm [container-name]
        ```
    - Remove docker image
        ```console
        docker (image) stop [container-name]
        ```
