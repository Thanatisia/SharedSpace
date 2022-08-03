# NetfilterQueue Example 1 - Packet Monitoring

```
Aim: MiTM Attack with Analysis and Manipulation of packets on live traffic
    Capture incoming and outgoing packets from my local (Kali) machine,
    put them in the queue,
    inspect them as Scapy packets and
    release them to the destination
    
NOTE: THIS EXAMPLE IS FOR EDUCATIONAL PURPOSES ONLY, PLEASE DO NOT USE THIS FOR ILLEGAL and/or UNETHICAL PURPOSES, thank you.
```

- Install the *NetFilterQueue* package 
    - Setup
        - Dependencies
            + python3-pip
            + git
            + libnfnetlink-dev
            + libnetfilter-queue-dev
        - Python Package Repository Link: git+https://github.com/kti/pythonnetfilterqueue 
    - Install dependencies
        ```console
        sudo apt install -y python3-pip git libnfnetlink-dev libnetfilter-queue-dev
        ```
    - Install using Python PIP
        - Install python-pypi package
            + -U [repository_type]+[repository_url] : Install using an external remote repository url
            ```console
            pip3 install -U git+https://github.com/kti/python-netfilterqueue
            ```
- Configure the iptables to assign Queue Numbers for Incoming and Outgoing packets
    + Run the following commands consecutively
    ```console
    $> iptables -I INPUT -j NFQUEUE --queue-num 1
    $> iptables -I OUTPUT -j NFQUEUE --queue-num 1
    ```

- Create a python source file *nfq.py* (any filenames)
    ```python
            #!/usr/bin/env python
            
            from scapy.all import *
            from netfilterqueue import NetfilterQueue
            import os
            import sys
            
            # iptablesr = "iptables -A FORWARD -j NFQUEUE --queue-num 1" # Create Port Forward
            # os.system(iptablesr)
            # os.system("sysctl net.ipv4.ip_forward=1")
            
            def modify(packet):
                ip_pkg = IP(packet.get_payload()) # Create IP packet
                print(ip_pkg.show())
                packet.accept() # Accept IP Packet
                
            nfqueue = NetfilterQueue()
            nfqueue.bind(1, modify)
            
            try:
                nfqueue.run() # Run the Network Filter Queue
            except KeyboardInterrupt:
                nfqueue.unbind() # Stop the bind if keyboard cancelled the SIGNAL
    ```
    
+ Run the program
    ```console
    sudo python nfq.py
    ```
+ Open a Web Browser and Navigate
