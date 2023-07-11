# C++: Using Pipes

## Table of Contents
+ [Basics](#basics)
+ [Wiki](#wiki)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Basics
+ Pipe as a general concept is basically the idea of redirecting an output after running/execution into a buffer/memory object in another location
    - In Operating Systems 
        + Pipe allows you to send the stdout of command-1 into the stdin of command-2 for use
            ```console
            command-1 | command-2 {options} <arguments>
            ```
    - Similar Implementations
        + similar to Python's `os.Popen(cmd)`

## Wiki
### Snippets and Examples
- Basic implementation
    ```c
    vector<string> exec_return(string cmd, bool verbose=false)
    {
        /*
         * Execute system commands using strings and return the standard output
         *
         * :: Params
         * - cmd : The command string you want to execute
         *   Type: string
         *
         * - verbose : Flag to enable/disable verbose output
         *   Type: Boolean
         *   Default Values: false
         */
        // Initialize Variables
        char buffer[128]; // Buffer array container to hold Pipe object contents
        vector<string> res_stdout = {};

        // Convert command string into a char *
        const char *cmd_str = cmd.c_str();

        // Create PIPE object for calling system commands and retrieve the standard output
        FILE *pipe = _popen(cmd_str, "r");

        // Check if pipe is opened
        if(!pipe) { throw std::runtime_error("popen() failed!"); }

        // If no issue with the pipe
        try {
            // try getting all contents of the pipe stream
            while (fgets(buffer, sizeof buffer, pipe) != NULL) 
            {
                // While there are still contents in the stream to return
                // buffer = Memory Container containing all the pipe contents/data
                res_stdout.push_back(buffer);
            }
        }
        catch(...)
        {
            /*
             * Error detected: Close the pipe object
             */
            _pclose(pipe);
            throw;
        }

        /*
         * After finishing
         */
        // Close the pipe
        _pclose(pipe);

        return res_stdout;
    }
    ```

## Resources

## References

## Remarks
