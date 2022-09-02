# DNS Sinkhole

## Basics

### Introduction
```
A DNS Sinkhole is a Networking + Cybersecurity concept.

"DNS Sinkholing" is a mechanism aimed at protecting users by intercepting DNS requests that are attempting to connect either known malicious, unwanted or advertisement domains and
    - returning a false, "controlled" IP address
        + This controlled IP address will point to a sinkhole server that is defined by the DNS Sinkhole Administrator.
```

### Purpose
- Cybersecurity
    + This can be used to prevent hosts from connecting to or communicating with known malicious destinations such as a Botnet C&C (Command and Control) server

- General Usage
    - A DNS Sinkhole can also be used to filter out and block Advertisements and tracking. 
        + In a sense, a DNS sinkhole is an Ad-Blocker

## Examples
- [PiHole](https://github.com/Thanatisia/SharedSpace/tree/main/Docs/Linux/Guides/Server/DNS%20Servers) : Typically used for Ad-blocking, it can be used as a DNS Sinkhole as well as a DNS Server; it is similar to a firewall. 
    + Initially created for use on a raspberry pi, PiHole is used on any devices that runs Linux.

## Resources

## References
+ [ENISA Europa - DNS Sinkhole](https://www.enisa.europa.eu/topics/csirts-in-europe/glossary/dns-sinkhole)

## Remarks
