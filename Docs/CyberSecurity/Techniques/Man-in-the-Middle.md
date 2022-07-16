# Man-in-the Middle (MITM)
+ There is an attacker that intercepted the communication between 2 parties as a Middle-man (thus, Man-in-the-Middle)
    - Typically relays and possibly modifies the communication between 2 parties
        + Who believes they are directly communicating with each other
    - The attacker/Man-in-the-Middle will usually have some tracker that will decode the communication between the 2 parties

- Given the following structure
    ```
    Normal Communication : 
        Person-1 <-----> Person-2
    
    Man-in-the-Middle :
        Person-1 <----> Attacker <----> Person-2
                            |
                            |
                            |
                            V
                        Tracker such as
                        - Wireshark
    ```

- Attack Examples
    + ARP Poisoning

