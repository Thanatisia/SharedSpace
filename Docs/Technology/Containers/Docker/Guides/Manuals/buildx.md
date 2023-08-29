# docker - buildx

## Information
### Background
```
Docker command to support (Re)Building of docker images for Multiarchitecture
```

### Topics Involved
+ docker 
+ docker buildx
+ qemu : Hypervisor that emulates the machine’s processor through dynamic binary translation and provides a set of different hardware and device models for the machine, enabling it to run a variety of guest operating systems.

## Setup
### Dependencies
+ docker
+ qemu
- qemu-user-static : Enables an execution of different multi-architecture contains in docker
    + Allows to initiate builder for other architectures
    + builder is necessary because you cannot use the docker driver directly to build for multiple platforms simultaneously

### Pre-Requisites

## Documentation
### Synopsis/Syntax
```console
docker buildx [command] {options} <arguments>
```

### Parameters
- Positionals
    - commands 
        - `build {options} <arguments>` : Build a docker image
            - Options
                - With Arguments
                    - `-t [target-image (author/image-name)]` : Specify the target image
                    - `--platform [architectures (platform/architecture,...)]` : Specify the target platform/architectures; Please separate all platforms with a ',' delimiter
                        - Platforms
                            + linux
                        - Architectures
                            + amd64
                            + arm64
                            + x86_64
                    - `--push [remote-repository-url]` : Push to the specified remote repository URL; Default: DockerHub (aka '.')
                        - Remote Docker container Repository URL
                            + DockerHub (Default; represented with '.')
                            + GitHub
                - Flags
        - `create {options} <arguments>` : Create a new builder
            - Options
                - With Arguments
                    - `--name [name-of-builder]` : Specify the name of the builder to create
                - Flags
                    + --use : Switch to use the builder immediately after creating
        + ls : List platforms your docker drivr supports 
- Optionals
    - With Arguments
    - Flags

### Usage
- Check architecture listings
    ```console
    docker buildx ls
    ```

- Create a new builder and switch to it
    ```console
    docker buildx create --use --name [name-of-builder]
    ```

- Build a docker image for multiple architectures
    - For linux/amd64 and linux/arm64
        ```console
        docker buildx build -t author/repository --platform linux/amd64,linux/arm64 --push [dockerhub (.) | https://github.com]
        ```

- Inspect image using docker image
    ```console
    docker inspect {remote-repository-server}/author/repository-name | jq .[].Architecture
    ```

- Pull the pushed image
    ```console
    docker pull author/repository-name --platform [platform/architecture]
    ```

- Test run and check the image
    - Test Run
        ```console
        docker run -dit --rm -p "ip-address:host-system-port:container-port" --platform [platform/architectures,...] [image (author/repository-name)]
        ```
    - Check Webserver
        ```console
        curl -sL [server-ip-address]:[port]
        ```

## Wiki
### Snippets and Examples

## Resources

## References
+ [Docker Docs - Build - Building Multiplatform](https://docs.docker.com/build/building/multi-platform/)
+ [Medium - drpdishant - Multiarch images with docker buildx and qemu](https://drpdishant.medium.com/multi-arch-images-with-docker-buildx-and-qemu-141e0b6161e7)


## Remarks


