# Python snippets - HTTP Server - Serving HTML file/pages using the HTTP/1.0 server with HTTP routing

## Information
### Description
- This snippet is a follow-up from the [serving-html-file.md](Docs/Programming/Languages/Python/Snippets/socket-programming/http-server/socket-http-server/serving-html-file.md) documentation
    - This snippet will modify the code to process the client's connection route (`[protocol]://[domain]:[port-number]/page/routes`)
        + Using match-case, route the content to return according to the specified page

- Contents
    + Define the target file contents to read - This will be the 'Access Control List (ACL)'
    + Read all files into a dictionary on startup for easy access during run-time
    + Obtain the connection requests
    + Split request into headers and the HTTP body
    + Process the URL routing and parse the page as requested
    + Format the HTTP packet with the chosen page
    + Return the response to the sender

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
        # Define your file contents to read
        files = {
            "htdocs" : [
                "index.html",
                "404.html"
            ]
        }
        f_contents = {}
        page = ""
        ```

    - Iterate all directories/files in the folder tree dictionary
        ```python
        for f_path, f_files in files.items():
        ```

    - Map file path to the file contents dictionary
        ```python
            if not (f_path in f_contents):
                f_contents[f_path] = {}
        ```

    - Iterate through current files in the directory
        ```python
            for f_id in range(len(f_files)):
        ```

    - Get current file name
        ```python
                f_name = f_files[f_id]
        ```

    - Define full file path
        ```python
                f_fullpath = "{}/{}".format(f_path, f_name)
        ```

    - Map file name to the file contents dictionary
        ```python
                if not (f_name in f_contents):
                    f_contents[f_path][f_name] = ""
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
                        f_contents[f_path][f_name] = f_read.read()

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

7. Parse the HTTP headers and obtain the URL route
    ```python
        # Parse HTTP headers
        headers = request.split("\n")
        url_route = headers[0].split()[1]
    ```

8. Use 'match-case' to create a routing to various pages
    ```python
        match url_route:
            case "/": # Root/Index page
                page = f_contents["htdocs"]["index.html"]
            case _:
                # Default case
                ## Check if url route exists
                if url_route in f_contents["htdocs"]:
                    # Exists in the Access Control List
                    page = f_contents["htdocs"][url_route]
                else:
                    # Does not exist in the Access Control List
                    # page = "Error 404: '{}' not found".format(url_route)
                    page = f_contents["htdocs"]["404.html"]
    ```

9. Modify the response text to take the selected page to render on the client's web browser
    ```python
            HTTP_VERSION = "HTTP/1.0"
            HTTP_STATUS_CODE = "200 OK"
            response_text = page
            response = '{} {}\n\n{}'.format(HTTP_VERSION, HTTP_STATUS_CODE, response_text)
    ```

10. Send back the HTTP response
    - Explanation
        - There are various ways to send the HTTP packet back to the sender as a reply
            + `.sendall(response_bytes)` will send the response text (encoded into a bytes data) back to the sender
    ```python
            conn.sendall(response.encode("utf-8"))

            # Print response text confirmation
            print("Response: {}".format(response))
    ```

11. Close connection after sending response
    ```python
            conn.close()
    ```

12. Close server socket object after usage
    ```python
    finally:
        # Close server socket after usage
        server_socket.close()
    ```

13. Create a folder 'htdocs' to contain all of your HTML files and source codes
    ```bash
    mkdir htdocs
    ```

14. Create your Web pages/sites files as necessary
    - index.html
        ```html
        <html>
            <head>
                <title>Hello World</title>
            </head>

            <body>
                <h1>Hello World!</h1>
                <p>Welcome to the index.html web page..</p>
                <p>Here's a link to <a href="ipsum.html">Ipsum</a></p>
            </body>
        </html>
        ```
    - 404.html
        ```html
        <html>
            <head>
                <title>Error 404</title>
            </head>

            <body>
                <h1>Error 404: This page could not be found</h1>
            </body>
        </html>
        ```

### Usage
- Open terminal and Start up server
        ```bash
        python main.py
        ```

- Access your web browser
    - Enter the domain/URL on the address bar
        - Root page ('/')
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

# Define your file contents to read
files = {
    "htdocs" : [
        "index.html",
        "404.html"
    ]
}
f_contents = {}
page = ""

# Iterate all directories/files
for f_path, f_files in files.items():
    # Map file path to the file contents dictionary
    if not (f_path in f_contents):
        f_contents[f_path] = {}

    # Iterate through current files in the directory
    for f_id in range(len(f_files)):
        # Get current file name
        f_name = f_files[f_id]

        # Define full file path
        f_fullpath = "{}/{}".format(f_path, f_name)

        # Map file name to the file contents dictionary
        if not (f_name in f_contents):
            f_contents[f_path][f_name] = ""

        # Check if index file exists
        if os.path.isfile(f_fullpath):
            # Get the contents of the target index HTML page
            with open(f_fullpath) as f_read:
                # Read file contents
                f_contents[f_path][f_name] = f_read.read()

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

        # Parse HTTP headers
        headers = request.split("\n")
        url_route = headers[0].split()[1]

        # Use 'match-case' to create Web routing to various pages
        match url_route:
            case "/": # Root/Index page
                page = f_contents["htdocs"]["index.html"]
            case _:
                # Default case
                ## Check if url route exists
                if url_route in f_contents["htdocs"]:
                    # Exists in the Access Control List
                    page = f_contents["htdocs"][url_route]
                else:
                    # Does not exist in the Access Control List
                    # page = "Error 404: '{}' not found".format(url_route)
                    page = f_contents["htdocs"]["404.html"]

        # Format HTTP response packet head, header and texts
        HTTP_VERSION = "HTTP/1.0"
        HTTP_STATUS_CODE = "200 OK"
        response_text = page
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

