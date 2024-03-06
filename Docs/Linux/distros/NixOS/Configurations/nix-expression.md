# Nix Expression flake file

## Information
### Summary
+ Nix uses flake-typed script files - also known as 'Nix Expression' files - to perform Nix-based scripting

## Documentation
### Formatting and Information
+ File format: .nix
+ File name: *.nix

### Nix Expression Operators
+ '?' : Nix Expression Operator to mean 'What is the object on the Left Hand Side? It is the mapping defined on the Right Hand Side'
+ ':' : Nix Expression Operator for 'continue with this'
+ ''your-statements-here'' : Wrap the commands with double quotes to write multiline command statements

### Nix Expression file
- Import libraries
    - To import a library
        + variable-name : This is the variable object that you will define and be mapped to the imported package
        + package-name : This is the package you wish to import. The imported package will be mapped to the variable
        + '?' : Nix Expression Operator to mean 'What is the object on the Left Hand Side? It is the mapping defined on the Right Hand Side'
        + ':' : Nix Expression Operator for 'continue with this'
    ```nix
    { [variable-name] ? import <package-name> {} }:
    ```

- Initialize and Declare variables
    ```nix
    let
        variable-name = values;
    in
    ```

- Execute functions
    - Explanation
        - When executing a function and parsing parameter attributes and values
            + Each attribute needs to be closed with ';' after completion to separate every attribute and statements
    ```nix
    package.library.function {
        attribute = values;
    }
    ```

### Synopsis/Syntax
- To run a Nix expression flake file
    ```bash
    nix run [nix-flake].nix
    ```

- To build a Nix image
    ```bash
    nix-build {options} <arguments> [nix-expression-flake].nix
    ```

### Parameters
#### nix-build
- Positionals
    + nix-expression-flake : Specify the nix expression file to build
- Optionals
    - With Arguments
        + `--with-arg [argument-variable] [argument-value-map]` : Specify an argument variable and explicitly map the sepcified value to the variable
    - Flags

### Package and Libraries
- nixpkgs : Nix Package Collection library
    + dockerTools : Docker and Docker images-based tools

### Classes

### Functions
- nixpkgs
    - `.buildEnv { name; paths; ... };` : Build the specified environment in the provided name and paths
        - Parameters
            + name : Specify the name of the environment to build
            - paths : List of paths to build; 
                + Format: [ paths ... ];
    - `.writeRootfs [custom-rootfs-tarball-file-name] (command);` : Write the results output generated via the command to the specified custom rootfs tarball archive as a root filesystem file
    - `.writeScriptBin [script-filename] [command];` : Write the specified command string to the provided script filename; Wrap the commands with ''your-statements-here'' to write multiline command statements
    - `.writeText [custom-rootfs-tarball-file-name] (command);` : Write the results output generated via the command to the specified custom text file
    - `.runCommand "command-name" {} [commands ...]` : Execute the specified commands; Wrap the commands with ''your-statements-here'' to write multiline command statements
- nixpkgs.dockerTools
    - `.buildImage { name, rootfs };` : Build a new custom docker image
        - Parameters
            + name : Specify the name of the docker image to build
            + tag : Specify the tag of the docker image to build
            + rootfs : Write the commands required to generate the rootfs of the new docker image to be created
            + copyToRoot : Copy the specified docker image environment to root directory

### Attributes/Variables

### Usage

## Wiki

### Snippets
- Building a rootfs-based nixos image from the default busybox image used by the nix/nixos docker image
    - Steps
        - Setting up the environment: 
            - You need a Nix expression file (usually named default.nix or build.nix) that 
                + defines the build process for the NixOS rootfs image. 
                + This file specifies the packages, configuration, and other resources required for building the image.
        - Defining the root filesystem creation: 
            + In the Nix expression file, you specify how to create the root filesystem. 
            - This involves tasks such as 
                + creating directories, 
                + copying necessary binaries, 
                + setting up configuration files, etc. 
        - Building the Docker image: 
            - Once the root filesystem is prepared, you use 'dockerTools.buildImage' from Nixpkgs to build the Docker image. 
                + This function takes the root filesystem as input and 
                + generates a Docker image that includes the NixOS base system.
        - Executing the build: 
            - You run nix-build with your Nix expression file to initiate the build process. 
            - Nix will then
                + evaluates the expressions, 
                + fetches necessary dependencies, and 
                + executes the build steps defined in the file.
    - Example Explanation
        - In this particular case, we are starting from a BusyBox image, so you'll need to copy BusyBox binaries to the root filesystem.
            + We use dockerTools.buildImage to create a Docker image.
            - We define the root filesystem creation logic within the rootfs attribute. 
                - This involves 
                    + creating directories, 
                    + copying BusyBox binaries, and 
                    + performing any other setup necessary for the NixOS base system.
                + The resulting Docker image will contain the NixOS base system built on top of the BusyBox image.
    - Pre-Requisites
        - Startup 'nixos/nix:latest' docker container
            - Notes
                - The nix docker image is using busybox
                    + Hence, you will need to generate a rootfs image tarball converted from the BusyBox container
            ```bash
            docker run -itd --name=nix nixos/nix:[tag|version]
            ```

        - Enter the nix container
            ```bash
            docker exec -it nix /bin/sh
            ```
    - Nix Expression flake file
        + Let the file be named 'build.nix'
        ```nix
        { pkgs ? import <nixpkgs> {} }:

        pkgs.dockerTools.buildImage {
          name = "nixos-rootfs";
          rootfs = pkgs.writeRootfs "rootfs.tar.gz" (pkgs.runCommand "create-rootfs" {} ''
            # Create necessary directories and files
            mkdir -p $out/rootfs/{bin,dev,etc,home,lib,mnt,proc,root,run,sbin,sys,tmp,usr,var}

            # Copy BusyBox binaries to the root filesystem
            cp -r /busybox/* $out/rootfs/bin/

            # Optionally, you can create configuration files or perform any other setup required for your NixOS base system
          '');
        }
        ```
    - Build image
        ```bash
        nix-build build.nix
        ```

## Resources

## References

## Remarks

