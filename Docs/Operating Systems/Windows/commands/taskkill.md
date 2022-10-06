# Documentation - Command : taskkill

## Table of Contents
+ [Information](#information)
+ [Setup](#setup)
+ [Documentation](#documentation)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Information

### Description
```
taskkill is a Command Line utility for ending/killing system processes
    - similar to *NIX's 'pkill' command that allows you to kill a process via process id (PID) or image (command) name

Essentially, taskkill is like the backend of the task manager that kills the 'task' (aka process) you have selected.

Taskkill is usually used with 'tasklist' to determine/locate a process to kill
```

## Documentation

### Synopsis/Syntax
```batchdos
taskkill {options} <arguments>
```

### Parameters
    
- Kill Method
    + /IM [image-name] : (Kill by Image/Process Name) Speicifies the Image Name of the process to be terminated
        - Notes
            + Wildcard '*' can be used to specify all tasks/image names from the point you declared it
    + /PID [process_id] : (Kill by PID) Specifies the Process ID (PID) to be killed 

- Optionals
    + /FI [filter] : Applies a filter/condition to select a set of tasks. Allows '*' to be used as wildcard
    + /S [remote-system] : Specify the remote system to connect to 
    + /U [{domain\}username] : Specify the user context (name) to execute the command
    + /P [password] : Specify the password to the username provided. Will prompt for user input if empty
    + /? : Display detailed information on usage

- Flags
    + /F : Forcefully terminate the process(es)
    + /T : Terminates the specified process and any child processes which were started by it

### Usage
- Kill a specific task 
    + using findstr and taskkill
    - Find the PID of the process you want to end
        + Please refer to [tasklist.md](tasklist.md) for more info
        ```batchdos
        tasklist | findstr "your-process-name"
        ```
    - End the process (or task) using the PID (process ID)
        ```batchdos
        taskkill /f /pid process_ID
        ```

## Wiki
### Basics
- Processes : 
    ```
    In Windows context, a process is similar to a "Task". 
    Whereby each process in the system represents an application that is running in the background.
        - In Linux, you can find using the 'ps'(process status) command.

    Each process is identifiable by a PID (Process ID), and this is the same for Windows
    ```

## Resources

## References
+ [YouTube | NetworkChuck | 40 Windows Commands you NEED to know (in 10 Minutes)](https://www.youtube.com/watch?v=Jfvg3CS1X3A)

## Remarks

