# Bash - Settings

## Information
### DESCRIPTION
```
shopt is a built-in command of the Bash shell that enables/disables options for the current shell session
```

## Setup
### Adding Settings
- Enabled/disabled options for the current shell session
    + Use the *shopt* command in your .bashrc file
        ```console
        # .bashrc
        shopt {options} [option-name...]
        ```

## Documentation
### Synopsis/Syntax
```console
shopt {options} [optname...]
```
### Parameters
#### Positional
- optname : The name of a bash option
    + Multiple option names can be specified (Seperate with space delimiter)
#### Options
+ -o : Restrict the values of *optname* to those known by the **set** built-in command
+ -p : Print all shell options and their current values (Default)
- -q : Quiet Mode.
    + Provide no output, but return an error status
    - Error Status
        - Single optname
            - If the option is set
                + Error Status = TRUE
            - If the option is not set
                + Error Status = FALSE
        - multiple optnames
            - If all options are set
                + ERROR Status = TRUE
            - If any of the options are not set
                + ERROR Status = FALSE
- -s : Set options that are specified.
    + If no optnames are specified, list all options that are currently set
+ -u : Unset optnames 
   
### Usage
- Set option(s)
    ```console
    shopt -s [option-names...]
    ```
    
- Unset option(s)
    ```console
    shopt -u [option-names...]
    ```
        
## Wiki       
### Masterlist
> List of Bash shopt settings
+ autocd        : Interactive Shells only; A specified command name that is a directory name is executed as if it were the cd command's argument. Basically automatically cd to the directory (like zsh's default)
+ cdable_vars   : A cd command's argument that is not a valid directory path is assumed to be a variable that contains a valid directory path to cd into 
- cdspell       : Interactive Shells only; Minor errors in the spelling of a component in a specified directory path provided in a cd command are corrected.
    - Errors include
        + Transposed characters
        + Missing character
        + One character too many
    - If a correction is found : The corrected file name is printed and the command proceeds
- checkhash     : Bash checks that a command found in the hash table (using the *hash* command) of remembered commands actually exists before trying to execute it.
    - If a hashed command no longer exists
        + a normal path search is performed
- checkjobs     : Bash lists the status of any stopped and running jobs before exiting an interactive shell.
    + If any jobs are running : Defer the exit until a second exit is attempted without an intervening command
    + The shell always postpones exiting if any jobs are stopped
    
```
This is still being updated
```

## References
+ [Computerhope - shopt](https://www.computerhope.com/unix/bash/shopt.htm)
    
## Resources

## Remarks
    

