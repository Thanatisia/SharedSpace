# Rust compiler docker

## Information
### Docker image
+ Author: Rust
+ Image: Rust
+ Repository URL: https://hub.docker.com/_/rust
- Documentation Pages:
    + [Rust Book](https://doc.rust-lang.org/book/)

## Setup
### Pre-Requisites
+ have your Rust code ready
- Rust project work structure/filesystem
    - Must include the following
        + Cargo.toml

### Dependencies
+ docker(-ce)
+ docker-compose

## Documentation
- Pull latest image
    ```console
    docker pull rust
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
- Invoke cargo commands in container
    - Create new project
        ```console
        docker exec -it [container-name] /bin/bash -c "cargo new [project-name]"
        ```

## Resources

## References
+ [FreeCodeCamp - How to mount local directories using `docker run -v`](https://www.freecodecamp.org/news/docker-mount-volume-guide-how-to-mount-a-local-directory/#:~:text=You%20bind%20local%20directories%20and,source%3E%3A%20.)
+ [DOcker blogs - Simplify your deployments using the rust official image](https://www.docker.com/blog/simplify-your-deployments-using-the-rust-official-image/)

## Remarks


