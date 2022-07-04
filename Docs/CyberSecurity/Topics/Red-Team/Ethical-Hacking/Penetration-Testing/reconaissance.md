# Cybersecurity Documentation - Red Team Ethical Hacking : Reconaissance 

## Table of Contents
- [Information](#information)
- [Tools](#tools)
    - [Domain](#gathering-information-about-domain)
    - [Website Techologies](#gathering-information-about-technologies-a-website-uses)
    - [Subdomains](#gathering-information-about-subdomains)
    - [Domains on the Same Server](#gathering-information-about-domains-on-the-same-server)
    - [Open Source Intelligence (OSINT)](#open-source-intelligence-osint)
    
## Information
- Stage 1 of the Ethical Hacking Lifecycle

## Tools

### Gathering Information about Domain

- nslookup
    - A tool for querying the Domain Name System (DNS)
    - To obtain domain name or IP address mapping and/or other DNS records
    - Available in Windows, *NIX and MacOS
    - A tool for sending a DNS query directly from the client to any type of DNS server, regardless of whether it is root, TLD or authoritative
    - Documentation
        - Synopsis/Syntax
            nslookup {parameters} [url/ip address]
        - Parameters
            + -type=[type] : Specify the type of DNS record
        - Usage
            + Basic : nslookup www.example.com
            + Search for a Name server : nslookup -type=ns example.com
            + Reverse DNS : nslookup 11.22.33.44
- whois
    - A protocol for querying about the owner of a domain name, IP network
    - Information returned by WHOIS contains information about the owner
        - Examples
            + Email Addresses
            + Contact Numbers
            + Street Addresses
    - As WHOIS servers exist all over the internet and are administered by different organizations, the quality of the results may vary
    - All WHOIS services have mecahnisms in place to prevent data mining
    - Web-based whois service
        + URL : [whois domaintools](https://whois.domaintools.com)
         Easier to navigate and view information provided by whois
         Sometimes, more information can be found

### Gathering Information about Technologies a Website uses

- Net Tools
    - Netcraft
        - A website that provides comprehensive information about technologies that a website uses
        - URL : [Netcraft](https://sitereport.netcraft.com)
         It provides information about web hosting company, hosting history, type of web server, whether it sends spam, server‐side and client‐side technologies, web applications used and etc. 
         All the above information can be exploited to find vulnerabilities of the target.
        - Obtain information such as
            + SSL Certificate Chain

### Gathering Information about Subdomains

- [Netcraft Search DNS](https://searchdns.netcraft.com)
- [Pentest Tools](https://pentest-tools.com/information-gathering/find-subdomains-of-domain)

### Gathering Information about Domains on the Same Server

- Hacker Target
    - The same server having different websites
    - 1 server can serve/handle multiple websites
    - Gaining access to one of those websites on the same server can be helpful to attack others
        + Lateral Movements
    - URL : [hackertarget](https://hackertarget.com/reverse-ip-lookup)
    - query a website you know

### Gathering Information about Exploitable Vulnerabilities
    - ExploitDB
        - To search for exploitable vulnerabilities in the website
        - URL : [Exploit DB](exploit-db.com)

### Network Packet Capture

- Wireshark
        
### Open Source Intelligence (OSINT)
+ [Shodan](shodan.io)


