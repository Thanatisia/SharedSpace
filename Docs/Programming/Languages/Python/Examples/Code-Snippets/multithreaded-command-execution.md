# Command Execution with Multithreading in Python

## Operational Workflow
1. You (the user) define all the commands you wish to execute
2. For all elements in the list of commands you wish to execute (aka 'tasks'), Create a new thread
3. Execute all the threads in the pool concurrently
4. Wait for the tasks to be completed
5. Receive all standard outputs (if any)

## Snippets

- Multithreaded concurrent command execution
    ```python
    import os
    import sys
    import threading
    from subprocess import Popen, PIPE

    results = []
    def exec(task, test_command=False):
        """
        Execute the given task
        """
        # Check if flag 'test_command' is Enabled
        if test_command:
            # Debug: Only print out the command/task to validate
            print("Executing: {}".format(task))
        else:
            # Sanitization: Convert the task command list elements into string before proceeding
            for i in range(len(task)): task[i] = str(task[i])

            # Open a Subprocess pipe and execute the task command
            with Popen(task, stdout=PIPE, stdin=PIPE, stderr=PIPE) as proc:
                # Execute task and communicate
                res = proc.communicate()
                stdout = res[0]
                stderr = res[1]

            # Decode if any
            if stdout != "":
                stdout = stdout.decode("utf-8")
            if stderr != "":
                stderr = stderr.decode("utf-8")

            # Return result of current task
            results.append({"task" : task, "stdout" : stdout, "stderr" : stderr})

    def main():
        # Initialize Variables
        thread_pool = []
        threads_status = {} # Container for storing the alive status of all the created threads
        commands_list = ["your", "commands", "here"]

        # Get argument count
        number_of_commands = len(commands_list)

        # Calculate number of threads to create
        number_of_threads = len(number_of_commands)

        # Check if there are any tasks
        if number_of_commands > 0:
            for i in range(number_of_threads):
                # Get current task
                task = commands_list[i]

                # Initialize new Thread for the current task
                thread = threading.Thread(target=exec, args=(task,))

                # Store current thread in a thread pool
                thread_pool.append(thread)

            # Iterate through all threads in the pool and start
            for thread in thread_pool: 
                print("[i] Starting thread: {}".format(thread.name))
                thread.start()

            # Create a mapping of the created threads in the threads_status container for storing the alive status of the threads
            for thread in thread_pool:
                threads_status[thread] = thread.is_alive()

            # Iterate through all threads in the pool and wait for the thread to complete
            for thread in thread_pool: 
                print("[i] Waiting for thread to complete: {}".format(thread.name))
                thread.join()

            print("[+] Threads completed.")

            # Print results
            for i in range(len(results)):
                # Get current result
                curr_task = results[i]

                # Iterate through current task
                for k,v in curr_task.items():
                    print("{} = {}".format(k,v))

                print("")
        else:
            print("[i] No arguments provided.")

    if __name__ == "__main__":
        main()
    ```

