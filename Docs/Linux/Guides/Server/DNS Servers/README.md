# DNS Servers

## Basics
### DNS
```
DNS is the Domain Name Service, an Internet protocol that basically maps/translates the IP address of your server with a Human-readable string, essentially becoming the Server's "name".
	- This new string that you can access is known as the "Domain Name" of the Server

While attached/hosted,
	- You can use the server by its domain name regardless if it is Public Network or Private Network.

- Essentially, this is to allow you to use any server by a central "Domain Name" instead of the IP address directly, like a phonebook for the internet.

On top of the name, DNS are also required so that the computer knows where - for example - "google.com" points to.
```

### Domain Hierarchy
- In DNS, there are 3 levels
	- Top-Level Domain (TLD)
	- Root Server
	- Authoritative Domain (AD)

### DNS Server
```
A server is any device (computer, microcomputer etc) that is providing a service to and from multiple clients via various platforms. 

As such, a DNS server is a computer that provides DNS capabilities to other client computers within the same network and/or other networks (if the DNS server can be accessed).
```
- Types of DNS servers
	+ Recursive DNS Server
		```
		Responds to a request from the client and returns the IP address for the requested domain name.
		The recursive resolver server makes a series of requests until it reaches the authoritative DNS name server (AD) for the requested domain
		```
	+ Authoritative DNS Server
		```
		Is the server that actually holds and maintains the record for the requested domain.
		The authoritative DNS server also has an updated mechanism
			- Allowing administrators to manage their public DNS names.
		```

## Use-Cases
- Having to input a name of the domain/server instead of remembering the IPv4 address
- Using the domain name as opposed to the IPv4 address directly will be slightly safer as you dont tell them the exact Public IP address
- Hosting your own DNS server will allow you to have your own local DNS instead of relying on other DNS service providers
	- Using big-named DNS service providers has an adverse-effect whereby there is an increased chance of them getting attacked
		- Because your logs are usually also saved by big-named DNS service providers,
			+ Your logs may be leaked
			+ Security may be compromised

## DNS Protocols
+ UDP (default)
+ TCP Port 53 (as fallback)

## DNS Servers
+ [Pi-hole with Unbound Open Source Recursive DNS Server Solution](PiHole)

## Resources

## References
+ [infoblox - DNS (Domain Name System)](https://www.infoblox.com/glossary/domain-name-system-dns/)

## Remarks