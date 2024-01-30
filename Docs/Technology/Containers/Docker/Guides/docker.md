# Docker command

## Setup

### Dependencies
+ docker

### Pre-Requisites
+ Prepare Dockerfile: If you are building your own image

### Security and User Permissions
- Add docker user to group 'dockergroup'
    + To be able to use docker without 'sudo'
    ```console
    adduser -aG dockergroup [username]
    ```

## Documentation

### System Services
+ docker

### Synopsis/Syntax

```console
sudo docker {actions} [image-name]
```

### Parameters
- `build {options} <arguments> [path-to-build]` : Build a container/image recipe found in the specified path; To be replaced with buildx (if possible)
    - Options
        - With Arguments
            - `-t [target-image (author/image-name)]` : Specify the target image
            - `--build-arg ARCH=[target-architecture]`: Specify the target platfom/architecture you want to multiarch build for using docker manifests
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
- compose {options} : Implementation of 'docker-compose' within docker itself (released in a latest version of docker)
    - Options
        + Same as docker-compose
+ images : To list all available Docker images on your host
+ info : To get information about docker
- inspect : `docker inspect` prints out the details of a specified docker container
    - Synopsis/Syntax
        ```console
        docker inspect {options} [container-name]
        ````
    - Options
        + TBC
+ network {options} : Display Network Information and Handle Docker networks
	- Options
		+ create {options} {bridge-templates} [new-bridge-name] : To create a new bridge network by using existing networks as templates. Using user-defined bridge networks allows the user to control which containers can communicate with each other and containers can be connected to multiple networks at the same time
			- Options
				+ --driver : Create bridge network
                + --subnet [subnet-mask/prefix] : Specify the subnet mask/prefix for this new docker network
		+ ls : List the networks 
		+ inspect [network interface] : See information about the specified network
+ stats {options} [container ID...] : To get access to CPU, memory, network and disk utilization for all of the containers running on your host (or the specified containers if provided); You may specify as many container IDs as you want
	- Options
		+ --all : Displays stopped containers
		+ --no-steam : To get a one-time snapshot of current container resource usage
+ version : To get information about docker version
+ container : Manage docker containers
+ volume : Manage docker volumes
+ ps {options} : To display information of the running and stopped container processes
	- Options
		+ -l : To display a list of the running and stopped containers
+ attach [Container ID] : Attach the shared folder of the specified container ID to your host shared folder at container run-time; Any file you add to this directory will be available from the host folder
+ commit [target container ID] [new-image-name] : To commit the changes made in the specified *container ID/name* and create a new image named *new-image-name*; please use *ps -l* to display all running and stopped containers to get the container ID/name.
+ exec {options} [Container ID/name] {command} : Run a command in a running container
	- Options
		+ -i : Interactive Mode
		+ -t : Run in terminal
+ rm [container ID] : To remove/delete a container and start from scratch
+ rmi [image-name] : To *remove image*
+ run {options} [image-name] {(optional) commands...} : Start running the specified image/container and execute the commands specified (if any)
	- Options
		+ -d : Start as a daemon (Backend Service)
		+ -i : Start Interactive Mode; Corresponds with a docker-compose's "stdin" keyword
		- -p [port-number] : Start using a specific Port Number
		    + -p [host-system-port]:[container-port] : To Port Forward and expose a specified internal port within the Docker container to an external port on the host system
		+ -t : Run in terminal; Corresponds with docker-compose's "tty" keyword
                + -u : Set the user id and group id of the user to use; Corresponds with docker-compose's "user" keyword
                    + Format: "[user-id]:[group-id]"
                    + Recommended Values : "$(id -u):$(id -g)"
		+ -v [host-directory]:[container-volume]:[permissions] : To attach the specified host directory to the specified container volume location located in the container's filesystem; Used for storage sharing between container and host; Corresponds to docker-compose'd "volumes" keyword
        + --device=[disk-label] : Adding/Passthrough the disk/devices to container; If you require a chroot environment for disk partition and management (i.e. formatting)
		+ --name=[Container ID] : Provide a specific Container ID as the name of the container; aka Set container name
		+ --network=[bridge-name] : Specify the Network Bridge Interface for the container to use; aka Run Docker container with a specific network
		+ --rm : Delete the container created and its cache after the Docker instance has ended
+ search [image-name] : To search for a docker image called the specified *image-name*
+ start [Container ID or name] : Start the specified container. Note: You will need to get the container id/name to start a specific container, please use *ps -l* to display all running and stopped containers to get the container ID/name.
+ stop [Container ID or name] : Stop the specified container. Note: You will need to get the container id/name to start a specific container, please use *ps -l* to display all running and stopped containers to get the container ID/name.
+ pull [target-image-name] : To "pull" and download the specified target image locally
+ default (Empty) : Get a list of all available docker commands

### Usage
- Building the Container  
    + This command will output and return you the image ID  
    ```console
    docker build [folder-to-build]
    ```

- Creating a named image
    ```console
    docker run --name [your_container_name] {your-container-id}
    ```

- To list all images
    ```console
    docker image ls
    ```
    
- To list existing running docker container processes
    ```console
    sudo docker ls
    ```
    
- To startup a docker container
    ```console
    sudo docker run --name [container-name] -itd -p [host-port:container-port] [image-name]
    ```
    
- To create a new docker network
    ```console
    sudo docker network create [network-name] --subnet [subnet-mask/prefix]
    ```

## Wiki
### Snippets and Examples
#### Basic Operations
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

#### Analysis
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

#### Building
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

#### Testing
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

#### System Device and Disk Operations
- Adding/Passthrough the disk/devices to container
    - Information
        - If you require a chroot environment for disk partition and management (i.e. formatting)
    - Examples
        - SATA/AHCI
            ```console
            --device=/dev/sdX
            ```
        - NVME
            ```console
            --device=/dev/nvme[device-number]
            ```
        - Loopback Device
            ```console
            --device=/dev/loop[device-number]
            ```
    ```console
    docker run -itd --name="container-name" --device=[disk-label] image:tag
    ```


## Resources

## References
+ [Docker Documentations - Command Line - Add Host device to container device](https://docs.docker.com/engine/reference/commandline/run/#add-host-device-to-container-device)
+ [StackOverflow - how to run arm64 docker images on amd64 host platform](https://stackoverflow.com/questions/68675532/how-to-run-arm64-docker-images-on-amd64-host-platform?rq=3)
+ [How to mount a device of host to host in a Docker container](https://stackoverflow.com/questions/38736319/how-to-mount-a-device-of-host-to-host-in-a-docker-container)

## Remarks
