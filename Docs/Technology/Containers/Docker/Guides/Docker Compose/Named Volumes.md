# Docker - Named Volumes

## Introduction
### Basics
- Volumes
    ```
    In docker, volumes - similar to the concept of "Volumes" in disks - are effectively folders that are allocated/mounted from the host system into the container for use.

    Generally, volumes is one way among others to share files from the host system to the container. 

    Personally - I have not found a way to do it the other way around, to share files from the container to the host system, thus, do update me if there is a way.
    ```

### Named Volumes
```
Named Volumes in docker-compose, is a way of mounting volumes within the docker-compose environment without specifying a volume folder.
    - This is similar to making an alias for the volume you wish to mount into the container.

By default:
    - Named Volumes will be created in the folder directory : '/var/lib/docker/volumes'
```

## Documentation
### Synopsis/Syntax
- docker-compose
    ```yaml
    version: "3"

    volumes:
	[named-volume-alias]:
	    # All of these are optional, just leave them empty to be default
	    driver: {local}
	    

    services:
	service_name:
	    image: [author/image]
	    volumes:
	        # [host-system-path]:[container-path]
	        - [named-volume-alias]:/path/in/container
    ```

## Snippets

## Wiki
### Optional Named Volume Keys
+ driver : The type of volume you want to create
- driver_opts : The driver options/settings
    + type : driver type (default : 'none')
    + o : driver 
	- Valid Values:
	    + 'bind' : For Bind Mount
    + device : Define the custom path to mount the volume 

## Resources

## References
+ [Stackoverflow - How to set a path on host for a named volume in docker-compose yaml](https://stackoverflow.com/questions/36387032/how-to-set-a-path-on-host-for-a-named-volume-in-docker-compose-yml)

## Remarks