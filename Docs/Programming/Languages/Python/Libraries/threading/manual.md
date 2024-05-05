# Python Library - threading

## Table of Contents
* [Documentation](#documentation)

## Information
### DESCRIPTION
+ threading is a built-in python library for Multithreading and Concurrency programming using multiple threads
- Multi-threading is a technique for decomposing tasks into sub-tasks that can be processed simultaneously.
    - Pros
        - This is particularly useful in applications that require heavy I/O operations,
            - i.e.
                + web scraping
                + reading files from a network
                + reading from a database.
            + Because each thread can run the I/O-bound processes concurrently
    - Limitations
        - The Global Interpreter Lock (GIL) in Python restricts one thread to execute Python bytecodes at a time, even in a multi-core processor environment. 
            - Therefore, 
                + multithreading only achieves concurrency and not parallelism for IO-bound processes.
                + multi-threading in Python is not suitable for CPU-bound tasks. 
            + For such tasks, Python offers another method of parallel processing: [multiprocessing](../multiprocessing/manual.md).

## Documentation

### Packages
- threading

### Modules
- threading : The primary multithreading core library module

### Classes
- threading
    - `.Thread(target, args, ...)` : Initializes and constructs a new Thread object for multithreading and processing simultaneously. Initialize a new class for every thread you want to use for parallel execution
        - Parameter Header/Signatures
            - `target=<function-to-execute>` : Specify a new target function to attach to this thread to be executed
                + Type: Function
            - `args=(your, arguments, to, pass, into, function)` : Specify a tuple containing all the arguments you wish to pass into the function's parameter/argument signature/header
                + Type: Tuple

### Functions
- threading.Thread()
    + `.start()` : Start/Initiate the thread(s)
    + `.join()` : The main program will wait for the thread(s) to be completed before proceeding past that point

### Data Types and Objects

### Attributes/Variables

### Usage
- Initializing and creating Threads for each task
    ```python
    import threading

    def print_numbers():
       for i in range(10):
           print(f”  {i}”)

    def print_letters():
       for letter in 'abcdefghij':
           print(f”  {letter}”)

    # Initialize Threads
    t1 = threading.Thread(target=print_numbers)
    t2 = threading.Thread(target=print_letters)

    # Start each processes
    t1.start()
    t2.start()

    # Join the processes when completed
    t1.join()
    t2.join()
    ```

- Create multiple Thread objects
    ```python
    from threading import Thread

    # Initialize variables
    argv = []
    number_of_threads = len(argv)
    threads = []

    # Iterate number_of_threads times and create a thread for every item in the arguments list (to run concurrently)
    for i in range(number_of_threads):
        # Create a new Thread() object
        curr_thread = Thread(target=<function-to-execute>, args=(your, arguments, to, pass, into, function))

        # Append newly created object into the pool/storage
        threads.append(curr_thread)

    # Iterate through the list of threads and start all tasks
    for thread in threads:
        # Start all threads
        thread.start()

    # Iterate through the list of threads and wait for the thread to complete before proceeding
    for thread in threads:
        # Wait for the thread to complete execution before continuing
        thread.join()
    ```

### Operational Workflow
- Import package and modules
    ```python
    from threading import Thread
    ```

- Create/Instantiate a new thread for executing functions
    - Explanation
        - This will create a new Thread object holding to the target function you wish to execute.
            + For each Thread object you create, you are assigning 1 more thread from your CPU/GPU
            + Every task assigned to the threads will be ran in parallel
    - Related:
        + Multicore GPU Programming
        + CUDA
        + OpenCL
        + OpenGL
    ```python
    thread = Thread(target=<function-to-execute>)
    ```

- Start the thread
    ```python
    thread.start()
    ```

- Join the thread and wait for the thread(s) to be completed before proceeding past that point
    ```python
    thread.join()
    ```

## Wiki

### Terminologies
- Thread : A thread (also known as a 'core') refers to individual 'bridges' or 'routing lanes' on a CPU/GPU that can be used to execute programs.
- multiprocessing : Performing 'multiple tasks' in an iterable/list concurrently/parallely until the last element in the iterable. Multiprocessing is a form of concurrent execution model
- multithreading : Performing multiple threads concurrently to perform multiple tasks at the same time. Multithreading is a form of concurrent execution model
- tasks : basically each task is also known as the individual elements within an iterable/list

## References

## Resources
+ [builtin - data science - multithreading vs multiprocessing](https://builtin.com/data-science/multithreading-multiprocessing)
+ [Python Docs - threading (for multithreading)](https://docs.python.org/3/library/threading.html)
+ [run.ai - deep learning for computer vision - python parallel programming](https://www.run.ai/guides/deep-learning-for-computer-vision/python-parallel-processing)

## Remarks

