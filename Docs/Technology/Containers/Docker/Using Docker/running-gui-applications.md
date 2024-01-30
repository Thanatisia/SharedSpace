# Docker - running GUI applications

## Information
### Security
- Please note that due to the nature of this requiring communication between the host system and the container, 
    - there will be some security issues such as 
        1. Compromising of the 'isolation' property of containers
            - Your container will no longer be isolated as there will be a hole to the container door leading to your system, 
                - please ensure that you do not execute anything that may traverse the network (regardless of worm or not worm)
    + therefore, please practice safe execution when attempting this

## Setup
### Dependencies
+ docker
+ docker-compose

### Pre-Requisites
- Host system setup
    - Add your host system user into the docker, audio and video groups
        ```console
        usermod -aG docker [username]
        usermod -aG audio [username]
        usermod -aG video [username]
        ```

- Display Server setup
    - Xorg
        - (Important) Set xhost to allow docker applications only
            - Explanation
                + By default, the X server of the host listens only in localhost (lo)
                - The best security practice is to allow only local connections from required applications
                    + Therefore, allow only the docker ports
            ```console
            xhost +local:docker
            ```

        - (Optional) Creating XOrg Authorization/Authentication file
            - Notes
                - You can ignore this if you already have an existing Xauthority file and/or an active Xorg session
            - Dependencies
                - xauth
            - Create an .Xauthority file
                ```console
                touch ~/.Xauthority
                ```

            - Add a new magic cookie token for the current display and user
                - Explanation
                    - display-monitor-number : The virtual monitor display number that the Display Server will use to render the Graphical application in; aka $DISPLAY environment variable
                    - hash : A randomly-generated hexadecimal hash (key) mapped to the current user
                        - Algorithms:
                            - "$(od -An -N16 -tx /dev/urandom | tr -d ' ')"
                ```console
                xauth add [display-monitor-number ($DISPLAY)] MIT-MAGIC-COOKIE-1 [hash]
                ```

            - List all 'magic cookies'
                - Explanation
                    - The format of each line/row is: `[hostname/]:[display-monitor-number (aka $DISPLAY)] [algorithm] [hash]`
                        - where
                             - hostname : The name of your host system (aka 'hostname')
                             - display-monitor-number : The virtual monitor display number that the Display Server will use to render the Graphical application in; aka $DISPLAY environment variable
                             - algorithm : The hashing algorithm used to generate the 'Magic Cookie' hash; Default: 'MIT-MAGIC-COOKIE-1'
                             - hash : A randomly-generate hexadecimal hash generated for the mapped user; This hash is used for authentication and authorization by the Xorg (X11) display server during session startup
                ```console
                xauth list
                ```

## Documentations
### Components
- Environment Variables
    - $DISPLAY : Contains the host system's virtual monitor running the Display Server session

- Network
    - `Network Mode: host` : Passthrough to host system's network so that the container can communicate with the host system
    - Ports
        - 5900 : (Optional) Default VNC port
        - 6080 : (Optional) Default Websocket port

- Volumes to mount
    - X11 Display Server
        - /tmp/.X11-unix    : Mount X11 socket from host system to container for container to access information on the current Xorg session
        - $HOME/.Xauthority : For X11/Xorg magic cookie authorization and authentication
    - Hardware Device Files
        - /dev/shm          : Passthrough the shared memory (shm = traditional Shared Memory) device; used as an efficient mean of passing data between programs (in this case, between host system and container)
        - /run/dbus         : Passthrough the running dbus from host system to container to enable communication between 2 or more processes on a single system or different systems (in this case, between host system and container)
    - User Management
        - /etc/passwd       : Optional; Mount the users file from the host system into the container so that the container will know what users there are; please ensure you mount this as read-only if you are using this
        - /etc/group        : Optional; Mount the group file from the host system into the container so that the container will know what groups there are; please ensure you mount this as read-only if you are using this
    - Optionals
        - /path/to/shared/volumes : Optional; mount a designated shared volume path that will be used between both host system and container; WARNING: Ensure that you are executing the applications reading/writing to the shared volume as the appropriate user (refer to [docker exec](#docker-exec) for more information on how to execute as a specific user)

- Devices to passthrough
    - /dev/snd          : Soundcard for audio passthrough

### Docker Snippets
#### Dockerfile
- Pull base image
    ```dockerfile
    FROM [base-image] AS base
    ``
- Update and Upgrade repositories
    - apt
        ```dockerfile
        ## Update and Upgrade repositories
       RUN apt update -y && apt upgrade -y && \
           ## Install dependencies
           apt install -y [dependencies ...]
        ```
    - pacman
        ```dockerfile
        ## Update and Upgrade repositories
       RUN pacman -Syu && \
           ## Install dependencies
           pacman -S [dependencies ...]
        ```
- Set Entry Point
    - Notes
        + Set the entry point as the application directly to run ONLY that application
    ```console
    ENTRYPOINT ["/bin/bash"]
    ```

#### docker compose
- Notes
    - The example below relies on X11 as an example, in the case whereby you are using wayland, please change the X11 socket to the wayland equivalent as necessary

- Default
    - Note
        - This default compose file layout will startup a container with the following properties
            + communication with the host
            + able to open up GUI applications from the container on the host
            + audio passthrough
            + no shared volumes
    ```yaml
    version: "3.7"
    services:
      gui:
        image: gui:latest
        container_name: gui
        build:
          context: .
          dockerfile: gui.Dockerfile
        network_mode: host # Passthrough to host system's network so that the container can communicate with the host system
        restart: unless-stopped
        tty: true # Equivlent to docker run's '-t' flag
        environment:
          ## Environment Variables
          - DISPLAY=${DISPLAY} # Passthrough current host system's $DISPLAY environment variable which contains the virtual monitor running the Display Server session
        volumes:
          ## Mount volumes from host system to container
          ## [host-system-volume]:[container-volume]:[permission]
          - /tmp/.X11-unix:/tmp/.X11-unix    # Mount X11 socket from host system to container for container to access information on the current Xorg session
          - ~/.Xauthority:$HOME/.Xauthority  # For X11/Xorg magic cookie authorization and authentication
          - /dev/snd:/dev/snd                # Soundcard for audio passthrough
          - /dev/shm:/dev/shm                # Passthrough the shared memory (shm = traditional Shared Memory) device; used as an efficient mean of passing data between programs (in this case, between host system and container)
          - /run/dbus:/run/dbus              # Passthrough the running dbus from host system to container to enable communication between 2 or more processes on a single system or different systems (in this case, between host system and container)
        devices:
          ## Passthrough devices directly into the container
          ## [host-system-device]:[container-device]
          - /dev/snd:/dev/snd : Passthrough Soundcard device from host system into container
    ```

- Accessing as a specific user in the container
    - Notes
        - Please refer to section block [docker exec](#docker-exec) for example on how to execute application as a specific user
    - Explanation
        - Volumes
            + Mount '/etc/passwd' into the container as a read-only file so that the container knows your host system users
            + Mount '/etc/group' into the container as a read-only file so that the container knows your host system groups
    ```yaml
    version: "3.7"
    services:
      gui:
        image: gui:latest
        container_name: gui
        build:
          context: .
          dockerfile: gui.Dockerfile
        network_mode: host # Passthrough to host system's network so that the container can communicate with the host system
        restart: unless-stopped
        tty: true # Equivlent to docker run's '-t' flag
        environment:
          ## Environment Variables
          - DISPLAY=${DISPLAY} # Passthrough current host system's $DISPLAY environment variable which contains the virtual monitor running the Display Server session
        volumes:
          ## Mount volumes from host system to container
          ## [host-system-volume]:[container-volume]:[permission]
          ### Display Server
          - /tmp/.X11-unix:/tmp/.X11-unix    # Mount X11 socket from host system to container for container to access information on the current Xorg session
          - ~/.Xauthority:$HOME/.Xauthority  # For X11/Xorg magic cookie authorization and authentication
          ### Hardware Device Files
          - /dev/snd:/dev/snd                # Soundcard for audio passthrough
          - /dev/shm:/dev/shm                # Passthrough the shared memory (shm = traditional Shared Memory) device; used as an efficient mean of passing data between programs (in this case, between host system and container)
          - /run/dbus:/run/dbus              # Passthrough the running dbus from host system to container to enable communication between 2 or more processes on a single system or different systems (in this case, between host system and container)
          ### Shared system volumes
          - /etc/passwd:/etc/passwd:ro
          - /etc/group:/etc/group:ro
        devices:
          ## Passthrough devices directly into the container
          ## [host-system-device]:[container-device]
          - /dev/snd:/dev/snd : Passthrough Soundcard device from host system into container
    ```

- Shared System Volumes
    - Notes
        - Please refer to section block [docker exec](#docker-exec) for example on how to execute application as a specific user
    - Explanation
        - path-to-shared-volumes : To simplify the transferring of files; mount a shared volume from the host system to the container
            - Note:
                - If an application is using a mounted folder/path that is owned by a specific user in the host system, you need to execute the command as that user
                    + Please refer to [here](#docker-exec)
    ```yaml
    version: "3.7"
    services:
      gui:
        image: gui:latest
        container_name: gui
        build:
          context: .
          dockerfile: gui.Dockerfile
        network_mode: host # Passthrough to host system's network so that the container can communicate with the host system
        restart: unless-stopped
        tty: true # Equivlent to docker run's '-t' flag
        environment:
          ## Environment Variables
          - DISPLAY=${DISPLAY} # Passthrough current host system's $DISPLAY environment variable which contains the virtual monitor running the Display Server session
        volumes:
          ## Mount volumes from host system to container
          ## [host-system-volume]:[container-volume]:[permission]
          ### Display Server
          - /tmp/.X11-unix:/tmp/.X11-unix    # Mount X11 socket from host system to container for container to access information on the current Xorg session
          - ~/.Xauthority:$HOME/.Xauthority  # For X11/Xorg magic cookie authorization and authentication
          ### Hardware Device Files
          - /dev/snd:/dev/snd                # Soundcard for audio passthrough
          - /dev/shm:/dev/shm                # Passthrough the shared memory (shm = traditional Shared Memory) device; used as an efficient mean of passing data between programs (in this case, between host system and container)
          - /run/dbus:/run/dbus              # Passthrough the running dbus from host system to container to enable communication between 2 or more processes on a single system or different systems (in this case, between host system and container)
          ### Shared system volumes
          - /path/to/shared/volume:/app/shared:rw
        devices:
          ## Passthrough devices directly into the container
          ## [host-system-device]:[container-device]
          - /dev/snd:/dev/snd : Passthrough Soundcard device from host system into container
    ```

### Docker commands
#### Compose
- General
    ```console
    docker-compose down; docker-compose up -d --build
    ```

#### build image
- General
    ```console
    docker build --tag=[image-author/image-name:version-tag] {--build-arg [argument=value]} -f [Dockerfile] [context (default: .)]
    ```

#### docker run
- (Recommended) General - Audio Passthrough
    ```console
    docker run -itd --name=[container-name] \
        --net=host \
        --restart=unless-stopped \
        -e DISPLAY=${DISPLAY} \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v ~/.Xauthority:$HOME/.Xauthority \
        -v /run/dbus:/run/dbus \
        -v /dev/shm:/dev/shm \
        --device /dev/snd:/dev/snd
        [image-author]/[image-name]:[version-tag]
    ```

- No Audio Passthrough
    ```console
    docker run -itd --name=[container-name] \
        --net=host \
        --restart=unless-stopped \
        -e DISPLAY=${DISPLAY} \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v ~/.Xauthority:$HOME/.Xauthority \
        -v /run/dbus:/run/dbus \
        -v /dev/shm:/dev/shm \
        [image-author]/[image-name]:[version-tag]
    ```

- Accessing as a specific user in the container
    - startup
        - Explanation
            - New Files
                + Mount '/etc/passwd' into the container as a read-only file so that the container knows your host system users
                + Mount '/etc/group' into the container as a read-only file so that the container knows your host system groups
        ```console
        docker run -itd --name=[container-name] \
            --net=host \
            --restart=unless-stopped \
            --device /dev/snd:/dev/snd \
            -e DISPLAY=${DISPLAY} \
            ### Display Server
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            -v ~/.Xauthority:$HOME/.Xauthority \
            ### Hardware Device Files
            -v /run/dbus:/run/dbus \
            -v /dev/shm:/dev/shm \
            ### Shared System Volumes
            -v /etc/passwd:/etc/passwd:ro \
            -v /etc/group:/etc/group:ro \
            [image-author]/[image-name]:[version-tag]
        ```

- Shared folders between host and container
    - Explanation
        - path-to-shared-volumes : To simplify the transferring of files; mount a shared volume from the host system to the container
            - Note:
                - If an application is using a mounted folder/path that is owned by a specific user in the host system, you need to execute the command as that user
                    + Please refer to [here](#docker-exec)
    ```console
    docker run -itd --name=[container-name] \
        --net=host \
        --restart=unless-stopped \
        --device /dev/snd:/dev/snd \
        -e DISPLAY=${DISPLAY} \
        ### Display Server
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v ~/.Xauthority:$HOME/.Xauthority \
        ### Hardware Device Files
        -v /run/dbus:/run/dbus \
        -v /dev/shm:/dev/shm \
        ### Shared System Volumes
        -v /path/to/shared/volume:/app/shared:rw \
        [image-author]/[image-name]:[version-tag]
    ```

#### docker exec
- Startup a GUI application as a background process
    ```console
    docker exec [container-name] [application-name] &
    ```

- Execute and enter as a specific user
    - Explanation
        + user-id : Specify the User ID of the user you want to login as (i.e. 1000); You can use '$(id -u)' to obtain the user ID of your current user
        + group-id : Specify the Group ID of the user you want to login as (i.e. 998); You can use '$(id -g)' to obtain the group ID of your current user
    - Syntax
        ```console
        docker exec -it -u [user-id]:[group-id] [container-name] [applications]
        ```
    - Example
        - Execute as current host user
            ```console
            docker exec -it -u "$(id -u):$(id -g)" [container-name] [applications]
            ```

### Usage 
#### Host System
- Set GUI application in container to launch in the host system
    - Edit your shell's resource configuration (rc) file (i.e. bash : ~/.bashrc)
        - Explanation
            + This is similar to how DistroBox installs and starts up their containers in the host system
    - Set the GUI application you want to execute as an alias of the 'docker exec' command calling that application
        - as root (Default)
            ```console
            alias [application-name]="docker exec [application-name]"
            ```
        - as a user (required if your folder is a pre-existing folder owned by a user)
            ```console
            alias [application-name]="docker exec -it -u "$(id -u):$(id -g)" [container-name] [application-name]"
            ```
    - Reload shell rc file
        ```console
        source ~/.[shell]rc
        ```
    - Run application in foreground
        ```console
        [application-name]
        ```
    - Run application as a process
        ```console
        [application-name] &
        ```

### Operational Flow
#### Full run
- Startup container
    - as root
        - Using docker-compose
            - Design docker-compose.yaml
                ```yaml
                version: "3.7"
                services:
                  gui:
                    image: gui:latest
                    container_name: gui
                    build:
                      context: .
                      dockerfile: gui.Dockerfile
                    network_mode: host # Passthrough to host system's network so that the container can communicate with the host system
                    restart: unless-stopped
                    tty: true # Equivlent to docker run's '-t' flag
                    environment:
                      ## Environment Variables
                      - DISPLAY=${DISPLAY} # Passthrough current host system's $DISPLAY environment variable which contains the virtual monitor running the Display Server session
                    volumes:
                      ## Mount volumes from host system to container
                      ## [host-system-volume]:[container-volume]:[permission]
                      ### Display Server
                      - /tmp/.X11-unix:/tmp/.X11-unix    # Mount X11 socket from host system to container for container to access information on the current Xorg session
                      - ~/.Xauthority:$HOME/.Xauthority  # For X11/Xorg magic cookie authorization and authentication
                      ### Hardware Device Files
                      - /dev/snd:/dev/snd                # Soundcard for audio passthrough
                      - /dev/shm:/dev/shm                # Passthrough the shared memory (shm = traditional Shared Memory) device; used as an efficient mean of passing data between programs (in this case, between host system and container)
                      - /run/dbus:/run/dbus              # Passthrough the running dbus from host system to container to enable communication between 2 or more processes on a single system or different systems (in this case, between host system and container)
                      ### Shared system volumes
                      - /path/to/shared/volume:/app/shared:rw # Shared Volume
                      - /path/to/shared/volume/home:$HOME:rw # Home directory
                    devices:
                      ## Passthrough devices directly into the container
                      ## [host-system-device]:[container-device]
                      - /dev/snd:/dev/snd : Passthrough Soundcard device from host system into container
                ```

            - Startup docker compose
                ```console
                docker-compose down; docker-compose up -d --build
                ```

        - Using docker run
            - build
                ```onsole
                docker build --tag=[author/name:version] -f [dockerfile] [context]
                ```
            - Startup container
                ```console
                docker run -itd --name=[container-name] \
                    --net=host \
                    --restart=unless-stopped \
                    -e DISPLAY=${DISPLAY} \
                    --device /dev/snd:/dev/snd \
                    ### Display Server
                    -v /tmp/.X11-unix:/tmp/.X11-unix \
                    -v ~/.Xauthority:$HOME/.Xauthority \
                    ### Hardware Device Files
                    -v /run/dbus:/run/dbus \
                    -v /dev/shm:/dev/shm \
                    ### Shared System Volumes
                    -v /path/to/shared/volume:/app/shared:rw \
                    -v /path/to/shared/volume/home:$HOME:rw \
                    [image-author]/[image-name]:[version-tag]
                ```
    - as current host user
        - Using docker-compose
            - Design docker-compose.yaml
                ```yaml
                version: "3.7"
                services:
                  gui:
                    image: gui:latest
                    container_name: gui
                    build:
                      context: .
                      dockerfile: gui.Dockerfile
                    network_mode: host # Passthrough to host system's network so that the container can communicate with the host system
                    restart: unless-stopped
                    tty: true # Equivlent to docker run's '-t' flag
                    environment:
                      ## Environment Variables
                      - DISPLAY=${DISPLAY} # Passthrough current host system's $DISPLAY environment variable which contains the virtual monitor running the Display Server session
                    volumes:
                      ## Mount volumes from host system to container
                      ## [host-system-volume]:[container-volume]:[permission]
                      ### Display Server
                      - /tmp/.X11-unix:/tmp/.X11-unix    # Mount X11 socket from host system to container for container to access information on the current Xorg session
                      - ~/.Xauthority:$HOME/.Xauthority  # For X11/Xorg magic cookie authorization and authentication
                      ### Hardware Device Files
                      - /dev/snd:/dev/snd                # Soundcard for audio passthrough
                      - /dev/shm:/dev/shm                # Passthrough the shared memory (shm = traditional Shared Memory) device; used as an efficient mean of passing data between programs (in this case, between host system and container)
                      - /run/dbus:/run/dbus              # Passthrough the running dbus from host system to container to enable communication between 2 or more processes on a single system or different systems (in this case, between host system and container)
                      ### Shared system volumes
                      - /path/to/shared/volume:/app/shared:rw # Shared Volume
                      - /path/to/shared/volume/home:$HOME:rw # Home directory
                      - /etc/passwd:/etc/passwd:ro       # User Management
                      - /etc/group:/etc/group:ro         # User Management
                    devices:
                      ## Passthrough devices directly into the container
                      ## [host-system-device]:[container-device]
                      - /dev/snd:/dev/snd : Passthrough Soundcard device from host system into container
                ```

            - Startup docker compose
                ```console
                docker-compose down; docker-compose up -d --build
                ```

        - Using docker run
            - build
                ```onsole
                docker build --tag=[author/name:version] -f [dockerfile] [context]
                ```
            - Startup container
                ```console
                docker run -itd --name=[container-name] \
                    --net=host \
                    --restart=unless-stopped \
                    -e DISPLAY=${DISPLAY} \
                    --device /dev/snd:/dev/snd \
                    ### Display Server
                    -v /tmp/.X11-unix:/tmp/.X11-unix \
                    -v ~/.Xauthority:$HOME/.Xauthority \
                    ### Hardware Device Files
                    -v /run/dbus:/run/dbus \
                    -v /dev/shm:/dev/shm \
                    ### Shared System Volumes
                    -v /path/to/shared/volume:/app/shared:rw \
                    -v /path/to/shared/volume/home:$HOME:rw \
                    -v /etc/passwd:/etc/passwd:ro \
                    -v /etc/group:/etc/group:ro \
                    [image-author]/[image-name]:[version-tag]
                ```

- Append into shell rc file
    - as root (Default)
        ```bash
        alias docker-gui-run="docker exec gui"
        alias [application-name]="docker exec -it gui [application-name]"
        ```
    - as the current user
        ```bash
        alias docker-gui-run="docker exec -it -u "$(id -u):$(id -g)" gui"
        alias [application-name]="docker exec -it -u "$(id -u):$(id -g)" gui [application-name]"
        ```

- Reload shell
    ```console
    source ~/.[shell]rc
    ```

- Execute application 
    - as root (Default)
        ```console
        docker exec -it gui [applications]
        ```
    - as the current user
        ```console
        docker exec -it -u "$(id -u):$(id -g)" gui [applications]
        ```

## Wiki

## Resources

## References
+ [baeldung - linux - Running GUI Applications in a Linux Docker Container](https://www.baeldung.com/linux/docker-container-gui-applications)
+ [howtogeek - devops - How to run GUI applications in a docker container](https://www.howtogeek.com/devops/how-to-run-gui-applications-in-a-docker-container/)

## Remarks

