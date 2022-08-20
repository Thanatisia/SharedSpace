# Docker command

## Setup

### Pre-Requisites
+ Dockerfile

## Documentation

### Services
+ docker

### Synopsis/Syntax

```console
sudo docker {actions} [image-name]
```

### Parameters
+ build [path-to-build] : Build a container/image recipe found in the specified path
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
+ run {options} [image-name] {(optional) commands...} : Start running the specified image and execute the commands specified (if any)
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
- Building the Container  
    + This command will output and return you the image ID  
    ```console
    docker build [folder-to-build]
    ```

- Creating a named image
    ```console
    docker run --name [your_container_name] [your-container-id]
    ```


