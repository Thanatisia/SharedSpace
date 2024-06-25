# Python snippets - HTTP Server - Simple HTTP/1.0 Server using the 'socket' library/module

## Information
### Description
- This snippet will create a simple HTTP/1.0 Server using socket programming with nothing fancy
    + Primarily the fundamental layout of a HTTP client-server communication format
- Contents
    + Server definitions
    + Start server listening
    + Waiting for client connections
    + Establishing client connections
    + Getting the client request
    + Replying/sending a HTTP response body
    + Close client connection
    + Close socket connection

## Steps

### Implementation
1. Import dependencies (packages, libraries)
    ```python
    import socket
    ```

2. Define your socket's host IP address and application port number
    - Explanation
        - In this example,
            + the variable 'SERVER_HOST' will contain your server hosts's IP address. It is set to '0.0.0.0' for example purposes
            + the variable 'SERVER_PORT' will contain your server's listening port number. Typically the default used by Web server and application developers are 8000 or 8080 (for HTTP/HTTPS) unless specified according to protocol design
            + The host and port are usually grouped together in a tuple known as the 'socket' which will be used as an interface into the server so that it is able to perform network communication with other devices on the network interface
    ```python
    # Define socket host and port
    SERVER_HOST = "0.0.0.0" # Specify the server host's IP address
    SERVER_PORT = 8000 # Specify the server listening port number
    ```

3. Create a socket for network communication
    - Create a new Socket object containing the Address Family and the Stream
        - Explanation
            - `socket.AF_INET` is a Network Address Family, basically a group of various networking tags that can be assigned to a socket for identifications
                + `AF_INET` contains the IPv4 address family, and as the name suggests, its used to allow the socket to communicate within the network/on the internet
            - `SOCK_STREAM` contains the flag/identifier that the socket object is used for streaming data to and from between a client and a server (i.e. TCP server, HTTP Server)
                + This is basically TCP
        ```python
        server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        ```
    - Set the socket optional flags
        - Explanation
            - `socket.setsockopt()` will set the specified option/flags to the socket for extra properties/attributes as necessary
                + `socket.SOL_SOCKET` is a constant flag to enable the attribute/property that this is a socket
                + `socket.SO_REUSEADDR` is a constant flag to enable the attribute/property that this is a socket will tell the socket object to reuse the IP address on startup
        ```python
        server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        ```

4. Bind the server socket (tuple containing the host ip address and port number) to the socket object
    - Explanation
        + The host and port are usually grouped together in a tuple known as the 'socket' which will be used as an interface into the server so that it is able to perform network communication with other devices on the network interface
        + `socket.bind(socket_tuple)` will bind the socket tuple to the network socket object to give it the networking information (ip address, server application port number) required to communicate within the network infrastructure
    ```python
    server_socket.bind( (SERVER_HOST, SERVER_PORT) )
    ```

5. Try starting the server and listen for client connections
    ```python
    try:
        # Statements here
    except Exception as ex:
        print("Exception encountered: {}".format(ex))
    ```

6. Start serving the socket and begin listening
    - Explanation
        - `socket.listen(N)` will begin listening for any client connection requests to accept
            - If there are any ongoing network connections, 
                + all subsequent network connections will be added to the socket's backlog with a maximum specified in the function ('N')
    ```python
        server_socket.listen(1)
        print("Listening on server IP Address: {}, port {}...".format(SERVER_HOST, SERVER_PORT))
    ```

7. Start a while loop that will keep going until the server is closed using 'Ctrl+C'
    ```python
        while True:
    ```

8. Wait for client connections
    - Explanation
        + the server will be in a loop, waiting and listening for a client connection request to accept
        - When a client connection is established
            + The callback event handler will be triggered and the function will return the client's connection state/object and the client's IP address
    ```python
            conn, addr = server_socket.accept()

            # Print confirmation message
            print("Connection received and accepted from client '{}' : '{}'".format(addr, conn))
    ```

9. Get the client requests from the connection
    - Explanation
        - Now that a connection has been established
            - The connection object can be used to obtain/receive all data within a buffer memory size (buffer size is typically 1024-bytes) within the HTTP packet 
                + The data returned is an encoded bytes data
                + Thus, you will then need to decode the data
    ```python
            request = conn.recv(1024).decode("utf-8")

            # Print request
            print("Request packet: {}\n".format(request.rstrip()))
    ```

10. Process the request string as necessary, and format the HTTP response packet head, header and texts to send back to the client/sender
    - Explanation
        + Using the request body, you can process the data as necessary (i.e. API routing using match-case)
        - When sending back a response body, you will need to format the packet according to the HTTP specifications
            - Explanation
                - Structure and Components
                    - HTTP packet header information
                        + `HTTP/[http-version]` : Specify the HTTP version you wish to send the response with (i.e. 1.0 = HTTP/1.0)
                        + `[HTTP Response Status Code] [HTTP Status Message]` : Your HTTP Routing response status code and its corresponding status message ('200 OK', '404 Not Found' etc etc)
                    - HTTP response body and texts
                        + `[response-text-body]` : Place your response body you wish to send/reply back to the sender
                - Notes
                    - Notice the 2 newlines, those are necessary as part of the HTTP Protocol specifications for separation of information
                        + First component contains the HTTP packet headers
                        + 2nd component contains the response body
            - Format
                ```
                HTTP/[http-version]
                [HTTP Response Status Code] [HTTP Status Message]


                [response-text-body]
                ```
    ```python
            HTTP_VERSION = "HTTP/1.0"
            HTTP_STATUS_CODE = "200 OK"
            response_text = "Hello World"
            response = '{} {}\n\n{}'.format(HTTP_VERSION, HTTP_STATUS_CODE, response_text)
    ```

11. Send back the HTTP response
    - Explanation
        - There are various ways to send the HTTP packet back to the sender as a reply
            + `.sendall(response_bytes)` will send the response text (encoded into a bytes data) back to the sender
    ```python
            conn.sendall(response.encode("utf-8"))

            # Print response text confirmation
            print("Response: {}".format(response))
    ```

12. Close connection after sending response
    ```python
            conn.close()
    ```

13. Close server socket object after usage
    ```python
    finally:
        # Close server socket after usage
        server_socket.close()
    ```

### Usage
- Open 2 terminals
    - Start up server
        ```bash
        python main.py
        ```

    - Connect to the server
        - Using curl
            ```bash
            curl [protocol]://[server-ip-address]:[server-port-number]/pages/[routes]
            ```

## Snippets

> Implementing a simple HTTP/1.0 Server

```python
import socket

# Define socket host and port
SERVER_HOST = "0.0.0.0" # Specify the server host's IP address
SERVER_PORT = 8000 # Specify the server listening port number

# Create a socket for network communication
server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM) # Create a new Socket object containing the Address Family and the Stream
server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1) # Set socket optional flags
server_socket.bind( (SERVER_HOST, SERVER_PORT) ) # Bind the server socket (tuple containing the host ip address and port number) to the socket object

# Try starting the server and listen for client connections
try:
    # Start serving the socket and begin listening
    server_socket.listen(1)
    print("Listening on server IP Address: {}, port {}...".format(SERVER_HOST, SERVER_PORT))

    # Keep looping until the server is closed using 'Ctrl+C'
    while True:
        # Wait for client connections
        conn, addr = server_socket.accept()

        # Print confirmation message
        print("Connection received and accepted from client '{}' : '{}'".format(addr, conn))

        # Get the client requests from the connection
        request = conn.recv(1024).decode("utf-8")

        # Print request
        print("Request packet: {}\n".format(request.rstrip()))

        # Format HTTP response packet head, header and texts
        HTTP_VERSION = "HTTP/1.0"
        HTTP_STATUS_CODE = "200 OK"
        response_text = "Hello World"
        response = '{} {}\n\n{}'.format(HTTP_VERSION, HTTP_STATUS_CODE, response_text)

        # Send back a HTTP response text
        conn.sendall(response.encode("utf-8"))

        # Print response text confirmation
        print("Response: {}".format(response))

        # Close connection after sending response
        conn.close()
except Exception as ex:
    print("Exception encountered: {}".format(ex))
finally:
    # Close server socket after usage
    server_socket.close()
```


## Resources
+ [Python3 Documentations - Library - Socket](https://docs.python.org/3/library/socket.html)

## References
+ [Codementor - joaojonesventura - Building a basic HTTP server from scratch in python](https://www.codementor.io/@joaojonesventura/building-a-basic-http-server-from-scratch-in-python-1cedkg0842)

## Remarks

