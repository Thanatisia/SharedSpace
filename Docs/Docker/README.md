# Docker Documentations

Compilation of Documentation, Guides, Tips n Tricks and Basics on Docker

## Table of Contents
- [Information](#information)
- [Resources](#resources)
- [References](#references)
- [Remarks](#remarks)

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

### Kickstart Steps
> Some starting steps
+ [Docker Setup](Guides/setup.md)
+ [Docker Basics](Guides/basics.md)
+ Creating a *Dockerfile*
+ [Creating your first image](Guides/making-your-own-image.md)
+ Creating your first container

## Resources
+ [LinuxHint - ArchLinux Docker Tutorial](https://linuxhint.com/arch-linux-docker-tutorial/)
+ [tecmint - Install docker and run docker containers in Ubuntu](https://www.tecmint.com/install-docker-and-run-docker-containers-in-ubuntu/)
+ [DockerHub - A central storage for all Docker Images](https://hub.docker.com/)

## References

## Remarks