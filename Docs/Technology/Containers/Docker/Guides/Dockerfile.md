# Dockerfile

## Information
### DESCRIPTION
```
Dockerfiles are like recipes to 
automate/simplify the creation of a 
custom Base image.
```

## Documentations
### Synopsis/Syntax
```
FROM distribution
CMD ["echo", "Hello World"]
```

### Functions
- FROM
    + Create a base image using the specified base distribution and Linux filesystem as a base  
    - Syntax
        ```
        FROM [base-distribution]
        ```
        
- MAINTAINER
    + Allows you to set the Author field of the generated images (basically set the author name of the Container)
    - Syntax
        ```
        MAINTAINER [name]
        ```
        
- RUN
    + Runs a command
    - Syntax
        - In Shell Form,  the command is running in a shell.
            - Description
                + Execute multiple commands all in a single string and shell
            - By Default
                + On Linux : /bin/sh -c
                + On Windows : cmd /S /C
            - Notes
                + The default shell for the shell form can be changed using the *SHELL* command
            - Type : String
            ```
            RUN "command"
            ```
        - In Exec Form
            - Description
                + Execute the executable/command with the parameter seperated and sanitized
                + Makes it possible to avoid shell string munging
                + RUN commands using a base image that does not contain the specified shell executable
                - Normal shell processing doesnt occur when using this form
                    - Example
                        - RUN `["echo", "$HOME"]` will not do variable substitution on $HOME
            - Type : List
            ```
            RUN ["<executable>", "<param-1>", "<param-n>", ...]
            ```
            
- CMD  
    - DESCRIPTION
        + Command and arguments to execute in your container
        - The main purpose is to provide defaults for an executing container
            - These defaults can include an executable OR 
                - They can omit the executable
                    + You must specify an *ENTRYPOINT* instruction
    - Notes
        - There can only be one *CMD* instruction in a Dockerfile
            - If you list more than 1 CMD
                + Then only the last CMD will take effect
    - Syntax
        - Exec form (Preferred)
            ```
            CMD [commands, arguments...]
            ```
        - Default parameters to ENTRYPOINT
            ```
            CMD ["<param1>", "<param2>"]
            ```
        - Shell Form
            ```
            CMD "<command>" "<param1>" "<param2>"
            ```
            
- LABEL
    - DESCRIPTION
        + Adds metadata to an image; provides a "Label" to the image
        + Use quotes and backslashes as you would in command-line parsing to include spaces within a LABEL value
        + Labels are additive including LABELs in FROM images
        - If Docker encounters a Label/Key that already exists
            + The new value overrides any previous labels with identical keys
        - To view an image's labels, use the *docker inspect* command
            + They will be under the "Labels" JSON Attribute
    - NOTES
    - Syntax
        ```
        LABEL <key>=<value> [<key>=<value> ...]
        ```
        
- EXPOSE
    - DESCRIPTION
        + Essentially to explicitly state to port forward the internal source port (Docker container) to the external destination port (Host device)
        + Informs Docker that the docker listens on the specified network port(s) at runtime
        + Does not make the ports of the container accessible to the host
    - NOTES
    - Syntax
        ```
        EXPOSE <port> [<port> ...]
        ```
        
- ENV
    - DESCRIPTION
        + Sets the Environment Variable *<key>* to the value *<value>*
        + The value will be in the environment of all "descendent" Dockerfile commands and can be replaced inline
        + The Environment Variable set using the ENV instruction will persist even when a container is running from the resulting image
        - The first form will set a single variable to a value with the entire string after 
            - the first space is being treated as the value
                + Including characters such as spaces and quotes
    - NOTES
    - Syntax
        - Individual Environment Variable setting
            ```
            ENV <key> <value>
            ```
        - Mass/Group Environment Variable setting
            ```
            ENV <key>=<value> [<key>=<value> ...]
            ```
            
- ADD
    - DESCRIPTION
        - Copies new files, directories or remote file URLs from *<src>* and 
            + Adds them to the filesystem of the image at the path *<dest>*
        - *<src>* may contain wildcards and matching will be done using Go's 'filepath.Match' rules
        - If *<src>* is a file or directory
            - Then they must be relative to the source directory that is being built
                + Context of the build
        - *<dest>* is an absolute path, or a path relative to *WORKDIR*
        - If *<dest>* doesnt exist
            + It is created along with all the missing directories in its path
    - NOTES
    - Syntax
        - Non-Whitespace Paths
            ```
            ADD <src> [<src> ...] <dest>
            ```
        - Whitespace Paths
            ```
            ADD ["<src>", ..., "<dest>"]
            ```
            
- COPY
    - DESCRIPTION
        - Copies new files or directories *<src>* and 
            + Adds them to the filesystem of the image at the path *<dest>*
        - *<src>* may contain wildcards and matching will be done using Go's 'filepath.Match' rules
        - *<src>* must be relative to the source directory that is being built
                + Context of the build
        - *<dest>* is an absolute path, or a path relative to *WORKDIR*
        - If *<dest>* doesnt exist
            + It is created along with all the missing directories in its path
    - NOTES
    - Syntax
        - Non-Whitespace Paths
            ```
            COPY <src> [<src> ...] <dest>
            ```
        - Whitespace Paths
            ```
            COPY ["<src>", ..., "<dest>"]
            ```
            
- ENTRYPOINT
    - DESCRIPTION
    - NOTES
    - SYNTAX
    
- VOLUME
    - DESCRIPTION
        + Creates a mount point with the specified name and 
        + Marks it as holding externally mounted volumes from the Host system and/or other containers
        - Tldr; Mount the specified paths from the host system into the counter's filesystem
            + Allowing a connection between the container and your host system's filesystem
    - NOTES
    - Syntax
        - Non-Whitespace Paths
            ```
            VOLUME <path> [<path> ...]
            ```
        - Whitespace Paths
            ```
            VOLUME ["<path>", ...]
            ```
            
- USER
    - DESCRIPTION
        + Sets the username or UID to use when running the image for any *RUN*, *CMD* and *ENTRYPOINT* instructions that follows.
    - NOTES
    - Syntax
        ```
        USER <username | UID>
        ```
        
- WORKDIR
    - DESCRIPTION
        + Set the working directory for any *RUN*, *CMD*, *ENTRYPOINT*, *COPY* and *ADD* instructions that follow it
        - Can be used multiple times in one Dockerfile
            - If relative path is provided
                + It will be relative to the path of the previous WORKDIR instruction
    - Syntax
        ```
        WORKDIR [path/to/workdir]
        ```
        
- ARG
- ONBUILD
- STOPSIGNAL
- HEALTHCHECK
- SHELL
    - DESCRIPTION
        + Overrides the default shell with the specified shell
        + Each SHELL instruction overrides all previous SHELL instruction calls
        + Allows an alternates shell to be used
    - NOTES
        - Alternate Shell Types
            + zsh
            + csh
            + tcsh
            + xonsh
            + powershell
            + etc
    - Syntax
        ```
        SHELL ["<executable>", "<param1>", "<param2>"]
        ```
        
## Wiki

## Resources

## References
+ [Kapeli - Dockerfile Cheatsheet](https://kapeli.com/cheat_sheets/Dockerfile.docset/Contents/Resources/Documents/index)

## Remarks
