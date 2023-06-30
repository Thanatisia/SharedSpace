# Custom Command Line Argument (CLI) without getopt(s)

Command Line (CLI) Argument and Parameter implementation in Linux shellscripting is typically written using the getopt or getopts framework.
Those 2 functions are powerful in providing the capability to easily create command line parameter input without much overhead required.

However, it is actually possible to create your own command line argument support using an if-condition, a while loop, a case-esac and the shift function.

## Components
+ Opening if-condition  : Check if any arguments are provided.
+ While loop            : While the next argument being provided is not empty.
+ case-esac             : Switch case to check if the current argument is a valid input from the user.
+ shift [n] function    : Shift/move the current cli argument/parameter index to the left by n-position.

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
