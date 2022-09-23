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
+ -p [port-number] : Use an alternate port number to connect to the remote device

### Usage
- Basic Usage
    ```console
    ssh username@192.168.1.1
    ```

## Additionals

### File Sharing between Guest and Host
- To share and transfer a file using Guest and Host
	+ use the command [scp](../scp.md)

## Resources

## References

## Remarks

