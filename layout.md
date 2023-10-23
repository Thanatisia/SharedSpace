# Repository 'docs' folder Layout

## Notes
+ Generated using Windows 'tree /A /F'

## Layout
```
/
|   CHANGELOGS.md
|   CONTRIBUTING.md
|   CONTRIBUTION.md
|   layout.md
|   README.md
|   
\---Docs
    |   CHANGELOGS.md
    |   README.md
    |   
    +---Anime
    |   |   masterlist.md
    |   |   
    |   \---Seasons
    |           2022-Summer.md
    |           
    +---Computers
    |   +---Computer Architecture
    |   |       systems-archicture.md
    |   |       
    |   +---Computer Hardware
    |   |   |   PC Parts List.md
    |   |   |   
    |   |   \---Components
    |   |           motherboard.md
    |   |           
    |   +---Data Recovery
    |   |   \---Methods
    |   |           using-tar.md
    |   |           
    |   +---Data Storage
    |   |   \---RAID
    |   |           basics.txt
    |   |           
    |   +---Disks
    |   |   \---Partitions
    |   |           terminologies.txt
    |   |           
    |   +---Servers
    |   |   |   server-types.md
    |   |   |   
    |   |   \---NAS
    |   |           setup.md
    |   |           
    |   \---Single Board Computers
    |       \---Raspberry Pi
    |               troubleshooting.md
    |               
    +---CyberSecurity
    |   |   roles-and-jobs.md
    |   |   tools.txt
    |   |   
    |   +---Cheatsheets
    |   |       masterlist.md
    |   |       
    |   +---CTF
    |   |   \---Resources
    |   |           websites.txt
    |   |           
    |   +---Disaster Recovery
    |   |       disaster-recovery-plan.md
    |   |       
    |   +---Examples
    |   |   \---Malware
    |   |       |   README.md
    |   |       |   
    |   |       \---Ransomware
    |   |           \---Substitution-Cipher
    |   |               \---Example-1
    |   |                       file-recovery.py
    |   |                       key-recovery.py
    |   |                       ransomware.py
    |   |                       README.md
    |   |                       
    |   +---Files
    |   |       cwe.md
    |   |       dictionary.md
    |   |       linux-repositories.md
    |   |       resources.md
    |   |       website-tools.md
    |   |       
    |   +---Guides
    |   |   +---TLS-SSL
    |   |   |   \---Self-Sign SSL Certificate
    |   |   |           README.md
    |   |   |           
    |   |   \---Vulnerabilities
    |   |           Vulnerabilities.md
    |   |           Vulnerability Scanning.md
    |   |           
    |   +---Hardware
    |   |   |   masterlist.md
    |   |   |   README.md
    |   |   |   
    |   |   \---Penetration Testing
    |   |           LAN_turtle.md
    |   |           
    |   +---Network Security
    |   |   \---Protocols
    |   |       \---IPSec
    |   |               basics.md
    |   |               
    |   +---Roles
    |   |   \---Cryptography
    |   |       +---Fast Exponentiation - Square and Multiply
    |   |       |       fast-exponentiation.py
    |   |       |       README.md
    |   |       |       
    |   |       +---Hash Collision
    |   |       |       hash-collision.py
    |   |       |       README.md
    |   |       |       
    |   |       +---Knapsack Trapdoor Encryption Scheme
    |   |       |       knapsack.py
    |   |       |       README.md
    |   |       |       
    |   |       +---Lehman's Primality Test
    |   |       |       lehman.py
    |   |       |       README.txt
    |   |       |       
    |   |       \---Ring Signature
    |   |               message.txt
    |   |               privateKey.txt
    |   |               publickey.txt
    |   |               README.md
    |   |               requirements.txt
    |   |               ring-signature.py
    |   |               
    |   +---Techniques
    |   |   |   ARP-poisoning.md
    |   |   |   Man-in-the-Middle.md
    |   |   |   Password-Cracking.md
    |   |   |   
    |   |   +---Ciphers
    |   |   |       substitution-cipher.md
    |   |   |       
    |   |   +---Encryption
    |   |   |       encryption-algorithms.md
    |   |   |       hashing-algorithms.md
    |   |   |       
    |   |   +---Google Dorking
    |   |   |       basics.md
    |   |   |       
    |   |   +---Hashing
    |   |   |       salt-and-hashing.md
    |   |   |       
    |   |   +---Rainbow Tables
    |   |   |       implementation.md
    |   |   |       
    |   |   +---Reconnaissance
    |   |   |   \---Network Sniffing
    |   |   |           1 - Man-in-the-Middle with Ettercap.md
    |   |   |           
    |   |   +---Remote Access
    |   |   |   |   basics.md
    |   |   |   |   
    |   |   |   \---Reverse Shell
    |   |   |       +---Linux
    |   |   |       |       1-with netcat.md
    |   |   |       |       
    |   |   |       \---Windows
    |   |   |               1-with netcat using powershell.md
    |   |   |               
    |   |   +---Spoofing
    |   |   |       ip-spoofing.md
    |   |   |       
    |   |   \---Web Penetration
    |   |       \---SQL Injection
    |   |               examples.md
    |   |               
    |   +---Tools
    |   |   |   arpscan.md
    |   |   |   arpspoof.md
    |   |   |   BeEF.md
    |   |   |   bettercap.md
    |   |   |   crunch.md
    |   |   |   dmitry.md
    |   |   |   hydra.md
    |   |   |   john-the-ripper.md
    |   |   |   lazagne.md
    |   |   |   netcat.md
    |   |   |   netdiscover.md
    |   |   |   nmap.md
    |   |   |   nslookup.md
    |   |   |   scapy.md
    |   |   |   setoolkit.md
    |   |   |   template.md
    |   |   |   theHarvester.md
    |   |   |   tools-summary.md
    |   |   |   weevely.md
    |   |   |   
    |   |   +---Frameworks
    |   |   |   \---Metasploit
    |   |   |           basics.md
    |   |   |           setup.md
    |   |   |           
    |   |   \---Suites
    |   |           airmon-ng.md
    |   |           hashcat.md
    |   |           kbd-audio.md
    |   |           rainbowcrack.md
    |   |           
    |   \---Topics
    |       +---Blue-Team
    |       |   \---Malware-Analysis
    |       |           commands.txt
    |       |           
    |       +---DNS-Sinkhole
    |       |       README.md
    |       |       
    |       +---Red-Team
    |       |   \---Ethical-Hacking
    |       |       |   lifecycle.txt
    |       |       |   
    |       |       \---Penetration-Testing
    |       |               reconaissance.md
    |       |               scanning.md
    |       |               
    |       \---System Security
    |           \---Security Models
    |                   RBAC.md
    |                   
    +---Data Recovery and Validation
    |       tools.txt
    |       
    +---Data Science
    |   \---Data Analytics
    |           da-basics.md
    |           
    +---Database Systems
    |   |   cheatsheet.txt
    |   |   README.md
    |   |   
    |   +---NoSQL
    |   |   \---MongoDB
    |   |           basics.txt
    |   |           
    |   +---Oracle
    |   |       sqlplus.txt
    |   |       
    |   +---PL-SQL
    |   |       basics.txt
    |   |       stored_plsql.txt
    |   |       
    |   \---Topics
    |       \---Database Normalization
    |               Rules to Database Normalization.txt
    |               
    +---Engineering
    |   \---Electrical
    |       \---Electronics
    |           \---Cable
    |                   types.md
    |                   
    +---Gaming
    |   +---Emulation
    |   |   |   lookup-registry.md
    |   |   |   resources.md
    |   |   |   
    |   |   +---Platforms
    |   |   |   +---Nintendo 3DS
    |   |   |   |   \---Emulators
    |   |   |   |           emulators.md
    |   |   |   |           
    |   |   |   \---Nintendo Switch (NSW)
    |   |   |       |   tools-and-utilities.md
    |   |   |       |   
    |   |   |       +---Emulators
    |   |   |       |   |   emulators.md
    |   |   |       |   |   
    |   |   |       |   \---Skyline-Emulator
    |   |   |       |           bugs-encountered.md
    |   |   |       |           README.md
    |   |   |       |           setup.md
    |   |   |       |           
    |   |   |       \---Utilities
    |   |   |           \---NSC_BUILDER
    |   |   |                   examples.md
    |   |   |                   README.md
    |   |   |                   setup.md
    |   |   |                   
    |   |   \---ROM Hacking, Translation and Patches
    |   |           translation-patch-groups.md
    |   |           
    |   \---Games
    |       \---Platforms
    |           \---Nintendo Switch (NSW)
    |               +---Shin Megami Tensei V
    |               |   \---Game Guides
    |               |           strategies.md
    |               |           
    |               \---The Legend of Zelda - Breath of the Wild
    |                   \---Game Guides
    |                           boss-guide.md
    |                           
    +---General
    |       note-taking.txt
    |       resources.md
    |       useful-software.txt
    |       
    +---Git
    |   |   1. setup.txt
    |   |   10. Cloning a repository.txt
    |   |   11. Fetching changes.txt
    |   |   12. Pull changes.txt
    |   |   13. Contributing.txt
    |   |   14. Must have files
    |   |   15. Add new remote repository url.txt
    |   |   16. Handling Personal Access Tokens.txt
    |   |   17. Licenses.txt
    |   |   18. Tags.txt
    |   |   19. Deployments.txt
    |   |   2. Adding files.txt
    |   |   20. Git submodules.md
    |   |   21. Git logs.md
    |   |   22. Git Worktree.md
    |   |   3. Commit files.txt
    |   |   4. Create new Branch.txt
    |   |   5. Create new Repository on Github.txt
    |   |   6. Pushing a branch to Github.txt
    |   |   7. Create & Merge Pull Request.txt
    |   |   8. Delete Branch.txt
    |   |   9. Get changes on Github back to your computer.txt
    |   |   CHANGELOGS.md
    |   |   cheatsheet.txt
    |   |   CONTRIBUTING.md
    |   |   EX1. create new repository.txt
    |   |   EX2. push existing repository.txt
    |   |   Git workflow.txt
    |   |   Glossary.txt
    |   |   Issues-1. Bypass - Untracked working tree files overwriting warning.txt
    |   |   Issues-2. Bypass - Filename too long.txt
    |   |   Open Source Contributions.txt
    |   |   playbook.md
    |   |   README.md
    |   |   Starters-Guide.txt
    |   |   User-Example.sh
    |   |   
    |   +---commands
    |   |       git.md
    |   |       
    |   \---Remote Repository Hosts
    |       \---GitHub
    |           |   layout.md
    |           |   
    |           +---GitHub Actions
    |           |       README.md
    |           |       
    |           \---Tools
    |                   gh.md
    |                   
    +---Home Lab
    |   |   infrastructure-design-specs.md
    |   |   operational-flow.md
    |   |   playbook.md
    |   |   resources.md
    |   |   writing-documentations.md
    |   |   
    |   +---Ideas and Concepts
    |   |       dns-wide-adblocking.txt
    |   |       
    |   +---Pre-Requisites
    |   |       postinstallation-setup.md
    |   |       
    |   +---Services and Tools
    |   |   |   pipeline-and-ideas.md
    |   |   |   services.md
    |   |   |   
    |   |   +---Cloud Server
    |   |   |   \---Nextcloud
    |   |   |       \---Guides
    |   |   |               tips-and-tricks.md
    |   |   |               
    |   |   +---Proxy Server
    |   |   |   \---nginx
    |   |   |       \---Reverse Proxy
    |   |   |           |   configurations.md
    |   |   |           |   README.md
    |   |   |           |   
    |   |   |           \---Service Configuration Snippets
    |   |   |                   jellyfin.md
    |   |   |                   
    |   |   +---System Monitoring
    |   |   |   \---Uptime Kuma
    |   |   |       +---bare-metal
    |   |   |       |       setup.md
    |   |   |       |       
    |   |   |       \---docker
    |   |   |               setup.md
    |   |   |               
    |   |   +---VNC Clients
    |   |   |   \---NoVNC
    |   |   |       |   layering-and-implementations.md
    |   |   |       |   README.md
    |   |   |       |   
    |   |   |       \---Guides
    |   |   |               setup.md
    |   |   |               
    |   |   \---Webservers
    |   |       \---Jupyter Server
    |   |           |   README.md
    |   |           |   
    |   |           +---docs
    |   |           |   |   README.md
    |   |           |   |   
    |   |           |   +---containerization
    |   |           |   |   \---docker
    |   |           |   |       |   README.md
    |   |           |   |       |   
    |   |           |   |       \---images
    |   |           |   |           \---Base-Notebook
    |   |           |   |                   docker-compose.yaml
    |   |           |   |                   README.md
    |   |           |   |                   
    |   |           |   \---development
    |   |           |       \---api-framework
    |   |           |               python.md
    |   |           |               
    |   |           \---setup
    |   |                   bare-metal.md
    |   |                   containerization.md
    |   |                   
    |   \---Snippets-and-Examples
    |           basic-setup.md
    |           
    +---Language
    |   +---Chinese
    |   |       hokkien.md
    |   |       
    |   +---French
    |   |       compilation.md
    |   |       
    |   \---Japanese
    |       |   japanese.md
    |       |   
    |       \---compilation
    |               grammar.md
    |               
    +---Linux
    |   |   filesystem-structure.md
    |   |   playbook.md
    |   |   README.md
    |   |   
    |   +---commands
    |   |       awk
    |   |       cheatsheets.txt
    |   |       dd.md
    |   |       declare.md
    |   |       diff.md
    |   |       find.md
    |   |       getopts.md
    |   |       gpg.md
    |   |       hexdump.md
    |   |       install.md
    |   |       ln.txt
    |   |       masterlist.md
    |   |       nl.md
    |   |       notify-send.md
    |   |       openssl.md
    |   |       parted.md
    |   |       patch.md
    |   |       printf.md
    |   |       README.md
    |   |       rsync.md
    |   |       sed
    |   |       shift.md
    |   |       su
    |   |       tail.md
    |   |       tar.md
    |   |       template.md
    |   |       tr.md
    |   |       trap.md
    |   |       use-cases.md
    |   |       xargs.md
    |   |       
    |   +---Development
    |   |   \---Terminal-User-Interface
    |   |       |   README.md
    |   |       |   
    |   |       \---frameworks
    |   |               whiptail.md
    |   |               
    |   +---distros
    |   |   |   README.md
    |   |   |   
    |   |   +---ArchLinux
    |   |   |   |   README.md
    |   |   |   |   
    |   |   |   +---AUR
    |   |   |   |   |   README.md
    |   |   |   |   |   
    |   |   |   |   \---AUR Helpers
    |   |   |   |       \---yay
    |   |   |   |               README.md
    |   |   |   |               
    |   |   |   +---guides
    |   |   |   |   |   Issues-and-Fixes.txt
    |   |   |   |   |   Remounting.txt
    |   |   |   |   |   
    |   |   |   |   +---basics
    |   |   |   |   |   \---setup
    |   |   |   |   |       |   index
    |   |   |   |   |       |   
    |   |   |   |   |       \---manual
    |   |   |   |   |               7. Setup Swapfile
    |   |   |   |   |               
    |   |   |   |   +---Bootloader
    |   |   |   |   |       uefi.md
    |   |   |   |   |       
    |   |   |   |   \---tips-n-tricks
    |   |   |   |           remounting
    |   |   |   |           
    |   |   |   +---pacman
    |   |   |   |       basics.txt
    |   |   |   |       file.txt
    |   |   |   |       mirrors.txt
    |   |   |   |       Setup.txt
    |   |   |   |       
    |   |   |   \---To Be Migrated
    |   |   |           customization
    |   |   |           installguide
    |   |   |           packagelist
    |   |   |           post-installations
    |   |   |           README.md
    |   |   |           ricing
    |   |   |           
    |   |   +---Debian
    |   |   |   +---Debootstrap
    |   |   |   |   |   download_debootstrap.sh
    |   |   |   |   |   installation-guide-draft-Debian via another unix system.txt
    |   |   |   |   |   postinstallation-guide-draft-Debian via another unix system.txt
    |   |   |   |   |   remount.sh
    |   |   |   |   |   setup_debootstrap.sh
    |   |   |   |   |   
    |   |   |   |   \---Plannings
    |   |   |   |           1. Asura - draft.txt
    |   |   |   |           1. Asura.txt
    |   |   |   |           1. Asura_2021-08-19_0848H.txt
    |   |   |   |           Template-1_2021-08-18_2104H.txt
    |   |   |   |           Template-2.txt
    |   |   |   |           Template.txt
    |   |   |   |           
    |   |   |   +---Files
    |   |   |   |       ppa-list.md
    |   |   |   |       
    |   |   |   \---package-management
    |   |   |           apt.md
    |   |   |           basics.md
    |   |   |           Setup.md
    |   |   |           sources-list.md
    |   |   |           
    |   |   +---Fedora
    |   |   |   \---setup
    |   |   |       \---LiveCD Templates
    |   |   |           \---Fedora Workstation 37
    |   |   |               +---dnf
    |   |   |               |   |   dnf.conf
    |   |   |               |   |   
    |   |   |               |   +---plugins
    |   |   |               |   |       copr.conf
    |   |   |               |   |       debuginfo-install.conf
    |   |   |               |   |       
    |   |   |               |   \---protected.d
    |   |   |               |           dnf.conf
    |   |   |               |           fedora-workstation.conf
    |   |   |               |           grub2-efi-ia32.conf
    |   |   |               |           grub2-efi-x64.conf
    |   |   |               |           grub2-pc.conf
    |   |   |               |           grub2-tools-minimal.conf
    |   |   |               |           shim.conf
    |   |   |               |           sudo.conf
    |   |   |               |           systemd.conf
    |   |   |               |           
    |   |   |               +---rpm-gpg
    |   |   |               |       RPM-GPG-KEY-37-fedora
    |   |   |               |       RPM-GPG-KEY-fedora-10-i386
    |   |   |               |       RPM-GPG-KEY-fedora-10-ppc
    |   |   |               |       RPM-GPG-KEY-fedora-10-ppc64
    |   |   |               |       RPM-GPG-KEY-fedora-10-primary
    |   |   |               |       RPM-GPG-KEY-fedora-10-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-11-i386
    |   |   |               |       RPM-GPG-KEY-fedora-11-ppc
    |   |   |               |       RPM-GPG-KEY-fedora-11-ppc64
    |   |   |               |       RPM-GPG-KEY-fedora-11-primary
    |   |   |               |       RPM-GPG-KEY-fedora-11-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-12-i386
    |   |   |               |       RPM-GPG-KEY-fedora-12-ppc
    |   |   |               |       RPM-GPG-KEY-fedora-12-ppc64
    |   |   |               |       RPM-GPG-KEY-fedora-12-primary
    |   |   |               |       RPM-GPG-KEY-fedora-12-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-13-arm
    |   |   |               |       RPM-GPG-KEY-fedora-13-armhfp
    |   |   |               |       RPM-GPG-KEY-fedora-13-i386
    |   |   |               |       RPM-GPG-KEY-fedora-13-mips
    |   |   |               |       RPM-GPG-KEY-fedora-13-primary
    |   |   |               |       RPM-GPG-KEY-fedora-13-secondary
    |   |   |               |       RPM-GPG-KEY-fedora-13-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-14-arm
    |   |   |               |       RPM-GPG-KEY-fedora-14-i386
    |   |   |               |       RPM-GPG-KEY-fedora-14-primary
    |   |   |               |       RPM-GPG-KEY-fedora-14-secondary
    |   |   |               |       RPM-GPG-KEY-fedora-14-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-15-arm
    |   |   |               |       RPM-GPG-KEY-fedora-15-armhfp
    |   |   |               |       RPM-GPG-KEY-fedora-15-i386
    |   |   |               |       RPM-GPG-KEY-fedora-15-ppc
    |   |   |               |       RPM-GPG-KEY-fedora-15-ppc64
    |   |   |               |       RPM-GPG-KEY-fedora-15-primary
    |   |   |               |       RPM-GPG-KEY-fedora-15-s390
    |   |   |               |       RPM-GPG-KEY-fedora-15-s390x
    |   |   |               |       RPM-GPG-KEY-fedora-15-secondary
    |   |   |               |       RPM-GPG-KEY-fedora-15-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-16-arm
    |   |   |               |       RPM-GPG-KEY-fedora-16-armhfp
    |   |   |               |       RPM-GPG-KEY-fedora-16-i386
    |   |   |               |       RPM-GPG-KEY-fedora-16-ppc
    |   |   |               |       RPM-GPG-KEY-fedora-16-ppc64
    |   |   |               |       RPM-GPG-KEY-fedora-16-primary
    |   |   |               |       RPM-GPG-KEY-fedora-16-s390
    |   |   |               |       RPM-GPG-KEY-fedora-16-s390x
    |   |   |               |       RPM-GPG-KEY-fedora-16-secondary
    |   |   |               |       RPM-GPG-KEY-fedora-16-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-17-arm
    |   |   |               |       RPM-GPG-KEY-fedora-17-armhfp
    |   |   |               |       RPM-GPG-KEY-fedora-17-i386
    |   |   |               |       RPM-GPG-KEY-fedora-17-ppc
    |   |   |               |       RPM-GPG-KEY-fedora-17-ppc64
    |   |   |               |       RPM-GPG-KEY-fedora-17-primary
    |   |   |               |       RPM-GPG-KEY-fedora-17-s390
    |   |   |               |       RPM-GPG-KEY-fedora-17-s390x
    |   |   |               |       RPM-GPG-KEY-fedora-17-secondary
    |   |   |               |       RPM-GPG-KEY-fedora-17-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-18-arm
    |   |   |               |       RPM-GPG-KEY-fedora-18-armhfp
    |   |   |               |       RPM-GPG-KEY-fedora-18-i386
    |   |   |               |       RPM-GPG-KEY-fedora-18-ppc
    |   |   |               |       RPM-GPG-KEY-fedora-18-ppc64
    |   |   |               |       RPM-GPG-KEY-fedora-18-primary
    |   |   |               |       RPM-GPG-KEY-fedora-18-s390
    |   |   |               |       RPM-GPG-KEY-fedora-18-s390x
    |   |   |               |       RPM-GPG-KEY-fedora-18-secondary
    |   |   |               |       RPM-GPG-KEY-fedora-18-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-19-armhfp
    |   |   |               |       RPM-GPG-KEY-fedora-19-i386
    |   |   |               |       RPM-GPG-KEY-fedora-19-ppc
    |   |   |               |       RPM-GPG-KEY-fedora-19-ppc64
    |   |   |               |       RPM-GPG-KEY-fedora-19-primary
    |   |   |               |       RPM-GPG-KEY-fedora-19-s390
    |   |   |               |       RPM-GPG-KEY-fedora-19-s390x
    |   |   |               |       RPM-GPG-KEY-fedora-19-secondary
    |   |   |               |       RPM-GPG-KEY-fedora-19-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-20-armhfp
    |   |   |               |       RPM-GPG-KEY-fedora-20-i386
    |   |   |               |       RPM-GPG-KEY-fedora-20-ppc
    |   |   |               |       RPM-GPG-KEY-fedora-20-ppc64
    |   |   |               |       RPM-GPG-KEY-fedora-20-primary
    |   |   |               |       RPM-GPG-KEY-fedora-20-s390
    |   |   |               |       RPM-GPG-KEY-fedora-20-s390x
    |   |   |               |       RPM-GPG-KEY-fedora-20-secondary
    |   |   |               |       RPM-GPG-KEY-fedora-20-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-21-aarch64
    |   |   |               |       RPM-GPG-KEY-fedora-21-armhfp
    |   |   |               |       RPM-GPG-KEY-fedora-21-i386
    |   |   |               |       RPM-GPG-KEY-fedora-21-ppc64
    |   |   |               |       RPM-GPG-KEY-fedora-21-ppc64le
    |   |   |               |       RPM-GPG-KEY-fedora-21-primary
    |   |   |               |       RPM-GPG-KEY-fedora-21-s390
    |   |   |               |       RPM-GPG-KEY-fedora-21-s390x
    |   |   |               |       RPM-GPG-KEY-fedora-21-secondary
    |   |   |               |       RPM-GPG-KEY-fedora-21-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-22-aarch64
    |   |   |               |       RPM-GPG-KEY-fedora-22-armhfp
    |   |   |               |       RPM-GPG-KEY-fedora-22-i386
    |   |   |               |       RPM-GPG-KEY-fedora-22-ppc64
    |   |   |               |       RPM-GPG-KEY-fedora-22-ppc64le
    |   |   |               |       RPM-GPG-KEY-fedora-22-primary
    |   |   |               |       RPM-GPG-KEY-fedora-22-s390
    |   |   |               |       RPM-GPG-KEY-fedora-22-s390x
    |   |   |               |       RPM-GPG-KEY-fedora-22-secondary
    |   |   |               |       RPM-GPG-KEY-fedora-22-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-23-aarch64
    |   |   |               |       RPM-GPG-KEY-fedora-23-armhfp
    |   |   |               |       RPM-GPG-KEY-fedora-23-i386
    |   |   |               |       RPM-GPG-KEY-fedora-23-ppc64
    |   |   |               |       RPM-GPG-KEY-fedora-23-ppc64le
    |   |   |               |       RPM-GPG-KEY-fedora-23-primary
    |   |   |               |       RPM-GPG-KEY-fedora-23-s390
    |   |   |               |       RPM-GPG-KEY-fedora-23-s390x
    |   |   |               |       RPM-GPG-KEY-fedora-23-secondary
    |   |   |               |       RPM-GPG-KEY-fedora-23-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-24-aarch64
    |   |   |               |       RPM-GPG-KEY-fedora-24-armhfp
    |   |   |               |       RPM-GPG-KEY-fedora-24-i386
    |   |   |               |       RPM-GPG-KEY-fedora-24-ppc64
    |   |   |               |       RPM-GPG-KEY-fedora-24-ppc64le
    |   |   |               |       RPM-GPG-KEY-fedora-24-primary
    |   |   |               |       RPM-GPG-KEY-fedora-24-s390x
    |   |   |               |       RPM-GPG-KEY-fedora-24-secondary
    |   |   |               |       RPM-GPG-KEY-fedora-24-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-25-aarch64
    |   |   |               |       RPM-GPG-KEY-fedora-25-armhfp
    |   |   |               |       RPM-GPG-KEY-fedora-25-i386
    |   |   |               |       RPM-GPG-KEY-fedora-25-ppc64
    |   |   |               |       RPM-GPG-KEY-fedora-25-ppc64le
    |   |   |               |       RPM-GPG-KEY-fedora-25-primary
    |   |   |               |       RPM-GPG-KEY-fedora-25-s390x
    |   |   |               |       RPM-GPG-KEY-fedora-25-secondary
    |   |   |               |       RPM-GPG-KEY-fedora-25-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-26-aarch64
    |   |   |               |       RPM-GPG-KEY-fedora-26-armhfp
    |   |   |               |       RPM-GPG-KEY-fedora-26-i386
    |   |   |               |       RPM-GPG-KEY-fedora-26-ppc64
    |   |   |               |       RPM-GPG-KEY-fedora-26-ppc64le
    |   |   |               |       RPM-GPG-KEY-fedora-26-primary
    |   |   |               |       RPM-GPG-KEY-fedora-26-s390x
    |   |   |               |       RPM-GPG-KEY-fedora-26-secondary
    |   |   |               |       RPM-GPG-KEY-fedora-26-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-27-aarch64
    |   |   |               |       RPM-GPG-KEY-fedora-27-armhfp
    |   |   |               |       RPM-GPG-KEY-fedora-27-i386
    |   |   |               |       RPM-GPG-KEY-fedora-27-ppc64
    |   |   |               |       RPM-GPG-KEY-fedora-27-ppc64le
    |   |   |               |       RPM-GPG-KEY-fedora-27-primary
    |   |   |               |       RPM-GPG-KEY-fedora-27-s390x
    |   |   |               |       RPM-GPG-KEY-fedora-27-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-28-aarch64
    |   |   |               |       RPM-GPG-KEY-fedora-28-armhfp
    |   |   |               |       RPM-GPG-KEY-fedora-28-i386
    |   |   |               |       RPM-GPG-KEY-fedora-28-ppc64
    |   |   |               |       RPM-GPG-KEY-fedora-28-ppc64le
    |   |   |               |       RPM-GPG-KEY-fedora-28-primary
    |   |   |               |       RPM-GPG-KEY-fedora-28-s390x
    |   |   |               |       RPM-GPG-KEY-fedora-28-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-29-aarch64
    |   |   |               |       RPM-GPG-KEY-fedora-29-armhfp
    |   |   |               |       RPM-GPG-KEY-fedora-29-i386
    |   |   |               |       RPM-GPG-KEY-fedora-29-ppc64
    |   |   |               |       RPM-GPG-KEY-fedora-29-ppc64le
    |   |   |               |       RPM-GPG-KEY-fedora-29-primary
    |   |   |               |       RPM-GPG-KEY-fedora-29-s390x
    |   |   |               |       RPM-GPG-KEY-fedora-29-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-30-aarch64
    |   |   |               |       RPM-GPG-KEY-fedora-30-armhfp
    |   |   |               |       RPM-GPG-KEY-fedora-30-i386
    |   |   |               |       RPM-GPG-KEY-fedora-30-ppc64le
    |   |   |               |       RPM-GPG-KEY-fedora-30-primary
    |   |   |               |       RPM-GPG-KEY-fedora-30-s390x
    |   |   |               |       RPM-GPG-KEY-fedora-30-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-31-aarch64
    |   |   |               |       RPM-GPG-KEY-fedora-31-armhfp
    |   |   |               |       RPM-GPG-KEY-fedora-31-i386
    |   |   |               |       RPM-GPG-KEY-fedora-31-ppc64le
    |   |   |               |       RPM-GPG-KEY-fedora-31-primary
    |   |   |               |       RPM-GPG-KEY-fedora-31-s390x
    |   |   |               |       RPM-GPG-KEY-fedora-31-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-32-aarch64
    |   |   |               |       RPM-GPG-KEY-fedora-32-armhfp
    |   |   |               |       RPM-GPG-KEY-fedora-32-i386
    |   |   |               |       RPM-GPG-KEY-fedora-32-ppc64le
    |   |   |               |       RPM-GPG-KEY-fedora-32-primary
    |   |   |               |       RPM-GPG-KEY-fedora-32-s390x
    |   |   |               |       RPM-GPG-KEY-fedora-32-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-33-aarch64
    |   |   |               |       RPM-GPG-KEY-fedora-33-armhfp
    |   |   |               |       RPM-GPG-KEY-fedora-33-i386
    |   |   |               |       RPM-GPG-KEY-fedora-33-ppc64le
    |   |   |               |       RPM-GPG-KEY-fedora-33-primary
    |   |   |               |       RPM-GPG-KEY-fedora-33-s390x
    |   |   |               |       RPM-GPG-KEY-fedora-33-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-34-aarch64
    |   |   |               |       RPM-GPG-KEY-fedora-34-armhfp
    |   |   |               |       RPM-GPG-KEY-fedora-34-i386
    |   |   |               |       RPM-GPG-KEY-fedora-34-ppc64le
    |   |   |               |       RPM-GPG-KEY-fedora-34-primary
    |   |   |               |       RPM-GPG-KEY-fedora-34-s390x
    |   |   |               |       RPM-GPG-KEY-fedora-34-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-35-aarch64
    |   |   |               |       RPM-GPG-KEY-fedora-35-armhfp
    |   |   |               |       RPM-GPG-KEY-fedora-35-ppc64le
    |   |   |               |       RPM-GPG-KEY-fedora-35-primary
    |   |   |               |       RPM-GPG-KEY-fedora-35-s390x
    |   |   |               |       RPM-GPG-KEY-fedora-35-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-36-aarch64
    |   |   |               |       RPM-GPG-KEY-fedora-36-armhfp
    |   |   |               |       RPM-GPG-KEY-fedora-36-ppc64le
    |   |   |               |       RPM-GPG-KEY-fedora-36-primary
    |   |   |               |       RPM-GPG-KEY-fedora-36-s390x
    |   |   |               |       RPM-GPG-KEY-fedora-36-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-37-aarch64
    |   |   |               |       RPM-GPG-KEY-fedora-37-armhfp
    |   |   |               |       RPM-GPG-KEY-fedora-37-ppc64le
    |   |   |               |       RPM-GPG-KEY-fedora-37-primary
    |   |   |               |       RPM-GPG-KEY-fedora-37-s390x
    |   |   |               |       RPM-GPG-KEY-fedora-37-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-38-aarch64
    |   |   |               |       RPM-GPG-KEY-fedora-38-ppc64le
    |   |   |               |       RPM-GPG-KEY-fedora-38-primary
    |   |   |               |       RPM-GPG-KEY-fedora-38-s390x
    |   |   |               |       RPM-GPG-KEY-fedora-38-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-39-aarch64
    |   |   |               |       RPM-GPG-KEY-fedora-39-ppc64le
    |   |   |               |       RPM-GPG-KEY-fedora-39-primary
    |   |   |               |       RPM-GPG-KEY-fedora-39-s390x
    |   |   |               |       RPM-GPG-KEY-fedora-39-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-7-i386
    |   |   |               |       RPM-GPG-KEY-fedora-7-ppc
    |   |   |               |       RPM-GPG-KEY-fedora-7-ppc64
    |   |   |               |       RPM-GPG-KEY-fedora-7-primary
    |   |   |               |       RPM-GPG-KEY-fedora-7-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-8-i386
    |   |   |               |       RPM-GPG-KEY-fedora-8-ppc
    |   |   |               |       RPM-GPG-KEY-fedora-8-ppc64
    |   |   |               |       RPM-GPG-KEY-fedora-8-primary
    |   |   |               |       RPM-GPG-KEY-fedora-8-primary-original
    |   |   |               |       RPM-GPG-KEY-fedora-8-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-9-i386
    |   |   |               |       RPM-GPG-KEY-fedora-9-ia64
    |   |   |               |       RPM-GPG-KEY-fedora-9-ppc
    |   |   |               |       RPM-GPG-KEY-fedora-9-ppc64
    |   |   |               |       RPM-GPG-KEY-fedora-9-primary
    |   |   |               |       RPM-GPG-KEY-fedora-9-primary-original
    |   |   |               |       RPM-GPG-KEY-fedora-9-secondary
    |   |   |               |       RPM-GPG-KEY-fedora-9-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-eln-aarch64
    |   |   |               |       RPM-GPG-KEY-fedora-eln-ppc64le
    |   |   |               |       RPM-GPG-KEY-fedora-eln-primary
    |   |   |               |       RPM-GPG-KEY-fedora-eln-s390x
    |   |   |               |       RPM-GPG-KEY-fedora-eln-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-iot-2019
    |   |   |               |       RPM-GPG-KEY-fedora-iot-aarch64
    |   |   |               |       RPM-GPG-KEY-fedora-iot-armhfp
    |   |   |               |       RPM-GPG-KEY-fedora-iot-i386
    |   |   |               |       RPM-GPG-KEY-fedora-iot-ppc64le
    |   |   |               |       RPM-GPG-KEY-fedora-iot-s390x
    |   |   |               |       RPM-GPG-KEY-fedora-iot-x86_64
    |   |   |               |       RPM-GPG-KEY-fedora-modularity
    |   |   |               |       RPM-GPG-KEY-fedora-rawhide-aarch64
    |   |   |               |       RPM-GPG-KEY-fedora-rawhide-ppc64le
    |   |   |               |       RPM-GPG-KEY-fedora-rawhide-primary
    |   |   |               |       RPM-GPG-KEY-fedora-rawhide-s390x
    |   |   |               |       RPM-GPG-KEY-fedora-rawhide-x86_64
    |   |   |               |       RPM-GPG-KEY-redhat-release
    |   |   |               |       
    |   |   |               \---yum.repos.d
    |   |   |                       fedora-cisco-openh264.repo
    |   |   |                       fedora-modular.repo
    |   |   |                       fedora-updates-modular.repo
    |   |   |                       fedora-updates-testing-modular.repo
    |   |   |                       fedora-updates-testing.repo
    |   |   |                       fedora-updates.repo
    |   |   |                       fedora.repo
    |   |   |                       google-chrome.repo
    |   |   |                       rpmfusion-nonfree-nvidia-driver.repo
    |   |   |                       rpmfusion-nonfree-steam.repo
    |   |   |                       _copr_phracek-PyCharm.repo
    |   |   |                       
    |   |   +---Gentoo
    |   |   |   |   installguide
    |   |   |   |   package-masterlist.md
    |   |   |   |   
    |   |   |   \---portage
    |   |   |       |   basics.md
    |   |   |       |   Setup.md
    |   |   |       |   
    |   |   |       +---commands
    |   |   |       |       emerge.md
    |   |   |       |       eselect.md
    |   |   |       |       
    |   |   |       \---Guides
    |   |   |               patching.md
    |   |   |               
    |   |   +---Templates
    |   |   |   \---Distro
    |   |   |       +---Debian
    |   |   |       |   \---Debootstrap
    |   |   |       |       +---Guides
    |   |   |       |       |       installation-guide-draft-Debian via another unix system.txt
    |   |   |       |       |       postinstallation-guide-draft-Debian via another unix system.txt
    |   |   |       |       |       
    |   |   |       |       \---Scripts
    |   |   |       |               download_debootstrap.sh
    |   |   |       |               remount.sh
    |   |   |       |               setup_debootstrap.sh
    |   |   |       |               
    |   |   |       \---setup_profiles
    |   |   |               n. username.txt
    |   |   |               Template.txt
    |   |   |               
    |   |   \---Void Linux
    |   |       +---Guides
    |   |       |       installation-guide.txt
    |   |       |       postinstallation-guide.txt
    |   |       |       
    |   |       +---Scripts
    |   |       |       chrootwrap.sh
    |   |       |       download_bootstrap.sh
    |   |       |       remount.sh
    |   |       |       setup_bootstrap.sh
    |   |       |       
    |   |       \---setup_profiles
    |   |               n. username.txt
    |   |               Template.txt
    |   |               
    |   +---Files
    |   |       architectures.md
    |   |       environment-variables.md
    |   |       font-icons-masterlist.md
    |   |       my-essentials.md
    |   |       packages-masterlist.md
    |   |       postinstallation-masterlist.md
    |   |       summary.txt
    |   |       Terminologies.md
    |   |       useful-references.md
    |   |       XDG-Base-Specifications.md
    |   |       
    |   +---Guides
    |   |   |   Backup & Recovery.txt
    |   |   |   Graphical Environment.txt
    |   |   |   Install Bootloader.txt
    |   |   |   Partition Management.txt
    |   |   |   Permissions.txt
    |   |   |   README.md
    |   |   |   Resolution Management.txt
    |   |   |   Template.txt
    |   |   |   User Management.txt
    |   |   |   
    |   |   +---Bootloaders
    |   |   |   \---Grub
    |   |   |           basics.md
    |   |   |           configurations.md
    |   |   |           grub themes.md
    |   |   |           grub-install.md
    |   |   |           grub-mkconfig.md
    |   |   |           grub-mkfont.md
    |   |   |           
    |   |   +---Cronjob
    |   |   |       cron-files.txt
    |   |   |       crontab.txt
    |   |   |       README.md
    |   |   |       setup.txt
    |   |   |       
    |   |   +---Designs
    |   |   |   |   Fonts-summary.txt
    |   |   |   |   Icons.txt
    |   |   |   |   
    |   |   |   \---Fonts
    |   |   |           basics.md
    |   |   |           installation.md
    |   |   |           locating-fonts.md
    |   |   |           
    |   |   +---Disk Management
    |   |   |   +---Disk Image Filesystem
    |   |   |   |   |   steps-disk-image-filesystem.txt
    |   |   |   |   |   
    |   |   |   |   \---Examples
    |   |   |   |           arch-chroot filesystem.txt
    |   |   |   |           
    |   |   |   \---RAID Array
    |   |   |           README.md
    |   |   |           
    |   |   +---File-System
    |   |   |   +---EFI
    |   |   |   |       installations.md
    |   |   |   |       setup-EFI-filesystem.txt
    |   |   |   |       
    |   |   |   \---MSDOS (MBR-BIOS)
    |   |   |           setup-MBR_BIOS-filesystem.txt
    |   |   |           
    |   |   +---From-Scratch
    |   |   |       build-from-source.md
    |   |   |       display-server.md
    |   |   |       README.md
    |   |   |       
    |   |   +---Fundamentals
    |   |   |       passwd-file.md
    |   |   |       
    |   |   +---Initialization Systems
    |   |   |   \---SystemD
    |   |   |       |   basics.md
    |   |   |       |   configurations.md
    |   |   |       |   services.md
    |   |   |       |   
    |   |   |       +---commands
    |   |   |       |       journalctl.md
    |   |   |       |       
    |   |   |       \---services
    |   |   |               systemd-service-config.md
    |   |   |               
    |   |   +---Linux Live CD-ISO
    |   |   |   |   mkisofs.txt
    |   |   |   |   README.md
    |   |   |   |   squashfs.txt
    |   |   |   |   
    |   |   |   \---Modifying Live CD
    |   |   |           unsquashing live cd.txt
    |   |   |           
    |   |   +---Networking
    |   |   |   |   networking-types.md
    |   |   |   |   ports.md
    |   |   |   |   README.md
    |   |   |   |   
    |   |   |   +---DNS Resolvers
    |   |   |   |   \---Unbound
    |   |   |   |           setup.md
    |   |   |   |           
    |   |   |   +---Network Configuration
    |   |   |   |       Set Static IP-Address.md
    |   |   |   |       
    |   |   |   \---Network Drivers
    |   |   |           ethtool.md
    |   |   |           
    |   |   +---Security Hardening
    |   |   |   \---Firewall
    |   |   |           iptables.md
    |   |   |           ufw.md
    |   |   |           
    |   |   +---Server
    |   |   |   +---DNS Servers
    |   |   |   |   |   README.md
    |   |   |   |   |   
    |   |   |   |   \---PiHole
    |   |   |   |       |   install-with-docker.md
    |   |   |   |       |   pihole.md
    |   |   |   |       |   README.md
    |   |   |   |       |   setup.md
    |   |   |   |       |   
    |   |   |   |       \---Unbound
    |   |   |   |           |   dns-server-setup.md
    |   |   |   |           |   docker-setup.md
    |   |   |   |           |   
    |   |   |   |           \---Configurations
    |   |   |   |                   pi-hole.conf
    |   |   |   |                   
    |   |   |   +---Email Servers
    |   |   |   |       basics.md
    |   |   |   |       postfix.md
    |   |   |   |       README.md
    |   |   |   |       
    |   |   |   +---Home Lab
    |   |   |   |   |   components.md
    |   |   |   |   |   concepts.md
    |   |   |   |   |   roadmap.md
    |   |   |   |   |   software.md
    |   |   |   |   |   
    |   |   |   |   +---NextCloud
    |   |   |   |   |       basics.md
    |   |   |   |   |       setup.md
    |   |   |   |   |       
    |   |   |   |   +---Proxmox
    |   |   |   |   |       basics.md
    |   |   |   |   |       setup.md
    |   |   |   |   |       
    |   |   |   |   \---Raspberry-Pi
    |   |   |   |           software.md
    |   |   |   |           
    |   |   |   +---Media Server
    |   |   |   |       dlna_media_server.md
    |   |   |   |       README.md
    |   |   |   |       
    |   |   |   +---NAS
    |   |   |   |   |   README.md
    |   |   |   |   |   
    |   |   |   |   \---OpenMediaVault
    |   |   |   |           frequently-encountered-issues.txt
    |   |   |   |           README.md
    |   |   |   |           setup.md
    |   |   |   |           
    |   |   |   +---Proxy Server
    |   |   |   |   \---nginx
    |   |   |   |       +---Guides
    |   |   |   |       |   \---Configuration
    |   |   |   |       |           reverse-proxy.md
    |   |   |   |       |           using-subdomains.md
    |   |   |   |       |           
    |   |   |   |       +---Resources
    |   |   |   |       |       reverse-proxy-guides-for-services.md
    |   |   |   |       |       
    |   |   |   |       \---Snippets-and-Examples
    |   |   |   |           +---1-Reverse Proxy
    |   |   |   |           |   \---multiple_locations
    |   |   |   |           |       +---etc
    |   |   |   |           |       |   |   hosts
    |   |   |   |           |       |   |   
    |   |   |   |           |       |   \---nginx
    |   |   |   |           |       |       |   nginx.conf
    |   |   |   |           |       |       |   
    |   |   |   |           |       |       +---conf.d
    |   |   |   |           |       |       |       default.conf
    |   |   |   |           |       |       |       
    |   |   |   |           |       |       +---includes
    |   |   |   |           |       |       |       proxy.conf
    |   |   |   |           |       |       |       ssl.conf
    |   |   |   |           |       |       |       
    |   |   |   |           |       |       \---ssl
    |   |   |   |           |       |               gen_rsa.sh
    |   |   |   |           |       |               README.md
    |   |   |   |           |       |               
    |   |   |   |           |       \---var
    |   |   |   |           |           \---www
    |   |   |   |           |               \---html
    |   |   |   |           |                       backend-not-found.html
    |   |   |   |           |                       index.html
    |   |   |   |           |                       
    |   |   |   |           \---default
    |   |   |   |               \---nginx
    |   |   |   |                   |   fastcgi_params
    |   |   |   |                   |   mime.types
    |   |   |   |                   |   nginx.conf
    |   |   |   |                   |   scgi_params
    |   |   |   |                   |   uwsgi_params
    |   |   |   |                   |   
    |   |   |   |                   \---conf.d
    |   |   |   |                           default.conf
    |   |   |   |                           
    |   |   |   +---RDP
    |   |   |   |   |   README.md
    |   |   |   |   |   
    |   |   |   |   \---projects
    |   |   |   |       \---xrdp
    |   |   |   |           |   README.md
    |   |   |   |           |   
    |   |   |   |           \---packages
    |   |   |   |                   xorgxrdp.md
    |   |   |   |                   
    |   |   |   +---Samba Network File Sharing Server
    |   |   |   |       README.md
    |   |   |   |       setup.md
    |   |   |   |       
    |   |   |   +---VNC-Servers
    |   |   |   |   +---TigerVNC
    |   |   |   |   |       README.md
    |   |   |   |   |       
    |   |   |   |   \---x11vnc
    |   |   |   |           playbook.md
    |   |   |   |           README.md
    |   |   |   |           
    |   |   |   +---VPN-Server
    |   |   |   |   |   README.md
    |   |   |   |   |   
    |   |   |   |   +---IPSEC
    |   |   |   |   |   +---Automatic
    |   |   |   |   |   |   \---hwdsl2
    |   |   |   |   |   |       \---linux-setup-ipsec-vpn
    |   |   |   |   |   |               ikev2.md
    |   |   |   |   |   |               setup.txt
    |   |   |   |   |   |               
    |   |   |   |   |   \---L2TP
    |   |   |   |   |       \---Errors
    |   |   |   |   |               error reading xl2ptd-control.md
    |   |   |   |   |               
    |   |   |   |   \---WireGuard
    |   |   |   |           basics.md
    |   |   |   |           setup.md
    |   |   |   |           
    |   |   |   +---Wake-on-Lan Server
    |   |   |   |   |   README.md
    |   |   |   |   |   
    |   |   |   |   \---etherwake
    |   |   |   |       |   etherwake.md
    |   |   |   |       |   setup.md
    |   |   |   |       |   wakeonlan.md
    |   |   |   |       |   
    |   |   |   |       \---config
    |   |   |   |               wol.template
    |   |   |   |               
    |   |   |   \---Web Server
    |   |   |       |   basics.md
    |   |   |       |   README.md
    |   |   |       |   setup.md
    |   |   |       |   
    |   |   |       \---nginx
    |   |   |           |   nginx.md
    |   |   |           |   
    |   |   |           \---Guides
    |   |   |               \---Configuration
    |   |   |                       configuration.md
    |   |   |                       load-balancer.md
    |   |   |                       self-signed-SSL-encryption.md
    |   |   |                       
    |   |   +---Setup
    |   |   |       Enable Sudo.txt
    |   |   |       General Flow.md
    |   |   |       Localization.txt
    |   |   |       Network.txt
    |   |   |       post-installation.md
    |   |   |       Preparation.txt
    |   |   |       Swapfile.txt
    |   |   |       
    |   |   \---System Administration
    |   |       |   faq.md
    |   |       |   monitoring.md
    |   |       |   playbook.md
    |   |       |   system-cleanup.md
    |   |       |   
    |   |       \---SSH
    |   |               adding-key-entries-into-known-hosts.md
    |   |               
    |   +---Issues-and-Solutions
    |   |       Basic Backup Recovery to another device.txt
    |   |       Kernel Panic.txt
    |   |       
    |   +---Linux Kernel
    |   |   |   README.md
    |   |   |   
    |   |   \---Customization
    |   |           customization-settings.md
    |   |           
    |   +---Linux-From-Scratch
    |   |   |   install-guide.txt
    |   |   |   lfs.sh
    |   |   |   package-list.md
    |   |   |   post-installation.txt
    |   |   |   
    |   |   \---Staged Build
    |   |           3-packages-and-patches.md
    |   |           
    |   +---package-manager
    |   |   |   aptitude
    |   |   |   emerge
    |   |   |   pacman
    |   |   |   xbps
    |   |   |   
    |   |   +---dnf
    |   |   |       dnf-setup.md
    |   |   |       
    |   |   \---dpkg
    |   |           dpkg.md
    |   |           
    |   +---packages
    |   |   |   package-name-reference.md
    |   |   |   
    |   |   +---Build from Source
    |   |   |   |   CHANGELOGS.md
    |   |   |   |   package-list.md
    |   |   |   |   pipeline.md
    |   |   |   |   README.md
    |   |   |   |   
    |   |   |   \---packages
    |   |   |       +---apache
    |   |   |       |   \---httpd
    |   |   |       |           compilation.md
    |   |   |       |           
    |   |   |       +---archlinux
    |   |   |       |   \---arch-install-scripts
    |   |   |       |           compilation.md
    |   |   |       |           
    |   |   |       +---jqlang
    |   |   |       |   \---jq
    |   |   |       |           cross-compilation.md
    |   |   |       |           README.md
    |   |   |       |           setup.md
    |   |   |       |           usage.md
    |   |   |       |           
    |   |   |       +---torvalds
    |   |   |       |   \---linux
    |   |   |       |           compilation.md
    |   |   |       |           
    |   |   |       \---void-linux
    |   |   |           \---xbps
    |   |   |                   compilation.md
    |   |   |                   
    |   |   +---Display Server
    |   |   |   \---xorg
    |   |   |       |   README.md
    |   |   |       |   
    |   |   |       \---Configurations
    |   |   |               setup-headless.md
    |   |   |               xinitrc.md
    |   |   |               
    |   |   +---docs
    |   |   |       dracut.md
    |   |   |       ffmpeg.txt
    |   |   |       pv.md
    |   |   |       summary.txt
    |   |   |       xautolock.md
    |   |   |       xdotools.md
    |   |   |       xidlehook.md
    |   |   |       
    |   |   +---fzf
    |   |   |   |   README.md
    |   |   |   |   
    |   |   |   \---commands
    |   |   |           fzf.md
    |   |   |           
    |   |   +---GitHub-CLI
    |   |   |   |   gh.md
    |   |   |   |   
    |   |   |   \---Plugins
    |   |   |           gh-s.md
    |   |   |           
    |   |   +---ImageMagick
    |   |   |   \---docs
    |   |   |           convert.md
    |   |   |           
    |   |   +---Network-Manager
    |   |   |   |   package-structure.md
    |   |   |   |   
    |   |   |   \---commands
    |   |   |           nmcli.md
    |   |   |           nmtui.md
    |   |   |           
    |   |   +---package-compile-guides
    |   |   |       binutils.md
    |   |   |       README.md
    |   |   |       
    |   |   \---Picom
    |   |       |   forks.txt
    |   |       |   
    |   |       \---settings
    |   |               set-blur.md
    |   |               
    |   +---ricing
    |   |   |   basic-initial-setup.md
    |   |   |   general-info.txt
    |   |   |   README.md
    |   |   |   
    |   |   +---Components
    |   |   |   +---Status-Bar
    |   |   |   |       polybar.txt
    |   |   |   |       
    |   |   |   \---Window Managers
    |   |   |       \---bspwm
    |   |   |               bspc.txt
    |   |   |               configs.txt
    |   |   |               installation.txt
    |   |   |               setup.txt
    |   |   |               
    |   |   +---GTK
    |   |   |       README.md
    |   |   |       
    |   |   +---Guides
    |   |   |       customization-packages-masterlist.md
    |   |   |       essential-steps.md
    |   |   |       
    |   |   +---Repositories
    |   |   |       ricing-recommendations.md
    |   |   |       
    |   |   +---Resources
    |   |   |       resources-masterlist.txt
    |   |   |       
    |   |   \---Templates
    |   |       \---Designs
    |   |               rice-design-chart.md
    |   |               
    |   +---shells
    |   |   +---Bash
    |   |   |       bash.md
    |   |   |       files.txt
    |   |   |       settings.md
    |   |   |       shopt.md
    |   |   |       
    |   |   +---General
    |   |   |       useful-aliases.md
    |   |   |       
    |   |   \---Xonsh
    |   |           README.md
    |   |           
    |   +---Snippets-and-Examples
    |   |       README.md
    |   |       Samba-NAS-Fileserver.md
    |   |       
    |   \---tips-n-tricks
    |       |   colour-definitions.sh
    |       |   linux
    |       |   pacman.txt
    |       |   shellscript-bash
    |       |   
    |       +---Recommendations
    |       |       aliases.txt
    |       |       
    |       \---Topics
    |           +---Distributions
    |           |       Retrieving Distribution Name.txt
    |           |       
    |           \---Package Managers
    |                   Checking for a specific package manager.txt
    |                   
    +---Mathematics
    |   \---Formulas
    |           probability-and-statistics.md
    |           trigonometry.md
    |           
    +---Networking
    |   +---Commands
    |   |       arp.md
    |   |       curl.md
    |   |       netstat.md
    |   |       
    |   +---Guides
    |   |       acronyms.md
    |   |       algorithms.md
    |   |       dictionary.md
    |   |       http-requests.md
    |   |       port-numbers.md
    |   |       protocols.md
    |   |       terminologies.md
    |   |       
    |   +---Resources
    |   |       VLSM-Table.md
    |   |       
    |   +---Tools
    |   |       dig.md
    |   |       
    |   \---Topics
    |       +---DNS
    |       |       basics.md
    |       |       
    |       \---Remote Connection
    |           \---commands
    |               \---SSH
    |                   |   README.md
    |                   |   setup.md
    |                   |   things-to-do-after-installing.md
    |                   |   
    |                   +---Code Snippets
    |                   |       port-forwarding.md
    |                   |       
    |                   \---commands
    |                           scp.md
    |                           sftp.md
    |                           ssh-copy-id.md
    |                           ssh-keygen.md
    |                           ssh.md
    |                           sshd.md
    |                           
    +---Operating Systems
    |   |   partitions.txt
    |   |   
    |   +---Android
    |   |   +---Files
    |   |   |       android-foss.md
    |   |   |       
    |   |   \---Free Open-Source Software (FOSS)
    |   |       \---Termux
    |   |               backup-and-recovery.txt
    |   |               display-environment.txt
    |   |               setup-termux.txt
    |   |               usage.txt
    |   |               
    |   +---File Sharing
    |   |   \---Remote
    |   |       |   tools.md
    |   |       |   
    |   |       \---sshfs
    |   |               basics.md
    |   |               mounting.md
    |   |               
    |   +---iOS
    |   |   \---Files
    |   |           tools.md
    |   |           
    |   \---Windows
    |       |   playbook.md
    |       |   
    |       +---commands
    |       |       assoc.md
    |       |       chkdsk.md
    |       |       clip.md
    |       |       dism.md
    |       |       findstr.md
    |       |       getmac.md
    |       |       icacls.md
    |       |       net.md
    |       |       netsh.md
    |       |       powercfg.md
    |       |       route.md
    |       |       sfc.md
    |       |       taskkill.md
    |       |       tasklist.md
    |       |       template.md
    |       |       wmic.md
    |       |       
    |       +---Guides
    |       |   +---Network
    |       |   |   \---Usages
    |       |   |           mounting.md
    |       |   |           
    |       |   \---System
    |       |           special-paths-and-environment-variables.md
    |       |           
    |       +---Registry
    |       |       basics.md
    |       |       
    |       +---Tips-and-Tricks
    |       |       Keybindings.md
    |       |       
    |       +---Versions
    |       |   \---Windows Server
    |       |           base-installation-guide.md
    |       |           
    |       +---Windows 10
    |       |       Changing System Fonts.txt
    |       |       Environment Variables.txt
    |       |       KMS Servers.txt
    |       |       
    |       +---WinGet-CLI
    |       |       basics.md
    |       |       
    |       \---WSL
    |               distributions.md
    |               README.md
    |               
    +---Programming
    |   |   best-practices
    |   |   README.md
    |   |   software-design-planner
    |   |   
    |   +---Artificial Intelligence
    |   |   |   ai-development-structure notepad.txt
    |   |   |   
    |   |   \---Ideas
    |   |       \---Project R.E.A.L.I.T.Y
    |   |               ai-development_project R.E.A.L.I.T.Y design.txt
    |   |               changelogs
    |   |               program_designer
    |   |               
    |   +---Build Systems
    |   |   \---Make
    |   |       |   basics.md
    |   |       |   
    |   |       +---Documentations
    |   |       |       make.md
    |   |       |       makefile-background-information.txt
    |   |       |       makefile.md
    |   |       |       quick-reference.md
    |   |       |       
    |   |       +---Implementations
    |   |       |       C-Lang.md
    |   |       |       
    |   |       +---Skeleton
    |   |       |       cpp.Makefile
    |   |       |       general.Makefile
    |   |       |       installer.Makefile
    |   |       |       python.Makefile
    |   |       |       
    |   |       +---Templates
    |   |       |       1_nested_folders_multiple_makefiles.txt
    |   |       |       basic-makefile-template.makefile
    |   |       |       
    |   |       \---Tutorials
    |   |               checks.txt
    |   |               general.txt
    |   |               
    |   +---Cheatsheets
    |   |       bash.md
    |   |       batch.txt
    |   |       cpp.txt
    |   |       git.txt
    |   |       Makefile.md
    |   |       makefile.txt
    |   |       php.txt
    |   |       python.txt
    |   |       regex.txt
    |   |       software-engineering.txt
    |   |       sql.txt
    |   |       vim.txt
    |   |       
    |   +---Computer Science
    |   |   \---Theory
    |   |           Big-O Notation.md
    |   |           
    |   +---Configuration-Files
    |   |       file-formats.md
    |   |       
    |   +---Data-Serialization
    |   |   \---Languages
    |   |       \---cheatsheets
    |   |               yaml.md
    |   |               
    |   +---Designing
    |   |       color-codes.md
    |   |       program_designer.md
    |   |       
    |   +---DevOps
    |   |       patching.md
    |   |       
    |   +---Files
    |   |   |   resources-masterlist.txt
    |   |   |   snippets.txt
    |   |   |   terminologies.md
    |   |   |   
    |   |   +---Plans
    |   |   |   \---Project Ideas
    |   |   |           Accounting Financial Statement Book DBMS.txt
    |   |   |           
    |   |   \---Templates
    |   |           changelogs
    |   |           index.html
    |   |           main.bat
    |   |           main.c
    |   |           main.cpp
    |   |           main.cs
    |   |           main.py
    |   |           main.sh
    |   |           program_designer
    |   |           README.md
    |   |           template-generator
    |   |           
    |   +---GPU Programming
    |   |   |   terminologies.md
    |   |   |   
    |   |   \---API
    |   |       |   README.md
    |   |       |   
    |   |       \---OpenCL
    |   |           |   objects.md
    |   |           |   terminologies.md
    |   |           |   use-cases.md
    |   |           |   
    |   |           +---Concepts
    |   |           |       data-management.md
    |   |           |       
    |   |           +---Kernel Code
    |   |           |       syntax.md
    |   |           |       
    |   |           +---Snippet and Examples
    |   |           |       compile-opencl-cpp.bat
    |   |           |       
    |   |           \---v1.2
    |   |                   cpp.md
    |   |                   setup.md
    |   |                   
    |   +---Guides
    |   |   |   project-ideas.md
    |   |   |   promoting.md
    |   |   |   
    |   |   \---Concepts
    |   |       \---Signals
    |   |               basics.md
    |   |               signals.md
    |   |               
    |   +---Language-Server-Packs
    |   |   |   README.md
    |   |   |   
    |   |   \---Languages
    |   |       \---C++
    |   |           \---LLVM-clang
    |   |                   README.md
    |   |                   setup.md
    |   |                   
    |   +---Languages
    |   |   +---ASSEMBLY
    |   |   |   |   README.md
    |   |   |   |   starters.md
    |   |   |   |   
    |   |   |   \---x86_64
    |   |   |           basics.md
    |   |   |           
    |   |   +---Batch
    |   |   |   |   documentations-and-playbook.md
    |   |   |   |   
    |   |   |   +---Code-Snippets
    |   |   |   |   \---Startup Workspace
    |   |   |   |           start.bat
    |   |   |   |           
    |   |   |   \---My-Scripts
    |   |   |           as64portable.bat
    |   |   |           portable.bat
    |   |   |           portable_start.bat
    |   |   |           README.md
    |   |   |           tee.bat
    |   |   |           
    |   |   +---C
    |   |   |   |   project-filesystem-structure.md
    |   |   |   |   
    |   |   |   +---Code-Snippets
    |   |   |   |   \---HelloWorld
    |   |   |   |           compile.bat
    |   |   |   |           main.c
    |   |   |   |           main.exe
    |   |   |   |           
    |   |   |   +---Templates
    |   |   |   |   \---Project structure
    |   |   |   |       \---Project_Name
    |   |   |   |           +---app
    |   |   |   |           |   \---src
    |   |   |   |           |           main.c
    |   |   |   |           |           
    |   |   |   |           \---docs
    |   |   |   |                   program_designer.md
    |   |   |   |                   
    |   |   |   \---utilities
    |   |   |           gcc.md
    |   |   |           
    |   |   +---C#
    |   |   |   +---Basics
    |   |   |   |       syntax.txt
    |   |   |   |       
    |   |   |   +---Guides
    |   |   |   |   \---Compilation
    |   |   |   |       +---Linux
    |   |   |   |       |       mono.md
    |   |   |   |       |       
    |   |   |   |       +---Steps
    |   |   |   |       |       compiling-from-command-line.md
    |   |   |   |       |       compiling-gui-from-command-line.md
    |   |   |   |       |       
    |   |   |   |       \---Windows
    |   |   |   |               csc.md
    |   |   |   |               
    |   |   |   +---IDE
    |   |   |   |   \---Visual-Studio
    |   |   |   |           keybindings.txt
    |   |   |   |           
    |   |   |   \---Templates
    |   |   |           project-sources.md
    |   |   |           
    |   |   +---CPP
    |   |   |   |   best-practices.txt
    |   |   |   |   
    |   |   |   +---Code-Snippets
    |   |   |   |   |   string-manipulation.md
    |   |   |   |   |   
    |   |   |   |   \---HelloWorld
    |   |   |   |           compile.bat
    |   |   |   |           main.cpp
    |   |   |   |           main.exe
    |   |   |   |           
    |   |   |   +---examples
    |   |   |   |   \---File-Level Encapsulation
    |   |   |   |       |   Template.txt
    |   |   |   |       |   
    |   |   |   |       +---Access Modifiers
    |   |   |   |       |       Student.cpp
    |   |   |   |       |       Student.h
    |   |   |   |       |       StudentTest.cpp
    |   |   |   |       |       
    |   |   |   |       \---ViolatePrivate
    |   |   |   |               ViolatePrivate.cpp
    |   |   |   |               ViolatePrivate.h
    |   |   |   |               ViolatePrivateTest.cpp
    |   |   |   |               
    |   |   |   +---Templates
    |   |   |   |   \---Project structure
    |   |   |   |       \---Project_Name
    |   |   |   |           +---app
    |   |   |   |           |   \---src
    |   |   |   |           |           main.cpp
    |   |   |   |           |           
    |   |   |   |           \---docs
    |   |   |   |                   program_designer.md
    |   |   |   |                   
    |   |   |   +---tips-n-tricks
    |   |   |   |       Compile using seperate files.txt
    |   |   |   |       Encapsulation - To share your function.txt
    |   |   |   |       
    |   |   |   +---topics
    |   |   |   |       encapsulation.txt
    |   |   |   |       header-guards.md
    |   |   |   |       macros.txt
    |   |   |   |       vector.txt
    |   |   |   |       
    |   |   |   +---utilities
    |   |   |   |       g++.md
    |   |   |   |       
    |   |   |   \---wiki
    |   |   |           cli-argument-parsing.md
    |   |   |           README.md
    |   |   |           system-command-calls.md
    |   |   |           using-pipes.md
    |   |   |           
    |   |   +---Golang
    |   |   |       basics.md
    |   |   |       
    |   |   +---Java
    |   |   |   +---Guides
    |   |   |   |       android-java-guides.md
    |   |   |   |       class.md
    |   |   |   |       
    |   |   |   \---Libraries
    |   |   |       |   external-libraries-masterlist.txt
    |   |   |       |   
    |   |   |       \---External Libraries
    |   |   |           \---JUnit
    |   |   |                   basics.txt
    |   |   |                   
    |   |   +---LaTeX
    |   |   |       docs.md
    |   |   |       README.md
    |   |   |       setup.md
    |   |   |       
    |   |   +---Lua
    |   |   |   \---APIs
    |   |   |       \---vim
    |   |   |               basics.md
    |   |   |               
    |   |   +---Markdown
    |   |   |       extended-syntax.md
    |   |   |       syntax.txt
    |   |   |       
    |   |   +---PHP
    |   |   |   |   setup.txt
    |   |   |   |   
    |   |   |   +---Files
    |   |   |   |       commands.md
    |   |   |   |       
    |   |   |   +---Libraries
    |   |   |   |       extlib.php
    |   |   |   |       mysqli_conn.php
    |   |   |   |       
    |   |   |   \---Templates
    |   |   |           xhtml.php.txt
    |   |   |           
    |   |   +---Powershell
    |   |   |       commands.md
    |   |   |       
    |   |   +---Python
    |   |   |   |   playbook.md
    |   |   |   |   syntax-changes.md
    |   |   |   |   
    |   |   |   +---Examples
    |   |   |   |   +---Code-Snippets
    |   |   |   |   |   |   command-line-argument.md
    |   |   |   |   |   |   Substitution-Cipher.py
    |   |   |   |   |   |   web-scraping.md
    |   |   |   |   |   |   
    |   |   |   |   |   +---CSV-Reader
    |   |   |   |   |   |   |   runner.bat
    |   |   |   |   |   |   |   
    |   |   |   |   |   |   +---app
    |   |   |   |   |   |   |   \---src
    |   |   |   |   |   |   |           Contact.csv
    |   |   |   |   |   |   |           main.py
    |   |   |   |   |   |   |           setup.py
    |   |   |   |   |   |   |           
    |   |   |   |   |   |   \---docs
    |   |   |   |   |   |           program_designer.md
    |   |   |   |   |   |           
    |   |   |   |   |   +---PersonalDBMS
    |   |   |   |   |   |   |   runner.bat
    |   |   |   |   |   |   |   
    |   |   |   |   |   |   +---app
    |   |   |   |   |   |   |   \---src
    |   |   |   |   |   |   |       |   main.py
    |   |   |   |   |   |   |       |   setup.py
    |   |   |   |   |   |   |       |   
    |   |   |   |   |   |   |       \---modules
    |   |   |   |   |   |   |           +---db
    |   |   |   |   |   |   |           |   |   db_utils.py
    |   |   |   |   |   |   |           |   |   
    |   |   |   |   |   |   |           |   \---__pycache__
    |   |   |   |   |   |   |           |           db_utils.cpython-39.pyc
    |   |   |   |   |   |   |           |           
    |   |   |   |   |   |   |           \---programs
    |   |   |   |   |   |   |               |   personal_db.py
    |   |   |   |   |   |   |               |   
    |   |   |   |   |   |   |               +---FinanceDB
    |   |   |   |   |   |   |               |   |   finance_db.py
    |   |   |   |   |   |   |               |   |   
    |   |   |   |   |   |   |               |   \---__pycache__
    |   |   |   |   |   |   |               |           finance_db.cpython-39.pyc
    |   |   |   |   |   |   |               |           
    |   |   |   |   |   |   |               \---__pycache__
    |   |   |   |   |   |   |                       personal_db.cpython-39.pyc
    |   |   |   |   |   |   |                       
    |   |   |   |   |   |   \---docs
    |   |   |   |   |   |           program_designer.md
    |   |   |   |   |   |           
    |   |   |   |   |   +---Simple-GUI
    |   |   |   |   |   |   |   README.md
    |   |   |   |   |   |   |   runner.bat
    |   |   |   |   |   |   |   
    |   |   |   |   |   |   +---app
    |   |   |   |   |   |   |   \---src
    |   |   |   |   |   |   |       |   main-single.py
    |   |   |   |   |   |   |       |   main-test.py
    |   |   |   |   |   |   |       |   setup.py
    |   |   |   |   |   |   |       |   
    |   |   |   |   |   |   |       \---modules
    |   |   |   |   |   |   |           |   general.py
    |   |   |   |   |   |   |           |   paths.py
    |   |   |   |   |   |   |           |   
    |   |   |   |   |   |   |           +---db
    |   |   |   |   |   |   |           |   |   sqlite_util.py
    |   |   |   |   |   |   |           |   |   
    |   |   |   |   |   |   |           |   \---__pycache__
    |   |   |   |   |   |   |           |           sqlite_util.cpython-39.pyc
    |   |   |   |   |   |   |           |           
    |   |   |   |   |   |   |           +---gui
    |   |   |   |   |   |   |           |   |   tkwrap.py
    |   |   |   |   |   |   |           |   |   
    |   |   |   |   |   |   |           |   \---__pycache__
    |   |   |   |   |   |   |           |           tkwrap.cpython-39.pyc
    |   |   |   |   |   |   |           |           
    |   |   |   |   |   |   |           \---program
    |   |   |   |   |   |   |               |   classroom.py
    |   |   |   |   |   |   |               |   
    |   |   |   |   |   |   |               \---__pycache__
    |   |   |   |   |   |   |                       classroom.cpython-39.pyc
    |   |   |   |   |   |   |                       
    |   |   |   |   |   |   \---docs
    |   |   |   |   |   |           program_designer.md
    |   |   |   |   |   |           
    |   |   |   |   |   \---Unit Tests
    |   |   |   |   |           tests.py
    |   |   |   |   |           
    |   |   |   |   \---Shellscripting
    |   |   |   |           Popen.md
    |   |   |   |           
    |   |   |   +---Frameworks
    |   |   |   |   |   choosing-a-framework.txt
    |   |   |   |   |   
    |   |   |   |   \---Mobile App Development
    |   |   |   |       \---Kivy
    |   |   |   |               general.txt
    |   |   |   |               
    |   |   |   +---Guides
    |   |   |   |   |   Exceptions.md
    |   |   |   |   |   interrupt-exceptions.md
    |   |   |   |   |   macros.md
    |   |   |   |   |   variable-length-arguments.txt
    |   |   |   |   |   write-modes.md
    |   |   |   |   |   
    |   |   |   |   +---Types
    |   |   |   |   |   +---int
    |   |   |   |   |   |       int.md
    |   |   |   |   |   |       
    |   |   |   |   |   +---list
    |   |   |   |   |   |       list-substitution.md
    |   |   |   |   |   |       lists.md
    |   |   |   |   |   |       
    |   |   |   |   |   \---string
    |   |   |   |   |           formatting.md
    |   |   |   |   |           strings.md
    |   |   |   |   |           
    |   |   |   |   \---Version-Specific
    |   |   |   |       \---Python3.10
    |   |   |   |           \---Keywords
    |   |   |   |                   match-case.md
    |   |   |   |                   
    |   |   |   +---Libraries
    |   |   |   |   |   packages-masterlist.md
    |   |   |   |   |   
    |   |   |   |   +---argparse
    |   |   |   |   |       manual.md
    |   |   |   |   |       README.md
    |   |   |   |   |       
    |   |   |   |   +---binascii
    |   |   |   |   |       manual.md
    |   |   |   |   |       README.md
    |   |   |   |   |       
    |   |   |   |   +---flask
    |   |   |   |   |       manual.md
    |   |   |   |   |       README.md
    |   |   |   |   |       setup.md
    |   |   |   |   |       
    |   |   |   |   +---hashlib
    |   |   |   |   |       manual.md
    |   |   |   |   |       README.md
    |   |   |   |   |       
    |   |   |   |   +---json
    |   |   |   |   |       manual.md
    |   |   |   |   |       README.md
    |   |   |   |   |       
    |   |   |   |   +---mysql-connector-python
    |   |   |   |   |       manual.md
    |   |   |   |   |       README.md
    |   |   |   |   |       setup.md
    |   |   |   |   |       
    |   |   |   |   +---netfilterqueue
    |   |   |   |   |   |   manual.md
    |   |   |   |   |   |   README.md
    |   |   |   |   |   |   
    |   |   |   |   |   \---examples
    |   |   |   |   |           nfq.py.md
    |   |   |   |   |           
    |   |   |   |   +---os
    |   |   |   |   |       manual.md
    |   |   |   |   |       README.md
    |   |   |   |   |       setup.md
    |   |   |   |   |       
    |   |   |   |   +---platform
    |   |   |   |   |       manual.md
    |   |   |   |   |       README.md
    |   |   |   |   |       setup.md
    |   |   |   |   |       
    |   |   |   |   +---pycryptodome
    |   |   |   |   |   |   manual.md
    |   |   |   |   |   |   README.md
    |   |   |   |   |   |   
    |   |   |   |   |   \---examples
    |   |   |   |   |       |   main.py
    |   |   |   |   |       |   
    |   |   |   |   |       +---aes
    |   |   |   |   |       |       decrypt.py
    |   |   |   |   |       |       encrypt.py
    |   |   |   |   |       |       
    |   |   |   |   |       +---hybrid
    |   |   |   |   |       |       decrypt.py
    |   |   |   |   |       |       encrypt.py
    |   |   |   |   |       |       
    |   |   |   |   |       \---rsa
    |   |   |   |   |               decrypt.py
    |   |   |   |   |               encrypt.py
    |   |   |   |   |               keygen.py
    |   |   |   |   |               
    |   |   |   |   +---PyInstaller
    |   |   |   |   |       manual.md
    |   |   |   |   |       README.md
    |   |   |   |   |       setup.md
    |   |   |   |   |       Specfile.md
    |   |   |   |   |       
    |   |   |   |   +---random
    |   |   |   |   |       manual.md
    |   |   |   |   |       README.md
    |   |   |   |   |       
    |   |   |   |   +---re
    |   |   |   |   |       manual.md
    |   |   |   |   |       README.md
    |   |   |   |   |       
    |   |   |   |   +---requests
    |   |   |   |   |       manual.md
    |   |   |   |   |       README.md
    |   |   |   |   |       
    |   |   |   |   +---rich
    |   |   |   |   |       manual.md
    |   |   |   |   |       README.md
    |   |   |   |   |       
    |   |   |   |   +---scapy
    |   |   |   |   |       manual.md
    |   |   |   |   |       README.md
    |   |   |   |   |       
    |   |   |   |   +---setuptools
    |   |   |   |   |       manual.md
    |   |   |   |   |       README.md
    |   |   |   |   |       setup.md
    |   |   |   |   |       
    |   |   |   |   +---socket
    |   |   |   |   |   |   manual.md
    |   |   |   |   |   |   README.md
    |   |   |   |   |   |   
    |   |   |   |   |   \---examples
    |   |   |   |   |           reverse-shell.md
    |   |   |   |   |           
    |   |   |   |   +---subprocess
    |   |   |   |   |   |   manual.md
    |   |   |   |   |   |   README.md
    |   |   |   |   |   |   
    |   |   |   |   |   \---examples
    |   |   |   |   |           symmetric-key-encryption-with-gpg.md
    |   |   |   |   |           
    |   |   |   |   \---tensorflow
    |   |   |   |           manual.md
    |   |   |   |           README.md
    |   |   |   |           
    |   |   |   +---Packages
    |   |   |   |       collaboration.txt
    |   |   |   |       http.txt
    |   |   |   |       pip.txt
    |   |   |   |       
    |   |   |   +---Projects
    |   |   |   |       Project Filesystem Structure.txt
    |   |   |   |       
    |   |   |   +---Templates
    |   |   |   |   \---Project structure
    |   |   |   |       \---Project_Name
    |   |   |   |           +---app
    |   |   |   |           |   \---src
    |   |   |   |           |           main.py
    |   |   |   |           |           setup.py
    |   |   |   |           |           
    |   |   |   |           \---docs
    |   |   |   |                   program_designer.md
    |   |   |   |                   
    |   |   |   +---Topics
    |   |   |   |   +---Class
    |   |   |   |   |       inheritance.md
    |   |   |   |   |       super.md
    |   |   |   |   |       
    |   |   |   |   +---Decorators
    |   |   |   |   |       basics.md
    |   |   |   |   |       compilation.md
    |   |   |   |   |       
    |   |   |   |   +---Environment Variables
    |   |   |   |   |       dotenv-syntax.txt
    |   |   |   |   |       flow.txt
    |   |   |   |   |       os-environ.txt
    |   |   |   |   |       README.md
    |   |   |   |   |       
    |   |   |   |   +---Functions
    |   |   |   |   |   \---Arguments
    |   |   |   |   |           keyword-only.md
    |   |   |   |   |           
    |   |   |   |   +---Namespaces
    |   |   |   |   |       Converting Namespaces to other types.md
    |   |   |   |   |       
    |   |   |   |   \---Testing
    |   |   |   |           unit-tests.md
    |   |   |   |           
    |   |   |   +---Virtual Environments
    |   |   |   |       start_venv.bat
    |   |   |   |       start_venv.sh
    |   |   |   |       venv-setup.md
    |   |   |   |       
    |   |   |   \---wiki
    |   |   |           cli-argument-parsing.md
    |   |   |           README.md
    |   |   |           system-command-calls.md
    |   |   |           using-pipes.md
    |   |   |           
    |   |   +---Rust
    |   |   |   \---Basics
    |   |   |           Built-in Libraries.md
    |   |   |           Syntax.md
    |   |   |           
    |   |   \---Templates
    |   |       |   programming-concepts-and-beginner's-guide.md
    |   |       |   
    |   |       \---programming-language
    |   |           +---Code-Snippets
    |   |           |       README.md
    |   |           |       
    |   |           \---Guides
    |   |                   README.md
    |   |                   
    |   +---Mobile-App-Development
    |   |   |   designing-a-good-looking-app.md
    |   |   |   
    |   |   \---Android
    |   |       +---adb
    |   |       |   |   basics.md
    |   |       |   |   README.md
    |   |       |   |   
    |   |       |   \---commands
    |   |       |           adb.md
    |   |       |           
    |   |       +---APKs
    |   |       |       Signing your apk.txt
    |   |       |       
    |   |       +---Development Environment
    |   |       |       Android-Environment.txt
    |   |       |       setup.txt
    |   |       |       
    |   |       +---Devices
    |   |       |       man-adb.txt
    |   |       |       
    |   |       +---Documentations
    |   |       |       widgets.md
    |   |       |       
    |   |       +---Guides
    |   |       |   |   dictionary.md
    |   |       |   |   files.md
    |   |       |   |   intents.md
    |   |       |   |   layouts.md
    |   |       |   |   views.md
    |   |       |   |   
    |   |       |   +---Biometric Authentication
    |   |       |   |       biometric-auth.md
    |   |       |   |       
    |   |       |   \---Fundamentals
    |   |       |           basics.md
    |   |       |           
    |   |       +---Languages
    |   |       |   +---Java
    |   |       |   |   |   basics.md
    |   |       |   |   |   classes.md
    |   |       |   |   |   
    |   |       |   |   \---Gradle
    |   |       |   |           Build-and-Deploy-app.txt
    |   |       |   |           man-gradle.txt
    |   |       |   |           README.md
    |   |       |   |           signing-app.txt
    |   |       |   |           
    |   |       |   +---Kotlin
    |   |       |   |       README.md
    |   |       |   |       setup.txt
    |   |       |   |       
    |   |       |   \---Python
    |   |       |       \---Frameworks
    |   |       |           \---Kivy
    |   |       |                   buildozer.txt
    |   |       |                   compiling-to-apk.txt
    |   |       |                   release-to-market.txt
    |   |       |                   
    |   |       +---Libraries
    |   |       |   \---Volley
    |   |       |           README.md
    |   |       |           
    |   |       +---Project
    |   |       |   |   File Structure.txt
    |   |       |   |   Files.txt
    |   |       |   |   generating-new-project-from-scratch.md
    |   |       |   |   Makefile.gen-android-fs
    |   |       |   |   things-to-do-before-proceeding.md
    |   |       |   |   
    |   |       |   \---templates
    |   |       |           MainActivity.java
    |   |       |           MainActivity.kt
    |   |       |           NewActivity.java
    |   |       |           NewActivity.kt
    |   |       |           
    |   |       \---Snippets
    |   |           \---Options Menu
    |   |                   README.md
    |   |                   
    |   +---Open Source Software
    |   |   |   README.md
    |   |   |   
    |   |   +---Essentials
    |   |   |       CONTRIBUTING.md
    |   |   |       CONTRIBUTIONS.md
    |   |   |       README.md
    |   |   |       
    |   |   +---Guides
    |   |   |   \---GitHub
    |   |   |           download-from-tags.txt
    |   |   |           
    |   |   \---Templates
    |   |       \---CONTRIBUTING
    |   |           \---GitHub
    |   |                   CONTRIBUTING.python.md
    |   |                   
    |   +---Regular Expressions
    |   |       regular-expressions-list.md
    |   |       
    |   +---Shellscript
    |   |   |   best-practices.md
    |   |   |   playbook.md
    |   |   |   
    |   |   +---Code-Snippets
    |   |   |       check-sudo.md
    |   |   |       command-line-argument.md
    |   |   |       map-objects.md
    |   |   |       permissions.md
    |   |   |       string-handling.md
    |   |   |       
    |   |   +---guides
    |   |   |   |   Comments.md
    |   |   |   |   install-scripts.md
    |   |   |   |   named-references.md
    |   |   |   |   seperate-string
    |   |   |   |   template
    |   |   |   |   
    |   |   |   \---Command Line Arguments
    |   |   |           Basics.md
    |   |   |           README.md
    |   |   |           Using-Getopts.md
    |   |   |           Using-shift.md
    |   |   |           
    |   |   +---My-Scripts
    |   |   |   |   audiomgr.sh
    |   |   |   |   clipkger.sh
    |   |   |   |   curl_repositories.sh
    |   |   |   |   customs.sh
    |   |   |   |   extlib.sh
    |   |   |   |   gen_project_structure.sh
    |   |   |   |   gitmgr.sh
    |   |   |   |   gits.sh
    |   |   |   |   git_utils.sh
    |   |   |   |   good-aliases.sh
    |   |   |   |   gtk_util.sh
    |   |   |   |   makefile.sh
    |   |   |   |   pacman.sh
    |   |   |   |   pacman_installed_pkg_with_description_test.sh
    |   |   |   |   postinstallations-root.sh
    |   |   |   |   postinstallations.sh
    |   |   |   |   README.md
    |   |   |   |   setup.sh
    |   |   |   |   strutil.sh
    |   |   |   |   textdl.sh
    |   |   |   |   unittest.sh
    |   |   |   |   vimopen.sh
    |   |   |   |   
    |   |   |   \---whiptail
    |   |   |           sleep-n-run.sh
    |   |   |           
    |   |   \---Skeleton
    |   |           main-with-getopts.sh
    |   |           main-with-shift.sh
    |   |           
    |   +---Software-Engineering
    |   |   |   unified_modelling_language (uml).txt
    |   |   |   workflow.txt
    |   |   |   
    |   |   +---Documentations
    |   |   |   +---Essentials
    |   |   |   |       CONTRIBUTING.md
    |   |   |   |       CONTRIBUTIONS.md
    |   |   |   |       README.md
    |   |   |   |       
    |   |   |   \---Files
    |   |   |       |   CONTRIBUTING.md
    |   |   |       |   CONTRIBUTIONS.md
    |   |   |       |   
    |   |   |       \---README
    |   |   |           \---Templates
    |   |   |                   README.software-development-planning.md
    |   |   |                   
    |   |   \---Software Development & Design
    |   |       |   resources.txt
    |   |       |   
    |   |       +---CI-CD
    |   |       |       tools.txt
    |   |       |       
    |   |       \---Planning
    |   |               Design Template.txt
    |   |               guide-naming-version-release.txt
    |   |               software-development-lifecycle.txt
    |   |               specs-list.txt
    |   |               
    |   +---Vim
    |   |   |   base-information.txt
    |   |   |   concepts.md
    |   |   |   controls.md
    |   |   |   fullguide.md
    |   |   |   README.md
    |   |   |   
    |   |   +---Configuration
    |   |   |       Autocommands.md
    |   |   |       Functions_and_Commands.md
    |   |   |       Highlight.md
    |   |   |       Remappings.md
    |   |   |       Settings.md
    |   |   |       
    |   |   +---Distros
    |   |   |   \---Neovim
    |   |   |       |   base-information.md
    |   |   |       |   
    |   |   |       +---Lua
    |   |   |       |       api.md
    |   |   |       |       terminologies.md
    |   |   |       |       
    |   |   |       \---Plugins
    |   |   |               plugins-compilation.md
    |   |   |               
    |   |   +---Documents
    |   |   |       devhints.io-Vim scripting cheatsheet.pdf
    |   |   |       turn-vim-into-an-ide.txt
    |   |   |       vim-must-haves.txt
    |   |   |       
    |   |   +---Guides
    |   |   |   |   buffers.md
    |   |   |   |   
    |   |   |   +---Beginner's Guide
    |   |   |   |       basic-keybindings.txt
    |   |   |   |       
    |   |   |   \---Plugins
    |   |   |           basics.txt
    |   |   |           
    |   |   +---Tips-n-Tricks
    |   |   |   \---Essentials
    |   |   |           Autocommands.txt
    |   |   |           Remappings.txt
    |   |   |           Settings.txt
    |   |   |           
    |   |   \---Vimscript
    |   |       \---Topics
    |   |               Using Dictionary.txt
    |   |               Using Lists.txt
    |   |               
    |   \---Web-Development
    |       +---Cheatsheets
    |       |       css.md
    |       |       html.txt
    |       |       javascript.txt
    |       |       
    |       +---Frameworks
    |       |   \---ReactJS
    |       |           setup.txt
    |       |           
    |       +---Github
    |       |   \---Pages
    |       |           1. How to deploy on GitHub Pages
    |       |           
    |       +---Guides
    |       |       software-stacks.md
    |       |       
    |       +---HTML
    |       |       basics.txt
    |       |       tags.md
    |       |       
    |       +---Javascript
    |       |   |   tips-n-tricks.txt
    |       |   |   
    |       |   \---Frameworks
    |       |       |   README.md
    |       |       |   
    |       |       \---Node-JS
    |       |           +---express-js
    |       |           |       README.md
    |       |           |       
    |       |           \---npm
    |       |                   cheatsheet.txt
    |       |                   
    |       +---Languages
    |       |   \---CSS
    |       |       \---Guides
    |       |               importing-css.md
    |       |               
    |       +---PHP
    |       |   \---libraries
    |       |           phpext.php
    |       |           
    |       \---Web Hosting
    |           \---Files
    |                   free-dns-services.txt
    |                   free-dynamic-web-services.txt
    |                   free-static-web-services.txt
    |                   
    +---Recreational
    |   \---Books
    |           collection.md
    |           
    +---Science
    |   \---Psychology
    |           dilemmas.md
    |           
    +---Services
    |   +---Cloud Infrastructure
    |   |   \---Amazon Web Services
    |   |       +---commands
    |   |       |       aws.md
    |   |       |       
    |   |       +---Guides
    |   |       |       aws-connecting-via-ssh.md
    |   |       |       categories-and-services.md
    |   |       |       
    |   |       \---SDK
    |   |               python.md
    |   |               
    |   \---Developer-API
    |       \---PubNub
    |           \---API
    |                   python.md
    |                   
    +---Software
    |   +---Browsers
    |   |   \---FireFox
    |   |           plugins.txt
    |   |           
    |   +---Image Downloader
    |   |   \---gallery-dl
    |   |           README.md
    |   |           
    |   +---Microsoft
    |   |   \---Excel
    |   |           automation-and-QoL.md
    |   |           
    |   +---Music Downloader
    |   |   \---SpotDL
    |   |           README.md
    |   |           
    |   +---OBS
    |   |       Keybindings.txt
    |   |       
    |   +---Text Editors
    |   |   \---Emacs
    |   |           basics.md
    |   |           setup.md
    |   |           
    |   +---Tmux
    |   |   |   basics.txt
    |   |   |   commands.md
    |   |   |   settings.md
    |   |   |   
    |   |   \---Configuration
    |   |           README.md
    |   |           
    |   \---Video Downloader
    |       \---yt-dlp
    |               cheatsheet.txt
    |               README.md
    |               
    +---Technology
    |   +---Blockchain
    |   |   |   terminologies.md
    |   |   |   websites.md
    |   |   |   
    |   |   +---Frameworks
    |   |   |   \---Ethereum
    |   |   |           geth.md
    |   |   |           
    |   |   \---Guides
    |   |       \---Fundamentals
    |   |               basics.md
    |   |               
    |   \---Containers
    |       |   README.md
    |       |   
    |       \---Docker
    |           |   faq-and-system-debugging.md
    |           |   playbook.md
    |           |   README.md
    |           |   
    |           +---docker-docs
    |           |   |   README.md
    |           |   |   
    |           |   \---services
    |           |       |   README.md
    |           |       |   
    |           |       +---Development
    |           |       |   \---Programming
    |           |       |       \---Rust
    |           |       |               docker-compose.md
    |           |       |               README.md
    |           |       |               snippets-and-examples.md
    |           |       |               
    |           |       \---docs
    |           |               benefits.md
    |           |               
    |           +---Files
    |           |   |   dictionary.md
    |           |   |   docker-images.md
    |           |   |   error-codes.txt
    |           |   |   file-locations.md
    |           |   |   packages.md
    |           |   |   parameter-comparison.md
    |           |   |   resources.md
    |           |   |   things to do after installing.md
    |           |   |   
    |           |   \---Templates
    |           |           docker-compose.yaml
    |           |           
    |           +---Guides
    |           |   |   basics.md
    |           |   |   docker.md
    |           |   |   Dockerfile.md
    |           |   |   making-your-own-image.md
    |           |   |   networking.md
    |           |   |   setup.md
    |           |   |   usage.md
    |           |   |   
    |           |   +---Docker Compose
    |           |   |       docker-compose YAML Configuration.md
    |           |   |       docker-compose.md
    |           |   |       Named Volumes.md
    |           |   |       
    |           |   \---Manuals
    |           |           buildx.md
    |           |           container.md
    |           |           volumes.md
    |           |           
    |           \---Using Docker
    |                   Snippets.md
    |                   
    +---Texts
    |   \---Unicode
    |           glyphicons.md
    |           kaomoji.md
    |           
    \---Virtual Machines
        |   README.md
        |   
        +---QEMU-KVM
        |   |   cheatsheets.txt
        |   |   playbook.md
        |   |   README.md
        |   |   setup.md
        |   |   
        |   +---Commands-and-Packages
        |   |       qemu-img.md
        |   |       qemu-system-[architecture].md
        |   |       virsh.md
        |   |       virt-install.md
        |   |       
        |   +---Guides
        |   |   |   differences.md
        |   |   |   
        |   |   +---Headless
        |   |   |       Headless-Using-QEMU.md
        |   |   |       Headless-Using-Virsh.md
        |   |   |       
        |   |   \---Networking
        |   |       \---Using qemu-system
        |   |               bridge-networking.md
        |   |               ports.md
        |   |               README.md
        |   |               
        |   +---scripts
        |   |   +---Linux
        |   |   |   |   conv_img.sh
        |   |   |   |   start_kvm.sh
        |   |   |   |   
        |   |   |   \---headless-vm
        |   |   |           manage_vm.sh
        |   |   |           settings.sh
        |   |   |           start_vm.sh
        |   |   |           
        |   |   \---Windows
        |   |           conv_img.bat
        |   |           start_kvm.bat
        |   |           
        |   \---Snippets
        |           development-workflow-with-vm.md
        |           headless-vm.md
        |           multiple-architectures.md
        |           
        \---VirtualBox
            |   Guest Additions.md
            |   
            +---Code-Snippets
            |       development-workflow-with-vm.md
            |       headless-vm.md
            |       vbox-attach-storage-devices.md
            |       vbox-attach-vdi_vhd-files.md
            |       vbox-detach-storage-devices.md
            |       vbox-detach-vdi_vhd-files.md
            |       
            +---Command-Line
            |       use-cases-and-snippets.md
            |       vboxheadless.md
            |       vboxmanage.md
            |       
            \---Scripts
                +---Batch-DOS
                |       convert_usb_to_vmdk.bat
                |       convert_vdi_to_img.bat
                |       create_virtualmachine.bat
                |       launch_usb_boot.bat
                |       start_vbox_with_personal_config.bat
                |       
                \---Shellscript
                        install-vbox-guest-additions.sh
``` 


