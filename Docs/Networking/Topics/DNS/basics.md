# DNS - Domain Name Service : Basics

## DESCRIPTION
```
DNS is the Domain Name Service, an Internet protocol that basically maps/translates the IP address of your server with a Human-readable string, essentially becoming the Server's "name".
    - This new string that you can access is known as the "Domain Name" of the Server

While attached/hosted,
	- You can use the server by its domain name regardless if it is Public Network or Private Network.
```
    
## DNS Query Types
+ Recursive DNS
+ Iterative DNS
+ Non-Recursive DNS

## DNS Server Types
+ DNS Resolver (Top-Level Domain)       
+ DNS Root Server
+ Authoritative Domain Name Server (AD)

## DNS Record Types
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
   
## Techniques
+ DNS Lookup
+ Reverse DNS Lookup
   
## DNS Lookup
### Methods
1. Search for Domain Name via DNS Lookup
    ```console
    {nslookup|dig} google.com
    ```
2. DNS Lookup Web Services

## DNS Servers/Utilities
+ Pi-hole

## DNS Resolver
+ Unbound
