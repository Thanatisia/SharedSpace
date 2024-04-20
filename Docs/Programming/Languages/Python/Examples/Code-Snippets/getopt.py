"""
Getopt CLI argument parser template for python
"""
import os
import sys

# Get System and Application Information
exec = sys.argv[0]
exec_path = os.path.basename(exec)[0]
exec_name = os.path.basename(exec)[1]
argv = sys.argv[1:]
argc = len(argv)

# Initialize Global Variables
positionals = []
opts = {}

if argc > 0:
    # Iterate through arguments list
    for i in range(argc):
        # Get current argument
        curr_arg = argv[i]

        # Check if argument starts with either '-' (short form) or '--' (long form)
        if (curr_arg.startswith("-")) or (curr_arg.startswith("--")):
            ## Starts with either '-' or '--' : Optional arguments

            ## Sanitize current argument, removing the starting '-' or '--'
            if curr_arg.startswith('-'):
                curr_arg = curr_arg.split("-")
            elif curr_arg.startswith('--'):
                curr_arg = curr_arg.split("--")

            ## Select last element
            curr_arg = curr_arg[::-1][0]

            ## Check if contains '='
            if '=' in curr_arg:
                ## Contains '='
                ## split by delimiter '=' with [0] = key, [1] = value
                ##     key = setting option
                ##     value = setting value
                key, values = curr_arg.split('=')
            else:
                ## Does not contain
                ## Separated by space delimiter (spacing), Default
                ## [i] = the flag, [i:] = Command Line Arguments
                key = curr_arg
                values = True

            ## Map the key obtained to the values
            opts[key] = values
        else:
            ## Positional arguments
            positionals.append(curr_arg)

    ## Return/Print CLI arguments
    print("{} arguments provided".format(argc))
    print("Positionals: {}".format(positionals))
    print("Optionals: {}".format(opts))
else:
    print("No arguments provided.")

