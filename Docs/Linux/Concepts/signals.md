# Linux - Signals

## Information
### Introduction
- Signals in a system are interrupts that are sent to the program to specify that an important event has occurred. 
    - When an interrupt is detected, an event callback function (that is tied to the signal interrupt handler) will be triggered and executed
        + The signal handler function will then execute its functions

- An 'Interrupt' is simply a signal that the hardware can send when it wants the processor's attention
    + The Operating System will detect when an interrupt is triggered

- Event Callback Function:
    + An Event is an action that is being monitored during runtime when the user is interacting with the application's standard input-output processes
    - a Callback Function is a function that is executed if a rule is triggered somewhere
        + An Event Callback Function is therefore, a Callback Function that is executed when the Event (which the callback function is attached to) is detected
    - Examples of an Event Callback
        - API loops
            + PubNub

## Signal Codes
### Popular Signals
+ SIGHUP  : Signal Number 1. Hang-up detected on controlling terminal or death of controlling process.
+ SIGINT  : Signal Number 2. Triggered if the user sends an interrupt signal (Ctrl + C).
+ SIGQUIT : Signal Number 3. Triggered if the user sends a quit signal (Ctrl + D).
+ SIGFPE  : Signal Number 8. Triggered if an illegal mathematical operation is attempted.
+ SIGKILL : Signal Number 9. If a process gets this signal, it must quit immediately and will not perform any clean-up operations.
+ SIGTERM : Signal Number 15. Software termination signal (sent kill by default); if a process gets this signal, the process will clean up and then end

## Documentation
### Tools
- kill : Kill a process by its process ID; kill supports the sending of signals to application via its process ID
- trap : Similar to C programming's 'signal()'; When activated and hooked in the application's runtime body, the program will trap a signal and monitor for any event interrupts from that signal
    + If the signal interrupt is detected, the callback function will be triggered and executed

### Signal Handling
- To show a complete table of each signal
    ```console
    man 7 signal
    ```

- List all allowed signals
    ```console
    kill -l
    ```

- To kill a process
    - Explanation
        + The command 'kill' will send a SIGKILL signal to the process you specified to end the process without any cleanup
    ```console
    kill {options} [process-id]
    ```

- To kill a process by passing a specific signal 
    - Options
        + '-s [SIGNAL]` : Specify the signal you want to send to the process
    ```console
    kill -s {signal-number} [process-id]
    ```

- To trap a signal
    - Explanation
        - When you execute this in an application, 
            - the function is trapping the signal you specified and 
                - mapping the signal to a signal handler callback function 
                    + which will be called if the signal is interrupted
    - Parameter Explanation
        - Positionals
            - callback-function : This is the signal handler callback function to be executed if the signal was interrupted
            - signal : Specify the signal value/name that you want to trap and monitor for interrupts
        - Options
            + -l : List all signals
            + -p : Print the action attached to the given signal
    - Synopsis/Syntax
        ```console
        trap {options} [callback-function] [signal]
        ```
    - Examples
        - Simple SIGINT signal interrupt
            - Callback Function
                ```bash
                function ctrlc() {
                    : "
                    Function will be executed when Ctrl+C is pressed
                    "
                    echo -e "Ctrl + C is pressed."
                    exit
                }
                ```
            - Main Function
                ```bash
                # Trap the SIGINT signal
                trap ctrlc SIGINT

                # While loop that will never exit unless ctrl c is pressed
                while true; do
                    echo -e "Please press Ctrl+C to exit..."
                    sleep 15
                done
                ```

## Wiki

## Resources

## References
+ [Baeldung - Linux - Bash Signal Handling](https://www.baeldung.com/linux/bash-signal-handling)
+ [Educative - Answers - What are linux signals](https://www.educative.io/answers/what-are-linux-signals)
+ [GeeksforGeeks - Signal handling in linux through the signal() Function](https://www.geeksforgeeks.org/signal-handling-in-linux-through-the-signal-function/)

## Remarks

