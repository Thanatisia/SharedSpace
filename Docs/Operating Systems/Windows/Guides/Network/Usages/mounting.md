# Network Mounting

## Pre-Requisites and Information
+ Network mounting on windows command line (batch) is performed using the 'net use' command
    - Synopsis/Syntax
        ```batch
        net use [drive-letter] \\[network-shared-drive-path] {options}
        ```

## Examples
- Mounting using the last unused drive letter and temporarily
    ```batch
    net use * \\[network-shared-drive-path] /user:[username] * /persistent:no
    ```


