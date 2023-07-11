# C++: System command calls

## Table of Contents
+ [Basics](#basics)
+ [Wiki](#wiki)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Basics
- To call a system command in C/C++
    - You use the built-in function call 'system(char *cmd)'
        + system() returns the exit/result code of type <integer> after completion
        + To return the stdout/result of the command, you must use [PIPE](using-pipes.md)
    - This is the heart of just doing a simple system calling
        + Do this if you do not need any returns, or just the exit code (similar to Python's os.system(), with pipe being os.pOpen())
        ```c
        const char *cmd_str = "your-command <arguments>";
        int ret_Code = system(cmd_str); // Execute system command and return exit code
        ```
- 'system()' takes in a variable of type <const char *>, 
    - hence if you are parsing in a string variable, 
        + You need to convert the string to <const char *> using 'string_variable.c_str()'
    ```c
    string cmd = "your-command <arguments>";
    const char *cmd_str = cmd.c_str();
    ```

## Wiki
### Snippets and Examples
- Basic implementation
    ```c
    int exec_cmd(string cmd, bool verbose=false)
    {
        /*
         * Execute system commands using strings
         *
         * :: Params
         * - cmd : The command string you want to execute
         *   Type: string
         *
         * - verbose : Flag to enable/disable verbose output
         *   Type: Boolean
         *   Default Values: false
         */
        const char *cmd_str = cmd.c_str();

        // Verbose output
        if(verbose == true)
        {
            cout << "Executing '" << cmd_str << "'" << endl;
        }

        int ret_Code = system(cmd_str); // Execute system command and return exit code
        return ret_Code;
    }
    ```

## Resources

## References

## Remarks
