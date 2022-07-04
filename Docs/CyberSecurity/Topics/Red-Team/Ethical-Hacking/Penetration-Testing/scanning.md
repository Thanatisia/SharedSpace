# Cybersecurity Documentation - Red Team Ethical Hacking : Scanning

## Table of Contents
- [Tools](#tools)
    - [Ping Sweep](#ping-sweep)
    - [Port-Scanning](#port-scanning)

## Tools

### Ping Sweep
- ping : Targets one specific IP to check if its alive
    - Documentation 
        - Synopsis/Syntax
        - Parameters
        - Usage
- fping : Ping multiple IP Addresses
    - Documentation
        - Synopsis/Syntax
            fping {options}
        - Parameters
            + -f [filename] : To read from a file
            + -g [ip-range] : Set a range of IPs
            + -h : Display help
        - Usage
            + fping -g [beginning_IP_address]-[ending_IP_address]
            + fping -g IP1, IP2, IPn
            + fping -g CIDR
            + fping -f ip_address.txt

### Port-Scanning

- nmap
    + The most popular, important port scanner
    + Added many new features including service/version detection, OS detection, network traceroute, multiple ping scanning and scripting functionality
    + GUI version: zenmap
    + States
        + open
        + closed
        + filtered
        + unfiltered
        + open|filtered
        + closed|filtered (Uncommon)
    - Documentation
        - Synopsis/Syntax
            nmap [option] <target_IP_address>
        - Default: 
            + Nmap will scan the 1000 most common ports in a random order
            + TCP SYN scan is used
            + Interactive Output
        - Parameters
            - General Options
                + -p [port-range] : Specify specific ports; Scan only the defined ports
                + -F : Scan only the 100 most common ports (fast)
                + -r : Do not randomize port numbers
                + --top-ports N : Scan the N most common ports
                + -v : Verbose; show detailed information about the scanning
            - Scan Options
                + -sT : TCP connect; Full open scan (perform three-way handshake)
                + -sS : TCP SYN scan; Half open scan
                + -sN : TCP NULL scan
                + -sF : TCP FIN scan
                + -sX : TCP Xmas Scan
                + -sA : TCP ACK Scan
                + -sU : UDP Scan
            - Timing Options
                + -T<mode> : Set a timer mode
                - Modes
                    + 0 : Paranoid : A packet is sent every 5 minutes (no packets sent in parallel for IDS evasion)
                    + 1 : Sneaky : A packet is sent every 15 seconds (no packets sent in parallel for IDS evasion)
                    + 2 : Polite : A packet is sent every 0.4 seconds (no packets sent in parallel)
                    + 3 : Normal : Default; Multiple packets to multiple targets sent
                    + 4 : Aggressive : Nmap will not wait for more than 1.25 seconds for a response
                    + 5 : Insane : Nmap will not wait for more than 0.3 seconds for a response
            - Output Options
                + -oN [filename] : Set Normal Output
                + -oX [filename] : Set XML output (This format can be converted to HTML format)
        - Usage
    - [Manual](https://nmap.org)

    
