# Rust with docker-compose

* Write-up, Documentation, snippets and examples of working with Rust using docker-compose

## Information
### Basics
- When it comes to docker-compose, docker-compose's forte is in working with multiple docker services all in one 'docker-compos' environment file
    + This allows you to startup, teardown, start and stop services within the docker-compose environment as though they are one entity
- However, typically when it comes to Development/Programming services, 
    - these includes the following categories
        + Compilers
        + Programs running as servers 
        + etc
    - These can come in many forms, some will exit immediately after execution of commands, some purposes will require it to stay up
        - Such as
            1. execute a specific command and the container will die (i.e. using a specific command from a compiler/interpretor/CLI utility)
            2. Stay up so the user can keep using it (i.e. Compilers)

## Documentation
### Important Key-Values
> The following are several basic key-values required to running rust without a dockerfile and staying up without exitting automatically
- `tty: true` : Corresponds to 'docker run -it'; this basically tells the container to stay in the tty (i.e stdin) after execution of any commands and stay up unless user exits
    - Useful for
        + Compilers : When you require to manually control what commands to execute on startup
    - Benefits of not using this : Assuming 'restart: {always|unless-stopped|never}' is not specified; Not using this will mean that upon completion of the command, the container will exit
        + CLI Utilities : Because of the above property, CLI utilities that executes only once and exits are good candidates to generally not have `tty: true`
        + Specific commands of a container's entrypoint : For example, if you are executing `commands: cargo build --release`, not including `tty: true` will cause the container to exit once the compilation is completed.
- `working_dir: '/container/new/working/directory'` : Corresponds to Dockerfile's 'WORKDIR' action; This sets the container's custom starting working directory
    - Useful for
        + if you want to perform an action at a specific directory
- `volumes` : Corresponds to 'docker run -v [host-system-volume]:[container-volume]:[permission]'; This maps and mounts the specified host system volume to the container specified volume path; This will effectively link the host system to the container and you can retrieve, modify and backup files on both sides (if is mounted)
    - Useful for
        + Programming : Basically you can change the source code on the host system (yours) side, and the file in the container's side will also be changed

## Snippets and Examples
- Baseline snippets to running rust without any commands and staying up/alive
    ```yaml
    version: "3.5"
    services:
        rust:
            image: rust:latest
            container_name: rust
            restart: unless-stopped
            tty: true
            working_dir: "/rust/app"
            volumes:
                - "./rust/app:/rust/app"
    ```

- Run specific command and immediately exit
    ```yaml
    version: "3.5"
    services:
        rust:
            image: rust:latest
            container_name: rust
            working_dir: "/rust/app"
            volumes:
                - "./rust/app:/app"
            command: "cargo build --release"
    ```

## Resources

## References

## Remarks


