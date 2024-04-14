# Networking - Web API

*Description*
-------------
- This is a collection of various useful Web APIs - Web services that can be accessed via command line utilities that communicates with a web server via HTTP REST API methods
    - Examples include
        - telnet
            + NOTE: This is unsafe and do not use any tools that is privacy-focused with telnet
            ```bash
            telnet http://webapp-server-[ip-address|domain]
            ```
        - ssh
            ```bash
            ssh https://webapp-server-[ip-address|domain]
            ```
        - curl
            ```bash
            curl https://webapp-server-[ip-address|domain]
            ```

*Web API*
---------

> Network Addresses

+ `https://ifconfig.so` : Returns your Public IP Address
+ `http://ip-api.com/json` : Similar to 'ifconfig.so' but uses HTTP REST API for communication and returns the result as a JSON through a GET request


