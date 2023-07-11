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

