# Docker - Basics

## Characteristics
- Docker Containers, as the name suggests, is isolated, has their own processes, Memory and network
- Dockers share the same underlying kernel
    + this means that if you're using a Linux Distribution, containers will use the same Linux Kernel, making it very efficient and fast
    + this also means that if you want to pull a Windows-based docker image like Windows server, you need to use a Windows host.

- Pros
    - Uses the same underlying kernel as your default system for all containers
        + Fast
        + Efficient
        + Simple 
        + Lightweight
- Cons
    + Cannot pull a windows-based image/container if using a linux-based system and vice versa

## Uses in the Industry
- Microservices
    - Taking portion of an application stack
        + Segmenting them into smaller bits and pieces
    - Examples
        - Multiserver Home Lab/Server
            + Creating a Docker container for Web Server
            + Creating a Docker container for Email Server
            + Creating a Docker container for Media Server
            + Creating a Docker container for NAS File Sharing Server (Samba)
            + Creating a Docker container for IPSec VPN Server

## Structure
- Docker usage
    ```
	[host system]
	  |
	  |--- docker pull [image-name] : Pull a specified image to the docker database; used to update your pulled images
		|
		|--- docker run {flags} --container-name="container_name" [image-name] : Run and startup the image name as a custom container name (optional; recommended)
			|
			|--- docker exec {flags} [container_name] [command] : Execute a command within the container; execute the shell (i.e. /bin/bash) to chroot and enter the terminal.
    ```

- Dockerfile:docker-compose usage
    ```
	[host system]
	  |
	  |--- Dockerfile : Used to design and create a docker image
		|
		|-- docker build : Build the docker image from the Dockerfile specifications
			|
			|-- docker-compose.yaml : The docker-compose file, used to automatically create all the docker containers specified in the compose file in a single docker-compose environment
				|
				|-- docker-compose up -d --build : Startup the docker-compose environment and create all the specified containers in the docker-compose file; --build is to build the Dockerfile path specified in the container definitions.
    ```

## Resources
+ [YouTube | NetworkChuck | You need to learn Docker RIGHT NOW //Docker Containers 101](https://youtu.be/eGz9DS-aIeY)
+ [YouTube | takacsmark | Dockerfile Tutorial by Example - ( Part I - Basics )](https://www.youtube.com/watch?v=6Er8MAvTWlI)
+ [Docker Hub](hub.docker.com)

## References

## Remarks
