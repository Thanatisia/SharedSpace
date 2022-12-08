# docker volumes

## Information
### Requirements
+ docker

### Basics
```
This contains a write-up/documentation for using the 'docker volumes' command as well as parameters.

This manages the volumes created and recognized in docker.
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
docker volume [action] {options} <arguments>
```

### Parameters
#### Actions
- ls : List all volumes recognized by docker

### Usage
- List all docker volumes
    ```console
    docker volumes ls
    ```

## Resources

## References
+ [docker volumes](https://www.howtogeek.com/devops/understanding-the-dockerfile-volume-instruction/#:~:text=The%20Dockerfile%20VOLUME%20instruction%20creates,%2Fapp%2Fdata%20container%20path.)

## Remarks