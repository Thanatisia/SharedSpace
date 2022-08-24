# Docker - Networking

## Information
### Requirements
+ docker.io

### Basics
```
Docker shares the Network with the host systems.
In linux, the Dynamic Network Service (DNS) performs network resolution by utilising the file '/etc/resolv.conf'.

By default, when docker is installed and a container is created, 
    Docker will copy the '/etc/resolv.conf' from the linux kernel and place it into the individual container, 
    thus using the same network as the host system by default.

Docker however, allows you to create your own custom network bridges and use them, these will act as "Subnets" within the docker network.
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

- Create a new docker network
    - Bridge
        ```console
        sudo docker network create [new-bridge-name]
        ```

- Start using a specific docker network
    ```console
    sudo docker run -idt --name "HelloWorld" --network [new-bridge-name] 
    ```

- Start container with Port forwarding 
    + By exposing the Internal port on the Docker container to an external port on the host system
    - Port Forwarding port 80 (http)
	+ Generally required when running a docker containing for a web server so that it is accessible
        ```console
        sudo docker run -idt --name "HelloWorld" -p 80:80 --network [new-bridge-name]
        ```


## Wiki
### Terminologies
+ driver = Network Type 

### Network Types
+ bridge

## Resources

## References
+ [YouTube | Networkchuck | Docker Networking is crazy!! (You need to learn it)](https://youtu.be/bKFMS5C4CG0)

## Remarks
