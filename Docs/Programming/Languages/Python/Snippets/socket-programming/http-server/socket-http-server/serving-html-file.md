# Python snippets - HTTP Server - Serving HTML file/pages using the HTTP/1.0 server

## Information
### Description
- This snippet is a follow-up from the [simple HTTP/1.0 Server using socket programming](Docs/Programming/Languages/Python/Snippets/socket-programming/http-server/socket-http-server/simple-socket-http1.0-server.md) documentation
    + Essentially, this snippet will modify the server to
        1. Read from a HTML root/index/landing page file you want to send back to the user (like a webserver)
        2. After establishing a connection with the client, format the response body to include the HTML file contents
        3. Respond with the HTML file contents, and printing your index page
- Contents
    + Read from a HTML root/index/landing page file you want to send back to the user (like a webserver)
    + Establishing a connection with the client
    + format the response body to include the HTML file contents
    + Respond with the HTML file contents, and printing your index page

## Steps

### Implementation
0. Please perform the initial setup according to the [simple HTTP/1.0 Server using socket programming](Docs/Programming/Languages/Python/Snippets/socket-programming/http-server/socket-http-server/simple-socket-http1.0-server.md) documentation
    + Import dependencies
    + Define your socket's host IP address and application port number
    + Create a socket for network communication
    + Bind the server socket (tuple containing the host ip address and port number) to the socket object

1. Prepare and read your HTML file contents for usage
    - Define your target HTML web page to use as the index/landing page
        ```python
        f_contents = ""
        f_path = "htdocs"
        f_name = "index.html"
        f_fullpath = "{}/{}".format(f_path, f_name)
        ```

    - Check if index file exists
        ```python
        if os.path.isfile(f_fullpath):
            # File exists
        else:
            print("File '{}' does not exist".format(f_fullpath))
            exit(1)
        ```

    - File exists - Open the file
        ```python
            # Get the contents of the target index HTML page
            with open(f_fullpath) as f_read:
                # Read file contents
                f_contents = f_read.read()

                # Close file after usage
                f_read.close()
        ```

2. Try starting the server and listen for client connections
    ```python
    try:
        # Statements here
    except Exception as ex:
        print("Exception encountered: {}".format(ex))
    ```

3. Start serving the socket and begin listening
    - Explanation
        - `socket.listen(N)` will begin listening for any client connection requests to accept
            - If there are any ongoing network connections, 
                + all subsequent network connections will be added to the socket's backlog with a maximum specified in the function ('N')
    ```python
        server_socket.listen(1)
        print("Listening on server IP Address: {}, port {}...".format(SERVER_HOST, SERVER_PORT))
    ```

4. Start a while loop that will keep going until the server is closed using 'Ctrl+C'
    ```python
        while True:
    ```

5. Get the client requests from the connection
    - Explanation
        - Now that a connection has been established
            - The connection object can be used to obtain/receive all data within a buffer memory size (buffer size is typically 1024-bytes) within the HTTP packet 
                + The data returned is an encoded bytes data
                + Thus, you will then need to decode the data
    ```python
            # Wait for client connections
            # ...

            # Get the client connection
            request = conn.recv(1024).decode("utf-8")

            # Print request
            print("Request packet: {}\n".format(request.rstrip()))
    ```

6. Modify the response text to take the contents of the HTML file to render on the client's web browser
    ```python
            HTTP_VERSION = "HTTP/1.0"
            HTTP_STATUS_CODE = "200 OK"
            response_text = f_contents
            response = '{} {}\n\n{}'.format(HTTP_VERSION, HTTP_STATUS_CODE, response_text)
    ```

7. Send back the HTTP response
    - Explanation
        - There are various ways to send the HTTP packet back to the sender as a reply
            + `.sendall(response_bytes)` will send the response text (encoded into a bytes data) back to the sender
    ```python
            conn.sendall(response.encode("utf-8"))

            # Print response text confirmation
            print("Response: {}".format(response))
    ```

8. Close connection after sending response
    ```python
            conn.close()
    ```

9. Close server socket object after usage
    ```python
    finally:
        # Close server socket after usage
        server_socket.close()
    ```

### Usage
- Open terminal and Start up server
        ```bash
        python main.py
        ```

- Access your web browser
    - Enter the domain/URL on the address bar
        ```bash
        [protocol]://[server-ip-address]:[server-port-number]/pages/[routes]
        ```

## Snippets

```python
import os
import sys
import socket

# Define socket host and port
SERVER_HOST = "0.0.0.0" # Specify the server host's IP address
SERVER_PORT = 8000 # Specify the server listening port number

# Create a socket for network communication
server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM) # Create a new Socket object containing the Address Family and the Stream
server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1) # Set socket optional flags
server_socket.bind( (SERVER_HOST, SERVER_PORT) ) # Bind the server socket (tuple containing the host ip address and port number) to the socket object

# Check if index file exists
f_contents = ""
f_path = "htdocs"
f_name = "index.html"
f_fullpath = "{}/{}".format(f_path, f_name)
if os.path.isfile(f_fullpath):
    # Get the contents of the target index HTML page
    with open("htdocs/index.html") as f_read:
        # Read file contents
        f_contents = f_read.read()

        # Close file after usage
        f_read.close()
else:
    print("File '{}' does not exist".format(f_fullpath))
    exit(1)

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
        response_text = f_contents
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

