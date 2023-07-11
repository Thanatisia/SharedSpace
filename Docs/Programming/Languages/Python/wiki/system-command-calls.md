# Python: System command calls

## Table of Contents
+ [Components](#components)
+ [Basics](#basics)
+ [Wiki](#wiki)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Components
```
The following are various components, packages and dependencies that are used when dealing with system command calls
```
### Libraries
+ os : The built-in library/module that handles Operating System-related functionalities and attributes

## Basics
- To call a system command in Python
    - run the 'system(cmd)' function found in the built-in library 'os'
        + system() returns the exit/result code of type <integer> after completion
        + To return the stdout/result of the command, you must use [PIPE](using-pipes.md)
    - This is the heart of just doing a simple system calling
        + Do this if you do not need any returns, or just the exit code (similar to C/C++'s built-in system(command-string))
        ```python
        import os
        command_string = "echo Hello World!"
        int ret_Code = os.system(command_string); # Execute system command and return exit code
        ```

## Wiki
### Snippets and Examples
- Basic implementation
    ```python
    def exec_cmd(cmd:str):
        """
        Execute command specified and 
        Return the return/exit code

        :: Params
        :: Positionals
        ::  - cmd : The command string to execute
        ::      Type: <string>
        """
        ret_Code:int = os.system(cmd)
        return ret_Code
    ```

## Resources

## References

## Remarks
