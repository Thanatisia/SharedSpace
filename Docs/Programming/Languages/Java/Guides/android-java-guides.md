## REST API
### HttpClient

## Multithreading/Multiprocessing
#### Creating a new runnable Thread
- Creating Thread
    ```java
    Thread [thread_name] = new Thread(new Runnable() {
        /*
         * create a new alternate thread to run on
         * [Usage]
         * - Network Interface requires to be ran on an alternative thread
         *  + By specification, Networking cannot be done on the UI thread
         */
         @Override
         public void run() {
             // Your statements here
         }
    });
    ```
- Running Thread
    ```java
    [thread_name].start()
    ```

#### Foreground/UI Threading
- Using runOnUiThread
    + Run this within an alternate Thread
    + Use this only for all foreground/display operations like 'Toast'
    + Using background operations will probably result in crashes most of the time
    ```java
    ...
    runOnUiThread(new Runnable() {
        // Run on the User Interface Thread
        @Override
        public void run()
        {
            // Your code here
        }
    });
    ...
    ```



