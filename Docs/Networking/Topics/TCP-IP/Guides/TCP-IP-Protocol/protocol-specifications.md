# TCP Socket Programming

## Introduction
### TCP/IP
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

## Syntax/Structure

```
----------         ----------
| Server | ------> | Client |
----------         ----------
    |------ SYN ------>|
    |<---- SYN-ACK ----|
    |------ ACK ------>| OK
```

## Resources

## References

## Remarks
