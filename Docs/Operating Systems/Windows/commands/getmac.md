# Documentation - Command : getmac

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
Windows command line utility to allow system administrators to 
obtain the MAC address of the windows system directly without using ipconfig.
```

## Documentation

### Synopsis/Syntax
```batchdos
getmac {options}
```

### Parameters
+ /? : Help menu; displays detailed options
+ /P [password] : Specifies the password for the given user context (name); will prompt for user input if empty
+ /S [system] : Specify remote system to connect to
+ /U [{domain\}user] : Specifies the user context (name) to execute
+ /V : Flag to display verbose output; will display the name of the connection as well as the network adapter on top of the defaults
- /FO [format] : Specify format to display the output value
    - Formats
        + TABLE
        + LIST
        + CSV
- /NH : Flag to specify that the Column Header should not be displayed in the output; Valid only for TABLE and CSV formats (hence, NH = No Header)

### Usage

- Default
    ```batchdos
    getmac
    ```

- Verbose with name of connection and adapter
    ```batchdos
    getmac /V
    ```

## Wiki

## Resources

## References
+ [YouTube | NetworkChuck | 40 Windows Commands you NEED to know (in 10 Minutes)](https://www.youtube.com/watch?v=Jfvg3CS1X3A)

## Remarks

