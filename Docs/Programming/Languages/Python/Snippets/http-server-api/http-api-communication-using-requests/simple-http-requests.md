# Python snippets - HTTP Server - Simple HTTP Server using the 'requests' library/module

## Steps

### Pre-Requisites
- Initialize variables
    - Define API endpoint remote server specifications
        - If it is local/self-hosted
            ```python
            # Initialize Variables
            SERVER_IP = "localhost" # Server IP Address
            SERVER_PORT = 8080 # Server Port Number
            SERVER_PROTOCOL = "http" # Server Protocol (http/https)
            domain = "{}://{}:{}".format(SERVER_PROTOCOL, SERVER_IP, SERVER_PORT)
            url = "{}/page/api/route".format(domain) # The API endpoint
            ```
        - If it is a remote API
            ```python
            # Initialize Variables
            url = "https://server-url/page/api/route" # The API endpoint
            payload = {} # Data to pass into the HTTP API
            ```

### GET Request
1. Initialize a new variable containing the payload data to pass into the HTTP API
    ```python
    payload = {} # Data to pass into the HTTP API
    ```

2. Send a GET request to the HTTP Server's route and return a response
    ```python
    response = requests.get(url, params=payload)
    ```

### POST Request
1. Initialize a new variable containing the data to pass into the HTTP API
    ```python
    new_data = {} # Data to pass into the HTTP API
    ```

2. Send a GET request to the HTTP Server's route and return a response
    ```python
    response = requests.post(url, json=new_data)
    ```

### Authentication Request
1. Obtain the details required for Authenticating the API Endpoint's AUTH mechanism from your system's environment variable
    - API_USER : Specify your username used to login and authenticate to access the service
        ```python
        username = os.getenv("API_USER") # Specify your username to login as to authenticate and access the service in the environment variable 'API_USER'
        ```
    - SECRET_API_KEY : Specify your secret API Token/Private key used to authenticate you as an authorized user
        ```python
        token = os.getenv("SECRET_API_KEY") # Specify your service's secret api token in the environment variable 'SECRET_API_KEY'
        ```

2. Data Validation: Null-value check
    - Explanation
        + Set the variables to empty string to avoid Null-value errors
    ```python
    if username == None: username = ""
    if token == None: token = ""
    ```

3. Send a GET request with the authentication and authorization (AA) data required to access the service to the API endpoint and return a response
    ```python
    response = requests.get(url, auth=HTTPBasicAuth(username, token))
    ```

### Request Processing
- Obtain the response's JSON
    ```python
    response_json = response.json()
    ```

- Obtain the response's HTTP status code
    ```python
    response_status_code = response.status_code
    ```

## Snippets

> GET Request

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

> POST Request

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
    new_data = {} # Data to pass into the HTTP API

    # Send a GET request to the HTTP Server's route and return a response
    response = requests.post(url, json=new_data)

    # Obtain the response's JSON
    response_json = response.json()

    # Obtain the response's HTTP status code
    response_status_code = response.status_code

    print("{} : {}".format(response_status_code, response_json))

if __name__ == "__main__":
    main()
```

> Authentication Request

```python
import os
import sys
import requests
from requests.auth import HTTPBasicAuth

def main():
    # Initialize Variables
    SERVER_IP = "localhost" # Server IP Address
    SERVER_PORT = 8080 # Server Port Number
    SERVER_PROTOCOL = "http"
    domain = "{}://{}:{}".format(SERVER_PROTOCOL, SERVER_IP, SERVER_PORT)
    url = "{}/".format(domain) # The API endpoint
    username = os.getenv("API_USER") # Specify your username to login as to authenticate and access the service in the environment variable 'API_USER'
    token = os.getenv("SECRET_API_KEY") # Specify your service's secret api token in the environment variable 'SECRET_API_KEY'

    # Data Validation: Null-value check
    if username == None: username = ""
    if token == None: token = ""

    # Send a GET request with the authentication and authorization (AA) data required to access the service to the API endpoint and return a response
    response = requests.get(url, auth=HTTPBasicAuth(username, token))

    # Obtain the response's JSON
    response_json = response.json()

    # Obtain the response's HTTP status code
    response_status_code = response.status_code

    print("{} : {}".format(response_status_code, response_json))

if __name__ == "__main__":
    main()
```

## Resources

## References

## Remarks

