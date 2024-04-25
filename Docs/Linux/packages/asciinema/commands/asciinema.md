# Linux package - asciinema command: asciinema

## Information
### Project
+ Package Author: asciinema
+ Package Name: asciinema
- Repositories
    - GitHub
        + [asciinema/asciinema](https://github.com/asciinema/asciinema)

### Description
- Asciinema is a Terminal screen recorder CLI utility that records not as a video, but the typing of the commands itself.
    + This means that asciinema allows for terminal replayability.
    + Asciinema also has a asciienma '.cast' recording file repository WebUI for uploading all your recordings up to for easy access
+ Asciinema also allows you to rerecord the terminal recording locally

## Supported Formats
+ GIF : Animated images

## Setup
### Dependencies
+ python
+ python-pip
+ python-venv
- Python packages/dependencies
    + asciinema

### Pre-Requisites
- Create Python Virtual Environment
    - Generate Virtual Environment
        ```bash
        python3 -m venv [virtual-environment-name]
        ```
    - Chroot into Virtual Environment
        - Linux
            ```bash
            . [virtual-environment-name]/bin/activate
            ```
        - Windows
            ```bash
            .\[virtual-environment-name]\Scripts\activate
            ```

- Installing locally
    - Using requirements.txt file
        - Create a requirements.txt file
            ```
            asciinema
            ```
        - Install python packages and dependencies
            ```bash
            python3 -m pip install -Ur requirements.txt
            ```

## Documentations
### Synopsis/Syntax
```bash
asciinema [action] {optionals} <arguments>
```

### Parameters
- Positionals
    - action : Specify an action to execute with Asciinem
        - Actions
            - `rec {options} <arguments> [output-terminal-recording-file]` : Begin recording the terminal and writing the video stream into the output terminal recording file
                - Parameters
                    - Positionals
                        - output-terminal-recording-file : Specify the file name of the output terminal recording file
                            + Type: String
                    - Optionals
                        - With Arguments
                            + `-c [command-to-execute]` : Execute a command in the recording
                        - Flags

- Optionals
    - With Arguments
    - Flags

### Usage
- Record the terminal locally
    - Record the specified command in the terminal locally into the recording file
        ```bash
        asciinema rec -c [command-to-execute] output.cast
        ```
    - Overwrite existing files
        ```bash 
        asciinema rec --overwrite output.cast
        ```

## Resources
+ [GitHub - asciinema/asciinema](https://github.com/asciinema/asciinema)
+ [GitHub - asciinema/agg](https://github.com/asciinema/agg)

## References
+ [GitHub - treyhunner/dramatic - screenshots - README](https://github.com/treyhunner/dramatic/tree/main/screenshots#readme)

## Remarks

