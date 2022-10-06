# Documentation - Command : tasklist

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
tasklist is a Command Line utility for viewing system processes, 
    - similar to *NIX's 'ps' command, performing the same process as a system monitoring utility.
Essentially, tasklist is like the backend to the task manager that displays all the current running processes as of execution.

Tasklist is usually used with 'taskkill' to end a process.
```

## Documentation

### Synopsis/Syntax
```batchdos
tasklist {options}
```

### Parameters

- Optionals
    - /FI [filter] : Displays a set of tasks that match a given criteria/filter specified
    - /FO [format] : Specifies the output format
        - Formats
            + TABLE
            + LIST
            + CSV
    + /M [exe_name|dll_name] : List all tasks currently using the specified executable/dll. If not specified - all loaded modules (dll/executables) are displayed.
    + /NH : aka No Header; Specifies that the "Column Header" should not be displayed in the output; Valid for only "TABLE" and "CSV" formats
    + /S [remote-system] : Specify remote system to connect to
    + /U [{domain\}username] : Specify the user context/name to execute the command
    + /P [password] : Specify the password the user context/name
    + /? : Display detailed information on usage

- Flags
    + /APPS : Displays (microsoft) store apps and their associated processes
    + /SVC : Display services hosted in each process
    + /V : Displays verbose task information

### Usage

- Kill a specific task 
    + using findstr and taskkill
    - Find the PID of the process you want to end
        ```batchdos
        tasklist | findstr "your-process-name"
        ```
    - End the process (or task) using the PID (process ID)
        + Please refer to [taskkill.md](taskkill.md) for more info
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
- Filters
    - STATUS
        - Valid Operators
            + eq
            + ne
        - Valid Value(s)
            + RUNNING
            + SUSPENDED
            + NOT RESPONDING
            + UNKNOWN
    - IMAGENAME
        - Valid Operators
            + eq
            + ne
        - Valid Value(s)
            + Image name
    - PID
        - Valid Operators
            + eq
            + ne
            + gt
            + lt
            + ge
            + le
        - Valid Value(s)
            + PID value
    - SESSION
        - Valid Operators
            + eq
            + ne
            + gt
            + lt
            + ge
            + le
        - Valid Value(s)
            + Session number
    - SESSIONNAME
        - Valid Operators
            + eq
            + ne
        - Valid Value(s)
            + Session name
    - CPUTIME
        - Valid Operators
            + eq
            + ne
            + gt
            + lt
            + ge
            + le
        - Valid Value(s)
            - CPU time (format of 'hh:mm:ss')
                + hh : Hours
                + mm : Minutes
                + ss : Seconds
    - MEMUSAGE
        - Valid Operators
            + eq
            + ne
            + gt
            + lt
            + ge
            + le
        - Valid Value(s)
            + Memory usage (in KB)
    - USERNAME
        - Valid Operators
            + eq
            + ne
        - Valid Value(s)
            + User name in '[domain\]user' format
    - SERVICES
        - Valid Operators
            + eq
            + ne
        - Valid Value(s)
            + Service name
    - WINDOWTITLE
        - Valid Operators
            + eq
            + ne
        - Valid Value(s)
            + Window title
    - MODULES
        - Valid Operators
            + eq
            + ne
        - Valid Value(s)
            + DLL name
            + Executable name

## Resources

## References
+ [YouTube | NetworkChuck | 40 Windows Commands you NEED to know (in 10 Minutes)](https://www.youtube.com/watch?v=Jfvg3CS1X3A)

## Remarks

