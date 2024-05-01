# Python Library - asyncio

## Table of Contents
* [Documentation](#documentation)

## Information
### DESCRIPTION
+ asyncio is a built-in python library for Asynchronous programming (async-await)
- Unlike multi-threading and multiprocessing, which are concurrent execution models, 
    + asynchronous programming is a form of parallel execution model. 
    - This method is based on the concept of 'event loop' and 'coroutines', 
        + allowing the program to handle multiple I/O-bound tasks concurrently without the need for threads or processes.

- asyncio as a library is used in conjunction with the keywords 'async' and 'await'
    + Acting as a helper library/module with functions that works with async-await as a dependency

## Documentation

### Packages
- asyncio

### Modules
- asyncio : The primary asynchronous programming I/O library/module for python

### Classes

### Functions
- asyncio
    - `.create_task(function_to_execute())` : Create a new task with a function to execute asynchronously
        - Parameter Signature/Header
            - function_to_execute : Specify and attach the function you wish to execute asynchronously
                + Type: Function
        - Return
            - task : Return the task object created to be executed asynchronously
                + Type: asyncio
    - `.run(function_to_execute())` : Start running the specified asynchronous (async) function
        - Parameter Signature/Header
            - function_to_execute : Specify and attach the asynchronous function to run
                + Type: Function
    - `.sleep(duration)` : Sleep for the specified duration (seconds)
        - Parameter Signature/Header
            - duration : Specify the duration for the task to sleep for (in seconds)
                + Type: Integer

### Data Types and Objects

### Attributes/Variables

### Usage
- Usage Syntax/Structure
    - Explanation
        - 1 coroutine 'function_to_execute' is created 
            + More can be created by using that same syntax structure
        - The `asyncio.create_task()` function is used to schedule the execution of these coroutines.
            + This will return the `task` object
        + The await keyword is used to pause the execution of the coroutine until the awaited task is completed.
        - The asyncio.run() function is used to execute the main coroutine, 
            + which waits for `task` to complete.
    ```python
    # Import library
    import asyncio

    # Create an asynchronous function to execute
    async def function_to_execute():
        # Statements here

        # Await
        await asyncio.sleep(1)

    # Create main() as an Asynchronous function
    async def main():
        task = asyncio.create_task(function_to_execute())

        # Await for the task to be completed before proceeeding
        await task

    if __name__ == "__main__":
        # Asynchronously run the main function
        asyncio.run(main())
    ```

### Operational Workflow
- Import package and modules
    ```python
    import asyncio
    ```

- Create an asynchronous function
    ```python
    async def function_to_execute():
        # Statements

        # Sleep for 1 second and wait for the sleep to be completed
        await asyncio.sleep(1)
    ```

- Create the main function as an asynchronous function with statements that will be ran using `asyncio.run(main())`
    - Statements
        - Create a new task and attach the asynchronous function you wish to execute
        - Await for the task to be completed before proceeeding
    ```python
    async def main():
        # Initialize a new task object
        task = asyncio.create_task(function_to_execute())

        # Await for the task to be completed
        await task
    ```

- Run the asynchronous main coroutine
    ```python
    if __name__ == "__main__":
        asyncio.run(main())
    ```

## Wiki

### Terminologies
- synchronous programming : Serially executing instructions as it is received and in the order it was received (similar to TCP vs UDP where TCP is synchronous)
- asynchronous programming : Asynchronously executing instructions in any order so long as it has received an instruction and will be executed (similar to TCP vs UDP where UDP is asynchronous). Asynchronous programming is a form of parallel execution model
- tasks : basically each task is also known as the individual elements within an iterable/list

## References

## Resources
+ [Python Docs - multiprocessing](https://docs.python.org/3/library/multiprocessing.html)
+ [run.ai - deep learning for computer vision - python parallel programming](https://www.run.ai/guides/deep-learning-for-computer-vision/python-parallel-processing)

## Remarks

