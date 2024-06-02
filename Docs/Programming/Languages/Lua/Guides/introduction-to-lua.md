# Lua - Documentations

## Information

### Description
+ This is a complete (as much as possible) write-up documentation of the lua embedded scripting/programming/interpreted language for beginners to learn from scratch

## Table of Contents
- [Basics](#basics)
    + [Operators](#operators)
    + [Variables](#variables)
- [Data Types](#data-types)
    + [String](#string)
    + [nil](#nil)
- [Standard Streams](#standard-streams)
    + [Standard Output (stdout)](#standard-output)
- [Data Structures](#data-structures)
    + [Arrays](#arrays)
    + [Tables](#table)
- [Iterative](#iterations)
    - [For Loop](#for-loop)
        + [Indexed-based](#indexed-based)
        + [Key-Value Mappings](#key-value-mappings)
- [Functions](#functions)
- [External Files](#external-files)
    + [Importing External Libraries and packages](#importing)
    + [File I/O Processing](#file-io-processing)
- [System Process Calls](#system-process-calls)
    + [Subprocess pipes](#subprocess-pipes)
- [Coroutines](#coroutines)
    + [Functions](#coroutine-functions)
    + [Setup Flow](#setup-flow)

## Basics

### Operators
+ `=` : Substitution; Set the values on the Right-Hand Side (RHS) to the variable on the Left-Hand Side (LHS)
+ `==` : Equals-to
+ `~=` : Not Equals to; Equivalent to `!=` in other languages

### Variables
> Declaration and Initialization

- Declaring a variable
    - Explanation
        - To declare a variable in lua, 
            + using the 'local' keyword will declare/generate a local variable only usable within the local scope (aka within the block in which you defined the object/variable)
    ```lua
    local var
    ```

- Initializing a variable
    - Explanation
        - After declaring, you will want to initialize the variable with a value so that it can be used
            - By default, in lua, every object when declared contains a 'nil' object if it does not contain any values (aka NULL, None, null)
                + This means that to check if an object is nil, you can just do a comparison for nil
                    ```lua
                    local var

                    if var == nil do
                        --- nil object
                    else
                        --- Not nil object
                    end
                    ```
        - To initialize a variable in lua,
            + Use the '=' operator to set the values of the Right-Hand Side (RHS) to the variables on the Left-Hand Side (LHS)
    - Initializing the various Data Types
        - nil (Default)
            ```lua
            var = nil
            ```
        - int
            ```lua
            var = 0-9
            ```
        - string
            ```lua
            var = "value"
            ```
        - array
            ```lua
            var = {elements, in here}
            ```
        - table
            ```lua
            var = {
                key = value
            }
            ```

## Data Types
### String
#### String Formatting
- To concatenate strings
    - Explanation
        + Use the '..' operator
    ```lua
    print("Hello" .. "World")
    ```

- To concatenate a raw string to a variable
    ```lua
    local var = "world"
    print("Hello" .. world)
    ```

### nil
- Explanation
    + also known as None, NULL, null
    - nil is basically an empty object, it is not even intiialized
        + Hence, you should do data validations such as a Null-value check to ensure a memory container is in a safe state to be used

- To check if a variable is nil
    - Using the object directly
        ```lua
        local var

        if var == nil do
            --- nil object
        else
            --- Not nil object
        end
        ```
    - Using the 'next()' function
        - Explanation
            + This function will check if the object has any values in the next element
        ```lua
        local var

        if next(var) == nil do
            --- nil object
        else
            --- Not nil object
        end
        ```

## Standard Streams
### Standard Output
- To print something the standard output
    - Explanation
        + Use the `print()` command
    ```lua
    print("your" .. "message")
    ```

## Data Structures

### Arrays
#### Information
- Introduction
    - Lua is 1-based instead of 0-based
        + This means that lua starts counting up from 1 instead of 0 when accessing the index position of an array
    + Arrays are Indexed, Ordered containers based on positions
    + As arrays in lua are dynamic-sized, Arrays are also known as ArrayLists, Lists, Vectors

#### Syntax and Structure
- To set a new element into the array
    - Explanation
        + Use the 'arr[index] = value' syntax to set the value into the specified index position within the array
    ```lua
    arr = {}
    arr[1] = "new_value"
    ```

- To obtain the number of elements in an array
    - Using the '#' prefix
        - Explanation
            + Use the '#' prefix behind the variable
        ```lua
        local arr = {}
        local number_of_elements = #arr
        ```
    - Manually using a function
        ```lua
        function M.get_list_size(list)
            --- Initialize Variables
            local size = 0

            --- Iterate through the list/array and count the nuber of elements
            for _ in pairs(list) do
                --- Increment List Size
                size = size + 1
            end

            --- return
            return size
        end
        ```

#### Functions and Usages

> Inserting a line into an array

```lua
table.insert(arr, line)
```

### Table
#### Information
- Introduction 
    + In lua, everything is a table ('{}')
    + Tables are (Key-Value) Mappings
    + also known as Dictionary, Associative Array, HashMap, Map

#### Syntax and Structure
- To set a new key to a table
    - Explanation
        - Use the 'var.key = value' syntax to 'map' the new key object of the table/dictionary variable to the specified value
            + Specifically, the `.key` operator
    ```lua
    arr = {}
    arr.key = "new_value"
    ```

- To obtain the number of elements in a table
    - Explanation
        + Use the '#' prefix behind the variable
    ```lua
    local arr = {}
    local number_of_elements = #arr
    ```

## Iterations

### For Loop

- Notes
    - By design, every container is a table in terms of structure/layout, regardless of indexed-based (array) or key-value mappings (dictionary/tables)
        + This means that generally, the functions/method of iterating is applicable generally, so long as the object is an iterable
    + You can use the '_' operator as a placeholder for any variables you do not want to use/initialize

#### Indexed-based

> Iterate through the array

- Notes
    + This works similar to Python
        ```python
        arr:list = []

        for element in arr:
            print("Current Element: {}".format(element))
        ```

```lua
for element in arr do
    print("Current Element: " .. element
done
```

> Iterating through an array and inserting each line into a table

- Notes
    + This works similar to Python
        ```python
        opts:list = []
        arr:list = []

        for line in arr:
            opts.append(line)
        ```

```lua
local opts = {}
local arr = {}

for line in arr do
    table.insert(opts, line)
done
```

> Iterating over an array using ipairs over pairs

- Explanation
    - For arrays, the natural way is to use `ipairs`, not `pairs`. However, it still needs a key
        - Like `pairs(arr)`, ipairs will return a key-value mapping in the iterative as well,
            + However, unlike `pairs(arr)`, the key is the index instead of a name

- Notes
    + This works similar to Python
        ```python
        arr:list = []

        for i in range(len(arr)):
            # Get current element
            curr_element = arr[i]

            # Print
            print("Current Element [{}]: {}".format(i, value))
        ```

```lua
for i, value in ipairs(arr) do
    print("Current Element [" .. i .. "]: " .. value)
end
```

> Iterating over an array and just obtaining the values

- Explanation
    + Use the function `values(arr)` to obtain only the values of the array and return as an iterable (table)

```lua
for element in values(arr) do
    print("Element: " .. element)
end
```

#### Key-Value Mappings

> Iterate through the table/dictionary and obtain the key-value mappings (LHS : RHS) of the table

- Notes
    + This works similar to Python
        ```python
        for k,v in dictionary.items()
            print("Key: {}".format(k))
            print("Value: {}".format(v))
        ```

```lua
local arr = { key = "value" }

for k,v in pairs(arr) do
    print("Key: " .. k)
    print("Value: " .. v)
end
```

## Functions

### Synopsis/Syntax
- Declaring and initializing a function
    - Explanation
        + Define a function using the `function` keyword, and specify the function's parameter signature/headers
        + End the function definitions using the `end` keyword
    ```lua
    function function_name(parameter_signature)
        --- Statements in here
    end
    ```

- Declaring and initializing a function within a table
    - Explanation
        + In Lua, because every object is a table, you can set a function and initialize directly as part of a variable
    ```lua
    local arr = {}

    function arr.function_name(parameter_signature)
        --- Statements in here
    end
    ```

- Declaring and initializing a function that returns a value
    - Notes
        - When calling a function that is not returning a value
            + The returned object will be 'nil'
    ```lua
    --- Define and initialize function for usage
    function function_name(parameter_signature)
        --- Initialize Variables
        local res = {}

        --- Statements in here

        --- Perform modification here

        --- Return result
        return res
    end
    ```

- Calling a function
    - Notes
        - When calling a function that is not returning a value
            + The returned object will be 'nil'
    ```lua
    local result = function_name(parameters, ...)
    ```

- Calling a function within a table
    ```lua
    local arr = {}

    --- Define a function for example
    function arr.function_name(parameter_signature)
        --- Statements here
    end

    --- Call function in array
    local result = arr.function_name(parameters, ...)
    ```

## Command Line Arguments

### Obtaining Command Line Arguments in Lua
- To obtain the CLI arguments passed in lua (aka 'argv')
    - Explanation
        - Use the 'arg' variable
            + The 'arg' variable is a special 'keyword' that contains all arguments passed in an array (Ordered/Positional/Indexed-based container) (aka ArrayList, List, Vector)
    ```lua
    local argv = arg
    ```

- To obtain the number of arguments passed (aka 'argc')
    - Using the '#' prefix behind the variable
        - Explanation
            + '#arr' is used to obtain the number of elements within a table
        ```lua
        local argc = #argv
        ```
    - Manually using a function
        ```lua
        function M.get_list_size(list)
            --- Initialize Variables
            local size = 0

            --- Iterate through the list/array and count the nuber of elements
            for _ in pairs(list) do
                --- Increment List Size
                size = size + 1
            end

            --- return
            return size
        end
        ```

- Iterate through the CLI arguments list for usage
    ```lua
    --- Check if CLI arguments are provided
    if argc > 0 then
        for i = 1, argc do
            --- Get current argument
            local curr_arg = argv[i]

            --- Process current argument
            print(i .. " : " .. curr_arg)
        end
    else
        error("No arguments provided.")
    end
    ```

## External Files
### Importing
- Import an external library/module or package
    - Explanation
        - Use the `require(package)` keyword to import/source an external library into the local variable as an object
            - The returned variable is a plugin table object, specifically the plugin's master table (i.e. `M = {}`)
                + Consisting of the plugin's functions, data classes, objects, attributes/variables or settings
        - Separate each directory leading up to the script with a '.' delimiter/separator
            + When specifying the plugin script name, leave out the '.lua' file extension
    ```lua
    local imported_object = require("plugin.package.module.script")
    ```

### File IO Processing
- File I/O Operations
    - To open a file for usage
        - Explanation
            - Use the function `.open()` from the `io` library in the lua standard library to open files for usage
                - `io.open(file_name, mode)`
                    - Parameter Signature/Headers
                        - file_name : Specify the target file you wish to open
                            + Type: String
                        - mode : Specify the mode which you want to open with
                            + Type: String
                            - Modes:
                                + r : Read
                                + w : Write
                    - Return
                        - file : Return the opened file pointer (fp)/file descriptor (fd) containing the opened file contents
                            + Type: IO
        ```lua
        local file = io.open(file_name, mode)
        ```

- Open a file to read
    ```lua
    --- Initialize Variables
    local opts = {}

    --- Null Validation: Check if file name is provided
    if file_name ~= nil then
        --- Open file (in read mode) for reading
        local file = io.open(file_name, "r")

        --- Null Validation: Check if file was opened properly
        if file then
            --- Statements here
        else
            print("Error opening File Name: [" .. file_name .. "]")
        end
    else
        print("File Name not provided")
    end
    ```

- Obtaining the contents of a file
    ```lua
    --- Open file (in read mode) for reading
    local file = io.open(file_name, "r")

    --- Null Validation: Check if file was opened properly
    if file then
        --- Obtain the file contents
        local file_contents = file:lines()

        --- Iterate through the file contents and insert into table (dictionary/key-value mappings)
        for line in file_contents do
            --- Insert the current line into the options table
            table.insert(opts, line)
        end
    else
        print("Error opening File Name: [" .. file_name .. "]")
    end
    ```

## System process calls 
- also known as system command execution
    + process calls is used to execute system commands

### Subprocess pipes
- Introduction
    - Subprocess pipes are essentially dedicated pathways setup specifically for commands (and its parameters/arguments) called processes (or proc for short)
        + These processes have specific IDs known as Process IDs (or PIDs) that can be used to track the status of each process.
        - By using subprocess pipes, you can create processes for multiple commands and track all of them for easier synchronous (and even asynchronous) command execution
            + As well as obtaining the standard streams (standard output and standard error) from the process result output

- This is similar to `subprocess.Popen()` in python
    ```python
    from subprocess import Popen, PIPE, DEVNULL

    with Popen(["command", "arguments", "here"], stdin=PIPE, stdout=PIPE, stderr=PIPE) as proc:
        # Execute process using `.communicate()` for synchronous command execution
        stdout, stderr = proc.communicate()

        # Obtain status code on completion
        rc = proc.returncode
    ```

- To execute the command and arguments as a (sub)process pipe and return the standard output and the status/return/result code
    - Explanation
        - Use the `pcall(command, arguments, here)` function to call/execute the system commands using process pipes
            + Subprocesses will allow more robust control over the output and the polling, as well as communication between processes for synchronicity
            + `pcall()` will return 
                - 0 : The result/return/status code of the command
                    + Type: Boolean
                    - Values
                        + true: If the call succeeds without erors
                        + false: If the call contains an error
                - 1 : The standard Output object
                    + Type: any
                    - Value: If result is true
                - 2 : The standard Error object
                    + Type: any
                    - Value: If result is false
    ```lua
    local rc, object = pcall("command", "arguments", "here")
    ```

## Coroutines

### Coroutine Functions
- `coroutine.create(function)` : Create a new coroutine for handling asynchronous function synchronously
    - Parameter Signature/Header
        - function : Specify the function you wish to execute when the coroutine is started/executed
            + Type: Function
    - Return
        - co : The coroutine object containing the coroutine created
            + Type: coroutine
- `coroutine.resume(co, item_selection)` : Resume the coroutine when the callback event handler function has been triggered
    - Parameter Signature/Header
        - co : Specify the Coroutine object
            + Type: coroutine
        - item_selection : (Optional) Specify the value you want to resume the process/coroutine from
            + Type: any
    - Notes
        + The first time `.resume()` is executed, it will start the coroutine after the asynchronous operation is completed, and to wait for the user selection to complete.
        + Subsequent uses will be resuming the coroutine if `.yield()` is used to suspend the coroutine executions
+ `coroutine.running()` : Make the stream synchronous
- `coroutine.yield(value)` : Suspend the coroutine executions with the specified value as the last item, until the callback event hander function resumes the coroutine.
    - Parameter Signature/Header
        - value : Specify the value that will be stored as the last item for retrieval
            + Type: any
            - Notes
                + If the value is not provided, it will suspend the coroutine executions with the last item that was stored

### Setup Flow
- Create a new coroutine for handling asynchronous function synchronously
    ```lua
    local co = coroutine.create(function()
        --- Perform Asynchronous functions and operations here
    end)
    ```

    - Design your asynchronous operation/function
        - Create a asynchronous function (or a function that contains an asynchronous operation) to execute
            ```lua
            local func_name = function(parameter_signature, ...)
                --- Statements
            end
            ```

            - Make the stream synchronous
                ```lua
                local co = coroutine.running()
                ```
            - Ensure that 'co' is a valid coroutine
                ```lua
                if not co then
                    error("This function must be called within a coroutine")
                end
                ```
            - (Optional) Define callback event function. 
                - Explanation 
                    + This Callback Event Handler function will be triggered after an asynchronous event (i.e. menu item is selected from a popup menu window) is detected
                    + To resume the coroutine at the end of the event handler: `coroutine.resume(co, selected_item)`
                ```lua
                local cb = function(_, sel)
                    --- Return the result of the attached function back up to the 'sel' callback object and
                    --- store the sel local variable result into 'async_res.result'
                    async_res.result = sel

                    --- Resume the coroutine after the menu has been created
                    coroutine.resume(co, sel)
                end
                ```
            - Activate asynchronous function
                ```lua
                your_async_function(opts, cb)
                ```
            - Suspend execution until the callback event handler resumes it
                - Explanation
                    - `coroutine.yield(value)` will suspend the coroutine executions with the specified value as the last item, until the callback event hander function resumes the coroutine.
                        + If the value is not provided, it will suspend the coroutine executions with the last item that was stored
                    + To resume the coroutine at the end of the event handler: `coroutine.resume(co, selected_item)`
                ```lua
                local result = coroutine.yield()
                ```
            - Return the result back to the caller of the asynchronous function
                ```lua
                return result
                ```

- Start the coroutine after the asynchronous operation is completed, and to wait for the user selection to complete.
    ```lua
    local success, message = coroutine.resume(co)
    ```

- Check if coroutine ran successfully
    ```lua
    if not success then
        error("Coroutine error: " .. tostring(message))
    end
    ```

## Resources

## References

## Remarks

