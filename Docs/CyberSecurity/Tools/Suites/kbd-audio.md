# Cybersecurity Utility - kbd-audio

```
kbd-audio is collection of command line (CLI) and GUI utilities/tools for capturing and analyzing audio data.
```

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Resources](#resources)
- [References](#references)
- [Remarks](#remarks)
- [Notes](#notes)

## Information

+ Utility Type: Audio Analysis
+ Tool Area of Efficiency : Offensive (Red Team)
+ Penetration Testing stage : Reconnaissance
+ Package Author: ggerganov
+ Package Name: kbd-audio
+ Repository URL: https://github.com/ggerganov/kbd-audio

## Setup

### Pre-Requisites


### Dependencies
- SDL2 : Used to capture audio and to open GUI windows
    - Library Names
        + libsdl
    - Using package manager
        - apt-based
            ```console
            sudo apt install libsdl2-dev
            ```
        - brew-based (MacOS)
            ```console
            brew install sdl2
            ```
        - MSYS2 (Windows)
            ```console
            pacman -S git cmake make mingw-w64-x86_64-dlfcn mingw-w64-x86_64-gcc mingw-w64-x86_64-SDL2
            ```

- FFTW3 (Optional) : Helper tools to perform Fourier transformations
    + URL: http://www.fftw.org/

### Obtaining
- Using git
    - Cloning repository
        ```console
        git clone https://github.com/ggerganov/kbd-audio
        ```
    - Change directory
        ```console
        cd kbd-audio
        ```

### Building/Compiling
- Initialize submodules
    ```
    git submodule update --init
    ```

- Make build directory
    ```console
    mkdir build && cd build
    ```

- Compile into build directory
    ```console
    cmake ..

    make
    ```

### Installing


## Documentation

### Synopsis/Syntax
- record-full : Record audio to a raw binary file on disk
    ```console
    ./record-full [output-file-name (i.e. output.kbd)] {options}
    ```

- play-full : Playback a recording captured via the `record-full` tool
    ```console
    ./play-full [input-file-name (i.e. input.kbd)] {options
    ```

- record : Record audio only while typing; Useful for collecting training data for `keytap`
    ```console
    ./record [output-file-name] {options}
    ```

- play : Playback a recording created via the `record` tool
    ```console
    ./play [input-file-name] {options}
    ```

- keytap : Detects pressed keys via microphone audio capture in real-time; Used training data captured via the `record` tool.
    ```console
    ./keytap [input-file-name-1 .input-file-name-2 .. input-file-name-n] {options}
    ```

- keytap-gui : GUI version of the `keytap` tool
    ```console
    ./keytap-gui [input-file-name-1 .input-file-name-2 .. input-file-name-n] {options}
    ```

- keytap2-gui : Detects pressed keys via microphone audio capture; 
    - Information: 
        + Uses statistical information (n-gram frequencies) about the language; 
        + **No training data is required**; 
        + The `record.kbd` input file has to be generated via the `record-full` tool and contains the audio data that will be analyzed. 
        + The 'n-gram-dir' folder file has to contain the 'n-gram probability' files for the corresponding language.
    ```console
    ./keytap-gui [record-file-name] [n-gram-frequency-directory] {options}
    ```

- keytap3 : Fully automated recovery of unknown text from audio recordings
    ```console
    ./keytap3 [input-file-name] [output-data-directory] {options}
    ```

- keytap3-gui : GUI version of the `keytap3` tool
    ```console
    ./keytap3-gui [input-file-name] [output-data-directory] {options}
    ```

- view-full-gui : Visualize waveforms recorded with the `record-full` tool; Can also playback the audio data
    ```console
    ./view-full-gui [input-keyboard-audio-file-name] {options}
    ```

- view-gui : Visualzie training data recorded with the `record` tool; Can also playback the audio data
    ```console
    ./view-gui [input-keyboard-audio-file-name] {options}
    ```

### Parameters

#### record-full
- Positionals
    + output-file-name : Specify the target output file name for the raw binary file (i.e. output.kbd)

- Optionals
    - With Arguments
    - Flags
        + -cN

#### play-full
- Positionals
    + input-file-name : Specify the target input file name to playback (i.e. input.kbd)

- Optionals
    - With Arguments
    - Flags
        + -pN

#### record
- Positionals
    + output-file-name : Specify the target output file name for the raw binary file (i.e. output.kbd)

- Optionals
    - With Arguments
    - Flags
        + -cN

#### play
- Positionals
    + input-file-name : Specify the target input file name to playback (i.e. input.kbd)

- Optionals
    - With Arguments
    - Flags
        + -pN

#### keytap
- Positionals
    + input-file-name-(n) : Specify the file names of all keyboard keypress audio to playback (i.e. input1.kbd input2.kbd ... inputn.kbd)
- Optionals
    - With Arguments
    - Flags
        + -cN
        + -CN
        + -pF
        + -tF

#### keytap-gui
- Positionals
    + input-file-name-(n) : Specify the file names of all keyboard keypress audio to playback (i.e. input1.kbd input2.kbd ... inputn.kbd)
- Optionals
    - With Arguments
    - Flags
        + -cN
        + -CN

#### keytap2-gui
- Positionals
    + record-file-name : Specify the file name of the recording
    + n-gram-dir : Specify the directory of the n-gram frequencies
- Optionals
    - With Arguments
    - Flags
        + -cN
        + -CN
        + -pN

#### keytap3
- Positionals
    + input-file-name : Specify the input file name of the audio recordings 
- Optionals
    - With Arguments
    - Flags
        + -cN
        + -CN
        + -fN
        + -FN
        + -pF
        + -tF

#### keytap3-gui
- Positionals
    + input-file-name : Specify the input file name of the audio recordings 
- Optionals
    - With Arguments
    - Flags
        + -cN
        + -CN
        + -fN
        + -FN
        + -pF
        + -tF

#### view-full-gui
- Positionals
    + input-keyboard-audio-file-name : Specify the input keyboard audio filename
- Optionals
    - With Arguments
    - Flags
        + -pN

#### view-gui
- Positionals
    + input-keyboard-audio-file-name : Specify the input keyboard audio filename
- Optionals
- Optionals
    - With Arguments
    - Flags
        + -pN

### Usage

## Wiki
### Packages/Components
+ keytap
+ keytap2
+ keytap3
+ Find the full list in the README [here](https://github.com/ggerganov/kbd-audio)

## Resources

## References
+ [Project Repository](https://github.com/ggerganov/kbd-audio)

## Remarks

## Notes
