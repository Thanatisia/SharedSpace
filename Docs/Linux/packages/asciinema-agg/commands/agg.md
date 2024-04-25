# Linux package - asciinema-agg command: agg

## Information
### Project
+ Package Author: asciinema
+ Package Name: agg
- Repositories
    - GitHub
        + [asciinema/agg](https://github.com/asciinema/agg)

### Description
- Asciinema is a Terminal screen recorder CLI utility that records not as a video, but the typing of the commands itself.
    + This means that asciinema allows for terminal replayability.
    + Asciinema also has a asciienma '.cast' recording file repository WebUI for uploading all your recordings up to for easy access
    + Asciinema also allows you to rerecord the terminal recording locally
- asciinema-agg - Asciinema GIF Generator (agg) - is the asciinema terminal screen recorder converter created by the asciinema developers (and part of the package) 
    + used to convert and generate animation gif files from [asciicast v2](https://github.com/asciinema/asciinema/blob/master/doc/asciicast-v2.md) screen recording (.cast) file produced by the asciinema terminal recorder for documentation and static usage
    + It uses Kornel Lesiński's excellent gifski library to produce optimized, high quality GIF output with accurate frame timing.
    + agg is a successor to asciicast2gif.

### Formats
+ GIF : Animated images

## Setup
### Dependencies
+ rustc
+ cargo

### Pre-Requisites

### Install agg
- using cargo
    - This will
        + download source code
        + build agg binary and
        + install it in `$HOME/.cargo/bin`
    ```bash
    cargo install --git https://github.com/asciinema/agg
    ```

### Post-Installations
- Add '$HOME/.cargo/bin' to your PATH
    ```bash
    export PATH+=":$HOME/.cargo/bin:"
    ```

## Documentations
### Synopsis/Syntax
```bash
agg {options} <arguments> [asciinema-terminal-recording-cast-file] [output-animation-gif-file]
```

### Parameters
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

### Usage
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
- Regenerate from the asciinema terminal recording file
    - Using theme: 'monokai' and font family 'JetBrainsMono Nerd Font Patched'
        ```bash
        asciinema-util convert --theme monokai --input-terminal-rec-filename output.cast --output-animation-filename output.gif --asciinema-agg-opts "--font-family JetBrainsMono Nerd Font Mono,JetBrainsMono NFM,JetBrainsMono NFM ExtraBold"
        ```

## Resources
+ [GitHub - asciinema/asciinema](https://github.com/asciinema/asciinema)
+ [GitHub - asciinema/agg](https://github.com/asciinema/agg)

## References
+ [GitHub - treyhunner/dramatic - screenshots - README](https://github.com/treyhunner/dramatic/tree/main/screenshots#readme)

## Remarks

