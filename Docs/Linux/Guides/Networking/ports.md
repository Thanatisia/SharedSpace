# Linux - Port Handling

```
Information/Documentation on working with Ports in Linux
```

## Information
### Background
- In Computer Networking, Ports are like "doors" to a location; 
    - where 
        - these "locations" are the networks we are working with 
            - If you are at home, the Home Network; 
            - If you are at work, the Corporate Network etc.
        - the doors lead to a room which will contain various objects and entities.

- Essentially, ports are a mapping of a door to an application you are serving in a device.
    - When Port Forwarding/Translating/Mapping 
        - You are mapping from
            + a port on your default gateway (router) pointing to the external (unsafe) public network
            + a port on a device in the internal (safe) private network running an application

## Checking if port is in use
- Using netstat (Not Recommended - Deprecated)
    - Notes
        + Please do not use this method as netstat has been deprecated on Linux for some time
        + I have included this for learning purposes, for actual production use - please use the 'ss' command
    - Parameters
        + -t : Select all TCP ports
        + -u : Select all UDP ports
        + -l : Show listening server sockets (open TCP and UDP ports in listing state)
        + -p : Display PID/Program name for sockets. In other words, this option tells who opened the TCP or UDP port. For example, on my system, Nginx opened TCP port 80/443, so I will /usr/sbin/nginx or its PID.
        + -n : Don’t resolve name (avoid dns lookup, this speed up the netstat on busy Linux/Unix servers)
    - Synopsis/Syntax
        - Filter out port in LISTEN state
            ```console
            {sudo} netstat -tulpn | grep LISTEN
            ```
        - Filter out specific TCP port
            ```console
            {sudo} netstat -tulpn | grep ':[PORT_NUMBER]'
            ```

- Using ss
    - Parameters
        + -t : Show only TCP sockets on Linux
        + -u : Display only UDP sockets on Linux
        + -l : Show listening sockets. For example, TCP port 22 is opened by SSHD server.
        + -p : List process name that opened sockets
        + -w : List out only RAW sockets
        + -n : Don’t resolve service names i.e. don’t use DNS
    - Synopsis/Syntax
        - Filter out port in LISTEN state
            ```console
            {sudo} ss -tulwpn | grep LISTEN
            ```
        - Filter out specific TCP port
            ```console
            {sudo} netstat -tulwpn | grep ':[PORT_NUMBER]'
            ```

## Wiki

## Resources

## References
+ [Cyberciti - UNIX/Linux Check if port is in use](https://www.cyberciti.biz/faq/unix-linux-check-if-port-is-in-use-command/)

## Remarks
