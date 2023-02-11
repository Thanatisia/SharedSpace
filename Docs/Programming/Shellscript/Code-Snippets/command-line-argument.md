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
- Main function
    ```shellscript
    main()
    {
        #
        # Main body
        # - Perform command line arguments and pre-processing checks and validation before running
        #
        argv=("$@")
        argc="${#argv[@]}"

        # Check that there are arguments
        if [[ "${argc}" -gt 0 ]]; then
            # There are arguments
            while [[ "$1" != "" ]]; do
                # Loop through all arguments until there are no more
                case $1 in
                    "-h" | "--help")
                        # Display this help menu and all commands/command line arguments
                        echo -e "Display Help"
                        display_help
                        shift 1
                        ;;
                    *)
                        # Invalid arguments provided
                        echo -e "Invalid parameter : $1"
                        shift 1
                        exit 1
                        ;;
                esac
            done
        else
            echo -e "No arguments provided."
        fi
    }
    ```

- Equivalent to python's 'if __name__ == "__main__":' check
    + Check if the script is being called, and not being imported/sourced as a module/library/class
    ```shellscript
    if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
        # Start
        main "$@"
    fi
    ```
