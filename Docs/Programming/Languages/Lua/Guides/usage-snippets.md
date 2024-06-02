# Lua - Usage Examples and Snippets

## Table of Contents
- Topics
    + [Coroutines](#coroutines)

## Topics
### Coroutines
- Information
    + Coroutines in lua are used to handle asynchronous functions and operations synchronously

> Defining an example asynchronous function to execute synchronously

- Explanation
    - Parameter Signature/Headers
        - cb : This is the callback function that will be activated/triggered when an event has been detected within the asynchronous function
            + Callback Event Functions are generally asynchronous, as they need to be triggered only when an event is detected

- Timer
    ```lua
    local function async_function(cb)
        --- Initialize a new timer
        local timer = vim.loop.new_timer()

        --- Start the timer and run for 2 seconds
        timer:start(2000, 0,
            function()
                timer:stop()
                timer:close()
                callback("Result from your asynchronous operation")
            end
        )
    end
    ```

> Defining the coroutine wrapper while the asynchronous function is executing

```lua
local function wait_for_async()
    --- Make the asynchronous operation synchronous
    local co = coroutine.running()

    --- Ensure that 'co' is a valid coroutine
    if not co then
        error("This function must be called within a coroutine")
    end

    --- Define the callback function to be triggered/activated/called by the asynchronous function when the event has been detected
    local function callback(_, result)
        --- Perform result selected statements here

        --- Resume the coroutine after user input is obtained and return the coroutine's yield
        coroutine.resume(co, result)
    end

    --- Call the asynchronous function with the callback
    async_function(callback)

    --- Suspend execution until the callback event handler resumes it
    local result = coroutine.yield()

    --- Return the results to the caller
    return result
end
```

> Implementation and Usage

- Simple coroutine create, resume
    ```lua
    local function main()
        -- Define variables
        local result

        -- Create a coroutine to hand the asynchronous operation synchronously
        local co = coroutine.create(
            function()
                -- Perform asynchronous function and statements here

                print("Starting async operation...")

                --- Wait for the asynchronous operation to be completed and return the yield from the coroutine
                result = wait_for_async()

                --- Print the result
                print("Async operation completed with the results: " .. result)
            end
        )

        -- Start the coroutine after the asynchronous operation is completed
        coroutine.resume(co)
    end
    ```

- Error Handling
    ```lua
    local function main(opts)
        -- Define variables
        local result

        -- Create a coroutine to hand the asynchronous operation synchronously
        local co = coroutine.create(
            function()
                -- Perform asynchronous function and statements here

                print("Starting async operation...")

                --- Wait for the asynchronous operation to be completed and return the yield from the coroutine
                result = wait_for_async()

                --- Print the result
                print("Async operation completed with the results: " .. result)
            end
        )

        --- Start the coroutine after the asynchronous operation is completed
        local success, std_msg = coroutine.resume(co)

        --- Check if the coroutine ran successfully
        if not success then
            error("Coroutine error: " .. tostring(std_msg))
        end
    end
    ```

## Resources

## References

## Remarks

