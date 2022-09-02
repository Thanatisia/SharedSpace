# Docs - Python Module : requests

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [References](#references)
- [Resources](#resources)
- [Remarks](#remarks)

## Information
### DESCRIPTION
```
This module is used to handle HTTP REST API requests such as POST, GET etc. with Python.

There exist a 'request' module which is built-in, but this is an improved variant of that module
```

### Basics
- An HTTP packet communication usually consists of 2 object types
	+ Requests : This is what you send to the server (using the TCP/IP 3-way handshake - SYN, ACK-SYN, SYN) to request for an action
	+ Response : This is what you receive from communicating with the server (using the TCP/IP 3-way handshake - SYN, ACK-SYN, SYN) 

- HTTP actions (Requests) includes
	+ POST request
	+ GET request
    + OPTIONS request
    + HEAD request
    + PUT request
    + PATCH request
    + DELETE request

- Status Codes
	+ 200 : Server and connection is ok
	+ 404 : Website Resource not found

## Setup
### Pre-Requisites

### Dependencies
- python
- pip

### Installing
- Using pip package manager
    ```console
    python -m pip install requests
    ```

## Documentation
### Importing
- Import whole module
    ```console
    import requests
    ```
    
- Importing specific modules/classes
    ```console
    from requests.[modules-name] import [class|function|variables|object]
    ```
    
### Modules

### Classes
- requests.exceptions : For handling exceptions

### Objects
- Exceptions
    - Attributes
        + HTTPError : When the page has an error
    - Functions
- Response
    - Attributes
        + response.content : Gets the raw bytes of the content (Payload) in the message body
        + response.headers : Gives the response headers such as Content time, TTL etc; type <dict>
        + response.status_code : Get the status code of your response
        + response.text : Decodes the content raw bytes into string for use
        + response.reason : A write-up/description of why the status code was returned
    
### Functions
- requests
    - .delete(url, args) : A convenience method to send a DELETE request to the webserver
        - Parameters
            - Positional
                - API_url : The URL of the website you want to send a DELETE request to
                    + Type : String
        + Return Type : Response Object 
    - .get(API_url, params, args) : A convenience method to send a GET request to the Web server
        - Parameters
            - Positional
                - API_url : The URL of the website you want to send a GET request to
                    + Type : String
        + Return Type : Response Object
    - .head(url, args) : A convenience method to send a HEAD request to the webserver
        - Parameters
            - Positional
                - API_url : The URL of the website you want to send a HEAD request to
                    + Type : String
        + Return Type : Response Object
    - .patch(url, data, args) : A convenience method to send a PATCH request to the webserver
        - Parameters
            - Positional
                - API_url : The URL of the website you want to send a PATCH request to
                    + Type : String
        + Return Type : Response Object
    - .post(url, data, json, args) : A convenience method to send a POST request to the webserver
        - Parameters
            - Positional
                - API_url : The URL of the website you want to send a POST request to
                    + Type : String
            - Optional
                - data : A dictionary, list of tuples, bytes or file object to send to the webserver
                    + Type : Dictionary | List | Bytes | fd
                - json : A JSON object to send to the Webserver required by the API
                    + Type : Dictionary
        + Return Type : Response Object
    - .put(url, data, args) : A convenience method to send a PUT request to the webserver
        - Parameters
            - Positional
                - API_url : The URL of the website you want to send a PUT request to
                    + Type : String
        + Return Type : Response Object
    - .request(method, url, **kwargs) : A general request function that can make the seven main kinds of request to a web server 
        - Notes
            + Using one of the convenience methods (.get(), .post() etc) has the same effect as calling this directly
        - Parameters
            - Positional
                - method : The Request Method to use to send the packet
                    + Type : String
                    - Options
                        + "GET" : send a GET request
                        + "POST" : send a POST request
                        + "OPTIONS"
                        + "HEAD"
                        + "PUT
                        + "PATCH"
                        + "DELETE"
                - url : The URL of the API
                    + Type : String
                - kwargs : Any number of dictionary items (named arguments) that are passed in as parameters that are required by the request type
                    + Type : Dictionary
                    - Options
                        - HEAD
                            - headers : A dictionary representing the packet headers to send to the web server
                                - Key-Values
                                    + "accept" : "application/accept-type",
                                    + "authorization" : "bearer token [TOKEN]"
                                + Type : Dictionary

                                
### Variables

### Usage
- General Flow
	```python
	import requests

	response = requests.get("https://link.to.api.com/api/filename")
    response_text = response.text
    
    status_code = response.status_code
    if status_code == 200:
        print("Success")
    else:
        print("Error : {}".format(status_code))
	```

- With JSON
	```python
	import json
	import requests

	response = requests.get("https://jsonplaceholder.typicode.com/todos") # Download JSON API GET request
	todos = json.loads(response.text) # Load JSON GET API Response text
	```

## References

## Resources

+ [RealPython - JSON](https://realpython.com/python-json/)
+ [RealPython - Requests](https://realpython.com/python-requests/)
+ [W3Schools - Python - Requests](https://www.w3schools.com/python/module_requests.asp)

## Remarks

