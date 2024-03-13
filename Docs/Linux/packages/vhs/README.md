# VHS - TTY CLI screen recorder

```
Recording demo GIFs for software development documentation in Linux - Using the 'vhs' command line tool
```

## Information
### Background
+ Write terminal GIFs as code for integration testing and demoing your CLI tools.

### Project
- Repository URL: 
    + [Main source repository](https://github.com/charmbracelet/vhs)
+ Marketing Page: https://charm.sh/

### Container
- Docker Repository:
    + GitHub Container Repository: ghcr.io/charmbracelet/vhs
- Resources and Files:

### Operational Flow
1. Design the .tape animation configuration file
2. Stream the contents of the tape configuration file into VHS for recording and wait for the command to complete creating the GIF
    ```bash
    vhs < [tape-file].tape
    ```
3. Play the GIF file using your media players
    - i.e. 
        - mpv
            ```bash
            mpv output-file.gif
            ```

## Setup
### Docker
#### Dependencies
+ docker
+ docker-compose

#### Pre-Requisites

#### Using docker run
- Starting up
    ```bash
    docker run -itd --name=vhs \
        --restart=unless-stopped \
        -v /path/to/vhs:/vhs \
        ghcr.io/charmbracelet/vhs:[tag] [tape-name].tape
    ```

- Teardown/Shutdown
    ```console
    docker container stop vhs && docker container rm vhs
    ```

- Start a stopped container
    ```console
    docker container start vhs
    ```

- Stop a running container
    ```console
    docker container stop vhs
    ```

- Restart a running container
    ```console
    docker container restart vhs
    ```

#### Using docker-compose
- Prepare
    + Please refer to [Template - docker compose](#docker-compose) for more information

- Starting up
    ```console
    docker-compose up -d
    ```

- Teardown/Shutdown
    ```console
    docker-compose down
    ```

- Start a stopped container
    ```console
    docker-compose start vhs
    ```

- Stop a running container
    ```console
    docker-compose stop vhs
    ```

- Restart a running container
    ```console
    docker-compose restart vhs
    ```

### Host Machine
#### Dependencies
+ git
+ go
+ [ttyd](https://github.com/tsl0922/ttyd)
+ ffmpeg

#### Pre-Requisites

#### Installation
- Using package-manager
    - apt-based
        ```bash
        apt install vhs
        ```
    - pacman-based
        ```bash
        pacman -S vhs
        ```
    - Nix
        ```bash
        nix-env -iA nixpkgs.vhs
        ```
    - Void Linux
        ```bash
        sudo xbps-install vhs
        ```
    - brew
        ```bash
        brew install vhs
        ```
    - MacPorts
        ```bash
        sudo port install vhs
        ```
    - Scoop
        ```bash
        scoop install vhs
        ```

- Using go
    ```bash
    go install github.com/charmbracelet/vhs@latest
    ```

### Start server
- Serve VHS
    - Configuration Options
        + VHS_PORT: The port to listen on (1976)
        + VHS_HOST: The host to listen on (localhost)
        + VHS_GID: The Group ID to run the server as (current user's GID)
        + VHS_UID: The User ID to run the server as (current user's UID)
        + VHS_KEY_PATH: The path to the SSH key to use (.ssh/vhs_ed25519)
        + VHS_AUTHORIZED_KEYS_PATH: The path to the authorized keys file (empty, publicly accessible)
    ```bash
    vhs serve
    ```

### Accessing
- To access VHS from a different machine via SSH
    - Explanation
        - VHS has a built-in SSH server which lets you access the application as though it were installed locally
            + `ssh [vhs-server-ip|domain]` : Attempt to access the VHS application server while it is up
            - `< [casette].tape` : Pipe/Stream the input VHS tape to record and perform the recording
                - Information
                    - When you are done, 
                        + VHS will use the recorded VHS tape file and generate a GIF. 
                    - Afterwhich, 
                        + it will return the VHS tape back up the stream and output the GIF to standard output
            + `> [output].gif` : Pipe/Stream the standard output VHS tape-generated GIF file
    ```bash
    ssh [vhs-server-ip|domain] < [casette].tape > [output].gif
    ```

## Documentations

### VHS CLI
#### Synopsis/Syntax
- Default
    ```bash
    vhs {options} <arguments> [action|casette-tape-name] > [output-tape-casette].tape
    ```

- To stream the contents of the tape configuration file into VHS for recording
    ```bash
    vhs < [tape-file].tape
    ```

#### Parameters
- Positionals
    - action : Specify the action to execute
        + Type: String
        - Actions
            + new : Create a new '.tape' file
            + record : Record the terminal actions to a tape file
            + `publish [gif-file]` : Specify the gif file you wish to publish to the vhs servers for sharing
            + serve : Start the server
                - Information
                    - VHS has an SSH server built in! 
                        + When you self-host VHS you can access it as though it were installed locally. 
                        - VHS will have access to commands and applications on the host, 
                            + so you don't need to install them on your machine.
    - casette-tape-name : Generate a GIF from the specified tape
        + Type: String

- Optionals
    - With Arguments
    - Flags

#### Usage
- Create a new '.tape' file
    ```bash
    vhs new demo.tape
    ```

- Record to a tape file
    ```bash
    vhs record > casette.tape
    ```

- Generate GIF from tape file
    ```bash
    vhs casette.tape
    ```

- Publish GIFs to servers for sharing
    ```bash
    vhs publish [gif-file]
    ```

- To startup the built-in SSH server
    ```bash
    vhs serve
    ```

- To access VHS from a different machine via SSH
    - Explanation
        - VHS has a built-in SSH server which lets you access the application as though it were installed locally
            + `ssh [vhs-server-ip|domain]` : Attempt to access the VHS application server while it is up
            - `< [casette].tape` : Pipe/Stream the input VHS tape to record and perform the recording
                - Information
                    - When you are done, 
                        + VHS will use the recorded VHS tape file and generate a GIF. 
                    - Afterwhich, 
                        + it will return the VHS tape back up the stream and output the GIF to standard output
            + `> [output].gif` : Pipe/Stream the standard output VHS tape-generated GIF file
    ```bash
    ssh [vhs-server-ip|domain] < [casette].tape > [output].gif
    ```

### VHS Instructions
#### Keywords
+ `Output [output-gif-filename]` : Specify the name of the output animation file
- `Set {options} <value>` : Set the specifications of the output animation file
    - Options
        + `FontSize [size]` : Set the size of the foreground (text) font
        + `Width [width (horizontal-row)]` : Set the width of the animation background canvas
        + `Height [height (vertical-col)]` : Set the height of the animation background canvas
- `Type [system-commands-to-execute] [other-actions]` : Specify the commands/actions to execute in the animation
    - Positionals
        + system-commands-to-execute : Specify the system commands that you want to execute in the animation
        + other-actions : Specify other actions/keywords to execute
+ `Sleep [duration]` : Timeout/sleep for the duration specified; Format: N{s|ms} where s = Seconds, ms = Milliseconds etc etc
+ Enter : Run the command by pressing enter.
+ `Backspace [number-of-spaces]` : Go backwards/backspace [number-of-spaces] number of times
+ Ctrl+C : Execute 'Ctrl+C' which is to cancel the action
+ Ctrl+L : Clear the screen

### Configuration 
#### Example File
> Filename: demo.tape

```
# Where should we write the GIF?
Output demo.gif

# Set up a 1200x600 terminal with 46px font.
Set FontSize 46
Set Width 1200
Set Height 600

# Type a command in the terminal.
Type "echo 'Welcome to VHS!'"

# Pause for dramatic effect...
Sleep 500ms

# Run the command by pressing enter.
Enter

# Admire the output for a bit.
Sleep 5s
```

### Environment Variables
+ VHS_PORT: The port to listen on (1976)
+ VHS_HOST: The host to listen on (localhost)
+ VHS_GID: The Group ID to run the server as (current user's GID)
+ VHS_UID: The User ID to run the server as (current user's UID)
+ VHS_KEY_PATH: The path to the SSH key to use (.ssh/vhs_ed25519)
+ VHS_AUTHORIZED_KEYS_PATH: The path to the authorized keys file (empty, publicly accessible)

### Networking
#### Port Forwarding/Translation/Mapping

## Wiki
### Filesystem Structure
#### Folders
- /vhs : VHS Application Directory

#### Files 


### Docker mappings
#### Default Volumes
+ /path/to/vhs:/vhs # VHS application directory

### Templates
#### docker compose
```yaml
version: "3.7"
services:
  vhs-tty-recorder:
    image: ghcr.io/charmbracelet/vhs
    container_name: vhs-tty-recorder
    # ports:
      ## Port Forward/Translate/Map from host system to container
      ## [host-ip-address]:[host-system-port]:[container-port]
    volumes:
      ## Mount volumes from host system to container
      ## [host-system-volume]:[container-volume]:[permissions]
      - ${PWD}/vhs:/vhs # VHS application directory
```

### Notes and Findings

## Resources

## References
+ [GitHub - charmbracelet/vhs : VHS Command Reference](https://github.com/charmbracelet/vhs#vhs-command-reference)
+ [YouTube - The Git Guild - How To Create Beautiful Command Line Animations with VHS](https://www.youtube.com/watch?v=AZpdMp_n624)

## Remarks

