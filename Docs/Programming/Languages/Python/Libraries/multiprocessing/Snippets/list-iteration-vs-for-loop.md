# Python - Multiprocessing Programming Example - Iterating through a list serial vs concurrency/parallelism

## Information

### Description

## Snippets

> Iterating through a list serially using for loop

```python
import os
import sys

def task(item):
    """
    Iterate through a list concurrently/parallely
    """
    item *= 2
    return item

def main():
    target_list = [ i for i in range(0, 1_000_000) ]
    result = []

    for i in range(len(target_list)):
        curr_element = target_list[i]
        new_element = task(curr_element)
        result.append(new_element)
        print(i)

    # Print results
    print(result)

if __name__ == "__main__":
    main()
```

> Iterating through a list concurrently

```python
"""
Multiprocessing/concurrency iteration over a list
"""
import os
import sys
from multiprocessing import Pool

def task(item):
    """
    Iterate through a list concurrently/parallely
    """
    item *= 2
    return item

def main():
    target_list = [ i for i in range(0, 1_000_000) ]
    result = []

    # Open a Multiprocessing pool (a group of tasks to be performed) for concurrent/parallel task execution
    with Pool() as pool:
        # Execute function 'task' to every element in the list and return the result of the pool
        result = pool.map(task, target_list)

        # Close the pool after usage
        pool.close()

    # Print results
    print(result)

if __name__ == "__main__":
    main()
```
