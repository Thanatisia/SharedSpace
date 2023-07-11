# Python : Using CLI Argument Parsing

## Table of Contents
+ [Components](#components)
+ [Terminologies](#terminologies)
+ [Methods](#methods)
+ [Wiki](#wiki)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Components

## Terminologies
+ CLI  : The Command Line Interface
+ argv : The shortform for Variable-Length arguments, generally used to represent the CLI arguments specified by the user
+ argc : The count/number of arguments provided; generally used for the number of CLI arguments specified by the user

## Methods
- Python has an argument parser library named 'argparse', as such, there are 2 methods of implementing CLI Argument Parsing
    - Manual Implementation
        - Operational Flow
            ```
            In any CLI argument handling/processing in C++, 
                there are generally these components
            ```
            1. Check argc counter that it has more than 1 elements (because element [0] is always the executable itself)
                + This integer counter variable basically states the size of the argv CLI argument character array container
            2. Loop through all elements in the list 'argv'
                + Starting from index '1'
            3. Check for CLI options/arguments to process
                - This is a syntax/best practice when designing a CLI utility
                    + First option: Shortform option (i.e. -[character])
                    + Second option: longform option (i.e. --[text])
                - Perform a while loop that runs as long as the current index is less than the upperbound/maximum limit (i < argc)
                    ```python
                    # Check if there are arguments provided
                    if(argc > 0):
                        # Arguments provided
                        # Loop through all recorded arguments
                        i:int = 0
                        # While current index is not the last element
                        while i < argc:
                            # Get current argument
                            arg:str = argv[i]

                            ## Conditions here
                            ### Check for CLI option and arguments here
                            if (arg == "-[short-form]") or (arg == "--[long-form]"):
                                ### Statements here... ###
                            else:
                                # Default option
                                print("Invalid option provided: [{}]".format(arg))

                            ## Increase index
                            i += 1
                    else:
                        # No arguments provided
                        print("No arguments provided.")
                    ```
                - If you have argument/options with subarguments 
                    - Update argument list by Shifting of argument to the left
                        - This is similar to 'shift 1' in bash shellscripting
                            + Decrease the argc value after the argument is used so that it matches the argument counter
                            + Remove the value from the command list so you can go to the next option by incrementing the argv pointer
                            + Decrease the current index of the list so it goes back down
                        + You must do this everytime you use an argument/option with subargument(s)
                        ```python
                        ## Pop out the option value
                        ## Note that you do this because I am assuming incremented your current index
                        argv.pop(i)

                        ## Reduce the count
                        argc = argc-1

                        ## Reduce the current index by 1 to remove the value
                        i = i-1
                        ```
    - Using argparse
        - Operational Flow
            1. Declare and Initialize the ArgumentParser class
                + This will return the ArgumentParser class object and Namespace
                - In the background
                    + This will retrieve 'system.argv'
            2. Add all arguments to be displayed using '.add_argument()'
                - In the background, 
                    - this will effectively append the argument into a list of options
                        + i.e. '-h' | '--help'
            3. Parse the list of arguments specified into the Argument Namespace
                - This will basically contain all the values mapped to the options in the form of Namespaces
                    + The option provided '--argument-option' will be parsed and converted into a Namespace object of format 'argument_option'
                    - Syntax/Equivalence:
                        - mapping
                            + Namespace 'argument_option' = "argument_value"
                    - Examples
                        + The option string `-X | --argument-option` => `arg-object.long_form`

## Wiki
### Snippets and Examples
- Basic structure/format
    - Components
        - process_args : CLI Arguments processor; Goes through all the arguments and append/make changes to flags before performing final execution
            - Variables
                - Global
                    + flags : Your options/flags to be processed after the CLI argument parsing
                    + argc  : Your count of the CLI arguments list
                    + argv  : Your CLI arguments list after removal of executable
                - Local
                    + i : The loop index
        + init         : Initialization of variables and defaults
    - Operational Flow
        - Notes
            + This is a rundown of how this syntax works for educational purposes, feel free to adjust/modify this to however you like
        - On Startup/Runtime
            - The interpreter will loop through the initializer and 
                1. go through the 'setup' function
                    - setup() will 
                        1. Initialize all default variables and set them as global for reference
                        2. Process all CLI arguments specified by user and store them into flags/run accordingly
                    - setup is complete
                2. After the initial setup, system will enter the main runner function
                    - main() will then proceed with any and all operations you require for the project
    ```python
    def process_args():
        """
        Process CLI arguments and options
        """
        global argc, argv, flags

        # Declare variables
        opt_value:str = ""

        # Check if there are arguments provided
        if(argc > 0):
            # Arguments provided
            # Loop through all recorded arguments
            i:int = 0
            # While current index is not the last element
            while i < argc:
                # Get current argument
                arg:str = argv[i]

                # Check argument option
                ### Positionals
                if (arg == "positional-command"):
                    """
                    Replace this with your positional commands/arguments here
                    """
                    ## start statement here
                ### Option with Arguments ###
                elif (arg == "-X") or (arg == "--option-with-subarguments"):
                    """
                    Replace this with any option that requires a subargument
                    """
                    # Check if there are arguments after this
                    if (i != (argc - 1)):
                        # This is not the last element in the list

                        # Get the next index
                        i = i+1

                        ## Get command to execute 
                        value_str:str = argv[i]

                        ## Do what you need with the value

                        """
                        When you are done with this option
                        """
                        ## Pop out the option value
                        argv.pop(i)

                        ## Reduce the count
                        argc = argc-1

                        ## Reduce the current index by 1 to remove the value
                        i = i-1
                ### Flags ###
                elif (arg == "-X") or (arg == "--flags"):
                    # Enable/Disable a flag (boolean value)
                    flags["option-name-here"] = True|False
                elif (arg == "-h") or (arg == "--help"):
                    # Help Menu
                    display_help()
                elif (arg == "-v") or (arg == "--version"):
                    # Display system version
                    display_version()
                else:
                    # Default option
                    print("Invalid option provided: [{}]".format(arg))

                ## Increase index
                i += 1
        else:
            # No arguments provided
            print("No arguments provided.")

    def init():
        """
        Initialization of defaults
        """
        # Global Variables
        global exec, argc, argv, flags, PROG_NAME, PROG_VERS

        # Declare and Initialize
        exec = sys.argv[0]
        argv = sys.argv[1:]
        argc = len(argv)
        flags = {
            "boolean-option" : False,
            "list-option" : [],
            "dictionary-option" : {"key" : "value"},
            "int-option" : 0,
            "string-option" : "Hello World",
            "float-option" : 0.0f,
        }
        PROG_NAME = "program-name"
        PROG_VERS = "v[major].[minor].[patches]-<release>"

    def setup():
        """
        Pre-program Startup/setup function
        """
        init()
        process_args()

    def main():
        """
        Main Runner
        """
        # Statements here

    if __name__ == "__main__":
        setup()
        main()
    ```

## Resources

## References

## Remarks
