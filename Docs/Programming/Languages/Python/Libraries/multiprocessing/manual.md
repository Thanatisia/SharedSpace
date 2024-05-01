# Python Library - multiprocessing

## Table of Contents
* [Documentation](#documentation)

## Information
### DESCRIPTION
+ multiprocessing is a built-in python library that allows developers to implement multiprocessing/concurrency/parallel programming into their program
- Multiprocessing overcomes the limitations of multi-threading by creating multiple processes, 
    + each having its own Python interpreter and memory space. 
    + This makes multiprocessing ideal for CPU-bound tasks, as it allows for true parallel execution.

## Documentation

### Packages
- multiprocessing

### Modules
- multiprocessing : The primary multiprocessing core library module

### Classes
- multiprocessing
    - `.SimpleQueue()` : Initializes and constructs a new simple queue object to become a "Shared Queue" for acting as a bridge between processes
    - `.Pool(options)` : Initializes and constructs a new Pool object to hold every task that is to be executed concurrently/parallely.
        - Parameter Header/Signatures
            - `processes=N` : Specify the number of processes you want to run the multiprocessing with
                + Type: Integer
            - `initializer=init_worker` : This argument will execute the specified initialize function (i.e. 'init()' => 'init'), in which contains the statements you want to execute inside each process/task
                + Type: Function
            - `initargs=(,)` : This arguments is a tuple containing the arguments/parameters you wish to pass into the initializer function (if available)
                + Type: Tuple
    - `Process(target, options...)` : Initializes a new process object for Multiprocessing, each having its own python interpreter and memory space. Initialize a new class for every process you want to use for parallel execution
        - Parameter Header/Signatures
            - target : Specify a new target function to attach to this process to be executed
                + Type: Function

### Functions
- multiprocessing.Pool()
    + `.close()` : Close the pool after usage
    - `.map(function, iterables)` : Process through the iterables passed into the pool, and in every task - execute the specified function concurrently/parallely.
        - Parameters Signature/Header
            - function : Specify the function you wish to execute on every task in the iterables/list
                + Type: Function
            - iterables: Specify the iterables/list object, in which, each element of the list is a task that will be used in the specified function concurrently
                + Type: List
        - Return
            - result: On completion of each task, return the task's results into the pool and this will be applied for every element in the iterable/list until the last element then the pool can be used to retrieve all the results
                + Type: List
    - `.map_async()` : The asynchronous variant of `.map()`
        - Parameters Signature/Header
            - function : Specify the function you wish to execute on every task in the iterables/list
                + Type: Function
            - iterables: Specify the iterables/list object, in which, each element of the list is a task that will be used in the specified function concurrently
                + Type: List
        - Return
            - result: On completion of each task, return the task's results into the pool and this will be applied for every element in the iterable/list until the last element then the pool can be used to retrieve all the results
                + Type: List

- multiprocessing.Process()
    + `.start()` : Start the process
    + `.join()` : Wait for the process to be completed and merge the process back into the main process

- multiprocessing.SimpleQueue()
    + `.close()` : Close the Shared Queue object after usage
    - `.get()` : Get and return all objects stored in the Shared simple queue
        - Return
            + Type: List
    - `.put(results)` : Append/Put a tuple containing an ID mapped to the result of the process to store the process' results for shared references. Use alongside `.get()` after the whole processing is completed to get the results
        - Parameter Signature/Header
            - results : A tuple containing an ID (element 0) mapped to the return value (element 1)
                + Type: Tuple
                + Format: (id, return_value)

### Data Types and Objects

### Attributes/Variables

### Usage
- Using a multiprocessing Pool
    - Setting up a working multiprocessing Pool to hold every task to be executed concurrently/parallely
        ```python
        from multiprocessing import Pool

        # Create and configure the process pool
        with Pool() as pool:
            # Generate a Multiprocessing Pool and issue tasks to be executed concurrently/parallely
            result = pool.map(multi_process_url, urls)

            # Close pool after usage
            pool.close()
        ```

    - Setting up a working multiprocessing Pool to hold every task to be executed concurrently/parallely with global variables support
        - Create an initializer
            - Explanation
                + This is used to allow sharing of global variables within processes
            ```python
            def init_worker(shared_queue):
                """
                Initialize global variables and components for Multiprocessing
                """
                global queue, global_var
                queue = shared_queue
                global_var = ""
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
            # Import library
            from multiprocessing import Pool

            # Initialize/Create a shared queue for use as a bridge between processes
            shared_queue = SimpleQueue()

            # Create and configure the process pool
            with Pool(initializer=init_worker, initargs=(shared_queue, )) as pool:
                # Generate a Multiprocessing Pool and issue tasks to be executed concurrently/parallely
                result = pool.map(function, iterables)

                # Close the Shared Queue after usage
                shared_queue.close()

                # Close pool after usage
                pool.close()

            return results
            ```

    - Using the Process' ID from 'os' as a anchor to keep the values the same order as the standard input during concurrency/parallelism
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

- Using individual Processes
    - Initializing and creating individual Processes for each task
        ```python
        from multiprocessing import Process

        def print_numbers():
           for i in range(10):
               print(f”  {i}”)

        def print_letters():
           for letter in 'abcdefghij':
               print(f”  {letter}”)

        # Initialize Processes
        p1 = Process(target=print_numbers)
        p2 = Process(target=print_letters)

        # Start each processes
        p1.start()
        p2.start()

        # Join the processes when completed
        p1.join()
        p2.join()
        ```

### Operational Workflow
- Import package and modules
    ```python
    from multiprocessing import Pool, SimpleQueue
    ```

- Create multiprocess Pool creation function
    - Explanation
        - at the end of the tasks
            - The resulting list should be as follows (using this example
                ```python
                [
                    [curr_proc_id, values],
                    ...
                ]
                ```
    ```python
    def multi_execute_tasks(urls):
        # Initialize/Create a shared queue for use as a bridge between processes
        shared_queue = SimpleQueue()

        # Create and configure the process pool
        with Pool(initializer=init_worker, initargs=(shared_queue, )) as pool:
            # Generate a Multiprocessing Pool and issue tasks to be executed concurrently/parallely
            results = pool.map(multi_process_url, urls)

            # Close the Shared Queue after usage
            shared_queue.close()

            # Close pool after usager
            pool.close()

        return results
    ```

- Create an initializer
    - Explanation
        + This is used to allow sharing of global variables within processes
    ```python
    def init_worker(shared_queue):
        """
        Initialize global variables and components for Multiprocessing
        """
        global queue, global_var
        queue = shared_queue
        global_var = ""
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

- Sanitize and return multiprocessing results
    ```python
    def sanitize_results(results):
        # Initialize Variables
        results = []

        # Sanitize and filter results
        for row in results:
            # Split current element into variables
            ## Get current process elements
            curr_proc_id = row[0]
            curr_proc_data = row[1]

            # Store results
            results.append({"process-id" : curr_proc_id, "data" : curr_proc_data})

        # perform statements here

        # Output/Return
        return results
    ```

## Wiki

### Terminologies
- multiprocessing : Performing 'multiple tasks' in an iterable/list concurrently/parallely until the last element in the iterable. Multiprocessing is a form of concurrent execution model
- tasks : basically each task is also known as the individual elements within an iterable/list

## References

## Resources
+ [Python Docs - multiprocessing](https://docs.python.org/3/library/multiprocessing.html)
+ [run.ai - deep learning for computer vision - python parallel programming](https://www.run.ai/guides/deep-learning-for-computer-vision/python-parallel-processing)

## Remarks


