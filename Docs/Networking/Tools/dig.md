# Networking Utility - dig

## Information
### DESCRIPTION
```
Dig is a Command Line Utility for DNS Lookup and to gather DNS information, similar to nslookup.

It stands for "Domain Information Groper", and it is helpful for Troubleshooting DNS problems, checking if the DNS Server/DNS Resolver can be located/found. This can also be used to check if a Website via their Domain Name can be found
```
+ Utility Type : Command Line Utility
+ Purpose : DNS Lookup, DNS Troubleshooting
- Package Name
    + Debian-based : dnsutils
    + CentOS/RedHat-based : bind-utils

### File Locations
+ Dig Configuration File : ~/.digrc
    
## Basics
### DNS Query Types
+ Recursive DNS
+ Iterative DNS
+ Non-Recursive DNS

### DNS Server Types
+ DNS Resolver (Top-Level Domain)       
+ DNS Root Server
+ Authoritative Domain Name Server (AD)

### DNS Record Types
- Major
    ```
    DNS have 5 major record types
    ```
    + A : Represents 'Address'. An 'A' record shows the IP address for a specific hostname or domain
    + AAAA : Represents 'Address' like A as well (points to the IP address for a domain), but it points to IPv6 Addresses instead of IPv4 addresses
    + CNAME : In full means "Canonical Name". This is a DNS record that points a domain name (Aliased) to another Domain, this pointed domain is the Canonical name. Use this alongside an 'A' record to get the actual IP address of the aliased domain name
    + MX : Mail Exchange - used for Email Records. Shows where Emails for a domain should be routed to; makes it possible to direct emails to a mail server
    + NS : Nameserver Records. Specifies the Authoritative DNS Server (AD) for a domain, basically helps point to where the Internet Application can find the IP address for a domain name (via an AD DNS Server)

- Minor
    + SOA : Start of Authority; Stores Admin information about a domain, including Email Address of the Admin and when the domain was last updated.
    + TXT : Text Record. Lets the owner of a domain store text values in the DNS.
    + PTR : Pointer Record
    + SRV : Services. Makes it possible to store the IP address and port for specific services
    + CERT : Public Key Certificate Records
    + DCHID : Dynamic Host Control Protocol ID
    + DNAME : Delegation Name
   
## DNS Lookup
### Steps
1. Search for Domain Name
    ```console
    dig google.com
    ```
    - Most important section is the *ANSWER SECTION:*

  
## Setup
### Pre-Requisites
+ Network-Enabled

### Dependencies

### Installing
- Using Package Manager
    - Debian-based (apt)
        ```console
        sudo apt install dnsutils
        ```
    - Red Hat-based (yum)
        ```console
        sudo yum install bind-utils
        ```

## Documentation
### Synopsis/Syntax
```console
dig {options} [server-hostname|server-ip-address] [server-dns-name] [dns-type]
```

### Default Behaviour
+ By default, dig uses the local configuration to decide which nameserver to query

### Parameters
#### DNS Record Types
+ ANY : All results that it finds, along with its IP addresses

#### Optionals
+ +answer: Give detailed information in the answers section
+ +noall : Do not give all
+ +short : Short Answer Option; Display only the IP address associated with the domain name
+ +trace : Identify the route that the traffic is using; Lists each different server the query goes through to its final destination; able to identify the IP address where the traffic is hopping to
+ -f [dns-name-entries] : To specify a domain name entry file containing multiple entries and import into dig
+ -v : Display Dig's system version
+ -x [ip-address] : Reverse DNS Lookup; To look up a domain name by its IP address

### Usage
- Search for a domain name via DNS Lookup
    ```console
    dig google.com
    ```

- Reverse DNS Lookup
    + To lookup a domain name by its IP address
    ```console
    dig -x [domain-ip-address]
    ```
    
- Specify a domain server
    + By default, dig uses the local configuration to decide which nameserver to query
    ```console
    dig @[domain-ip-address] google.com
    ```
    
- To return specific records
    ```console
    dig google.com [record-type]
    ```
   
- To lookup multiple entries
    - Create a file
        + Enter multiple domain names, each on a new line
    - Input file to dig
        ```console
        dig -f domain.txt
        ```
   
## Wiki
### Sections
- ANSWER
    + The first column lists the *name of the server* that was queried
    + The second column is the *Time to Live*, a set timeframe after which the record is refreshed
    + The third column shows the *class of query* – in this case, “IN” stands for Internet
    + The fourth column displays the *type of query* – in this case, “A” stands for an A (address) record
    + The final column displays the *IP address associated with the domain name*
+ HEADER : Shows information it received from the server
- OPT PSEUDOSECTION : Displays advanced data
    + EDNS : DNS Extension System
    + Flags : If flags were specified
    + UDP : UDP Packet Size
- QUESTION : Displays the query data that was sent
    + First column is the domain name queried
    + Second column is the type (IN = Internet) of query
    + Third column specifies the record (A = Address), unless otherwise specified
- STATISTICS : Shows metadata about the query
    + Query time – The amount of time it took for a response
    + SERVER – The IP address and port of the responding DNS server. You may notice a loopback address in this line – this refers to a local setting that translates DNS addresses
    + WHEN – Timestamp when the command was run
    + MSG SIZE rcvd – The size of the reply from the DNS server
    
## Resources

## References
+ [Phoenixnap - Linux dig command examples](https://phoenixnap.com/kb/linux-dig-command-examples)
+ [ns1 - DNS Records, Servers and Query types](https://ns1.com/resources/dns-types-records-servers-and-queries)

## Remarks

