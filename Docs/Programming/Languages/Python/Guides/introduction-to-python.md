# Python - Introduction and Documentations

## Information

### Description
+ This is a complete (as much as possible) write-up documentation of the Python interpreted scripting/programming language for beginners to learn from scratch

## Table of Contents
- [Basics](#basics)
    + [Setup](#setup)
    + [Project Workspaces and Development](#golang-projects)
    + [Operators](#operators)
    + [Keywords](#keywords)
    + [Variables](#variables)
    + [Basic Syntax](#Syntax)
    + [Conditional Statements](#conditional-statements)
- [Data Types](#data-types)
    + [Floats](#floats)
    + [Integers](#integers)
    + [String](#string)
    + [null](#null)
- [Standard Streams](#standard-streams)
    + [Standard Output (stdout)](#standard-output)
- [Data Structures](#data-structures)
    + [Arrays](#arrays)
    + [Vectors](#vectors)
    + [Structure](#structure)
- [Iterative](#iterations)
    - [For Loop](#for-loop)
        + [Indexed-based](#indexed-based)
        + [Key-Value Mappings](#key-value-mappings)
    - [While Loop](#while-loop)
    - [Recursion](#recursion)
+ [PyPI Packaging](#pypi-packaging)
- [Functions](#functions)
- [Command Line Arguments](#command-line-arguments)
- [External Files](#external-files)
    + [Importing External Libraries and packages](#importing)
    + [File I/O Processing](#file-io-processing)
- [System Process Calls](#system-process-calls)
    + [System Command Execution](#system-command-execution)
    + [Subprocess pipes](#subprocess-pipes)
- [Asynchronous Programming (Coroutines)](#asynchronous-programming)
- [Concurrency](#concurrency)
    + [Threads](#threads)

## Basics

### Setup
- Dependencies
    + python
    + python-pip
    + python-venv

## Documentations
### PyPI Packaging
- Generate a python project package workspace direcgory
    - Create a new workspace directory for your project
        ```bash
        mkdir -pv project-workspace
        ```
    - Change directory into workspace
        ```bash
        cd project-workspace
        ```
    - Create default project filesystem structure
        ```bash
        mkdir -pv src/[package-name]/
        ```
    - Create main files
        ```bash
        touch README.md requirements.txt pyproject.toml src/[package-name]/main.py
        ```

### Asynchronous Programming
#### Introduction
> Description
- Asynchronous Programming, also known as Coroutines, is a concept in software development in which programs run instructions concurrently (back to back, one after another), 
    + unlike parallelism (multiprocessing, multithreading) whereby the instructions are run at the same time (side by side at the same time)
- To implement asynchronous programming in your python application
    + There are 2 keywords - async and await.
    + async essentially defines the attached function as an asynchronous function
    - await will tell the asynchronous function to wait for this function to complete before proceeding further regardless of what other ongoing functions are still running.
        + Run all other functions and this until the await function is completed
        + This is useful for synchronization within asynchronocity, when you want to execute an asynchronous function synchronously

> Components
- `async def func_name(params, ...)`
    + `await command()`
- `asyncio.run(func_name())`

#### Syntax
```python
import asyncio

async def func_name(params, ...):
    # Statements here
    # Asynchronously sleep for the specified number of seconds and concurrently let the other processes run
    await asyncio.sleep(0)

async def main():
    results = await asyncio.gather(func_name(params,...))

if __name__ == "__main__":
    asyncio.run(main())
```

#### Snippets
- For Loop
    ```python
    import os
    import sys
    import asyncio

    async def for_loop(min=0, increment=1, max=1_000_000):
        for i in range(min, max, increment):
            print("Looping for: {}".format(max))
            print(i)
            # Asynchronously sleep for the specified number of seconds and concurrently let the other processes run
            await asyncio.sleep(0)

    async def exec_command(fn, *vargs, **kwargs):
        res = None
        err_msg = ""
        token = False
        try:
            res = await fn(*vargs, **kwargs)
            # await asyncio.sleep(0)
            token = True
        except Exception as ex:
            err_msg = ex
        return [res, token, err_msg]

    async def main():
        results = await asyncio.gather(
            exec_command(for_loop, max=3),
            exec_command(for_loop, max=6),
            exec_command(for_loop, max=9),
            exec_command(for_loop, max=12)
        )
        print("All Complete")
        print("Results: {}".format(results))

    if __name__ == "__main__":
        asyncio.run(main())
    ```

- While Loop
    ```python
    import os
    import sys
    import asyncio

    async def while_loop_increment(min=0, incr=1, max=1_000_000):
        i = min
        while i < max:
            print("Looping for: {}".format(max))
            print(i)
            i += incr
            # Asynchronously sleep for the specified number of seconds and concurrently let the other processes run
            await asyncio.sleep(0)

    async def exec_command(fn, *vargs, **kwargs):
        res = None
        err_msg = ""
        token = False
        try:
            res = await fn(*vargs, **kwargs)
            # await asyncio.sleep(0)
            token = True
        except Exception as ex:
            err_msg = ex
        return [res, token, err_msg]

    async def main():
        results = await asyncio.gather(
            exec_command(while_loop_increment, max=3),
            exec_command(while_loop_increment, max=6),
            exec_command(while_loop_increment, max=9),
            exec_command(while_loop_increment, max=12)
        )
        print("All Complete")
        print("Results: {}".format(results))

    if __name__ == "__main__":
        asyncio.run(main())
    ```

## Resources

## References

## Remarks

