# C programming - Signals

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

## Operating Systems
### Linux
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

## Signal Handling

## Documentation

### Synopsis/Syntax
- Import libraries
    ```c
    #include <signals.h>
    ```

### Libraries
+ signals.h

### Classes

### Functions
- `signal(signal, signal_handler);` : Activate and attach the signal interrupt to the program's body.
    - Notes
        - Issues
            - it is preferable to stay away from employing signal (). 
                - This system call has a problem with portability.
                    + it acts differently under various operating systems. 
                    + There is a more recent system call that performs all the functions of signal() while additionally providing a little bit more details about the signal itself, its origin, etc. - sigaction
    - Parameters
        - signal : Specify the signal interrupt you want the application to be monitoring during runtime. If this signal is detected, the specified event callback function will be triggered and activated
            + Type: Integer
        - signal_handler : Specify the event callback function to be triggered and activated when the signal is interrupted
            + Type: Pointer function

- `int sigaction(int signum, const struct sigaction *act, struct sigaction *oldact);` : Another system call that modifies the signal handler
    - Parameters
        - `int signum` : Specify the signal number you want the application to be monitoring during runtime. If this signal is detected, the specified event callback function will be triggered and activated
            + Type: Integer
        - `const struct sigaction *act` : Pointers to the sigaction structure
            + Type: const struct sigaction *
        - `struct sigaction *oldact` : 

### Usage
- Simple 'signal()' implementation
    - Examples
        - SIGTERM
            - Explanation
                + This is a busy loop program that will keep running as long as 'isRunning' is 1 (True)
                - Program will hook on to the application during runtime and catch the specified signal (SIGTERM)
                    - if the signal is interrupted, 'event_callback' will be called
                        + which will flip the value and set the global variable 'isRunning' to 0 if the signal is interrupted
            - Snippet
                ```c
                #include <signal.h>
                #include <stdio.h>

                static volatile int isRunning = 1;

                void event_callback() {
                    // Set the global variable 'isRunning' to 0 if the signal is interrupted
                    isRunning = 0;
                }

                int main() {
                    // Catch the specified signal (SIGTERM) and if the signal is interrupted, 'event_callback' will be called
                    signal(SIGTERM, event_callback);
                    // Infinite loop as long as 'isRunning' is 1 (True)
                    while(isRunning) {}

                    printf("%s\n", "SIGTERM caught, exiting...");
                    return 0;
                }
                ```
            - Compilation
                ```console
                gcc signal-interrupt.c -c 
                gcc signal-interrupt.o -o signal-interrupt
                ```
            - Usage
                - Startup loop program
                    ```console
                    ./signal-interrupt
                    ```
                - Kill the application's process
                    ```console
                    kill -s SIGTERM [process-id]
                    ```
                - Intended Standard Output
                    ```console
                    SIGTERM caught, exiting...
                    ```

- Simple 'signalaction()' implementation
    - Example
        - Snippet
            - Termination Signal Handler
                ```c
                #include <signal.h>

                void termination_handler(int signum)
                {
                  struct temp_file *p;

                  for (p = temp_file_list; p; p = p->next)
                    unlink (p->name);
                }
                ```
            - Simple sigaction structure and signal call
                ```c
                int main (void)
                {
                    // Generate new sigaction structures - 'new_action' and 'old_action'
                    struct sigaction new_action, old_action;

                    /* Set up the structure to specify the new action. */
                    new_action.sa_handler = termination_handler;
                    sigemptyset (&new_action.sa_mask);
                    new_action.sa_flags = 0;

                    // Hook the signal interrupt callback function for signal 'SIGINT'
                    sigaction (SIGINT, NULL, &old_action);
                    if (old_action.sa_handler != SIG_IGN) {
                        sigaction (SIGINT, &new_action, NULL);
                    }

                    // Hook the signal interrupt callback function for signal 'SIGHUP'
                    sigaction (SIGHUP, NULL, &old_action);
                    if (old_action.sa_handler != SIG_IGN) {
                        sigaction (SIGHUP, &new_action, NULL);
                    }

                    // Hook the signal interrupt callback function for signal 'SIGTERM'
                    sigaction (SIGTERM, NULL, &old_action);
                    if (old_action.sa_handler != SIG_IGN)
                        sigaction (SIGTERM, &new_action, NULL);
                    }
                }
                ```
            - sigaction examine/retrieve information about the current action for the signal without changing that action
                ```c
                int main() {
                    // Create another sigaction structure for query
                    struct sigaction query_action;

                    // Obtain sigaction information
                    int signal_action = sigaction (SIGINT, NULL, &query_action);

                    if (signal_action < 0) {
                      /* sigaction returns -1 in case of error. */
                    }
                    else if (query_action.sa_handler == SIG_DFL) {
                      /* SIGINT is handled in the default, fatal manner. */
                    }
                    else if (query_action.sa_handler == SIG_IGN) {
                      /* SIGINT is ignored. */
                    }
                    else {
                      /* A programmer-defined signal handler is in effect. */
                    }
                    return 0;
                }
                ```

## Wiki

## Resources

## References
+ [Educative - Answers - What are linux signals](https://www.educative.io/answers/what-are-linux-signals)
+ [GeeksforGeeks - Signal handling in linux through the signal() Function](https://www.geeksforgeeks.org/signal-handling-in-linux-through-the-signal-function/)
+ [GNU - Software - libc - sigaction function example](https://www.gnu.org/software/libc/manual/html_node/Sigaction-Function-Example.html)

## Remarks

