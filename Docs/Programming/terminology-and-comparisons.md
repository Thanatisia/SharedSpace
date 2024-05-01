# Programming/Software Development Technicalities, Terminologies and comparisons between terms

## Terminologies

### Processing
+ Concurrency : Managing multiple 'tasks' efficiently with one resource
- Parallelism : Utilizing multiple resources to execute tasks simultaneously
    - Language examples
        - Python
            + Using the 'multiprocessing' library for Multiprocessing
            + Using the 'threading' library for Multithreading
+ tasks : A task is basically an element from a set/list/pool of tasks that are to be executed parallely/concurrently. In the context of an iterable/list, a single task refers to each element inside a list in which, will be executed with a multiprocessing function

## Comparisons
- Concurrency vs Parallelism
    - Concurrency is when two or more tasks can start, run, and complete in overlapping time periods.
        + It doesn't necessarily mean they'll ever both be running at the same instant.
        - For example,
            + multitasking on a single-core machine.
    - Parallelism is when tasks literally run at the same time,
        - e.g.,
            + on a multicore processor

## Resources

## References

## Remarks

