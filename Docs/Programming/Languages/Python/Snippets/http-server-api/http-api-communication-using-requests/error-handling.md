# Python snippets - HTTP Requests - Error Handling

## Information
+ Please refer to [simple-http-requests.md](Docs/Programming/Languages/Python/Snippets/http-server-api/http-api-communication-using-requests/simple-http-requests.md) for more information on the initial setup

## Steps

### Initial Try-catch
1. Try to execute the HTTP Request
    ```python
    try:
        # Send a GET request to the HTTP Server's route and return a response
        response = requests.get(url)
    ```

2. Raise the response to obtain the status
    ```python
        response.raise_for_status()
    ```

### Handling Generic Errors
1. Catch the HTTPError (Error 404)
    ```python
    except requests.exceptions.HTTPError as error:
        print(error)
    ```

### Handling Connection Errors
1. Catch the Connection Error (i.e. endpoint dropped)
    ```python
    except requests.ConnectionError as error:
        print(error)
    ```

### Handling Timeout
1. Try to execute the HTTP GET Request but with a timeout set
    ```python
    try:
        # Send a GET request to the HTTP Server's route and return a response
        response = requests.get(url, timeout=0.0001)
    ```

2. Catch the Timeout error
    ```python
    except requests.Timeout as error:
        print(error)
    ```

### Handling Too many Redirects
1. Catch the Too Many Redirects error
    ```python
    except requests.exceptions.TooManyRedirects as error:
        print(error)
    ```

## Snippets

> Handling Generic Errors

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

    # Attempt to send a GET request
    try:
        # Send a GET request to the HTTP Server's route and return a response
        response = requests.get(url, params=payload)

        # Obtain the response's JSON
        response_json = response.json()

        # Obtain the response's HTTP status code
        response_status_code = response.status_code

        print("{} : {}".format(response_status_code, response_json))

        # Raise the response to obtain the status
        response.raise_for_status()
    except requests.exceptions.HTTPError as error:
        # HTTP Error detected (Error 404 - Not Found)
        print(error)

if __name__ == "__main__":
    main()
```

> Handling Connection Errors

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

    # Attempt to send a GET request
    try:
        # Send a GET request to the HTTP Server's route and return a response
        response = requests.get(url, params=payload)

        # Obtain the response's JSON
        response_json = response.json()

        # Obtain the response's HTTP status code
        response_status_code = response.status_code

        print("{} : {}".format(response_status_code, response_json))

        # Raise the response to obtain the status
        response.raise_for_status()
    except requests.ConnectionError as error:
        # HTTP Error detected (Error 404 - Not Found)
        print(error)

if __name__ == "__main__":
    main()
```

> Handling Timeout

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

    # Attempt to send a GET request
    try:
        # Send a GET request to the HTTP Server's route and return a response
        response = requests.get(url, timeout=0.0001)

        # Obtain the response's JSON
        response_json = response.json()

        # Obtain the response's HTTP status code
        response_status_code = response.status_code

        print("{} : {}".format(response_status_code, response_json))

        # Raise the response to obtain the status
        response.raise_for_status()
    except requests.Timeout as error:
        print(error)

if __name__ == "__main__":
    main()
```

> Handling Too many Redirects

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

    # Attempt to send a GET request
    try:
        # Send a GET request to the HTTP Server's route and return a response
        response = requests.get(url, params=payload)

        # Obtain the response's JSON
        response_json = response.json()

        # Obtain the response's HTTP status code
        response_status_code = response.status_code

        print("{} : {}".format(response_status_code, response_json))

        # Raise the response to obtain the status
        response.raise_for_status()
    except requests.exceptions.TooManyRedirects as error:
        print(error)

if __name__ == "__main__":
    main()
```

