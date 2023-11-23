# Documentation - Command : ssh

## Table of Contents
+ [Information](#information)
+ [Setup](#setup)
+ [Documentation](#documentation)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Information

+ Port Number : 22

### Description

```
The Secured Shell (SSH) protocol is a Remote network protocol used to perform Remote connection to a external network device via the terminal with connection/packet encryption, replacing Telnet (which had no encryption and transmits text entirely in plaintext)

- The ssh command is used to SSH into another device shell remotely via the terminal via Public Key Encryption/Infrastruction (which utilizes Public-Private Key Pairs to authenticate/authorize transmissions)
```

## Documentation

### Synopsis/Syntax

```console
ssh {options} [username]@[ip-address|domain-name]
```

### Parameters
- Positionals
    + remote-host : Specify the remote host you wish to establish secured communications with; Format: `[username]@[ip-address|domain-name]`
- Optionals
    - With Arguments
        + `-D [socks-port-number]` : This will open a SOCKS proxy (that supports TCP/UDP connections) on the local port number specified
        + `-p [port-number]` : Use an alternate port number to connect to the remote device
    - Flags
        + -N : This tells to not execute remote command, just forward the port
        + -C : This tells to compress the data over the tunnel

### Usage
- Basic Usage
    ```console
    ssh username@192.168.1.1
    ```

- Establish an SSH tunnel with Socks
    + Summary: This tells the computer to use itself as a proxy server
    - Explanation
        + This will effectively "Port Forward" the SOCKS proxy port number from the specified remote host
        + To the local host that is communicating/making connection with the Proxy Server
        + Thereby creating an SSH tunnel between your computer and the specified remote host
    - Parameters
        - Positionals
            - proxy-server : Specify the account of the SSH server
                + Format: username@server-ip
        - Optionals
            + `-D [socks-port-number]` : This will open a SOCKS proxy (that supports TCP/UDP connections) on the local port number specified
            + -N : This tells to not execute remote command, just forward the port
            + -C : This tells to compress the data over the tunnel
    ```console
    ssh -D 1337 -N -C [proxy-server (username@server-ip)]
    ```

## Additionals

### File Sharing between Guest and Host
- To share and transfer a file using Guest and Host
	+ use the command [scp](scp.md)

## Resources

## References

## Remarks

