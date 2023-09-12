# DIY/Custom Command Line Argument (CLI) without argparse

Command Line (CLI) Argument and Parameter implementation in Python can be done (relatively) easily in argparse
Those are powerful in providing the capability to easily create command line parameter input without much overhead required.

However, it is actually possible to create your own command line argument support using an if-condition, a while loop, a case-esac and the shift function.

## Components
- 'optional' dictionary        : Key-Value container (aka Map/HashMap/Dictionary/ArrayList) to store all optional arguments parsed in as well as the values
    ```python
    # Initialize Variables
    configurations = {
        "optionals" : {
            # key = variable/option name
            # value = value
            "help" : False,
            "version" : False
        },
        # ...,
    }
    exec = sys.argv[0]
    argv = sys.argv[1:]
    argc = len(argv)
    ```
- 'positional' list            : Indexed-based container (aka ArrayList/Array/Vector) to store all positional arguments parsed in; The index of the element is the position
    ```python
    # Initialize Variables
    configurations = {
        # ...,
        "positionals" : []
    }
    exec = sys.argv[0]
    argv = sys.argv[1:]
    argc = len(argv)
    ```
- Opening if-condition         : Check if any arguments are provided.
    ```python
    if argc > 0:
        # If there are cli arguments/options
    else:
        # No arguments parsed...
        print("No arguments parsed.")
        exit(1)
    ```
- While loop                   : While the next argument being provided is not empty.
    ```python
    # If there are cli arguments/options
    while ( i < (argc) ):
        # Loop through all arguments
        # Get current argument
        curr_arg = argv[i]

        # Conditions here
        # ...

        # Increment index
        i += 1
    ```
+ switch-case                    : Switch case to check if the current argument is a valid input from the user.; In python, you can use either if-else, or the 'match' keyword
    - Using 'if-else'
        ```python
        # If there are cli arguments/options
        while ( i < (argc) ):
            # Loop through all arguments
            # Get current argument
            curr_arg = argv[i]

            ## Conditions here
            if (curr_arg == "-h") or (curr_arg == "--help"):
                ## Perform action here...
            else:
                # Default action here

            # Increment index
            i += 1
        ```
    - Using 'match'
- index increment mechanism    : This index is used to go to the next n-th argument in the CLI argument/parameter list (similar to shift [n] in linux shellscripting)
    - i.e.
        + shift [n] function : Shift/move the current cli argument/parameter index to the left by n-position.
    ```python
    while ( i < (argc) ):
        # Loop through all arguments
        # Get current argument
        curr_arg = argv[i]

        # Switch-case through the arguments
        if (curr_arg == "-h") or (curr_arg == "--help"):
            ## Display help menu
            configurations["optionals"]["help"] = True
        elif (curr_arg == "-v") or (curr_arg == "--version"):
            ## Display version information
            configurations["optionals"]["version"] = True
        else:
            ## Remaining: Positionals
            configurations["positionals"].append(curr_arg)

        # Increment index
        ## Equivalent to 'shift 1' at the end of each option
        i += 1
    ```

## Snippets
- Command Line Argument and option parsing Primary Mechanism
    ```python
    import os
    import sys

    """
    Declaration and Initialization
    """
    # Initialize Variables
    configurations = {
        "optionals" : {
            # key = variable/option name
            # value = value
            "help" : False,
            "version" : False
        },
        "positionals" : []
    }
    exec = sys.argv[0]
    argv = sys.argv[1:]
    argc = len(argv)

    def main():
        # Initialize Variables
        i:int = 0

        """
        Obtain Command Line Arguments
        """
        # Check if there are options
        if argc > 0:
            # If there are cli arguments/options
            while ( i < (argc) ):
                # Loop through all arguments
                # Get current argument
                curr_arg = argv[i]

                # Switch-case through the arguments
                if (curr_arg == "-h") or (curr_arg == "--help"):
                    ## Display help menu
                    configurations["optionals"]["help"] = True
                elif (curr_arg == "-v") or (curr_arg == "--version"):
                    ## Display version information
                    configurations["optionals"]["version"] = True
                else:
                    ## Remaining: Positionals
                    configurations["positionals"].append(curr_arg)

                # Increment index
                i += 1
        else:
            print("No arguments parsed.")
            exit(1)

        """
        Process command line arguments
        """
        # Declare global variables
        global optionals, positionals

        # Process
        optionals = configurations["optionals"]
        positionals = configurations["positionals"]

        # Perform all actions required with the optional arguments and positional arguments here
    ```

- Command Line Argument with variable positions (Recommended)
    ```python
    import os
    import sys

    def init():
        """
        Initialize Variables
        """
        global configurations, argc, argv

        # Initialize Variables
        configurations = {
            "optionals" : {
                # key = variable/option name
                # value = value
                "help" : False,
                "version" : False
            },
            "positionals" : []
        }
        exec = sys.argv[0]
        argv = sys.argv[1:]
        argc = len(argv)

    def obtain_args():
        # Initialize Variables
        i:int = 0

        # Check if there are options
        if argc > 0:
            # If there are cli arguments/options
            while ( i < (argc) ):
                # Loop through all arguments
                # Get current argument
                curr_arg = argv[i]

                # Switch-case through the arguments
                if (curr_arg == "-h") or (curr_arg == "--help"):
                    ## Display help menu
                    configurations["optionals"]["help"] = True
                elif (curr_arg == "-v") or (curr_arg == "--version"):
                    ## Display version information
                    configurations["optionals"]["version"] = True
                else:
                    ## Remaining: Positionals
                    configurations["positionals"].append(curr_arg)

                # Increment index
                i += 1

    def process_args():
        """
        Process command line arguments
        """
        # Declare global variables
        global optionals, positionals

        # Process
        optionals = configurations["optionals"]
        positionals = configurations["positionals"]

        # Output
        return [optionals, positionals]

    def setup():
        # Step 1 - Declare and Initialize variables
        init()
        # Step 2 - Obtain CLI arguments and options
        obtain_args()
        # Step 3 - Process CLI arguments and options
        process_args()

    def test_cli_arguments():
        assert True in optionals.values(), "Error: Optionals are not found"
        print("Success: Optionals are found")
        assert len(positionals) > 0, "Error: Positionals are not found"
        print("Success: Positonals are found")

    def main():
        """
        Main Runner
        """
        # Step 3 - Main Runner: Process through options and arguments
        print("Ready to launch")
        print("Optionals : {}".format(optionals))
        print("Positionals : {}".format(positionals))

        """
        Process and perform your main body here
        """

        # Unit Tests
        test_cli_arguments()

    if __name__ == "__main__":
        setup()
        main()
    ```

- Entry point/main runner
    - Notes
        + Checks if the script is being called, and not being imported/sourced as a module/library/class
    ```python
    import os
    import sys

    init()
    {
        # Setup/initialization/pre-loading function
    }

    main() 
    {
        # Main runner
        exec = sys.argv[0]
        argv = sys.argv[1:] # Get the first argument excluding the executable
        argc = len(argv) # Get the size of the arguments parsed
    }

    if __name == "__main__":
        # Only run this if it is called and not sourced
        init()
        main()
    ```

## Wiki

## Resources

## References

## Remarks
