# Python snippets - HTTP API Requests - Sessions

## Steps

### Setup
1. Import dependencies and packages
    ```python
    import requests
    ```

2. Initialize a new session
    - Explanation
        + Initializing a new session is like creating a new group for each HTTP API/Request and you want to give a unique property/attribute to each API request as a group
    ```python
    session = requests.Session()
    ```

### Session - Set maximum number of redirects
1. Set max redirects for current API session
    ```python
    session.max_redirects = 3
    ```

### Session - Disabling Redirects
1. Disable redirects for the current session
    ```python
    session.allow_redirects = False
    ```

## Snippets

> Session - Set maximum number of redirects

```python
import os
import sys
import requests

def main():
    # Initialize Variables
    SERVER_IP = "localhost" # Server IP Address
    SERVER_PORT = 8080 # Server Port Number
    SERVER_PROTOCOL = "http"
    domain = "{}://{}:{}".format(SERVER_PROTOCOL, SERVER_IP, SERVER_PORT)
    url = "{}/".format(domain) # The API endpoint
    payload = {} # Data to pass into the HTTP API

    # Initialize a new session
    session = requests.Session()

    # Set max redirects for current API session
    session.max_redirects = 3

    # Send a GET request to the HTTP Server's route and return a response
    response = requests.get(url, params=payload)

    # Obtain the response's JSON
    response_json = response.json()

    # Obtain the response's HTTP status code
    response_status_code = response.status_code

    print("{} : {}".format(response_status_code, response_json))

if __name__ == "__main__":
    main()
```

> Session - Disabling Redirects

```python
import os
import sys
import requests

def main():
    # Initialize Variables
    SERVER_IP = "localhost" # Server IP Address
    SERVER_PORT = 8080 # Server Port Number
    SERVER_PROTOCOL = "http"
    domain = "{}://{}:{}".format(SERVER_PROTOCOL, SERVER_IP, SERVER_PORT)
    url = "{}/".format(domain) # The API endpoint
    payload = {} # Data to pass into the HTTP API

    # Initialize a new session
    session = requests.Session()

    # Disable redirects for the current session
    session.allow_redirects = False

    # Send a GET request to the HTTP Server's route and return a response
    response = requests.get(url, params=payload)

    # Obtain the response's JSON
    response_json = response.json()

    # Obtain the response's HTTP status code
    response_status_code = response.status_code

    print("{} : {}".format(response_status_code, response_json))

if __name__ == "__main__":
    main()
```

