# Docs - Python Module : socket

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [References](#references)
- [Resources](#resources)
- [Remarks](#remarks)

## Information

This module is essentially the base for the topic of Socket Programming 

- Sockets and the socket API are used to send messages across a network. 
	+ They provide a form of inter-process communication (IPC). 
	+ The network can be a logical, local network to the computer, or one that’s physically connected to an external network, with its own connections to other networks. 
	+ The obvious example is the Internet, which you connect to via your ISP

- Socket programming usually consists of 2 object types
	+ socket server (connection)
	+ socket client (connector)

## Setup

### Pre-Requisites

- python
- pip

### Obtaining

+ Built-in

## Documentation

### Module Class

import socket

### Variables

#### Address Family

+ AF_INET : Internet address family for IPv4

#### Stream Type

+ SOCK_STREAM : Stream for TCP/IP

### Functions

#### Socket Server (Stream/Transmission)

+ socket()
+ .bind()
+ .listen()
+ .accept()
+ .connect()
+ .connect_ex()
+ .send()
+ .recv()
+ .close()

#### Socket Client (Listening/Receiver)

+ socket()
+ .bind()
+ .listen()
+ .accept()

### Synopsis/Syntax

#### Socket Server

- To initialize a Socket Stream
	```python
	stream = socket.socket([Address_Family], [Socket_Type])
	```

- To associate the socket with a specific network interface and port number
	```python
	stream.bind( ([HOST_IP, PORT]) )
	```

- To start listening to the socket stream
	```python
	stream.listen()
	```

- To accept connection received and get the address
	```python
	""" 
	NOTE:
	- conn is the connection object
	"""
	conn, addr = stream.accept()
	```

- To receive data from the connection while it is open
	```python
	# bytes = Number of bytes to receive
	data = conn.recv(bytes)
	```

- To reply the connection
	- data : The data to send to all addresses in the connection
		+ format : b'Hello World'
	```python
	conn.sendall([data])
	```

#### Socket Client



### Parameters

### Usage

- General Flow
	- Socket Server
		```python
		HOST = "127.0.0.1"  # This is your host IP address (for Server)
		PORT = 65432        # This is the port to listen on (non-priviledged ports are > 1023)
		
		stream = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
		with stream:
			# Use the socket object without calling s.close()
			s.bind( (HOST,PORT) )	# Bind stream to a socket [hint : A socket is basically the Host IP Address + Port number together, i.e. (HOST_IP, PORT)]
			s.listen()		# Start Listening to the socket stream
			conn, addr = s.accept()	# Accept connection received and get the address

			"""
			NOTE:
				- you now have a new socket object known as 'conn'
			"""
			with conn:
				print("Connected by {}".format(addr))
				while True:
					# Continuous loop and keep connection open until break condition is met
					data = conn.recv(1024) # Receive data from connection

					# - if the connection receives an empty bytes object (b'')
					#	- that signals that the client closed the connection and the loop is terminated
					if not data:
						break
					conn.sendall(data)
		```
	- Socket Client
		```python
		HOST = "127.0.0.1"  # This is your host IP address (for Server)
		PORT = 65432        # This is the port to listen on (non-priviledged ports are > 1023)
		
		stream = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

		with stream:
			stream.connect( (HOST, PORT) )  # Bind stream to a socket [hint : A socket is basically the Host IP Address + Port number together, i.e. (HOST_IP, PORT)]
			stream.sendall(b"Hello World")  # Send to all addresses in the connection the data
			data = stream.recv(1024)        # Receive data from connection

		print("Received : {}".format(data))
		```	
## References

## Resources

+ [RealPython - Sockets](https://realpython.com/python-sockets/)

## Remarks

