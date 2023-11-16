# Xorg Display Server - Starting a simple X11 server from scratch

## Information
```
(WIP) Run through of how to start a standard X11/Xorg Display Server from scratch from the tty without startx or xinit
```

## Setup
### Table of Contents
+ [Dependencies](#dependencies)
- [Pre-Requisites](#pre-requisites)
    + Terminal/Virtual Display Variables/values
    + Xorg Display Server files
    + Cleanup function
- [Setting signal traps and Environment Variables](#setting-signal-traps-and-environment-variables)
    + Set trap to catch the 'EXIT' signal when X11 is exiting
    + (Optional) For Cleanup: Loop through 4 signals `'HUP', 'INT', 'QUIT', 'TERM'` and perform cleanup according to the caught signals
    + Set the DISPLAY environment variable to the target display monitor (in this case, the tty)
    + Trap and obtain the xinitrc file, then return to the USR1 signal
- [Setup Xauthority authentication and authorization capabilities](#setup-xauthority-authentication-and-authorization-capabilities)
    + Randomly generate a 16-digit Xauth magic cookie for the server instance
    + Add the Xauth magic cookie entry for the current session into the xauth authentication list
- [Startup Xorg Display Server](#startup-xorg-display-server)
    + Trap the USR1 signal to obtain user input and Execute display server in the tty as a daemon/background process
    + Obtain process ID and wait and listen for the display server to be killed

### Dependencies
+ Xorg/X11 : Display Server

### Pre-Requisites
- Take note of the following
    - tty : Get the current Terminal Type (TTY) console display
        ```console
        tty=$(tty)
        tty=${tty#/dev/tty}
        ```
    - stty : Print all current settings in a stty-readable format
        ```console
        stty=$(stty -g)
        ```

- Prepare Xorg files
    + .xinitrc : This contains the xinit configuration file
    - XAUTHORITY file : The Xauthority file (default: ~/.Xauthority) is basically a security authentication and authorization file used by X11 (Xorg) to specialize what user is allowed to enter to this server instance
        - Set XAUTHORITY environment variable
            ```console
            XAUTHORITY="/path/to/Xauthority"
            ```
        - Create Xauthority file
            ```console
            touch -- "$XAUTHORITY"
            ```

- Prepare cleanup function
    + Please refer to [Cleanup and closing](#cleanup-and-closing) for a runthrough explanation on how the cleanup function works
    - Example
        ```console
        cleanup()
        {
            # Check and validate if the display server process is killed
            if [ "$server" ] && kill -0 "$server" 2> /dev/null; then
                # Not killed
                ## Kill the display server process
                kill "$server"

                ## Wait for the process to exit
                wait "$server"

                ## Get return status code
                xorg=$?
            fi

            # Check STTY
            if ! stty "$stty"; then
                stty sane
            fi

            # Remove current session's display monitor (that we created) from the Xauthority authentication list
            xauth remove :"$tty"
        }
        ```

### Setting signal traps and Environment Variables
- Set trap to catch the 'EXIT' signal when X11 is exiting
    - Information
        + This trap is important as this catches the exit signal and kills the Display server's process
        + Essentially, this trap is what allows the display server to exit back to the tty on kill
        + Without this, the display server black box would remain up and you need to physically kill the process using 'pkill Xorg'
    - Recommended:
        + Perform a cleanup function by prepending the trap with 'cleanup_func_name;'
        + Refer to [Cleanup and closing](#cleanup-and-closing) for some cleanup function steps
    - Syntax
        ```console
        trap 'cleanup; exit "[exit-code (default: 0)]"' EXIT
        ```
    - Usage
        ```console
        trap 'cleanup; exit "${xorg:-0}"' EXIT
        ```

- (Optional) For Cleanup: Loop through 4 signals `'HUP', 'INT', 'QUIT', 'TERM'` and perform cleanup according to the caught signals
    - Recommended:
        + Perform a cleanup function by prepending the trap with 'cleanup_func_name;'
        + Refer to [Cleanup and closing](#cleanup-and-closing) for some cleanup function steps
    ```console
    for signal in HUP INT QUIT TERM; do
        trap "cleanup; trap - $signal EXIT; kill -s $signal $$" "$signal"
    done
    ```

- Set the DISPLAY environment variable to the target display monitor (in this case, the tty)
    - Information
        - The 'DISPLAY' environment variable is used to effectively tell the display server which framebuffer to display at (i.e. DISPLAY=:0 to render on display monitor 1 etc etc)
            - Usage Examples includes
                + X Virtual Framebuffer (Xvfb)
                + Docker containers to run GUI applications either on the host display, or in a Virtual display monitor/output such as VNC
        + Just like the usage of startx and xinit, this contains the definitions and configurations of the Xorg server
    - Syntax
        ```console
        export DISPLAY=:[your-tty (i.e. ${tty})]
        ```
    - Usage
        ```console
        export DISPLAY=:$tty
        ```

- Trap and obtain the xinitrc file, then return to the USR1 signal
    - Explanation
        + Xorg will return a USR1 signal to the parent process indicating it is ready to accept connections if it inherited a USR1 signal with a SIG_IGN disposition.  
        + Consequently a client may be started directly from a USR1 signal handler and obviate the need to poll for server readiness.
    - Note
        - The `& wait "$!"` is not mandatory, you may remove it
            + However, the '&' must include the subsequent actions such as `wait "$!"`
    - Syntax
        ```console
        trap '[xinitrc-file] & wait "$!"' USR1
        ```
    - Usage
        ```console
        trap '"${@:-$HOME/.xinitrc}" & wait "$!"' USR1
        ```

### Setup Xauthority authentication and authorization capabilities
- Randomly generate a 16-digit Xauth magic cookie for the server instance
    - Explanation
        + xauth: The X authentication CLI utility; used to manage/handle X authentication and authorization validations, as well as checking of the Xauthentication file to ensure the cookie inside is valid
        + MIT-MAGIC-COOOKIE-1 : An algorithm used by Xauth to generate a magic cookie
        + "$(od -An -N16 -tx /dev/urandom | tr -d ' ')" : Randomly generate a 16-digit random integer to be the magic cookie
    - Syntax
        ```console
        xauth add :"[tty-display-monitor]" MIT-MAGIC-COOKIE-1 "$(od -An -N16 -tx /dev/urandom | tr -d ' ')"
        ```
    - Usage
        ```console
        xauth add :"$tty" MIT-MAGIC-COOKIE-1 "$(od -An -N16 -tx /dev/urandom | tr -d ' ')"
        ```

### Startup Xorg Display Server
- Trap the USR1 signal to obtain user input and Execute display server in the tty as a daemon/background process
    - Syntax
        ```console
        (trap '' USR1 && exec /path/to/bin/Xorg :"[display-monitor]" vt"[display-monitor]" -keeptty -noreset -auth "$XAUTHORITY") &
        ```
    - Usage
        ```console
        (trap '' USR1 && exec /path/to/bin/Xorg :"$tty" vt"$tty" -keeptty -noreset -auth "$XAUTHORITY") &
        ```

- After starting the server
    - Get the process ID of the server process
        ```console
        server=$!
        ```
    - Wait for the server to close/exit
        + This is basically a while loop/web server that is constantly listening
        ```console
        wait "$server"
        ```

### Cleanup and closing
- After quitting the Xorg display server instance
    - Check if server process ID exists and is killable
        + kill the server
        + wait and check the server
        + get the return code of the Display Server into a variable
        ```console
        if [ "$server" ] && kill -0 "$server" 2> /dev/null; then
            kill "$server"
            wait "$server"
            xorg=$?
        fi
        ```
    - Check 'stty' if it is still available
        ```console
        if [[ ! stty "$stty" ]]; then
            stty sane
        fi
        ```
    - Remove the current tty from the Xauthority list
        ```console
        xauth remove :"[tty-display-monitor]"
        ```

## Documentation
### Important points
- DISPLAY environment variable is set
    + Ensure that your '$DISPLAY' environment variable is set, otherwise the Display Server would not know where to render the graphical environment
    ```console
    export DISPLAY=${DISPLAY:-0}
    ```

## Wiki

### Makefile
- Installing your application into the system
    - Using a Makefile
        - Variables
            ```makefile
            PREFIX = /usr/local # Installation path
            bin_dir = $(PREFIX)/bin # Binary directory
            data_root_dir = $(PREFIX)/share # The root data directory for your project; i.e. /usr/local/share
            man_dir = $(data_root_dir)/man # The user manual directory
            man_1_dir = $(mandir)/man1 # The user man1 file directory
            ```
        - Rules/Targets
            - Installation
                ```makefile
                install:
                    ## Installation steps
                    ### Create Directories
                    mkdir -p -- $(DESTDIR)$(bin_dir) $(DESTDIR)$(man_1_dir)

                    ### Copy binary/application into system
                    cp -f -- [your-application] $(DESTDIR)$(bin_dir)/[your-application]

                    ### Change modifier/permission of executables
                    chmod -- +x $(DESTDIR)$(bin_dir)/[your-application]

                    ### Copy man1 user manual files into system
                    cp -f -- [your-application].1 $(DESTDIR)$(man_1_dir)/[your-application].1
                ```
            - Uninstallation
                ```makefile
                uninstall:
                    ## Uninstallation/Removal

                    ### Delete directory created
                    rm -r $(DESTDIR)
                ```

### Basic Commands
- wait : Basic process management utilities; The function 'wait()' will wait for the first occurence of the specified child process to die. The return value is that of the wait(2) system call
    ```console
    wait [process-id]
    ```

### Useful functionalities
- Get the process ID of the last-ran application
    ```console
    last_process_ID=`$!`
    ```

## Resources

## References
+ [GitHub - Earnestly/sx](https://github.com/Earnestly/sx/blob/master/sx)
+ [cemkeylan - blog - 2020-08-12 - Starting X without Xinit](https://cemkeylan.com/blog/20200812-starting-x-without-xinit.html)

## Remarks
