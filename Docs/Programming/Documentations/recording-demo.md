# Recording Demo for Software/Project Docuemntations

## Formats
+ GIF : Animated images

## Documentations
### Demo Gifs
- To rerecord the terminal recording locally:
    - Using asciinema
        - Setup
            - Dependencies
                + python
                + python-pip
                + python-venv
                - Python packages/dependencies
                    + asciinema
            - Pre-Requisites
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
                - Install python packages and dependencies
                    ```bash
                    python3 -m pip install -Ur requirements.txt
                    ```
        - Record the terminal locally
            - Explanation
                - Synopsis/Syntax
                    ```bash
                    asciinema [action] {optionals} <arguments>
                    ```
                - Parameters
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
            - Usage
                - Record the specified command in the terminal locally into the recording file
                    ```bash
                    asciinema rec -c [command-to-execute] output.cast
                    ```

- To generate a GIF image:
    - Regenerate from the asciinema terminal recording file
        - Using asciinema-agg
            - Setup
                - Dependencies
                    + rustc
                    + cargo
                - Pre-Requisites
                - Install agg
                    - using cargo
                        - This will
                            + download source code
                            + build agg binary and
                            + install it in `$HOME/.cargo/bin`
                        ```bash
                        cargo install --git https://github.com/asciinema/agg
                        ```
            - Explanation
                - Synopsis/Syntax
                    ```bash
                    agg {options} <arguments> [asciinema-terminal-recording-cast-file] [output-animation-gif-file]
                    ```
                - Parameters
                    - Positionals
                        + asciinema-terminal-recording-cast-file : Specify the target terminal recording .cast file you want to convert into a static animation gif file
                        + output-animation-gif-file : Specify the output file name of the animation gif
                    - Optionals
                        - With Arguments
                            - `--cols [number-of-columns]` : Horizontal size (width of the animation canvas)
                            - `--rows [number-of-rows]` : Vertical size (Height of the animation canvas)
                            - `--font-family [font-family]` : Specify font family of your target font
                                - Notes
                                    - Finding Font Family:
                                        - Using fc-list
                                            ```bash
                                            fc-list
                                            ```
                            - `--font-size [font-size]` : Specify the font size to render the texts in the animation
                            - `--theme [theme]` : Specify the theme to apply to the background of the gif
                                - Example Themes
                                    + solarized-light
                                    + monokai
                        - Flags
            - Usage
                - Convert the terminal recording into an animated demo gif with a 'solarized-light' theme
                    ```bash
                    agg --theme solarized-light [terminal-recording-cast-file.cast] [output-animation-gif-file.gif]
                    ```
                - Convert the terminal recording into an animated demo gif with a 'monokai' theme
                    ```bash
                    agg --theme monokai [terminal-recording-cast-file.cast] [output-animation-gif-file.gif]
                    ```
                - Convert the terminal recording into an animated demo gif with a width of 71, height of 13, font size 16
                    ```bash
                    agg --cols 71 --rows 13 --font-size 16 [terminal-recording-cast-file.cast] [output-animation-gif-file.gif]
                    ```
                - Convert the terminal recording into an animated demo gif with a specific font family
                    - Explanation
                        - font-family
                            - To find the font family
                                - Using 'fontconfig'
                                    ```bash
                                    fc-list
                                    ```
                    ```bash
                    agg --font-family "font-family" [terminal-recording-cast-file.cast] [output-animation-gif-file.gif]
                    ```

## Resources
+ [GitHub - asciinema/asciinema](https://github.com/asciinema/asciinema)
+ [GitHub - asciinema/agg](https://github.com/asciinema/agg)

## References
+ [GitHub - treyhunner/dramatic - screenshots - README](https://github.com/treyhunner/dramatic/tree/main/screenshots#readme)

## Remarks

