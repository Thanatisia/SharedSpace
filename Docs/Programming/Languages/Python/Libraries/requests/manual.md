# Docs - Python Module : requests

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [References](#references)
- [Resources](#resources)
- [Remarks](#remarks)

## Information

This module is used to handle HTTP REST API requests such as POST, GET etc. with Python.

There exist a 'request' module which is built-in, but this is an improved variant of that module

- An HTTP packet communication usually consists of 2 object types
	+ Requests : This is what you send to the server (using the TCP/IP 3-way handshake - SYN, ACK-SYN, SYN) to request for an action
	+ Response : This is what you receive from communicating with the server (using the TCP/IP 3-way handshake - SYN, ACK-SYN, SYN) 

- HTTP actions includes
	+ POST request
	+ GET request

- Status Codes
	+ 200 : Server and connection is ok
	+ 404 : Website Resource not found

## Setup

### Pre-Requisites

- python
- pip

### Obtaining

+ python -m pip install requests

## Documentation

### Module Class

+ import requests
+ from requests.exceptions

### Variables

#### Response

+ response.content : Gets the raw bytes of the content (Payload) in the message body
+ response.headers : Gives the response headers such as Content time, TTL etc; type <dict>
+ response.status_code : Get the status code of your response
+ response.text : Decodes the content raw bytes into string for use

### Functions

#### Exceptions

+ HTTPError

#### GET request methods

+ To receive a GET request
	```python
	response = requests.get("https://api.github.com")
	```


#### POST request methods



### Synopsis/Syntax



### Parameters

### Usage

- General Flow
	```python
	import requests

	response = requests.get("https://link.to.api.com/api/filename")
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

## Remarks

