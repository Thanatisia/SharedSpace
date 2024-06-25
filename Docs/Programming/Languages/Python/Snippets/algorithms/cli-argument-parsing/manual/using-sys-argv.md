# Python snippets - Algorithms - Manual CLI Argument Parsing using the built-in 'sys' standard library/module in python

## Steps

> Implementations

1. Initialize Variables
    ```python
    argparser = { "positionals" : [], "optionals" : { "with-arguments" : {}, "flags" : {} } }
    ```

2. Check if there are arguments provided
    ```python
    if argc > 0:
        # Arguments provided
        # Statements ...
    ```

3. If there were no arguments provided
    ```python
    else:
        print("[X] No arguments provided.")
        exit(1)
    ```

4. If there are arguments provided
    + Initialize the index counter 'i'
    + Start a while loop counter that will run as long as the index 'i' is less than or equals to the (size of the arguments list - 1)
    ```python
        i = 0
        while i <= (argc-1):
    ```

5. Get current argument
    ```python
            curr_arg = argv[i]
    ```

6. Process current argument
    - Explanation
        - Perform a 'Match-case' (aka 'switch-case') pattern matching against the current argument
            - The cases will be to check if the current argument is any of the optional arguments
                - Denoted by the structure/format:
                    + `-<short-form>` : Short Format, typically only uses 1 character (i.e. -h, -v)
                    + `--<long-form>` : Long Format, typically this will be multiple word that describes the purpose of the usage (i.e. --help, --version)
            - If a parameter with argument values is found
                1. Set the keyword for the current optional
                2. Get the next element's index (`next_idx = i+1`)
                3. Check if there are any argument values provided in the following/subsequent option
                    - If there are are arguments (`if next_idx <= (argc-1)`)
                        + Get the next argument (`next_arg = argv[next_idx]`)
                        - Verify that the argument is not empty
                            + Check if the argument is empty (`if next_arg.rstrip() == ""`)
                            - Check if argument is not an optional (starts with '-') (`not (next_arg.startswith("-")):`)
                                - If the argument is an acceptable value
                                    - Check if the keyword is in the 'with-arguments' key-value
                                        + If the keyword is not in the list, map the keyword to the dictionary and initialize a new list entry
                                    + Append and set the argument to the current keyword
                                    + Increment index counter by 1 to skip the next argument to the subsequent element
                    - If there are no arguments
                        + Print 'argument not provided' message
            - If a flag (parameter with no argument values) is found
                1. Initialize the keyword for this optional argument (`keyword = "keyword/identifier-here"`)
                2. Set the boolean value of your flag optionals to 'True' when specified (`argparser["optionals"]["flags"][keyword] = True`)
    ```python
            match curr_arg:
                # With Arguments
                case "-<short-form>" | "--<long-form>":
                    # Get the next element's index
                    next_idx = i+1

                    # Set the current keyword
                    keyword = "keyword/identifier-here"

                    # Check if there are any argument values provided
                    if next_idx <= (argc-1):
                        # Arguments are provided
                        ## Get next argument
                        next_arg = argv[next_idx]

                        ## Verify that the argument is not empty
                        if next_arg.rstrip() == "": # Check if argument is empty
                            print("Empty value provided to {}.".format(curr_arg))
                        elif not (next_arg.startswith("-")): # Check if argument is an optional (starts with '-')
                            ## Check if the keyword is in the 'with-arguments' key-value
                            if not (keyword in argparser["optionals"]["with-arguments"]):
                                ## Not inside, initialize a new list
                                argparser["optionals"]["with-arguments"][keyword] = []

                            ## Append and set the argument to the key
                            argparser["optionals"]["with-arguments"][keyword].append(next_arg)

                            ## Increment by 1 to skip the next argument to the subsequent element
                            i += 1
                    else:
                        print("Argument value not provided to {}".format(curr_arg))
                # Flags
                case "-h" | "--help":
                    ## Display help
                    argparser["optionals"]["flags"]["help"] = True
                case "-v" | "--version":
                    ## Display system version information
                    argparser["optionals"]["flags"]["version"] = True
                case "-<short-form>" | "--<long-form>":
                    ## Initialize the keyword for this optional argument
                    keyword = "keyword/identifier-here"
                    ## Set the boolean value of your flag optionals to 'True' when specified
                    argparser["optionals"]["flags"][keyword] = True
                case _:
                    ## Default case: Positionals
                    argparser["positionals"].append(curr_arg)
    ```

7. Increment index by 1 to jump to the next argument
    ```python
            i += 1
    ```

> Usage

1. Initialize Variables and separate the argument parser into optional and positional lists
    ```python
    positionals = argparser["positionals"]
    optionals = argparser["optionals"]
    ```

2. Process CLI optional arguments - Iterate through both optionals with arguments and flags (True/False)
    ```python
    for opt_category, opt_dicts in optionals.items():
    ```

3. Iterate through the optional parameter values
    ```python
        for opt_key, opt_values in opt_dicts.items():
    ```

4. Match/Switch-case and process the key
    ```python
            match opt_key:
                # Note that the 'opt_key' contains the keyword/unique identifier you set to each optional argument/flags
                case "help":
                    # Display help
                    display_help()
                case "version":
                    # Display system version information
                    display_system_version()
                case "keyword/identifier-here":
                    # Retrieve the contains accordingly
                    obj = opt_values
                    print(obj)
                case opt_found if not (opt_found in list(opt_dicts.keys())):
                    # Option is not found
                    print("Optional argument '{}' is not found".format(opt_found))
    ```

5. Process positional actions - Iterate/for-loop through the positionals list
    ```python
    for i in range(len(positionals)):
    ```

6. Get current action
    ```python
        curr_action = positionals[i]
    ```

7. Match/Switch-case and process the action
    ```python
        match curr_action:
            case "action":
                # Your statements here
    ```

## Snippets

### Implementations

```python
# Initialize Variables
argparser = { "positionals" : [], "optionals" : { "with-arguments" : {}, "flags" : {} } }

# Check if there are arguments provided
if argc > 0:
    i = 0
    while i <= (argc-1):
        # Get current argument
        curr_arg = argv[i]

        # Process current argument
        match curr_arg:
            # With Arguments
            case "-<short-form>" | "--<long-form>":
                # Get the next element's index
                next_idx = i+1

                # Set the current keyword
                keyword = "keyword/identifier-here"

                # Check if there are any argument values provided
                if next_idx <= (argc-1):
                    # Arguments are provided
                    ## Get next argument
                    next_arg = argv[next_idx]

                    ## Verify that the argument is not empty
                    if next_arg.rstrip() == "": # Check if argument is empty
                        print("Empty value provided to {}.".format(curr_arg))
                    elif not (next_arg.startswith("-")): # Check if argument is an optional (starts with '-')
                        ## Check if the keyword is in the 'with-arguments' key-value
                        if not (keyword in argparser["optionals"]["with-arguments"]):
                            ## Not inside, initialize a new list
                            argparser["optionals"]["with-arguments"][keyword] = []

                        ## Append and set the argument to the key
                        argparser["optionals"]["with-arguments"][keyword].append(next_arg)

                        ## Increment by 1 to skip the next argument to the subsequent element
                        i += 1
                else:
                    print("Argument value not provided to {}".format(curr_arg))
            # Flags
            case "-h" | "--help":
                ## Display help
                argparser["optionals"]["flags"]["help"] = True
            case "-v" | "--version":
                ## Display system version information
                argparser["optionals"]["flags"]["version"] = True
            case "-<short-form>" | "--<long-form>":
                ## Initialize the keyword for this optional argument
                keyword = "keyword/identifier-here"
                ## Set the boolean value of your flag optionals to 'True' when specified
                argparser["optionals"]["flags"][keyword] = True
            case _:
                ## Default case: Positionals
                argparser["positionals"].append(curr_arg)

        # Increment index by 1 to jump to the next argument
        i += 1
else:
    print("[X] No arguments provided.")
    exit(1)
```

### Usage

```python
# Initialize Variables
positionals = argparser["positionals"]
optionals = argparser["optionals"]

# Process CLI optional arguments
## Iterate through both optionals with arguments and flags (True/False)
for opt_category, opt_dicts in optionals.items():
    ## Iterate through the optional parameter values
    for opt_key, opt_values in opt_dicts.items():
        ## Match/Switch-case and process the key
        match opt_key:
            # Note that the 'opt_key' contains the keyword/unique identifier you set to each optional argument/flags
            case "help":
                # Display help
                display_help()
            case "version":
                # Display system version information
                display_system_version()
            case "keyword/identifier-here":
                # Retrieve the contains accordingly
                obj = opt_values
                print(obj)
            case opt_found if not (opt_found in list(opt_dicts.keys())):
                # Option is not found
                print("Optional argument '{}' is not found".format(opt_found))

# Process positional actions
for i in range(len(positionals)):
    # Get current action
    curr_action = positionals[i]

    ## Match/Switch-case and process the action
    match curr_action:
        case "action":
            # Your statements here
```

## Resources

## References

## Remarks

