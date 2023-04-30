# Skyline Emulator Setup

## Pre-Requisites
- Getting Production Key
- Getting Title Key
- Getting GPU Drivers for Skyline/Vita3K
- (Until Skyline supports DLC and Updates) Merging game files with DLC and Updates
- Checking compatibility list

## Setup
- Download Skyline Emulator APK
    + Go to [Skyline Download Builds](https://skyline-emu.one/download/)
    - Download the latest build/release (Top-most build)
        + Press 'Download' to download the apk
        + Press 'View on GitHub' to see the latest changes

## Manual Compilation/Build from source
### Dependencies
+ git : For cloning
+ Android Studio : For opening project source and building

### Pre-Requisites
- If using Windows
    - Open Terminal/Command Prompt with Administrator privileges
        + Enable git symlinks
            ```console
            git config core.symlinks true
            ```
- Clone the repository recursively
    - Notes:
        + Release branch: ftx1
    ```console
    git clone https://github.com/skyline-emu/skyline.git --recursive
    ```
- Open Android Studio
    - First Time Setup
        + Import the project 'skyline'
        - Exclude the following folders from indexing
            + app/libraries/llvm
            + app/libraries/boost

### Build
+ Sync the project

## Resources
+ [Skyline Download Builds](https://skyline-emu.one/download/)
+ [Skyline Repository Building steps](https://github.com/skyline-emu/skyline/blob/ftx1/BUILDING.md)
