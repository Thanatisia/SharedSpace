# pihole command

## Information

### File Locations
> Locations of where pihole scripts and configs are stored
+ Script Location : /usr/local/bin/pihole
+ Pihole-related extra/resource Files : /etc/pihole
+ Pihole DNS Blacklist/Whitelist List Script : /opt/pihole/list.sh

### Files
- /etc/pihole
    + gravity.db : Contains the domainlist table for DNS

### Scripts
- /opt/pihole
    + list.sh           : Contains your Blacklist/Whitelist/Regex pattern matching
    + piholeDebug.sh    : Debugger
    + piholeCheckout.sh : Checkout Switch Pihole subsystems to a different GitHub branch. An admin can specify repositories + branches
    + webpage.sh        : Set an administrator contact address for the block page. This will create a hyperlink on the block page to the specified email address

## Documentation
### Synopsis/Syntax
- Core Script
    ```console
    pihole {options} <arguments> {positionals}
    ```

- Web Script
    ```console
    pihole -a {options} <arguments>
    ```
    
### Parameters

#### Core Script
- Positional
    + checkout [branch-name] : Checkout Switch Pihole subsystems to a different GitHub branch. An admin can specify repositories + branches
    + chronometer : Chronometer
    + debug : Debugger
    + disable [time] : Toggle disable Pi-hole's ability to block unwanted domains. The disable option has the option to set a specified time before blocking is automatically re-enabled
        - Time
            + (n)s : Number of Seconds
            + (n)m : Number of Minutes
            + (n)h : Number of Hours
    + enable : Toggle enable Pi-hole's ability to block unwanted domains. 
    + flush : Log Flush
    + logging : Specified whether the Pi-hole log should be used; Comment out 'log-queries' within /etc/dnsmasq.d/01-pihole.conf and flushing the log
    + -q [domain-name] | query [domain-name] : Query your whitelist, blacklist, wildcards and adlists for a specified domain
    + reconfigure : Reconfigure pihole
    + restartdns : Restart Pi-hole's DNS service of the system
    + status : Check and display the running status of Pihole's DNS and blocking services
    + tail : Tail
    + uninstall : Uninstall and Remove Pihole from the system. Provides the option to remove each dependency individually
    + -g | updateGravity : Retrieve blocklists, consolidate them into one unique list for the built-in DNS server to use. 
        - Information
            + It also serves to complete the process of manual whitelisting, blacklisting and wildcard update. 
            + It is ran automatically each week but can be invoked manually at any time
    + -up | updatePihole : Automatically updates the Pihole server
        - Information
            + Checks Pi-hole Core, the Web Interface and FTL repositories to determine what upgrades (if any) are required.
    + -v {arguments} | version {arguments} : Check installed versions of Pi-hole, the Web Interface and FTL. Provides options to configure which details will be printed - such as current version, latest version, hash and subsystem
        - Arguments
            + -c : Current Version

- Optionals
    + -adlist : Query the database at /etc/pihole/gravity.db to return a list of adlists where the queried domain exists
    + -b [url|ip-address] : Blacklist a target IP Address/URL
    + -exact : Match exactly the query
    + -regex [pattern] : To blacklist DNS or incoming connections that matches a Regex pattern; Seperate all patterns with a space delimiter (' ')
    + -w [url|ip-address] : Whitelist a target IP Address/URL
    + -wild : To match all incoming connections
    + --help : Display this help command
    
#### Web/Administrative Script
+ -a [type] {options}: Admin (Default: Web Interace Administration; Indicate it is a Web Script)
    - Types
        + Default (Empty) : Web Interface Administration
        + email [email-address] {options} : Email Administrative Contact Address
        + interface [interface-target] {options} : Specify interface listening behaviour for pihole-FTL
            - Notes
                + Ensure that you use a firewall to prevent your Pihole from becoming a host to DNS amplification attackers (Cybersecurity concern).
                + You may want to consider running Wireguard to grant your mobile devices access to the Pi-hole (or self-hosting a VPN Server)
            - Interface Targets
                + all : All Interfaces
                + local : Local Interface
        - Temperatures : Choose any one of the below for the temperature S.I unit/indicator
            + celsius
            + fahrenheit
            + kelvin
+ -p {new-password} : Set a new password; Leave empty to set the new password interactively
+ -c : Chronometer/Temperature Unit; Set the specified temperature unit as the preferred type. This will affect the Web Interface and Chronometer
+ -t : Teleport; Create a configuration backup. The backup will be created in the current working directory. The backup can be imported using the *'Settings > Teleport'* page

### Usage

- Disable Help for the various options
    ```console
    pihole {-b|-w|-regex|-wild...} --help
    ```

- Set options for Web Interface
    ```console
    pihole -a {options} <arguments>
    ```
    
- Set a new password to the pihole Web Script
    ```console
    pihole -a -p [new-password]
    ```

- White/Blacklist according to Regex
    ```console
    pihole -regex '^example.com$' '.*\.example2.net'
    ```

    
## Resources

## References
+ [YouTube | TechHut | The Pi-Hole install EVERYONE needs!](https://www.youtube.com/watch?v=xtMFcVx3cHU)
+ [Pihole Documentations - Pihole command](https://docs.pi-hole.net/core/pihole-command/)

## Remarks
