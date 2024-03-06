# Linux utilities - Media - mpv

```
mpv is a popular minimal Media player that is widely used by Linux distributions for playing videos from the command line
```

## Information
### Project
+ Application Name: mpv
+ Application Type: Media (Music/Video) Player

## Setup
### Dependencies
### Pre-Requisites
### Installation
- Using package manager
    - apt-based
        ```console
        apt install mpv
        ```
    - pacman-based
        ```console
        pacman -S mpv
        ```

## Documentations
### Synopsis/Syntax
```console
mpv --vo=null [target-video-filename]
```

### Parameters
- Positionals
    + target-video-filename : Specify a target video to play
- Optionals
    - With Arguments
        + `--vo=[video-output]` : Specify a Video output stream; Set as 'null' to remove video and play audio only
    - Flags

### Usage
- Play only the audio from a video
    ```console
    mpv --vo=null [target-video-filename]
    ```

## Wiki

## Resources

## References

## Remarks

