# C++ : Using CLI Argument Parsing

## Table of Contents
+ [Components](#components)
+ [Wiki](#wiki)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Components

## Operational Flow
```
In any CLI argument handling/processing in C++, 
    there are generally these components
```
1. Check argc counter that it has more than 1 elements (because element [0] is always the executable itself)
    + This integer counter variable basically states the size of the argv CLI argument character array container
2. Loop through all elements in the character array 'argv'
    + Starting from index '1'
3. Check for CLI options/arguments to process
    - This is a syntax/best practice when designing a CLI utility
        + First option: Shortform option (i.e. -[character])
        + Second option: longform option (i.e. --[text])
4. Update argument list by Shifting of argument to the left
    - This is similar to 'shift 1' in bash shellscripting
        + Decrease the argc value after the argument is used so that it matches the argument counter
        + Remove the value from the command list so you can go to the next option by incrementing the argv pointer
    + You must do this everytime you use an argument/subargument
    ```c
    // Decrement the argc value
    argc--;

    // Increment the argv pointer
    argv++;
    ```

## Wiki
### Snippets and Examples
- Basic structure/format
    ```c
    int main(int argc, char *argv[])
    {
        // Initialize Variables
        vector<string> cmd_list = {};
        string src = argv[0]; // [0] = Executable itself

        // Check if there are arguments
        if(argc > 1)
        {
            // There are arguments
            // Loop through all arguments until there are no more
            for(int i=1; i<argc; i++)
            {
                // Get current argument
                string curr_arg = argv[i];
                cout << "Argument Value: [" << curr_arg << "]" << endl;

                // Check CLI arguments
                // NOTE:
                // - This is a syntax/best practice when designing a CLI utility
                //      - First option: Shortform option (i.e. -[character])
                //      - Second option: longform option (i.e. --[text])
                if(curr_arg == "-h" || curr_arg == "--help")
                {
                    int curr_index = i; // Store current index for use

                    // Check if next index is not the last index
                    if(curr_index++ != (argc - 1))
                    {
                        // There are still arguments    
                        // Get corresponding option in position index [i+1]
                        string arg_value = argv[curr_index++];
                        // Check if there's a value to the argument
                        if(arg_value != "")
                        {
                            // There's value provided.
                            // Statements here

                            /*
                             * Remove the value from the command list so you go to the next option
                             * - This is equivalent to 'shift 1' in bash shellscripting
                             *   - Must do this for every options
                             */
                            // Decrement the argc value
                            argc--;

                            // Increment the argv pointer
                            argv++;
                        }
                    }
                    else {
                        cout << "No command provided." << endl;
                    }
                }
                else
                {
                    // Default argument
                    cout << "Invalid argument provided: " << curr_arg << endl;

                    /*
                     * Remove the value from the command list so you go to the next option
                     * - This is equivalent to 'shift 1' in bash shellscripting
                     *   - Must do this for every options
                     */
                    // Decrement the argc value
                    argc--;

                    // Increment the argv pointer
                    argv++;

                    exit(1);
                }
            }
        }
        else
        {
            cout << "No arguments provided." << endl;
        }

        return 0;
    }
    ```

## Resources

## References

## Remarks
