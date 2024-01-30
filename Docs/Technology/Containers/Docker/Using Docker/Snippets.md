# Using Docker - Snippets and Examples

## Setup
### Dependencies
+ docker
+ (Optional) docker-compose: Unnecessary if you are running docker version >= 24

## GUI    
- Pre-Requisites
    - display server is installed
        + xorg
        + wayland

- Run GUI container from a docker container
    - Explanation
        - `-itd`:
            + `-d` : Run as a daemon; Startup in the background
            + `-i` : Startup interactive mode; Open up in interactive mode if executed
            + `-t` : Enable TTY mode; Stay in tty after finishing command
        - `-e DISPLAY=$DISPLAY`: 
            - Similar to running GUI applications from the tty; We must provide the container with a DISPLAY environment variable. 
                + This basically directs the display server and tells it which display to connect to
                + '$DISPLAY' is the value of `DISPLAY` on your host
            - Summary: Parse and "Map" your host display into the container's "Display"; 
                - The container will then display the GUI when executed which will in-turn, 
                    + open in your host display
        - `-v /tmp/.X11-unix/:/tmp/.X11-unix/`:
            - This will provide a docker container with access to your host's display server socket; in this case - X socket
                 + The X socket can be found in '/tmp/.X11-unit' on your host
                 + The contents of this directory should be mounted into a Docker volume assigned to the container
    ```console
    docker run -itd -e DISPLAY=$DISPLAY -v /tmp/.x11-unix/:/tmp/.X11-unix/ --name [your-custom-container-name] [image]
    ```

## Create a chroot environment using a container
- Explanation
    + Docker, and containers in general, is a good way to creating a distro-agnostic root filesystem/chroot environment for various distributions

- Use Cases
    + If you want to install ArchLinux via the command line through bootstrapping (pacstrap; ArchLinux-style) in a non-ArchLinux system

### Steps
- Pull latest image
    ```console
    docker pull [image]:latest
    ```

- Startup a container
    - Using docker run
        - Explanation
            - Startup an ArchLinux docker container with the name 'arch-chroot'
            - Parameters
        ```console
        docker run -itd --name=arch-chroot {other-options} archlinux:latest
        ```

- Chroot (Change root) into the container
    ```console
    docker exec -it [container-name] [shell]
    ```

- Stop container
    ```console
    docker stop [container-name]
    ```

- Remove container
    ```console
    docker rm [container-name]
    ```

- View container information
    ```console
    docker inspect [container-name]
    ```

- List container processes
    ```console
    docker ps [container-name]
    ```

### Optional Useful Settings
- Adding/Passthrough the disk/devices to container
    - Information
        - If you require a chroot environment for disk partition and management (i.e. formatting)
    - Examples
        - SATA/AHCI
            ```console
            --device=/dev/sdX
            ```
        - NVME
            ```console
            --device=/dev/nvme[device-number]
            ```
        - Loopback Device
            ```console
            --device=/dev/loop[device-number]
            ```
    ```console
    --device=[disk-label]
    ```

- Mount volumes from the host system to the container
    - Using docker run 
        ```console
        -v "[host-system-source-volume]:[container-destination-volume]:[permission]"
        ```


