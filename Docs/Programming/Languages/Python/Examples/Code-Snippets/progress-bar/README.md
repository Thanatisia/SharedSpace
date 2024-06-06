# Python Snippets and Examples - Progress Bar

## Information

### Topics needed
+ How to print on the same line
+ print - end="\r"

## Documentations

## Snippets

> Simple progress bar with a minimum and maximum

- Explanation
    - Parameter Signature/Header
        - number_of_tasks : This is the number of tasks representing the (virtual) number of operations the progress bar will run, and works as a maximum value
            + Type: Integer
        - min : Specify the minimum value to start the bar from
            + Type: Integer
    - `print(progress, end="\r")` : The 'end="\r"' is the core component of printing on the same line.
        - Essentially, `end="\r"` in 'print()' will return the cursor pointer to the start of the current line and continue from that point - which in this case, is the start of the line
            + Thereby writing over the current line

```python
def progressbar(number_of_tasks=10, min=0):
    """
    Progress Bar with printing on the same line
    """
    # Initialize Variable
    starting_icon = "|"
    pointer = ">"
    inc = 1
    perc = 0.0
    progress = starting_icon

    # Initiate while loop and iterate while progress bar is active
    i = min
    print(progress, end="\r")
    while perc != 100.00:
        # Calculate percentage
        perc = (i / number_of_tasks) * 100

        # Increment counter by 1
        i += inc

        # Append 1 pointer to the progress bar
        progress += pointer

        # Print percentage
        print("{}{} ({}%)".format(progress, starting_icon, perc), end="\r")

        # Sleep for 1 second
        time.sleep(1)
```

> Task-oriented Progress Bar

- Explanation
    - Parameter Signature/Header
        - tasks : Specify a list of dictionaries containing the task function object mapped to the arguments
            + Type: List<Dictionary>
            - Format
                ```python
                [
                    {
                        "function" : function,
                        "arguments" : args,
                    }
                ]
                ```
        - min : Specify the minimum value to start the bar from
            + Type: Integer
    - `print(progress, end="\r")` : The 'end="\r"' is the core component of printing on the same line.
        - Essentially, `end="\r"` in 'print()' will return the cursor pointer to the start of the current line and continue from that point - which in this case, is the start of the line
            + Thereby writing over the current line

```python
def progressbar(tasks, min=0):
    """
    Progress Bar for tracking the execution of a list of multiple tasks (mapped to the arguments)
    with printing on the same line
    """
    # Initialize Variable
    starting_icon = "|"
    pointer = ">"
    inc = 1
    perc = 0.0
    progress = starting_icon
    number_of_tasks = len(tasks)
    results = []

    # Initiate while loop and iterate while progress bar is active
    i = min
    print(progress, end="\r")
    while i < number_of_tasks:
        # Calculate percentage
        perc = (i / number_of_tasks) * 100

        # Get current task
        curr_task = tasks[i]

        # Get current function
        curr_fn = curr_task["function"]

        # Get current arguments
        curr_argv = curr_task["arguments"]

        # Execute tasks
        res = curr_fn(*curr_argv)

        # Initialize a dictionary for current command
        curr_cmd_res = {
            "command" : curr_fn,
            "arguments" : curr_argv,
            "result" : res
        }

        # Append into results list
        results.append(curr_cmd_res)

        # Increment counter by 1
        i += inc

        # Append 1 pointer to the progress bar
        progress += pointer

        # Print percentage
        print("{}{} ({}%)".format(progress, starting_icon, perc), end="\r")

        # Sleep for 1 second
        time.sleep(1)

    # Output/Return decorator
    return results

def main():
    # simple_count()
    # progressbar()
    tasks:list = [
        {
            "function" : os.getenv,
            "arguments" : ["HOME"]
        },
        {
            "function" : print,
            "arguments" : ["Hello World"]
        },
        {
            "function" : print,
            "arguments" : ["Hello World"]
        },
    ]
    res = progressbar_decorator(tasks)
    print("Results: {}".format(res))

if __name__ == "__main__":
    main()
```

## Resources

## References
+ [StackOverflow - Questions - 4897359](https://stackoverflow.com/questions/4897359/output-to-the-same-line-overwriting-previous-output)

## Remarks

