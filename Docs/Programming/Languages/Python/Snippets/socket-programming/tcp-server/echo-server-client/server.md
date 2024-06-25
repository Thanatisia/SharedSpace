# Python snippets - TCP Server - TCP/IP Echo Server

## Information

### Basics
- TCP/IP Client and Server
    - TCP/IP is a networking protocol used for communication between devices on the internet that prioritizes data integrity, the opposite being UDP
        - Typically, like most networking protocols, TCP/IP involves 2 parties
            + A client
            + A server
        - The server is represented by anyone who is listening for incoming data to be sent to while 
            + The client is represented by anyone who is sending the data to a server
    - When a server received a request from a client, the TCP/IP Protocol will perform a TCP 'SYN, SYN-ACK, ACK' Handshake to establish communication
        - Like a ping-pong match between the server and the client, the TCP Handshake is as follows
            + The server will send a SYN request (Synchronization) to the client to ask if it is there and ready
            + The client will reply with an ACK request (Acknowledge) to the server to respond that it is there and ready
            + The server will reply with a final SYN-ACK request (Synchronization-Acknowledge) to the client to confirm that it is ready
        - Once the connection has been established
            - The client will begin sending data to the server, and the server will reply according to what its received
                + Rinse and repeat

- What is an echo client/echo server
    - An Echo Client/Server is essentially 2 client and server that is programmed specifically to talk to each other and
        + The server will Echo what the client has sent back to the client, like an echo chamber

## Steps
1. Import dependencies and libraries
    ```python
    import sys
    import socket
    ```

2. Define socket host and port
    - Explanation
        + SERVER_HOST : Specify the server host's IP address
        + SERVER_PORT : Specify the server listening port number
        + SERVER_ADDR : The Server Address - A tuple group containing the server IP address mapped to the application port number required for network communication
    ```python
    SERVER_HOST = "0.0.0.0"
    SERVER_PORT = 10000
    SERVER_ADDR = (SERVER_HOST, SERVER_PORT)
    ```

3. Create a new Socket object containing the IPv4 Address Family and the TCP/IP Stream for Network communication
    ```python
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    print(sys.stderr, "Starting up on '{}' port '{}'".format(SERVER_HOST, SERVER_PORT))
    ```

4. Bind the server socket (tuple containing the host ip address and port number) to the socket object
    ```python
    sock.bind( (SERVER_HOST, SERVER_PORT) )
    ```

5. Set socket into server mode to listen for any incoming connection
    ```python
    sock.listen(1)
    print("Listening on server IP Address: {}, port {}...".format(SERVER_HOST, SERVER_PORT))
    ```

6. Keep looping until the server is closed using 'Ctrl+C'
    ```python
    while True:
    ```

7. Wait for client connections
    ```python
        print(sys.stderr, "Waiting for a connection...")
        # begin listening to the port for any incoming connections
        conn, addr = sock.accept()
    ```

8. Try starting the server and listen for client connections
    - Explanation
        - Try accepting the client's connection,
            + perform client-server communication until the break condition is encountered
        + On completion, close the connection after usage
    ```python
        try:
            # Print confirmation message
            print("Connection received and accepted from client '{}' : '{}'".format(addr, conn))

            # Statements
        except Exception as ex:
            print("Exception encountered: {}".format(ex))
        finally:
            # Close connection after sending response
            conn.close()
    ```

9. While there are still data to be received
    ```python
            while True:
    ```

10. Receive the data in small chunks of 16-bytes and re-transmit it
    - Explanation
        + Receive the data from the connection in a small chunk
    ```python
                data = conn.recv(16)
                print(sys.stderr, "Received '{}'".format(data.decode("utf-8")))
    ```

11. Check if data is found
    - Explanation
        - Check if data is empty
            + Data is not empty: Send back to client
        - Break condition : If data is empty (No more data)
            + Break the connection
    ```python
                if data:
                    print(sys.stderr, "Sending data back to the client")
                    conn.sendall(data)
                else:
                    # No more data
                    print(sys.stderr, "No more data from {}".format(addr))
                    # Break the connection
                    break
    ```

## Snippets

```python
import os
import sys
import socket

# Define socket host and port
SERVER_HOST = "0.0.0.0" # Specify the server host's IP address
SERVER_PORT = 10000 # Specify the server listening port number
SERVER_ADDR = (SERVER_HOST, SERVER_PORT) # The Server Address - A tuple group containing the server IP address mapped to the application port number required for network communication

# Create a socket for network communication (TCP/IP)
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM) # Create a new Socket object containing the IPv4 Address Family and the TCP/IP Stream for Network communication
print(sys.stderr, "Starting up on '{}' port '{}'".format(SERVER_HOST, SERVER_PORT))
sock.bind( (SERVER_HOST, SERVER_PORT) ) # Bind the server socket (tuple containing the host ip address and port number) to the socket object

# Set socket into server mode to listen for any incoming connection
sock.listen(1)
print("Listening on server IP Address: {}, port {}...".format(SERVER_HOST, SERVER_PORT))

# Keep looping until the server is closed using 'Ctrl+C'
while True:
    # Wait for client connections
    print(sys.stderr, "Waiting for a connection...")
    # begin listening to the port for any incoming connections
    conn, addr = sock.accept()

    # Try starting the server and listen for client connections
    try:
        # Print confirmation message
        print("Connection received and accepted from client '{}' : '{}'".format(addr, conn))

        # While there are still data to be received
        while True:
            # Receive the data in small chunks of 16-bytes and re-transmit it
            data = conn.recv(16)
            print(sys.stderr, "Received '{}'".format(data.decode("utf-8")))

            # Check if data is found
            if data:
                print(sys.stderr, "Sending data back to the client")
                conn.sendall(data)
            else:
                # No more data
                print(sys.stderr, "No more data from {}".format(addr))
                # Break the connection
                break
    except Exception as ex:
        print("Exception encountered: {}".format(ex))
    finally:
        # Close connection after sending response
        conn.close()
```

## Resources

## References

## Remarks

