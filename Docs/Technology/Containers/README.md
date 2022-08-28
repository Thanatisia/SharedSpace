# Containers

## DESCRIPTION
```
a Container is (generally) an isolated environment whereby it is basically a Virtual Machine but utilizes less RAM and is quicker than the general Virtual Machine by utilising the host OS' kernel.

With containers, developers (and system administrators) can package up an application with everything needed to run the application 
i.e.
	– the code, 
	- run-time, 
	- libraries, 
	- environment variables, and 
	- configuration files, 
and ship it all out as one package

A simple way of explaining container is that it packages an application so it can be run, with its dependencies, isolated from other processes.
```

## Types of Containers
+ Docker : Cross-platform; rovides one OS environment, supplied by the Docker Engine, and enables developers to easily run applications that reside in their own application environment which is specified by a docker image
+ LXC : Open source project of LinuxContainers.org; which launches an operating system init for each container

