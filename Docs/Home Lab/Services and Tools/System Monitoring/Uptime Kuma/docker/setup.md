# Uptime Kuma Setup - Docker (and docker-compose)


## Setup
### Pre-Requisites
### Dependencies
+ docker : For containerization
+ docker-compose : For using docker compose
+ git : Version Control and cloning from repository

### Installation
- Running via Docker
    - Options
        + -d : Run in the background as a daemon
        + --restart : When to restart the container
        + -p [host-system-port:container-port] : Port forward/map/translate the host system's port to the container's port
        + -v [host-system-volume:container-volume] : Map the specified volume from the host system to the container
        + --name [container-name] : Specify container's name
    - Positionals
        + image-name : The target image
    ```console
    docker run \
        -d \
        --restart=always \
        -p 3001:3001 \
        -v uptime-kuma:/app/data \
        --name uptime-kuma \
        louislam/uptime-kuma:1
    ```

- docker-compose
    ```yaml
    version: 3.5"

    services:
        # Uptime Kuma
        ## System Monitoring utility
        ## For Home Lab Servers
        uptime-kuma:
            image: louislam/uptime-kuma:1
            container_name: uptime-kuma
            restart: always
            ports:
                # [Host system port]:[container port]
                - 3001:3001
            volumes:
                # [host system path]:[container path]:[permissions]
                - "$PWD/uptime-kuma/app/data:/app/data"
    ```

### Verification and Usage
- Try accessing the webapp UI

## Documentations
### Administrative
- Reset Admin password
    - Check docker container
        ```console
        docker(-compose) ps
        ```
    - Reset admin password
        ```console
        docker exec -it uptime-kuma npm run reset-password
        ```

## Wiki

## Resources
+ [PM2 Process Manager Daemon](https://pm2.keymetrics.io/)
+ [lindevs - Reset Uptime Kuma admin password](https://lindevs.com/reset-uptime-kuma-admin-password-in-linux/)

## References
+ [GitHub - louislam/uptime-kuma](https://github.com/louislam/uptime-kuma)

## Remarks
