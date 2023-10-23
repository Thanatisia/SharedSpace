# Containerization : Docker

## Information
### Images
- Repositories
    + [Github Repository - jupyter/docker-stacks](https://github.com/jupyter/docker-stacks)

## Documentation
### Synopsis/Syntax
- Pull latest image
    ```console
    docker pull {base-notebook | datascience-notebook | minimal-notebook}
    ```

- (OPTIONAL) Build Dockerfile image
    + If you have a custom Dockerfile image builder
    ```console
    docker build -t [docker-image-name] [dockerfile-path]
    ```

- Run docker image
    - General background
        ```console
        docker run -itd --name [container-name] [image-name] {other-commmands}
        ```

    - Run docker image with volume mapping (Recommended)
        ```console
        docker run -itd -v "[host-system-volume]:[container-volume]"  --name [container-name] [image-name] {other-commmands}
        ```

- Stop docker container
    ```console
    docker container stop [container-name]
    ```

- Remove docker container
    ```console
    docker container rm [container-name]
    ```

- Remove docker image
    ```console
    docker image rm [container-name]
    ```

### Debugging
- Check issues with docker container
    - Check container process
        ```console
        docker (container) ps
        ```
    - Check docker container logs
        ```console
        docker logs [container-name]
        ```

### Executing


## Resources

## References
+ [FreeCodeCamp - How to mount local directories using `docker run -v`](https://www.freecodecamp.org/news/docker-mount-volume-guide-how-to-mount-a-local-directory/#:~:text=You%20bind%20local%20directories%20and,source%3E%3A%20.)
+ [Jupyter Docker Documentations - Main Page and Quick Start](https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html)

## Remarks
