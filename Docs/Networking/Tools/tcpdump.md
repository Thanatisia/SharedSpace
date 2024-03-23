# Network Administration - Tools - tcpdump

## Information
### Description
+ tcpdump is, as the name suggests, a TCP packet dump CLI utility used for Network Administration and Cybersecurity packet filtering and investigations

## Setup
### Dependencies
### Pre-Requisites

### Installation
- Using Package Managers
    - apt-based
        ```bash
        apt install tcpdump
        ```
    - dnf-based
        ```bash
        dnf install tcpdump
        ```
    - pacman-based
        ```bash
        pacman -S tcpdump
        ```
    - yum-based
        ```bash
        yum install tcpdump
        ```

## Documentations
### Logical Operators
- AND : Combine filtering options; requires all conditions to match
    + Syntax: and, &&
- OR  : Match either conditions; does not require all conditions to match
    + Syntax: or, ||
- EXCEPT : Negation of the condition (~[CONDITION])
    + Syntax: not, !
- LESS : Shows packets with size less than the filter
    + Syntax: <
- GREATER : Shows packets with size greater than the filter
    + Syntax: >

### Synopsis/Syntax
- Basics
    ```bash
    tcpdump {options} <arguments> {filters} {capture-protocols}
    ```

### Parameters
- Positionals
    - filters : Explicitly specify filter conditions when capturing the network network
        + `host [host-ip|domain]` : Capture traffic from the specified host IP address/domain
        + `port [port-number]` : Capture traffic from the defined port
        + `net [network-address]/[subnet-prefix]` : Capture files from the specified network subnet; Format: [network-address]/[subnet-prefix]
        + `src [source-ip-address]` : Capture traffic from a specific source address
        + `dst [destination-ip-address]` : Capture traffic from a specific destination address
        + `portrange [min-port]-[max-port]` : Capture traffic from a range of ports

    - capture-protocols : Explicitly specify the type of network packets to capture from the traffic
        - Network Types
            + http : Capture HTTP packets
            + tcp : Capture TCP packets
            + udp : Capture UDP packets

- Optionals
    - With Arguments
        + `-c [count]` : Specify the first [count] packets and exit
        + `-F [filter-input-file]` : Use the given file as an input for the filter
        - `-i [interface]` : Specify an interface to capture TCP packets from
            - Interface types
                + any : All interfaces
                + ethN : Ethernet Interface
                + wlanN : Wi-Fi Interface
        - `-I [interface]` : Specify an interface to set as monitor mode
            - Interface types
                + any : All interfaces
                + ethN : Ethernet Interface
                + wlanN : Wi-Fi Interface
        + `-r [input-file]`  : Specify the file name of the input file to read into the application buffer for processing and analysis
        + `-w [output-file]` : Specify the file name of the output file to save/write the captured TCP network traffic packets into

    - Flags
        - Packet Capturing
            + -A : Print in ASCII
            + -d : Dump/Display the standard output in human-readable form
            + -D : Show available interfaces
            + -K : Do not verify CHECKSUM
            + -L : Display Data Link types for the interface
            + -n : Do not resolve host names
            + -N : Do not print domain names
            + -p : Do not capture in promiscuous mode
            + -S : Display entire packet
            + -IPV6 : Show only IPv6 packets
        - Display/Output Options
            + -e : Print Link (Ethernet) headers
            + -q : Quiet mode; Display less verbose standard output
            + -S : Print network traffic packet sequence numbers in exact format
            + -t : Do not print timestamp details in network dump
            + -v : Little verbose output
            + -vv : More verbose output
            + -vvv : Most verbose output
            + -x : Print data and headers in hexadecimal (0x) format
            + -xx : Print data with link headers in hexadecimal (0x) format
            + -X : Print standard output in hexadecimal and ASCII format excluding link headers
            + -XX : Print standard output in hexadecimal and ASCII format including link headers

### Usage
- Show available network interfaces to scan
    ```bash
    tcpdump -D
    ```

- Capture TCP network packets from 
    - all interfaces
        ```bash
        tcpdump -i any
        ```
    - specific interfaces
        ```bash
        tcpdump -i [interface]
        ```

- Capture the first N TCP network packets and exit
    ```bash
    tcpdump -i [interface] -c [count]
    ```

- Print network packets in ASCII
    ```bash
    tcpdump -i [interface] -A
    ```

- Write/Save the captured network traffic packets to a file
    ```bash
    tcpdump -i [interface] -w tcpdump.txt
    ```

- Read and analyze the saved network capture file
    ```bash
    tcpdump -r tcpdump.txt
    ```

- Do not resolve host names
    ```bash
    tcpdump -n -i eth0
    ```

- Capture TCP packets only
    ```bash
    tcpdump -i [interface] -c [count] -w tcpdump.pcap tcp
    ```

- Capture traffic from a defined port only
    ```bash
    tcpdump -i [interface] port [port-number]
    ```

- Capture traffic from a specific host
    ```bash
    tcpdump -i [interface] host [host-ip|domain]
    ```

- Capture files/traffic from a specific network subnet
    ```bash
    tcpdump net [subnet-address (network-address/subnet-prefix)]
    ```

- Capture traffic from a specific source address
    ```bash
    tcpdump src [source-ip-address]
    ```

- Capture traffic from a specific destination address
    ```bash
    tcpdump dst [destination-ip-address]
    ```

- Filter traffic based on a port number for a service
    ```bash
    tcpdump http
    ```

- Filter traffic based on port range
    ```bash
    tcpdump portrange [min-port]-[max-port]
    ```

## Resources

## References
+ [comparitech - net-admin - tcpdump cheat sheet](https://www.comparitech.com/net-admin/tcpdump-cheat-sheet/)

## Remarks

