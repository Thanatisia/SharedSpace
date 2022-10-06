# Documentation - Command : powercfg

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
stands for Power Configuration, this Windows command line utility will check 
    to see if you have any energy or power issues with your computer, and afterwhich, 
    output to a report file.
```

## Documentation

### Synopsis/Syntax
```batchdos
powercfg {options} [commands]
```

### Parameters
```
Note:
- Please refer to 'powercfg /?' for the full documentation/manual of powercfg
    - This is currently a WIP and is therefore, incomplete.
```
- Commands
    + /batteryreport : Generates a report of battery usage 
    + /energy : Analyzes the system for common energy-efficiency and battery life problems. (tldr; Check if there are any Battery life/power consumption problems)

- Optionals
    + /? : Displays detailed options

### Usage

- Check Battery Usage
    ```batchdos
    powercfg /batteryreport
    ```

## Resources

## References
+ [YouTube | NetworkChuck | 40 Windows Commands you NEED to know (in 10 Minutes)](https://www.youtube.com/watch?v=Jfvg3CS1X3A)

## Remarks

