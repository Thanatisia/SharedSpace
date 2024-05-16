# Python Library - os

## Table of Contents
* [Documentation](#documentation)
* [Pre-Requisites](#pre-requisites)
* [Setup](#setup)

## Information
### DESCRIPTION
```
OS is a built-in python library to provide a portable way of handling Operating System (OS)-dependent functionality.
```

## Documentation
        
### Importing
- Whole Module
    ```python
    import os
    ```
    
### Modules
- os         : Handles general OS hardware/software information
- os.path    : Handles System Path (i.e. PATH or PYTHONPATH variable)
- os.environ : Handle Environment Variables

### Classes


### Objects

### Variables
- os
    - .name : Returns the name of the Operating System-dependent module import
        + Type: String
        - Notes
            + Similar to 'sys.platform' or the 'platform' module
        - Examples
            + posix : For UNIX/Linux systems
            + nt : For Windows (NT) systems
    - .sep : Returns the path separator for the detected operating system (i.e. '/' for Linux, '\' for Windows)
        + Type: String

### Functions

#### Cross-Platform
- os
    - `.getpid()` : Get the current Process's ID
        - Return
            - pid : The current process's ID
                + Type: Integer

- os.environ
    - .get(env_variable_key) : Get value of the Environment Variable
        - Parameters
            - env_variable_key : The Environment Variable to get
                + Type : String
        + Return Type: String

- os.path
    - `.join(src_path, additional_paths, ...)` : Joins the additional paths specified to the source path with the path separated based on the host operating system
        - Parameter Signature/Header
            - src_path : Specify the root top-level directory path
                + Type: String
            - additional_paths : Variable-Length; Specify all additional paths you wish to append to the back of the top-level directory
                + Type: String
        - Return
            - path : The combined path of the source and the additional paths
                + Type: String

### Usage
- Get Environment Variables
    ```python
    env = os.environ.get("Environment-Variable-Key") # Get value of the Environment Variable
    ```

- Using the Process' ID as a anchor to keep the values the same order as the standard input during concurrency/parallelism
    - Import libraries
        ```python
        import os
        from multiprocessing import Pool, SimpleQueue
        ```
    - Create multiprocess task function
        - Explanation
            + This function will be used in the multiprocessing Pool to be executed concurrently for every 'task'/element in the iterable
            - On completion of each task, the function will return the task's results into the pool
                + This will be applied for every element in the iterable/list until the last element then the pool can be used to retrieve all the results
        ```python
        def execute():
            # Get current process ID
            curr_proc_id = os.getpid()

            # Perform statements here

            # Store the results into the SharedQueue memory object
            return [curr_proc_id, values]
        ```
    - Create multiprocess Pool creation function
        - Explanation
            - 'with multiprocessing.Pool(initializer, initargs) as pool': This will create and configure a multiprocess pool in which the system will import/place all the 'tasks' into the pool to be executed concurrently/parallely
                - where 
                    + tasks are the individual elements within the iterable/list
                - Parameters
                    - `initializer=init_worker` : This argument will execute the specified initialize function, in which contains your statements to execute inside each process/task
                        + Type: Function
                    - `initargs=(,)` : This arguments is a tuple containing the arguments/parameters you wish to pass into the initializer function (if available)
                        + Type: Tuple
        ```python
        def multi_execute_tasks(urls):
            # Initialize/Create a shared queue for use
            shared_queue = SimpleQueue()

            # Create and configure the process pool
            with Pool(initializer=init_worker, initargs=(shared_queue, )) as pool:
                # Generate a Multiprocessing Pool and issue tasks to be executed concurrently/parallely
                proc_ret = pool.map(multi_process_url, urls)

                # Close the Shared Queue after usage
                shared_queue.close()

                # Close pool after usager
                pool.close()

            return results
        ```
    - Sanitize and return multiprocessing results
        ```python
        def sanitize_results(results):
            for row in results:
                # Split current element into variables
                ## Get current process elements
                curr_proc_id = row[0]
                curr_proc_data = row[1]

            # perform statements here
        ```

- To obtain the detected operating system's path separator
    - Notes
        + Linux: "top-level-directory-path/additional/paths"
        + Windows: "top-level-directory-path\additional\paths"
    ```python
    separator = os.sep
    ```

- Join paths
    - Explanation
        - The below will return 
            + Linux: "top-level-directory-path/additional/paths"
            + Windows: "top-level-directory-path\additional\paths"
    ```python
    import os

    path = os.path.join("top-level-directory-path", "additional", "paths")
    ```

## Wiki

    
## References


## Resources
+ [Python Docs - OS](https://docs.python.org/3/library/os.html)

## Remarks

