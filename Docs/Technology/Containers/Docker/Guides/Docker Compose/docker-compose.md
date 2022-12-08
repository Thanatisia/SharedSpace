# docker-compose

## Information
### DESCRIPTION
```
Docker Compose is a recipe containing ingredients required to automate the creation of multiple Docker Files as well as starting of services, the whole package
```

## Setup
### Pre-Requisites
- Create a Working Directory
    ```console
    mkdir -p your-folder
    ```
    
    - Enter the working directory
        - NOTE: 
            - If you do not do this, in 'sudo docker-compose', 
                + you *need* to provide a '-f [docker-working-directory]' option containing the *docker-compose.yaml* file
        ```console
        cd your-folder
        ```

    - Create a Docker compose file in the folder
        ```console
        $EDITOR docker-compose.yaml
        ```

### Dependencies
+ docker

### Installing
- Using Package Manager
    - Debian-based (apt)
        ```console
        sudo apt install docker-compose
        ```
    - Arch-based (pacman)
        ```console
        sudo pacman -S compose
        ```

## Documentation

### Synopsis/Syntax
```console
sudo docker-compose [action] {options}
```
### Parameters
- Positional
    - Action
        + up    {options} : Starts up all the containers in the docker-compose file, Creates the containers, the default bridge network for the containers and inputs them
        + down  {options} : Takes down all the containers in the docker-compose file, Removes the containers and deletes the network
        + ps    {options} : To list/show only the docker containers within the created compose environment
        + start {options} : To just start all the stopped container processes in the docker-compose file
        + stop  {options} : To just stop all the running container processes in the docker-compose file

- Optionals
    + -d : 
    + -f [docker-compose-location] : Specify the location of the docker compose file; Required if you are not inside the docker compose working directory

### Usage
- Startup docker-compose environment with building of Dockerfiles
    - Notes
        + Certain docker containers (i.e. my samba share) are built from scratch using Dockerfile and docker-compose, thus you need to run build
    ```console
    docker-compose up -d --build
    ```

- Startup and Create Docker Containers in the docker-compose environment and bridge networks
    ```console
    sudo docker-compose up -d {container-name(s)}
    ```
    
- Take down and delete all Docker Containers in the docker-compose environment and remove bridge networks
    ```console
    sudo docker-compose down -d
    ```
    
- Start/Run all stopped Docker Container processes in the docker-compose environment
    ```console
    sudo docker-compose start -d {container-name(s)}
    ```

- Stop all stopped Docker Container processes in the docker-compose environment
    ```console
    sudo docker-compose stop -d {container-name(s)}
    ```

- Restart docker-compose environment
    + Leaving 'container-name' empty will restart all containers in the compose environment
    ```console
    docker-compose restart [container-name]
    ```

- Open Interactive Shell in docker-compose
    ```console
    docker-compose run [service-name]
    ```
    
- List only the Docker Container processes in the docker-compose environment
    ```console
    sudo docker-compose ps
    ```
      
- Start/Run a docker linux development environment
    - Running docker-compose
        ```console
        sudo docker-compose up -d
        ```
    - Execute and chroot into a docker container
        ```console
        sudo docker exec -it [container-name] [shell]
        ```
      
## References
+ [YouTube | NetworkChuck | Docker Compose will BLOW your MIND!! (a tutorial)](https://www.youtube.com/watch?v=DM65_JyGxCo)

## Resources

## Remarks
