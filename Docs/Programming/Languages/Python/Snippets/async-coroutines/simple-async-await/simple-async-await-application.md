# Python snippets - Async and await - Simple Asynchronous concurrent executuon using async-await and asyncio

## Information
### Asynchronous Programming
> Introduction
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

> Syntax
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

## Steps
1. Import dependencies and packages
    ```python
    import os
    import sys
    import asyncio
    ```

2. Define your target asynchronous function with the async and await keyword
    - Explanation
        - To implement asynchronous programming in your python application
            + There are 2 keywords - async and await.
            + async essentially defines the attached function as an asynchronous function
            - await will tell the asynchronous function to wait for this function to complete before proceeding further regardless of what other ongoing functions are still running.
                + Run all other functions and this until the await function is completed
                + This is useful for synchronization within asynchronocity, when you want to execute an asynchronous function synchronously
                + `await asyncio.sleep(0)` : Asynchronously sleep for the specified number of seconds and concurrently let the other processes run
    ```python
    async def for_loop(min=0, increment=1, max=1_000_000):
        for i in range(min, max, increment):
            print("Looping for: {}".format(max))
            print(i)
            # Asynchronously sleep for the specified number of seconds and concurrently let the other processes run
            await asyncio.sleep(0)
    ```

3. Define your main entry point function as an asynchronous function
    - Explanation
        - `results = await asyncio.gather(tasks, ...)` : asyncio.gather(tasks,...) will gather all the specified tasks and execute asynchronously.
            - For each task completed, the results will be appended in a results list and when all are completed
                + The results will be returned to the caller
            + This is similar to creating a pool of tasks before executing the pool of tasks in a multithread pool or multiprocess pool
    ```python
    async def main():
        results = await asyncio.gather(
            for_loop(max=3),
            for_loop(max=6),
            for_loop(max=9),
            for_loop(max=12),
        )
        print("All Complete")
        print("Results: {}".format(results))
    ```

4. Begin running the asynchronous main function and its asynchronous contents concurrently (back to back)
    - Explanation
        - The 3rd core component of asynchronous programming in python
            + `asyncio.run(async_function())` will start running the specified asynchronous function in a clockwork
            + Essentially, telling the program to run this function asynchronously
    ```python
    if __name__ == "__main__":
        asyncio.run(main())
    ```

## Snippets
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

## Resources

## References

## Remarks

