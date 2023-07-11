# Linux System Administration - Playbook, Flow, Tips and Tricks

## Table of Contents
+ [Playbook](#playbook)
+ [Operational Flow](#operational-flow)
+ [Tips and Tricks](#tips-and-tricks)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Playbook

## Operational Flow
- If DNS is down
    - Potential Issues
        + Hardware freeze after having too much resource usage
        + Hardware freeze after an interface disconnected
        + Conflicting Network IP address
    - Troubleshooting
        - Are you able to remotely connect into it?
            + ssh
        - Change your DNS into another DNS server within your network
            + i.e. your default DNS (router etc)
            - Try to ping your server
                 - If no connection
                     1. If you are on-prem/on-site, or if you do not have connection to an IP-KVM
                         + Connect a display to it directly
                     2. check if the tty is frozen, or if it is accessible
                         - If it is not interfaceable
                             + Restart the server
                     3. Proceed to Investigation
                 - If there is connection
                     - Potential Reasoning
                         - DNS server is having a configuration error that is causing hiccup to occur
                             + Check the network traffic using something like `Wireshark` to see if there are any bottlenecks
                         - The server has multiple IP addresses and/or there is a conflict in IP addresses, hence the devices do not know which server to communicate with
                             + Check if there are multiple IP addresses using `ip a s`
                     1. Try to remotely connect into it
                         - Unable to remotely connect into it
                             + Connect a display to it directly
                         + Proceed to Investigation
    - Investigation
        - Network
            - Check if there are multiple IP addresses
                ```console
                ip a s
                ```
            - If you have a static IP address set
                - Check if dhcpcd is enabled/started
                    + A DHCP dynamic IP address may have been set next to your Static IP
        - Check the system logs immediately for potential causes
            - Using journalctl
                ```console
                journalctl -xe
                ```
    - Post-Investigation Actions
        - (Optional) If you are using manual service startup instead of the init system
            - To mitigate downtime
                + Start back up immediately after determining the reason
        - Make any and all adjustments to your Disaster Recovery Plan (DRP) as well as your Business Continuity Plan (BCP) as required from the findings
            + during the incident

## Tips and Tricks

## Resources

## References

## Remarks