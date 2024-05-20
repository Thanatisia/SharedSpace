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
    - `.walk(top_level_dir)` : Walk through all directories and subdirectories starting from the root/top-level directory down the tree
        - Parameter Signature/Header
            - top_level_dir : Specify the top level root directory to start the digging from
                + Type: String
                - Explanation
                    - python will dig and traverse through every branch (directory) and 
                        + store the current branch's directory name into index [0] of the current branch's list entry
                        + store every subbranches (subdirectories) into index [1] of the current branch's list entry
                        + store every file contents in the current branch into index [2] of the current branch's list entry
        - Return
            - tree_contents : os.walk() will return a list of tuples where each tuple is
                - Type: Iterable<tuple<String, List, List>>
                - Contents
                    1. Current path
                        + Type: String
                    2. Nested subdirectories in directory branch
                        + Type: Tuple
                    3. Files in directory branch
                        + Type: Tuple
        - Notes
            + Convert the returned object into a list using `list(os.walk(top_level_dir))` to manage the generator object as a list

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

- Tree Traversal 
    - Explanation
        + Walk through all directories and subdirectories starting from the root/top-level directory down the tree
        - os.walk() will return a list of tuples where each tuple is
            + [0] = String, Current path
            + [1] = Tuple, Nested subdirectories in directory branch
            + [2] = Tuple, Files in directory branch
    ```python
    import os

    # Initialize Variables
    tree_branch_mappings = {
        # path : { directories : [subdirectories in current directory], files : [files in current directory], },
    }
    top_level_dir = "."

    # Begin walking through the tree and navigate through all nested directories and subdirectories and the files within
    tree_iterable = list(os.walk(top_level_dir))

    # Iterate through tree iterable
    for i in range(len(tree_iterable)):
        # Get current branch
        curr_branch = tree_iterable[i]

        # Get branch tuple objects
        curr_path = curr_branch[0]
        curr_dir_dirs = curr_branch[1]
        curr_dir_files = curr_branch[2]

        # Check if path is in mapping
        if curr_path not in tree_branch_mappings:
            tree_branch_mappings[curr_path] = {"directories" : curr_dir_dirs, "files" : curr_dir_files}
 
    # Output
    return tree_branch_mappings
    ```

## Wiki

    
## References


## Resources
+ [Python Docs - OS](https://docs.python.org/3/library/os.html)

## Remarks

