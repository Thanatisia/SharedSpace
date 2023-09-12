# Custom Command Line Argument (CLI) without getopt(s)

Command Line (CLI) Argument and Parameter implementation in Linux shellscripting is typically written using the getopt or getopts framework.
Those 2 functions are powerful in providing the capability to easily create command line parameter input without much overhead required.

However, it is actually possible to create your own command line argument support using an if-condition, a while loop, a case-esac and the shift function.

## Components
+ Opening if-condition         : Check if any arguments are provided.
+ While loop                   : While the next argument being provided is not empty.
+ case-esac                    : Switch case to check if the current argument is a valid input from the user.
+ shift [n] function           : Shift/move the current cli argument/parameter index to the left by n-position.
+ 'optional' associative array : Associative Array (aka Map/HashMap/Dictionary) to store all optional arguments parsed in as well as the values
+ 'positional' list            : List (aka ArrayList/Array/Vector) to store all positional arguments parsed in; The index of the element is the position

## Snippets
- Command Line Argument and option parsing
    ```shellscript
    main()
    {
        #
        # Main body
        # - Perform command line arguments and pre-processing checks and validation before running
        #
        argv=("$@")
        argc="${#argv[@]}"

        # Check if there are arguments
        if [[ "$argc" -gt 0 ]]; then
            ## There are arguments
            ## Proceed to loop
            while [[ "$1" != "" ]]; do
                ## While there are still arguments
                ## Loop through all arguments until there are no more
                case $1 in
                    "option")
                        # Statements here

                        # Shift argument left-wards by 1 position after using it (the argument) to shuffle to the next option/argument in the list
                        shift 1
                        ;;
                    "-h" | "--help")
                        # Display this help menu and all commands/command line arguments
                        echo -e "Display Help"
                        display_help

                        # Shift argument left-wards by 1 position after using it (the argument) to shuffle to the next option/argument in the list
                        shift 1
                        ;;
                    *)
                        # Invalid arguments provided
                        echo -e "Invalid argument [$1] provided."

                        # Shift argument left-wards by 1 position after using it (the argument) to shuffle to the next option/argument in the list
                        shift 1
                        ;;
                esac
            done
        else
            echo -e "No arguments provided."
        fi
    }
    ```

- Command Line Argument with variable positions (Recommended)
    ```bash
    init()
    {
        : "
        Initialize Variables
        "
        # Initialize Variables
        declare -gA configuration_Optionals=(
            # key = variable/option name
            # value = value
            ["help"]="false"
            ["version"]="false"
        )
        declare -g configuration_Positionals=()
    }

    obtain_args()
    {
        : "
        Obtain arguments
        "
        argv=("$@")
        argc="${#argv[@]}"

        ## Check if arguments are provided
        if [[ "$argc" -gt 0 ]]; then
            ## Arguments are provided
            ## Loop through all arguments while there are still arguments
            ## and shift 1 position to the left to move to the next argument in the list
            while [[ "$1" != "" ]]; do
                case "$1" in
                    "-h" | "--help")
                        ## Display help menu
                        configuration_Optionals["help"]="true"
                        shift 1
                        ;;
                    "-v" | "--version")
                        ## Display system version
                        configuration_Optionals["version"]="true"
                        shift 1
                        ;;
                    *)
                        ## Invalid argument
                        ## Positionals
                        ## - Append to configurations
                        configuration_Positionals+=("$1")
                        shift 1
                        ;;
                esac
            done
        else
            ## Arguments are not provided/specified
            echo -e "Arguments not provided."
            ## Exit program
            exit 1
        fi
    }

    setup() 
    {
        # Step 1 - Declare and Initialize variables
        init
        # Step 2 - Obtain, Process CLI arguments and options
        obtain_args "$@"
    }

    main()
    {
        : "
        Main Runner
        "
        # Step 3 - Main Runner: Process through options and arguments
        echo -e "Ready to launch"

        echo -e ""

        echo -e "Optionals   :" 
        for k in "${!configuration_Optionals[@]}"; do 
            v="${configuration_Optionals[$k]}"
            echo -e "[$k] => [$v]"
        done

        echo -e ""

        echo -e "Positionals :"
        for i in "${!configuration_Positionals[@]}"; do
            curr_element="${configuration_Positionals[$i]}"
            echo -e "$i : $curr_element"
        done

        echo -e ""

        : "
        Process and perform your main body here
        "
    }

    if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
        setup "$@"
        main
    fi
    ```

- Entry point/main runner
    - Notes
        + Equivalent to python's 'if __name__ == "__main__":'
        + Checks if the script is being called, and not being imported/sourced as a module/library/class
    ```shellscript
    init()
    {
        # Setup/initialization/pre-loading function
    }

    main() 
    {
        # Main runner
        argv=("$@")
        argc="${#argv[@]}"
    }

    if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
        # Only run this if it is called and not sourced
        init
        main "$@"
    fi
    ```
