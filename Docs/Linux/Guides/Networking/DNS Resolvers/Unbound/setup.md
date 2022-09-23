# Linux - Open Source DNS Resolver - Unbound : Setup

```
This guide for a generic use to Unbound DNS Resolver is still a WIP, i have a working guide to running Unbound with Pi-hole
```

## Information
### DESCRIPTION
```
Unbound is a secure Open-Source recursive DNS server developed primarily by NLnet Labs, VeriSign Inc., Nominet and Kirei.
- Unbound is the recursive DNS resolver

Using Unbound, we can turn pi-hole's into a recursive DNS server.

In fact, Unbound can make any Linux system into a Recursive DNS server/resolver
    - So this is not necessarily just a Pi-hole specific usage
    - However, this specific configuration is for Pi-hole
        + Generic Unbound setup guide is a TODO
```

### Package
+ Package Name : unbound

### File Location
+ Unbound Default Files : /etc/unbound
+ Unbound Configurations : /etc/unbound/unbound.conf.d/

### Files
- /etc/resolv.conf : Linux DNS resolver config file
- /etc/unbound
    - unbound.conf : Unbound default configuration file

## Setup

### Installing DNS Server - Unbound Pi-hole DNS Solution
- Install 'unbound' package
    - via Package Manager
        - Debian-based (apt)
            ```console
            sudo apt install unbound
            ```            
        - Arch-based (pacman)
            ```console
            sudo pacman -S unbound
            ```
            
- Notes
    - If you see it failed the startup service - thats normal
        + Thats because it doesnt have a configuration yet

### Setup unbound configuration file
- Configure unbound configuration file
    - Open unbound configuration file 
        + You can refer to the Unbound documentations (under [Wiki - Template](#template)) for a *'/etc/unbound/unbound.conf.d/pi-hole.conf'* template
        ```console
        sudo $EDITOR /etc/unbound/unbound.conf
        ```
        - Enter the config into the file
           
    - Restart your unbound service
        ```console
        sudo service unbound restart
        ```
        
    - Test unbound to see if it is operational
        - Using dig to perform a DNS lookup
            + Target IP: 127.0.0.1 (your dns server interface)
            + Port : 5335
            ```console
            dig [domain-name] @127.0.0.1 -p 5335
            ```
  
    + Unbound configuration should be done
  
### Local DNS Server
- To use unbound as your local DNS server
    - Edit your DNS table in '/etc/resolv.conf'
        ```console
        sudo $EDITOR /etc/resolv.conf
        ```
        - Set your nameserver to the loopback addresses
            + '::1'
            + '127.0.0.1'
            ```
            # /etc/resolv.conf
            nameserver ::1
            nameserver 127.0.0.1
            options trust-ad
            ```

## Wiki

### Template
- unbound configuration
            ```
            server:
                # If no logfile is specified, syslog is used
                # logfile: "/var/log/unbound/unbound.log"
                verbosity: 0

                interface: 127.0.0.1      # Your pi-hole interface IP address
                port: 5335                # Your pi-hole listening port number
                do-ip4: yes
                do-udp: yes
                do-tcp: yes

                # May be set to yes if you have IPv6 connectivity
                do-ip6: no

                # You want to leave this to no unless you have *native* IPv6. With 6to4 and
                # Terredo tunnels your web browser should favor IPv4 for the same reasons
                prefer-ip6: no

                # Use this only when you downloaded the list of primary root servers!
                # If you use the default dns-root-data package, unbound will find it automatically
                #root-hints: "/var/lib/unbound/root.hints"

                # Trust glue only if it is within the server's authority
                harden-glue: yes

                # Require DNSSEC data for trust-anchored zones, if such data is absent, the zone becomes BOGUS
                harden-dnssec-stripped: yes

                # Don't use Capitalization randomization as it known to cause DNSSEC issues sometimes
                # see https://discourse.pi-hole.net/t/unbound-stubby-or-dnscrypt-proxy/9378 for further details
                use-caps-for-id: no

                # Reduce EDNS reassembly buffer size.
                # IP fragmentation is unreliable on the Internet today, and can cause
                # transmission failures when large DNS messages are sent via UDP. Even
                # when fragmentation does work, it may not be secure; it is theoretically
                # possible to spoof parts of a fragmented DNS message, without easy
                # detection at the receiving end. Recently, there was an excellent study
                # >>> Defragmenting DNS - Determining the optimal maximum UDP response size for DNS <<<
                # by Axel Koolhaas, and Tjeerd Slokker (https://indico.dns-oarc.net/event/36/contributions/776/)
                # in collaboration with NLnet Labs explored DNS using real world data from the
                # the RIPE Atlas probes and the researchers suggested different values for
                # IPv4 and IPv6 and in different scenarios. They advise that servers should
                # be configured to limit DNS messages sent over UDP to a size that will not
                # trigger fragmentation on typical network links. DNS servers can switch
                # from UDP to TCP when a DNS response is too big to fit in this limited
                # buffer size. This value has also been suggested in DNS Flag Day 2020.
                edns-buffer-size: 1232

                # Perform prefetching of close to expired message cache entries
                # This only applies to domains that have been frequently queried
                prefetch: yes

                # One thread should be sufficient, can be increased on beefy machines. In reality for most users running on small networks or on a single machine, it should be unnecessary to seek performance enhancement by increasing num-threads above 1.
                num-threads: 1

                # Ensure kernel buffer is large enough to not lose messages in traffic spikes
                so-rcvbuf: 1m

                # Ensure privacy of local IP ranges
                private-address: 192.168.0.0/16
                private-address: 169.254.0.0/16
                private-address: 172.16.0.0/12
                private-address: 10.0.0.0/8
                private-address: fd00::/8
                private-address: fe80::/10
            ``` 
            
## References
+ [YouTube | TechHut | The Pi-Hole install EVERYONE needs!](https://www.youtube.com/watch?v=xtMFcVx3cHU)

## Resources
+ [Pi-Hole Documentations - DNS Server Solution - Unbound](https://docs.pi-hole.net/guides/dns/unbound/)
+ [ArchWiki - Unbound General Installation Documentations](https://wiki.archlinux.org/title/unbound)

## Remarks
