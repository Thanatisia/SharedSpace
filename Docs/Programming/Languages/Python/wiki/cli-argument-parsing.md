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
                    - Update argument list by 
                        - Shifting of argument to the left
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
                        - Moving to the subsequent element after obtaining the argument's value
                            - Unlike the previous example, this is a simpler concept whereby given a memory block
                                ```
                                [element-0] | [element-1] | [element-2] | [element-3] | ...
                                ```
                                - Assuming you are currently in index 0 (Position 1), which contains the element 'element-0'
                                    - Let element-0 be the optional argument '-x'
                                        - '-x' has an argument value attached to it
                                            + This argument value will be index 1 (Position 2) which contains the element 'element-1'
                                    - To obtain element-1, you will need to access the following index by incrementing your index counter by 1
                                        + However, you want to only do that temporarily as the index counter is your main loop thread.
                                        - Hence, you will want to obtain the next index 
                                            - However, before obtaining the value, you should check if there are arguments after this
                                                ```python
                                                if (i <= (argc - 1)):
                                                    # Statements
                                                ```
                                                - you increment your index counter by 1 and store it into another variable
                                                    ```python
                                                    next_index = i+1
                                                    ```
                                                - Get the argument
                                                    ```python
                                                    value_str:str = argv[next_index]
                                                    ```
                                                +  Do what you need with the value
                                                -  Map the optional to the argument keyword corresponding to this option
                                                    ```python
                                                    argparser["optionals"]["with-arguments"]["argument-id-here"] = value_str
                                                    ```
                                                - When you are done with this option
                                                    - Increment index counter by 1 to jump to the subsequent element
                                                        ```python
                                                        i += 1
                                                        ```
                                - At the end of the loop, increment index counter and go to the next element
                                    ```python
                                    i += 1
                                    ```
                            + You must do this everytime you use an argument/option with subargument(s)
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

> Operational Flow Example

- Initialize your argument parser structure
    ```python
    def init():
        global argparser

        # Initialize Variables
        argparser = {
            "positionals" : [],
            "optionals" : {
                "with-arguments" : {},
                "flags" : {}
            }
        }
    ```

- Define your CLI argument parser  
    - Left-to-Right CLI argument parsing
        ```python
        def process_args():
            """
            Process CLI arguments and options
            """
            global argparser

            # Get CLI arguments
            exec = sys.argv[0]
            argv = sys.argv[1:]
            argc = len(argv)

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

                        ## Map argument into positionals list
                        argparser["positionals"].append(arg)
                    ### Option with Arguments ###
                    elif (arg == "-X") or (arg == "--option-with-subarguments"):
                        """
                        Replace this with any option that requires a subargument
                        """
                        ## Get next index
                        next_idx = i+1

                        # Check if there are arguments after this
                        if (i <= (argc - 1)):
                            # This is not the last element in the list

                            # Get the next index
                            next_index = i+1

                            ## Get command to execute
                            value_str:str = argv[i]

                            ## Do what you need with the value

                            ## (Optional) Map the optional to the argument keyword corresponding to this option
                            argparser["optionals"]["with-arguments"]["argument-id-here"] = value_str

                            """
                            When you are done with this option
                            """
                            # Increment index counter by 1 to jump to the subsequent element
                            i += 1
                    ### Flags ###
                    elif (arg == "-X") or (arg == "--flags"):
                        # Enable/Disable a flag (boolean value)
                        argparser["optionals"]["flags"]["argument-id-here"] = True|False
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

            # Output/Return
            return argparser
        ```
    - Argument Parser with default values set if no values are provided to the argument
        ```python
        def get_cli_arguments():
            """
            Get and parse CLI arguments provided by users
            """
            global argparser

            # Initialize Variables

            # Get CLI arguments
            exec = sys.argv[0]
            argv = sys.argv[1:]
            argc = len(argv)

            # Iterate through all CLI arguments and format into the arguments parser
            i:int = 0
            while i < argc:
                # Get current argument
                curr_arg:str = argv[i]

                # Match/switch case the current argument
                match curr_arg:
                    ## Optional Flags
                    case "-<short-form>" | "--<long-form>":
                        """
                        Replace this with any option that requires a subargument
                        """
                        # Optional argument with values required
                        ## Get next index
                        next_idx = i+1
                        ## Check if next argument value is provided
                        if next_idx <= (argc-1):
                            # Next index is not last element
                            next_element = argv[next_idx]

                            # Data Validation: Check if a filter value is specified
                            if next_element != "":
                                # Data Validation: Check Condition is met
                                if ([your-condition-here] == True):
                                    # Accepted Filter
                                    # Map the optional to the argument keyword corresponding to this option
                                    argparser["optionals"]["with-arguments"]["argument-id-here"] = next_element

                                    # Increment index counter by 1 to jump to the subsequent element
                                    i += 1
                                else:
                                    # Map the optional to the default value
                                    argparser["optionals"]["with-arguments"]["argument-id-here"] = default_value_here
                            else:
                                # Empty value: set to default
                                # Map the optional to the default value
                                argparser["optionals"]["with-arguments"]["argument-id-here"] = default_value_here
                        else:
                            # Argument not provided
                            # Map the optional to the default value
                            argparser["optionals"]["with-arguments"]["argument-id-here"] = default_value_here
                    ## Optional With Arguments
                    case "-<short-form>" | "--<long-form>":
                        # Enable/Disable a flag (boolean value)
                        argparser["optionals"]["flags"]["argument-id-here"] = True|False
                    case _:
                        # Default: Positional
                        argparser["positionals"].append(curr_arg)

                # Increment index counter and go to the next element
                i += 1

            # Output/Return
            return argparser
        ```

- Call and obtain the argument parser
    - Explanation
        + `case opt_name if not (opt_name in list(opt_category_values.keys())):` : Check if the current optional key-name is in the list of parsed optional arguments
    ```python
    def main():
        """
        Perform Pre-Initialization Setup
        """
        init()

        """
        Get CLI arguments
        """
        argparser = get_cli_arguments()

        """
        Extract CLI arguments as necessary
        """
        positionals = argparser["positionals"]
        optionals = argparser["optionals"]
        opt_with_args = optionals["with-arguments"]
        opt_with_args_Keys = list(opt_with_args.keys())
        opt_Flags = optionals["flags"]
        opt_flags_Keys = list(opt_Flags.keys())
        number_of_pos = len(positionals)
        number_of_opt = len(optionals)

        if ("verbose" in opt_flags_Keys):
            if opt_Flags["verbose"]:
                pprint_info(argparser)
                pprint_info(opt_with_args_Keys)

        """
        Process obtained CLI arguments
        """
        ## Iterate through the optional categories
        for opt_category_key, opt_category_values in optionals.items():
            for opt_name, opt_value in opt_category_values.items():
                # Switch case and check values
                match opt_name:
                    case "argument-id-here":
                        ## Perform actions here
                        exit(0)
                    case opt_name if not (opt_name in list(opt_category_values.keys())):
                        ## Default: If current option is not in the list
                        print("Invalid optional provided in category [{}]: {}={}".format(opt_category_key, opt_name, opt_value))

        """
        Process obtained positional arguments
        """
        for i in range(number_of_pos):
            # Get current positional
            curr_pos = positionals[i]

            # Do what you need with the current positional

    if __name__ == "__main__":
        main()
    ```

## Resources

## References

## Remarks

