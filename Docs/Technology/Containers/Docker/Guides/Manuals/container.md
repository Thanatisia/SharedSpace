# docker containers

## Information
### Requirements
+ docker

### Basics
```
This contains a write-up/documentation for using the 'docker container' command as well as parameters.

the 'docker container' command targets specifically the usage of containers in docker.
```

## Setup
### Pre-Requisites

### Dependencies

### Setting Up
- Install docker.io
    + Will provide a Docker default network interface
    - Using Package Manager
        - Debian-based (apt)
            ```console
            sudo apt install docker.io
            ```
        - Arch-based (pacman)
            ```console
            sudo pacman -S docker.io
            ```

## Documentation
### Synopsis/Syntax
```console
docker container [action] {options} <arguments>
```

### Parameters
#### Actions
- create {options} [base-image] : Create a new container; aka docker create
    - Positionals
        + base-image : The image you want to pull to use to make the container
    - Optionals
        + --name : Set the name of the container
        + -v [host-system-volume:container-volume] : Set a volume

### Usage
- Creating a named volume
    ```console
    docker container create --name [container-name] -v [named-volume]:/data [base-image]
    ```

## Resources

## References
+ [With a named volume](https://stackoverflow.com/questions/63993993/docker-persisted-volum-has-no-permissions-apache-solr/64006395#64006395)

## Remarks