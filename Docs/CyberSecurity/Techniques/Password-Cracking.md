### Introduction to Password Cracking
- Password cracking
    + A starting point for any serious exploitation.
    + An effective way to gain access to a system.
    - Many institutions educate their members to select strong passwords but it is hard to expect that everyone follows the rule.
        + Almost always weak passwords are used.
    + Humans always want to find pattern and similarities, cannot handle true randomness
   
### Password Cracking Techniques
- Dictionary Attack
    + Humans tend to use similar words related to them in their passwords
    - Steps
        + Uses a list of words which can possibly used as passwords.
        + Password cracking software usually has pre‐loaded lists of words or allows users to load their own list.
        + The words on the list can accelerate the cracking process and time.
        - These lists can also be downloaded from a number of websites (for free); 
            + some may contain millions of items.
- Brute-force Attack
    - Every possible combination of characters is attempted until the correct one is discovered
        - i.e.
            + Given a string size of n-bits
                 + 2^n = Number of combinations to go through
    - Prevention
        - Although this attack has potential to be successful eventually, many modern systems employ techniques such as “account lockouts” and “bad login couts (threshold)” to prevent this attack.
            + Usually, thresholds values are 3 to 5 (attempts).
            + Once the limit has been reached, the account will be locked out and will require an administrator to reset the password.n
       
- Hybrid Attack
    - This attack uses the dictionary attack as a basis but adopts some techniques of brute‐force attack as part of the process.
        + For example, it can attempt words in the dictionary but add numbers and/special characters in a brute‐force way

- Passive Online Attack
    + Achieves its goal by tapping into the network and using *a sniffer* or an *MITM tool* to observe the traffic that may contain passwords
    - Sniffer
        + Tools such as Wireshark that passively observes Network Traffic to capture passwords
    - MITM tool
        + Tools that launces Man-in-the-middle attacks (such as *bettercap*) to capture passwords

- Active Online Attack
    - Takes a more aggressive approach to extract passwords by
        + Engaging with the target
    - Attack is based on Malware
        + Can potentially obtain some other information as well as passwords during the process
    - Examples
        - Keylogger
            + Keyboard Sniffing or Keyloggers intercepts the password as a user enters it
            + This attack can be executed using hardware or software-based mechanisms
        + Trojans
        + Spyware

- Offline Attacks
    - Passwords these days will not be stored in a clear format
        + Usually in a hashed
    - A hash function should be applied to passwords and the resulting hash values (aka digests) are stored in the system
        - To protect the passwords from being exposed
            + as the hash function has the one-way property
    + Offline attacks are performed using the hash values the attacker has obtained

- Hash Functions
    - Basic facts about hash function
        + A hash function (in cryptography) is a cryptographic algorithm that takes an arbitrary input returns a fixed size output
        + The same message cannot have 2 different values, the h and h(prime) should be the same
    - The size of hash value (h) depends on the type of hash algorithms
        + MD5: 128 bits (broken)
        + SHA‐1: 160 bits(nearly broken)
        + SHA‐2: 224, 256, 384 and 512 bits
        + SHA‐3: 224, 256, 384 and 512 bits
    - The hash function is one‐way and collision resistant 

- Rainbow Table
    - A dictionary table made to crack a hashed password
        + Well-known pre-computed table for reversing hash
        + Typically generated
    - Concept
        - Search for a password (p) in [h = H(p)] using a huge number of pre-computed set of (p,h)'s
            + Table look-up is much faster than computing hash values one-by-one
            + Technique is called time/memory trade-off
    - The size of the table is generally very big
        + website: http://project‐rainbowcrack.com/table.htm
        + Nevertheless the size is manageable as the storage is getting cheaper and cheaper recently
    
    - Defense
        - Use of salt for password hashing
            - Computing *h = H(p||salt)* instead of *h=H(p)*
                + Where salt is a reasonaly large random number
                - Note:
                    + Salt should be public (non-secret) to check the hash value

            - Two main reasons why the use of salt is good
                + Salt is random
                + Salt has alot of possibilities
                + The possibility of collision (m and m' such that H(m) = H(m')) can be reduced
                - *p||salt* enlarges the input space of the hash function
                    + The size of rainbow table has to be much bigger
                    + Which makes the rainbow table attack impossible
                
- Non-Technical Attacks
    + also known as Non-Electronic Attack
    + does not use Electronic means to crack passwords
    - Examples
        - Default passwords
            + Using default passwords to gain access is seemingly trivial but is surprisingly very effective.
            + Default passwords are those set by the manufacturer or software developer.
            + In fact, these passwords are supposed to be changed by the customers when they set up purchased devices or software.
            + The problem is that quite a large number of users leave the default setting intact.
            + Some sites have collected default passwords: http://www.defaultpassword.com/
        - Dumpster Diving
        - Shoulder Surfing
        - Social Engineering
            + Like using default passwords, this attack can be effective even if no hardware/software tool is used.
            + Blackmail or conciliate or deceive users to give up their passwords through non‐technical means.

### Password Cracking Tools
- Hydra
    + Online Brute-force password attack tool
    + One of the most popular password cracking tools
    - Makes use of numerous protocols including 
        + ftp
        + http
        + ssh
        + smtp
        + POP3
        + mysql
        + etc
    - Supports multiple connections
        + parallel attacks
    - List of candidate passwords should be provided
        + Can be obtained externally
    - Documentation
        - Synopsis/Syntax
            + hydra {options} [target IP] [protocol]
        - Parameters
            + -l [login name]           : Login with the specified login name
            + -P [password list file]   : Specify the password list to load into hydra; Loads several passwords saved in the specified file
            + -t [number of tasks]      : Specify the number of tasks (aka Parallel connections) per target; Default 16
            + -v                        : Set verbose flag to 'True'; Display detailed standard output
            + -V                        : Shows every password being tried
        - Usage
            - Brute Forcing
                + Number of parallel connections : 16 connections, 
                + login as 'victim'
                + using the password list found in /usr/share/john/password.list 
                + victim's IP address : metasploitable
                + via protocol : FTP
                ```console
                hydra -t 16 -l victim -P /usr/share/john/password.list -vV <metasploitableIP> ftp
                ```
                
- John the Ripper
    + Offline Password Attacking Tool
    + Capable of performing brute-force attacks
    - Attack Steps
        - Unshadowing
            + Combine /etc/passwd and /etc/shadow files 
            + /etc/passwd stores a list of registered users in the system and
            + /etc/shadow stores the hashes of the passwords
        - Perform a dictionary attack against the unshadowed file using a word list to find a password
    - Documentation
        - Synopsis/Syntax
            + john {options} [victims password from unshadow]
        - Parameters
            + --wordlist=[password list] : Specify the password list
        - Usage
    - Examples
        - Combine entries of /etc/passwd and /etc/shadow by unshadowing
            - Documentation
                - Synopsis/Syntax
                    + unshadow /etc/passwd /etc/shadow > [output-password-file]
                - Parameters
                - Usage
            ```console
            unshadow /etc/passwd /etc/shadow > ./victims_pwd
            ```
        - Run John the Ripper using the password list
            ```console
            john --wordlist=/usr/share/john/password.list victims_pwd
            ```