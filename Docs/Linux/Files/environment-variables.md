# Linux Default Environment Variables

```
Compilation of various Linux default environment variables
```

- $DISPLAY : This defines the output display that the display server will point to when starting up a graphical application/environment; 
    + Syntax: ':[monitor-number]'
    + Starting Value: ':0'
    - Notes
        + You can set this to ':0' to run GUI applications from the tty
- $PATH    : Contains the system environment path; the system will source and reference every path listed in here to know where the applications/files are kept; Equivalent to Window's '%PATH%'
- $PWD     : stands for 'Print Working Directory'; Returns you the current working directory; Equivalent to Window's '%CD%'
