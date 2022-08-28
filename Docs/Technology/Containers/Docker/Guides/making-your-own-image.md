# Docker - Custom Base Image

## Information
### DESCRIPTION
```
Dockerfiles are like recipes to 
automate/simplify the creation of a 
custom Base image.
```
### Components of a Base Image
- Base Distribution
    + A GNU/Linux base distribution of your choice to build on top of; contains the filesystem of a base Linux Installation
+ Commands to execute when running the image/to create the container


## Docker Image/Container
> Steps to create your own Docker image/container with Dockerfile
- (OPTIONAL) Creating Dockerfile
    ```console
    FROM distribution
    CMD ["echo", "Hello World"]
    ```

- Building the Container  
    + This command will output and return you the image ID  
    ```console
    docker build [folder-to-build]
    ```

- Creating a named image
    ```console
    docker run --name [your_container_name] [your-container-id]
    ```

## Wiki
### Distributions
+ Alpine Linux (Popular; Small)
+ ArchLinux
+ Debian
+ Ubuntu

### Recipes
- Base Image/Container
    ```
    FROM distribution
    CMD ["echo Hello World"]
    ```

## References

## Resources
+ [YouTube | River Lynn Bailey | Creating your first Dockerfile, image and container](https://youtu.be/hnxI-K10auY)

## Remarks