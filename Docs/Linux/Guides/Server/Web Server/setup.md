# Web Server Setup

## Information
### DESCRIPTION
```
These are the general steps to setup a Web Server and host your files.
```

### Pre-Requisites
### Dependencies

### Components
+ Web Server Host
+ (OPTIONAL) DNS

### Steps
- Setup your Webserver
- Access your Webserver
	- Remotely
- Port Forward to access on the Public/External Network

### Setup your Webserver
> Please refer to the Documentations for the relevant Web Server Host application you would like to use
+ [apache2](apache2/README.md)
+ [nginx](nginx/README.md)

### Accessing your Webserver
#### Remotely
- Information
	+ Generally to transfer files from your local host to the webserver, you will need to do it remotely
	+ The webserver's webpage location is in [basics](basics.md)
- Components
	+ FTP/SSH Server
> This section is still a WIP

### Deployment
- Deploy/Host and access on the Public (External) Network
	```
	Out-of-the-Box, after you run your webserver host, the server is only serving within your *Private (Local) Network*
	- This means you are not able to access it from the outside
	```
	- Port Forwarding
		- Information
			+ To access your website from the outside, you need to port forward
			- Security
				- Please note that doing this means your Private Network is at higher risk of being discovered or accessed by adversaries on the Internet as you will generally require your Public IP Address
					- As such, it is generally recommended to also setup a Domain Name (DNS) or a Dynamic DNS (DDNS) for the website 
						+ so that people will only need to know/remember your webserver's name, not the Public IP address.
						+ Please refer to [Setting up DNS](#setting-up-dns) for steps to do so
		- Steps
			1. Go into your default gateway/Router (i.e. 192.168.1.1)
			2. Look for "Port Forwarding" or "Port Mapping"
			3. Add your webserver and Port Forward from HTTP (Internal/Private Network) to HTTPS (External/Public Network)
				- Map Internal Port : 80 (HTTP)
				- Map External Port : 443 (HTTPS)
			4. Save
			5. Test

### Security
#### Setting up DNS
	```
	DNS is the Domain Name Service, an Internet protocol that basically maps/translates the IP address of your server with a Human-readable string, essentially becoming the Server's "name".
		- This new string that you can access is known as the "Domain Name" of the Server

	While attached/hosted,
		- You can use the server by its domain name regardless if it is Public Network or Private Network.

	Essentially, this is to allow you to use any server by a central "Domain Name" instead of the IP address directly.
		- Somewhat increases security as people just needs to remember your name instead of the Public IP
			+ However, there are ways to find the Public IP of your Web Server
			+ Thus, you need to implement multiple security methods
	```
	- Methods
		- DNS Services (with Free Tier)
			- DuckDNS
			- CloudFlare

		- Self-Hosted DNS Server
	> This section is still a WIP and may be migrated to another file for streamlined and easier access

#### Setting up SSL Certificate
	```
	SSL/TLS is the Socket Secured Layer/Transport Layer Security Protocols.

	A SSL Certificate is an encrypted digital certificate when assigned, essentially shows that your website is authorised and "signed" by a Certificate Authenticator (CA)
		- Any traffic passing through an HTTP(S) domain/URL will be encrypted, thereby making the traffic safer.
	```
	> This section is still a WIP