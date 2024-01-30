"""
Sample template main file in a Python project codebase

:: Summary

:: Components
- Generally, any application main file should contain the following
    - help function : This function will display a help message with the syntax, parameters/options and usage
        - i.e.
            - display_help()
    - init function : This function will perform global variable and class object initializations
        - i.e.
            - init()
    - CLI argument obtain function : This function will obtain CLI arguments parsed into the application via the following format
        - CLI argument parsing blueprint steps
            1. Check if there are arguments provided
                - Assuming there are, proceed to step 2
            2. Loop through the CLI argument list
                - Obtain the current element in the list
                - Process through the current element and check if its a valid option (using either if-else condition blocks or switch/match-case statements)
                    - If the current element is a positional argument (non-optional)
                        - Recommended: Store into a separate list for positionals, as these arguments will be executed in a sequential order as per its positioning
                    - If the current element is an optional argument
                        - Check if the current element is a flag, or an option with parameter input values (i.e. -o [input])
                            - If the element is a flag: Set it as True or False (Boolean)
                            - If the element contains input values
                                - Temporarily obtain the index of the next argument (i+1)
                                - Obtain the next argument (argv[i+1])
                                - Map the option with the input argument (pos[k] = argv[i+1])
                                - Remember to pop that index/element from the argument list so that the list shifts left by 1 argument and goes to the next option/positional
                                    - argv.pop(i+1)
    - CLI argument process function : This function will process through the CLI arguments parsed and check for positionals and optional arguments
    - setup function : This function will perform pre-initialization and project environment setup
        - i.e
            - setup()
    - main function : The main entry point of the application; in Web Development, generally it should be index.[extension] if it is a web page
        - i.e.
            - main()
"""
import os
import sys

def display_help():
    """
    Display help message
    """
    msg="""
{}

:: Synopsis/Syntax
python {} <global-options> [actions] <internal-options> <arguments>

:: Parameters
- Positionals
    - Actions
        - actions : Description
            + Type: <Data Type>
- Optionals
    + -h | --help : Display help message

:: Usage
""".format(
    application_Info["name"], 
    application_Info["executable"]
)
    print(msg)

def init():
    """
    Perform global variable and class object initialization
    """
    global flags, application_Info, exec, argv, argc

    application_Info = {
        "name" : "Project Name",
        "executable" : "main.py",
        "version" : "v0.1.0",
    }

    # Global Variables
    flags = {
        "help" : False
    }

    exec = sys.argv[0]
    argv = sys.argv[1:]
    argc = len(argv)

    # Initialize Class variables

def obtain_cli_args():
    """
    Obtain CLI arguments in a dictionary (Key-Value) object
    """
    # Initialize Variables
    args = {
        "positionals" : {
            # [ID] = "positional argument input"
        },
        "optionals" : {
            "with-arguments" : {
                # Options with subarguments/parameters
                # [option-name] : [subargument]
            },
            "flags" : {
                # Flags = No arguments, but boolean. True/False
                # [option-name] : [true|false]
            }
        }
    }
    argv_local = argv.copy() # Copy the global CLI argument list so that the original list does not get overwritten (list and dictionaries in python uses a Pass-by-Reference property by default, which means that they both share the same memory address location in the memory register. Changing any values in a new list will modify the original as well)

    # Check if there are arguments
    if argc > 0:
        # While there are still arguments
        # Loop through and get all arguments
        for i in range(argc):
            # Get current CLI argument
            curr_arg = argv_local[i]

            # Process argument
            match curr_arg:
                case "-h" | "--help":
                    # Display Help
                    ## Check if option is in arguments
                    if not ("help" in args["optionals"]["flags"]):
                        ## Initialize the entry
                        args["optionals"]["flags"]["help"] = True
                case "-v" | "--version":
                    # Display system version
                    ## Check if option is in arguments
                    if not ("check-version" in args["optionals"]["flags"]):
                        ## Initialize the entry
                        args["optionals"]["flags"]["check-version"] = True
                case _:
                    # Default, incorrect option
                    print("Incorrect option provided : {}".format(curr_arg))
                    display_help()
    else:
        print("No arguments provided.")

    # Output
    return args

def process_cli_args(cli_args):
    """
    Process CLI arguments obtained

    :: Params
    - cli_args : Dictionary (Key-value) mapping of CLI argument (i.e. positionals, optional arguments - flags or with subarguments)
        Type: Dictionary
    """
    # Initialize Variables
    positionals = cli_args["positionals"]
    optionals = cli_args["optionals"]
    opt_with_Args = optionals["with-arguments"]
    opt_Flags = optionals["flags"]

    # Check Optional Arguments
    for k,v in opt_Flags.items():
        # option = True|False
        match k:
            case "help":
                # Check if is true
                if v == True:
                    # Is true
                    display_help()
            case "check-version":
                # Check if is true
                if v == True:
                    # Is true
                    print("System Version: {}".format(application_Info["version"]))
            case _:
                # Invalid option obtained
                print("Invalid option obtained: {}".format(k))

    # Loop through positional dictionary
    for k,v in positionals.items():
        print("{} = {}".format(k,v))

def setup():
    """
    Perform pre-initialization and project environment setup
    """
    global flags
    flags = obtain_cli_args()
    print(flags)
    process_cli_args(flags)

def main():
    """
    Run
    """

if __name__ == "__main__":
    init()
    setup()
    main()


