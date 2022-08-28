# Docker - Command Usage Examples

## Docker
- To pull down an image
    ```console
    docker pull [image]
    ```

- To pull down specific images from Dockerhub
    + The tag specifies the version of the image to download
    ```console
    docker pull [author]/[image-name]:[tag]
    ```

- To run/startup a container in the background
    ```console
    docker run -t -d --name [container-name] [image-name]
    ```

- To run/startup a specific container/image in the background
    + The tag specifies the version of the image to download
    ```console
    docker run -t -d --name [container-name] [author]/[image-name]:[tag]
    ```

- To run/startup a container in the background with a port forward to access your docker container port from host 
    + Useful for allowing access to a docker Web Server container/image
    - Map your internal port to the external port
        + internal port : Docker container port
        + external port : Host port
    ```console
    docker run -t -d -p [internal-port]:[external-port] --name [container-name] [image-name]
    ```

- To list all existing docker containers/images
    ```console
    docker image ls -a
    ```

- To list all docker processes running
    ```console
    docker ps
    ```

- To execute/connect an existing container
    ```console
    docker exec -it [container-name] [shell-to-provide]
    ```

- To execute/connect to a user in an existing container
    ```console
    docker exec -it --user [username] [container-name] [shell-to-provide]
    ```

## Docker Containers
- To list active containers
    ```console
    docker container list
    ``` 

- To stop an active container 
    ```console
    docker container stop [container-name]
    ```

- To start a stopped container
    ```console
    docker container start [container-name]
    ```

- To restart an active computer (stop-start)
    ```console
    docker container restart [container-name]
    ```

## Dockerfile
```
Automate creation of docker containers
```
- To build a Dockerfile
    ```console
    docker build [directory-to-build]
    ```

## Docker compose
```
Handle multiple containers
```

## Docker Volumes
```
Handle mounting of disks/drives from the host system onto the docker container
```

## Docker Network
```
Handle Docker Networks, Subnets etc
```
