# Metasploit Framework Basics

## Table of Contents:
+ [Information](#information)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Information
### DESCRIPTION
```
The Metasploit Project is a framework/collection of cybersecurity tools that assists Penetration Testing and allows easier execution of various exploitation techniques development in both Blue-Teaming and Red-Teaming
- Its aim is to *provide information about Security Vulnerability* to *assists penetration testingand IDS signature development*

Metasploit can be used as both a defensive tool to test vulnerabiltiies, as well as an offensive tool to intrude into remote systems.
``` 
   
### History
- Created By: H.D Moor
- Timeline
    + Developed using Perl in 2003 but Rewritten using Ruby in 2007
    + Acquired by Rapid7 in 2009
    + Has became the de-facto exploit development framework since then


### Supporting Tools
- Metasploit can be assisted using scanning tools such as
    + nmap
    + OpenVAS
    + nexpose
    + Nessus

### Modules
+ A module is a packaged collection of codes
- Can perform a specific action, such as
    + Scanning 
    + Exploiting
- Every task performed with the Metasploit framework is defined within a module

- Module Types
    - Exploit
        + An exploit is a program that takes advantage of a specific vulnerability and provides an attacker with access to the target system.
        + An exploit typically carries a payload and delivers it to a target.
        - Examples: 
            + windows/smb/s08‐067_netapi : targets a Windows Server Service vulnerability that could allow remote code execution.

    - Payload
        + A payload is the actual code that executes on the target system after an exploit successfully executes.
        + A payload can be a reverse shell payload or a bind shell payload.
        - Examples: 
            + Meterpreter
            + command shell

    - Auxiliary
        + Does not require the use of a payload to run like exploit but performs arbitrary actions including information gathering.
        + Is like an exploit but performs Information Gathering
        - Examples: 
            + scanners


    
### Using Metasploit
- Exploitation Steps using Metasploit
    1. Check whether the intended target system is susceptible to known vulnerabilities.
    2. Select and configure an exploit, which will take advantage of one of one of the vulnerabilities.
    3. Select and configure a payload, which will be executed on the target system upon successful entry.
    4. Execute the exploit
    

