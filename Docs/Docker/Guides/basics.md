# Docker Basics

Some basic concepts for starting with Docker

## Information

### Packages
+ Package Name : docker-ce (Debian), docker (Arch)
+ Package Author : docker
+ Groups : docker
- Default File Locations
	+ Docker Image Storage : /var/lib/docker

### DESCRIPTION

```
Docker is a popular Open Source OS-level Virtualization Software. 

Commonly known as a "Container", a Container is (generally) an isolated environment whereby it is basically a Virtual Machine but utilizes less RAM and is quicker than the general Virtual Machine by utilising the host OS' kernel.

With containers, developers (and system administrators) can package up an application with everything needed to run the application 
i.e.
	– the code, 
	- run-time, 
	- libraries, 
	- environment variables, and 
	- configuration files, 
and ship it all out as one package
```

## Setup
### Pre-Requisites

- Update your package manager
	- Debian-based (apt)
		```console
		sudo apt update && sudo apt upgrade
		```
	- Arch-based (pacman)
		```console
		sudo pacman -Syu
		```

- If you are using Debian-based (apt)
	- Download the GPG key
		```console
		curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
		```
	- Add the following repository into the apt list
		+ deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable
			```console
			sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
			```

### Dependencies

### Installing
- If you are using a Package Manager
	- Debian-based (apt)
		```console
		sudo apt install docker-ce docker-ce-cli containerd.io
		```
	- Arch-based (pacman)
		```console
		sudo pacman -S docker
		```

### Post Installation

#### To run Docker as a regular user
+ By default, you can run Docker only as root
- Create docker group
	```console
	groupadd docker
	```
- Add yourself to the docker group
	```console
	# Add user to a supplementary group 'docker'
	usermod -aG docker [your-username]

	# or
	gpasswd -a [your-username] docker
	```

#### To change location of Docker images
- If you are using SystemD
	- Stop the Docker Daemon
		```console
		systemctl stop docker.service
		```

	- (OPTIONAL) Move images to the target destination (if any)
		```console
		sudo mv /var/lib/docker/* [target-destination]
		```

	- Add the following parameters to the ExecStart in */etc/systemd/system/docker.service.d/docker-storage.conf*
		```console
		ExecStart=/usr/bin/dockerd --data-root=/path/to/new/location/docker -Hfd://
		```

	- Start the Docker Daemon
		```console
		systemctl start docker.service
		```
	

## Documentation

### Services
+ docker

### Synopsis/Syntax

```console
sudo docker {actions} [image-name]
```

### Parameters
+ images : To list all available Docker images on your host
+ info : To get information about docker
+ network {options} : Display Network Information
	- Options
		+ create {arguments} [bridge-templates] [new-bridge-name] : To create a new bridge network by using existing networks as templates. Using user-defined bridge networks allows the user to control which containers can communicate with each other and containers can be connected to multiple networks at the same time
			- Arguments
				+ --driver : Create bridge network
		+ ls : List the networks 
		+ inspect [network interface] : See information about the specified network
+ stats {options} [container ID...] : To get access to CPU, memory, network and disk utilization for all of the containers running on your host (or the specified containers if provided); You may specify as many container IDs as you want
	- Options
		+ --all : Displays stopped containers
		+ --no-steam : To get a one-time snapshot of current container resource usage
+ version : To get information about docker version
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
+ run {options} [image-name] {commands...} : Start running the specified image and execute the commands specified (if any)
	- Options
		+ -d : Start as a daemon (Backend Service)
		+ -i : Start Interactive Mode
		+ -p [port-number] : Start using a specific Port Number
		+ -t : Run in terminal
		+ -v [host-directory]:[container-volume] : To attach the specified host directory to the specified container volume location located in the container's filesystem; Used for storage sharing between container and host
		+ --name=[Container ID] : Provide a specific Container ID as the name of the container
		+ --network=[bridge-name] : Specify the Network Bridge Interface for the container to use
+ search [image-name] : To search for a docker image called the specified *image-name*
+ start [Container ID or name] : Start the specified container. Note: You will need to get the container id/name to start a specific container, please use *ps -l* to display all running and stopped containers to get the container ID/name.
+ stop [Container ID or name] : Stop the specified container. Note: You will need to get the container id/name to start a specific container, please use *ps -l* to display all running and stopped containers to get the container ID/name.
+ pull [target-image-name] : To "pull" and download the specified target image locally
+ default (Empty) : Get a list of all available docker commands

### Usage

## Resources
+ [LinuxHint - ArchLinux Docker Tutorial](https://linuxhint.com/arch-linux-docker-tutorial/)
+ [tecmint - Install docker and run docker containers in Ubuntu](https://www.tecmint.com/install-docker-and-run-docker-containers-in-ubuntu/)
+ [DockerHub - A central storage for all Docker Images](https://hub.docker.com/)

## References

## Remarks