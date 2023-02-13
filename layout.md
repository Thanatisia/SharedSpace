# Repository 'docs' folder Layout

## Notes
+ Generated using Windows 'tree /A /F' 

## Layout
```
/
|   CHANGELOGS.md
|   CONTRIBUTING.md
|   CONTRIBUTION.md
|   README.md
|   
\---Docs
    |   CHANGELOGS.md
    |   layout.md
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
    |   |       PC Parts List.md
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
    |   \---Servers
    |       |   server-types.md
    |       |   
    |       \---NAS
    |               setup.md
    |               
    +---CyberSecurity
    |   |   tools.txt
    |   |   
    |   +---Cheatsheets
    |   |       masterlist.md
    |   |       
    |   +---CTF
    |   |   \---Resources
    |   |           websites.txt
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
    |   |           rainbowcrack.md
    |   |           
    |   \---Topics
    |       +---Blue-Team
    |       |   +---Incident Response
    |       |   +---Malware-Analysis
    |       |   |       commands.txt
    |       |   |       
    |       |   +---Reverse-Engineering
    |       |   \---SOC
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
    |   |   README.md
    |   |   Starters-Guide.txt
    |   |   User-Example.sh
    |   |   
    |   \---Remote Repository Hosts
    |       +---GitHub
    |       |   |   layout.md
    |       |   |   
    |       |   \---Tools
    |       |           gh.md
    |       |           
    |       \---GitLab
    +---Home Lab
    |   |   infrastructure-design-specs.md
    |   |   
    |   \---Services and Tools
    |       |   pipeline-and-ideas.md
    |       |   
    |       +---Dashboard
    |       |   +---Dashy
    |       |   \---Heimdall
    |       \---System Monitoring
    |           +---Grafana
    |           \---Uptime Kuma
    +---Language
    |   +---French
    |   |       compilation.md
    |   |       
    |   \---Japanese
    |       |   japanese.md
    |       |   
    |       +---Chinese
    |       |       hokkien.md
    |       |       
    |       \---compilation
    |               grammar.md
    |               
    +---Linux
    |   |   filesystem-structure.md
    |   |   README.md
    |   |   
    |   +---commands
    |   |       awk
    |   |       cheatsheets.txt
    |   |       dd.md
    |   |       declare.md
    |   |       diff.md
    |   |       getopts.md
    |   |       gpg.md
    |   |       hexdump.md
    |   |       ln.txt
    |   |       masterlist.md
    |   |       notify-send.md
    |   |       openssl.md
    |   |       parted.md
    |   |       patch.md
    |   |       printf.md
    |   |       README.md
    |   |       sed
    |   |       shift.md
    |   |       su
    |   |       tar.md
    |   |       template.md
    |   |       tr.md
    |   |       trap.md
    |   |       use-cases.md
    |   |       xargs.md
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
    |   |   |   |   +---AUR Helpers
    |   |   |   |   |   \---yay
    |   |   |   |   |           README.md
    |   |   |   |   |           
    |   |   |   |   \---Packaging
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
    |   |   |   |   +---ARCHIVE
    |   |   |   |   |   +---2021-08-16_1359H
    |   |   |   |   |   |       setup_debootstrap.sh
    |   |   |   |   |   |       
    |   |   |   |   |   \---2021-08-19_0852H
    |   |   |   |   |       |   installation-guide-Debian via another unix system.txt
    |   |   |   |   |       |   
    |   |   |   |   |       \---setup_profiles
    |   |   |   |   |               1. Asura.txt
    |   |   |   |   |               Template-1_2021-08-18_2104H.txt
    |   |   |   |   |               
    |   |   |   |   \---setup_profiles
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
    |   |   |           basics.md
    |   |   |           configurations.md
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
    |   |   |   |               dns-server-setup.md
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
    |   |   |   |       \---Guides
    |   |   |   |           \---Configuration
    |   |   |   |                   reverse-proxy.md
    |   |   |   |                   
    |   |   |   +---Samba Network File Sharing Server
    |   |   |   |       README.md
    |   |   |   |       setup.md
    |   |   |   |       
    |   |   |   +---Self-Hosted
    |   |   |   |   \---Mastodon
    |   |   |   +---VPN-Server
    |   |   |   |   |   README.md
    |   |   |   |   |   
    |   |   |   |   \---IPSEC
    |   |   |   |       +---Automatic
    |   |   |   |       |   \---hwdsl2
    |   |   |   |       |       \---linux-setup-ipsec-vpn
    |   |   |   |       |               ikev2.md
    |   |   |   |       |               setup.txt
    |   |   |   |       |               
    |   |   |   |       \---L2TP
    |   |   |   |           \---Errors
    |   |   |   |                   error reading xl2ptd-control.md
    |   |   |   |                   
    |   |   |   +---Wake-on-Lan Server
    |   |   |   |   |   README.md
    |   |   |   |   |   
    |   |   |   |   \---etherwake
    |   |   |   |           etherwake.md
    |   |   |   |           setup.md
    |   |   |   |           
    |   |   |   \---Web Server
    |   |   |       |   basics.md
    |   |   |       |   README.md
    |   |   |       |   setup.md
    |   |   |       |   
    |   |   |       +---apache2
    |   |   |       \---nginx
    |   |   |           |   nginx.md
    |   |   |           |   
    |   |   |           \---Guides
    |   |   |               \---Configuration
    |   |   |                   |   configuration.md
    |   |   |                   |   load-balancer.md
    |   |   |                   |   
    |   |   |                   \---Configuration Files
    |   |   |                       +---Load Balancer
    |   |   |                       \---Reverse Proxy
    |   |   \---Setup
    |   |           Enable Sudo.txt
    |   |           General Flow.md
    |   |           Localization.txt
    |   |           Network.txt
    |   |           Preparation.txt
    |   |           Swapfile.txt
    |   |           
    |   +---Issues-and-Solutions
    |   |       Basic Backup Recovery to another device.txt
    |   |       Kernel Panic.txt
    |   |       
    |   +---Linux-From-Scratch
    |   |   |   install-guide.txt
    |   |   |   lfs.sh
    |   |   |   package-list.md
    |   |   |   post-installation.txt
    |   |   |   
    |   |   \---Guides
    |   |       \---Versions
    |   |           \---LFS-11.1
    |   +---package-manager
    |   |       aptitude
    |   |       emerge
    |   |       pacman
    |   |       xbps
    |   |       
    |   +---packages
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
    |   |   |       \---torvalds
    |   |   |           \---linux
    |   |   |                   compilation.md
    |   |   |                   
    |   |   +---docs
    |   |   |       ffmpeg.txt
    |   |   |       nmcli.md
    |   |   |       summary.txt
    |   |   |       xautolock.md
    |   |   |       xdotools.md
    |   |   |       xidlehook.md
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
    |   |   +---package-compile-guides
    |   |   |       README.md
    |   |   |       
    |   |   +---Picom
    |   |   |   |   forks.txt
    |   |   |   |   
    |   |   |   \---settings
    |   |   |           set-blur.md
    |   |   |           
    |   |   \---qtile
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
    |   |   +---Dotfiles
    |   |   |   +---distros
    |   |   |   |   +---ArchLinux
    |   |   |   |   |   \---profiles
    |   |   |   |   |       +---ArchLinux_VM_Build-1
    |   |   |   |   |       |   +---2021-06-12_0638H
    |   |   |   |   |       |   |   +---.config
    |   |   |   |   |       |   |   |   +---bspwm
    |   |   |   |   |       |   |   |   |       bspwmrc
    |   |   |   |   |       |   |   |   |       
    |   |   |   |   |       |   |   |   +---conky
    |   |   |   |   |       |   |   |   |       conky.conf
    |   |   |   |   |       |   |   |   |       
    |   |   |   |   |       |   |   |   +---gtk-2.0
    |   |   |   |   |       |   |   |   |       gtkfilechooser.ini
    |   |   |   |   |       |   |   |   |       
    |   |   |   |   |       |   |   |   +---gtk-3.0
    |   |   |   |   |       |   |   |   |       settings.ini
    |   |   |   |   |       |   |   |   |       
    |   |   |   |   |       |   |   |   +---herbstluftwm
    |   |   |   |   |       |   |   |   |       autostart
    |   |   |   |   |       |   |   |   |       
    |   |   |   |   |       |   |   |   +---libfm
    |   |   |   |   |       |   |   |   |       libfm.conf
    |   |   |   |   |       |   |   |   |       
    |   |   |   |   |       |   |   |   +---nitrogen
    |   |   |   |   |       |   |   |   |       bg-saved.cfg
    |   |   |   |   |       |   |   |   |       nitrogen.cfg
    |   |   |   |   |       |   |   |   |       
    |   |   |   |   |       |   |   |   +---pcmanfm
    |   |   |   |   |       |   |   |   |   \---default
    |   |   |   |   |       |   |   |   |           pcmanfm.conf
    |   |   |   |   |       |   |   |   |           
    |   |   |   |   |       |   |   |   +---qtile
    |   |   |   |   |       |   |   |   |   |   config.py
    |   |   |   |   |       |   |   |   |   |   config.py.default
    |   |   |   |   |       |   |   |   |   |   extlib.py
    |   |   |   |   |       |   |   |   |   |   extlib.sh
    |   |   |   |   |       |   |   |   |   |   
    |   |   |   |   |       |   |   |   |   \---__pycache__
    |   |   |   |   |       |   |   |   |           config.cpython-39.pyc
    |   |   |   |   |       |   |   |   |           extlib.cpython-39.pyc
    |   |   |   |   |       |   |   |   |           
    |   |   |   |   |       |   |   |   \---sxhkd
    |   |   |   |   |       |   |   |           sxhkdrc
    |   |   |   |   |       |   |   |           
    |   |   |   |   |       |   |   +---release
    |   |   |   |   |       |   |   |       2021-06-12_0638H.zip
    |   |   |   |   |       |   |   |       
    |   |   |   |   |       |   |   \---root
    |   |   |   |   |       |   |           .bashrc
    |   |   |   |   |       |   |           .bash_logout
    |   |   |   |   |       |   |           .bash_profile
    |   |   |   |   |       |   |           .gtkrc-2.0
    |   |   |   |   |       |   |           .xinitrc
    |   |   |   |   |       |   |           
    |   |   |   |   |       |   \---2021-07-12_0914H
    |   |   |   |   |       |       \---root
    |   |   |   |   |       |           |   .bashrc
    |   |   |   |   |       |           |   .bash_logout
    |   |   |   |   |       |           |   .bash_profile
    |   |   |   |   |       |           |   .gtkrc-2.0
    |   |   |   |   |       |           |   .xinitrc
    |   |   |   |   |       |           |   pkglist
    |   |   |   |   |       |           |   
    |   |   |   |   |       |           +---.config
    |   |   |   |   |       |           |   +---bspwm
    |   |   |   |   |       |           |   |       bspwmrc
    |   |   |   |   |       |           |   |       
    |   |   |   |   |       |           |   +---conky
    |   |   |   |   |       |           |   |       conky.conf
    |   |   |   |   |       |           |   |       
    |   |   |   |   |       |           |   +---dconf
    |   |   |   |   |       |           |   |       user
    |   |   |   |   |       |           |   |       
    |   |   |   |   |       |           |   +---gtk-2.0
    |   |   |   |   |       |           |   |       gtkfilechooser.ini
    |   |   |   |   |       |           |   |       
    |   |   |   |   |       |           |   +---gtk-3.0
    |   |   |   |   |       |           |   |       settings.ini
    |   |   |   |   |       |           |   |       
    |   |   |   |   |       |           |   +---herbstluftwm
    |   |   |   |   |       |           |   |       autostart
    |   |   |   |   |       |           |   |       
    |   |   |   |   |       |           |   +---libfm
    |   |   |   |   |       |           |   |       libfm.conf
    |   |   |   |   |       |           |   |       
    |   |   |   |   |       |           |   +---nitrogen
    |   |   |   |   |       |           |   |       bg-saved.cfg
    |   |   |   |   |       |           |   |       nitrogen.cfg
    |   |   |   |   |       |           |   |       
    |   |   |   |   |       |           |   +---pcmanfm
    |   |   |   |   |       |           |   |   \---default
    |   |   |   |   |       |           |   |           pcmanfm.conf
    |   |   |   |   |       |           |   |           
    |   |   |   |   |       |           |   +---qtile
    |   |   |   |   |       |           |   |   |   config.py
    |   |   |   |   |       |           |   |   |   config.py.default
    |   |   |   |   |       |           |   |   |   extlib.py
    |   |   |   |   |       |           |   |   |   extlib.sh
    |   |   |   |   |       |           |   |   |   
    |   |   |   |   |       |           |   |   \---__pycache__
    |   |   |   |   |       |           |   |           config.cpython-39.pyc
    |   |   |   |   |       |           |   |           extlib.cpython-39.pyc
    |   |   |   |   |       |           |   |           
    |   |   |   |   |       |           |   \---sxhkd
    |   |   |   |   |       |           |           sxhkdrc
    |   |   |   |   |       |           |           
    |   |   |   |   |       |           +---.icons
    |   |   |   |   |       |           |   \---default
    |   |   |   |   |       |           |           index.theme
    |   |   |   |   |       |           |           
    |   |   |   |   |       |           +---.local
    |   |   |   |   |       |           |   \---share
    |   |   |   |   |       |           |       |   recently-used.xbel
    |   |   |   |   |       |           |       |   
    |   |   |   |   |       |           |       +---qtile
    |   |   |   |   |       |           |       |       qtile.log
    |   |   |   |   |       |           |       |       
    |   |   |   |   |       |           |       \---xorg
    |   |   |   |   |       |           |               Xorg.0.log
    |   |   |   |   |       |           |               Xorg.0.log.old
    |   |   |   |   |       |           |               Xorg.1.log
    |   |   |   |   |       |           |               Xorg.1.log.old
    |   |   |   |   |       |           |               
    |   |   |   |   |       |           +---.vim
    |   |   |   |   |       |           |       .netrwhist
    |   |   |   |   |       |           |       
    |   |   |   |   |       |           \---Personal
    |   |   |   |   |       |               \---Rices
    |   |   |   |   |       |                   +---2021-06-12_0638H
    |   |   |   |   |       |                   |   |   .bashrc
    |   |   |   |   |       |                   |   |   .bash_logout
    |   |   |   |   |       |                   |   |   .bash_profile
    |   |   |   |   |       |                   |   |   .gtkrc-2.0
    |   |   |   |   |       |                   |   |   .xinitrc
    |   |   |   |   |       |                   |   |   start-commands.log
    |   |   |   |   |       |                   |   |   start-sys-svc.log
    |   |   |   |   |       |                   |   |   
    |   |   |   |   |       |                   |   +---.config
    |   |   |   |   |       |                   |   |   +---bspwm
    |   |   |   |   |       |                   |   |   |       bspwmrc
    |   |   |   |   |       |                   |   |   |       
    |   |   |   |   |       |                   |   |   +---conky
    |   |   |   |   |       |                   |   |   |       conky.conf
    |   |   |   |   |       |                   |   |   |       
    |   |   |   |   |       |                   |   |   +---gtk-2.0
    |   |   |   |   |       |                   |   |   |       gtkfilechooser.ini
    |   |   |   |   |       |                   |   |   |       
    |   |   |   |   |       |                   |   |   +---gtk-3.0
    |   |   |   |   |       |                   |   |   |       settings.ini
    |   |   |   |   |       |                   |   |   |       
    |   |   |   |   |       |                   |   |   +---herbstluftwm
    |   |   |   |   |       |                   |   |   |       autostart
    |   |   |   |   |       |                   |   |   |       
    |   |   |   |   |       |                   |   |   +---libfm
    |   |   |   |   |       |                   |   |   |       libfm.conf
    |   |   |   |   |       |                   |   |   |       
    |   |   |   |   |       |                   |   |   +---nitrogen
    |   |   |   |   |       |                   |   |   |       bg-saved.cfg
    |   |   |   |   |       |                   |   |   |       nitrogen.cfg
    |   |   |   |   |       |                   |   |   |       
    |   |   |   |   |       |                   |   |   +---pcmanfm
    |   |   |   |   |       |                   |   |   |   \---default
    |   |   |   |   |       |                   |   |   |           pcmanfm.conf
    |   |   |   |   |       |                   |   |   |           
    |   |   |   |   |       |                   |   |   +---qtile
    |   |   |   |   |       |                   |   |   |   |   config.py
    |   |   |   |   |       |                   |   |   |   |   config.py.default
    |   |   |   |   |       |                   |   |   |   |   extlib.py
    |   |   |   |   |       |                   |   |   |   |   extlib.sh
    |   |   |   |   |       |                   |   |   |   |   
    |   |   |   |   |       |                   |   |   |   \---__pycache__
    |   |   |   |   |       |                   |   |   |           config.cpython-39.pyc
    |   |   |   |   |       |                   |   |   |           extlib.cpython-39.pyc
    |   |   |   |   |       |                   |   |   |           
    |   |   |   |   |       |                   |   |   \---sxhkd
    |   |   |   |   |       |                   |   |           sxhkdrc
    |   |   |   |   |       |                   |   |           
    |   |   |   |   |       |                   |   +---.icons
    |   |   |   |   |       |                   |   |   \---default
    |   |   |   |   |       |                   |   |           index.theme
    |   |   |   |   |       |                   |   |           
    |   |   |   |   |       |                   |   +---.local
    |   |   |   |   |       |                   |   |   \---share
    |   |   |   |   |       |                   |   |       |   recently-used.xbel
    |   |   |   |   |       |                   |   |       |   
    |   |   |   |   |       |                   |   |       +---qtile
    |   |   |   |   |       |                   |   |       |       qtile.log
    |   |   |   |   |       |                   |   |       |       
    |   |   |   |   |       |                   |   |       \---xorg
    |   |   |   |   |       |                   |   |               Xorg.0.log
    |   |   |   |   |       |                   |   |               Xorg.0.log.old
    |   |   |   |   |       |                   |   |               Xorg.1.log
    |   |   |   |   |       |                   |   |               Xorg.1.log.old
    |   |   |   |   |       |                   |   |               
    |   |   |   |   |       |                   |   \---.vim
    |   |   |   |   |       |                   |           .netrwhist
    |   |   |   |   |       |                   |           
    |   |   |   |   |       |                   \---zips
    |   |   |   |   |       |                           2021-06-12_0638H.zip
    |   |   |   |   |       |                           
    |   |   |   |   |       +---Reference_Profile-1
    |   |   |   |   |       |   +---Documents
    |   |   |   |   |       |   |       distro-planner
    |   |   |   |   |       |   |       profile-list
    |   |   |   |   |       |   |       
    |   |   |   |   |       |   \---install-scripts
    |   |   |   |   |       |           example.sh
    |   |   |   |   |       |           installer-manual.sh
    |   |   |   |   |       |           installer-ux.min.sh
    |   |   |   |   |       |           installer.sh
    |   |   |   |   |       |           postinstallation-core-packages.sh
    |   |   |   |   |       |           postinstallations-root.sh
    |   |   |   |   |       |           postinstallations.sh
    |   |   |   |   |       |           
    |   |   |   |   |       \---VBox_USBoot-1
    |   |   |   |   |           +---Documents
    |   |   |   |   |           |       profile-list
    |   |   |   |   |           |       
    |   |   |   |   |           +---Dotfiles
    |   |   |   |   |           |   +---2021-06-20_1148H
    |   |   |   |   |           |   |   |   .bashrc
    |   |   |   |   |           |   |   |   .xinitrc
    |   |   |   |   |           |   |   |   .Xresources
    |   |   |   |   |           |   |   |   
    |   |   |   |   |           |   |   +---.config
    |   |   |   |   |           |   |   |   +---bspwm
    |   |   |   |   |           |   |   |   |       bspwmrc
    |   |   |   |   |           |   |   |   |       bspwmrc.test
    |   |   |   |   |           |   |   |   |       panel
    |   |   |   |   |           |   |   |   |       panel_bar
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---conky
    |   |   |   |   |           |   |   |   |       conky-keybindings.conf
    |   |   |   |   |           |   |   |   |       conky-middle_left.conf
    |   |   |   |   |           |   |   |   |       conky-middle_right.conf
    |   |   |   |   |           |   |   |   |       conky-TODOList.conf
    |   |   |   |   |           |   |   |   |       conky.conf.default
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---dunst
    |   |   |   |   |           |   |   |   |       dunstrc
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---eww
    |   |   |   |   |           |   |   |   |   |   eww-bar.png
    |   |   |   |   |           |   |   |   |   |   eww.scss
    |   |   |   |   |           |   |   |   |   |   eww.xml
    |   |   |   |   |           |   |   |   |   |   
    |   |   |   |   |           |   |   |   |   \---scripts
    |   |   |   |   |           |   |   |   |           getram
    |   |   |   |   |           |   |   |   |           getvol
    |   |   |   |   |           |   |   |   |           
    |   |   |   |   |           |   |   |   +---htop
    |   |   |   |   |           |   |   |   |       htoprc
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---libfm
    |   |   |   |   |           |   |   |   |       libfm.conf
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---libreoffice
    |   |   |   |   |           |   |   |   |   \---4
    |   |   |   |   |           |   |   |   |       \---user
    |   |   |   |   |           |   |   |   |           |   registrymodifications.xcu
    |   |   |   |   |           |   |   |   |           |   
    |   |   |   |   |           |   |   |   |           +---autotext
    |   |   |   |   |           |   |   |   |           |       mytexts.bau
    |   |   |   |   |           |   |   |   |           |       
    |   |   |   |   |           |   |   |   |           +---basic
    |   |   |   |   |           |   |   |   |           |   |   dialog.xlc
    |   |   |   |   |           |   |   |   |           |   |   script.xlc
    |   |   |   |   |           |   |   |   |           |   |   
    |   |   |   |   |           |   |   |   |           |   \---Standard
    |   |   |   |   |           |   |   |   |           |           dialog.xlb
    |   |   |   |   |           |   |   |   |           |           Module1.xba
    |   |   |   |   |           |   |   |   |           |           script.xlb
    |   |   |   |   |           |   |   |   |           |           
    |   |   |   |   |           |   |   |   |           +---config
    |   |   |   |   |           |   |   |   |           |       autotbl.fmt
    |   |   |   |   |           |   |   |   |           |       javasettings_Linux_X86_64.xml
    |   |   |   |   |           |   |   |   |           |       
    |   |   |   |   |           |   |   |   |           +---database
    |   |   |   |   |           |   |   |   |           |   |   biblio.odb
    |   |   |   |   |           |   |   |   |           |   |   evolocal.odb
    |   |   |   |   |           |   |   |   |           |   |   
    |   |   |   |   |           |   |   |   |           |   \---biblio
    |   |   |   |   |           |   |   |   |           |           biblio.dbf
    |   |   |   |   |           |   |   |   |           |           biblio.dbt
    |   |   |   |   |           |   |   |   |           |           
    |   |   |   |   |           |   |   |   |           +---extensions
    |   |   |   |   |           |   |   |   |           |   |   buildid
    |   |   |   |   |           |   |   |   |           |   |   
    |   |   |   |   |           |   |   |   |           |   +---bundled
    |   |   |   |   |           |   |   |   |           |   |   |   extensions.pmap
    |   |   |   |   |           |   |   |   |           |   |   |   lastsynchronized
    |   |   |   |   |           |   |   |   |           |   |   |   
    |   |   |   |   |           |   |   |   |           |   |   \---registry
    |   |   |   |   |           |   |   |   |           |   |       +---com.sun.star.comp.deployment.bundle.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |           |   |       |       backenddb.xml
    |   |   |   |   |           |   |   |   |           |   |       |       
    |   |   |   |   |           |   |   |   |           |   |       +---com.sun.star.comp.deployment.component.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |           |   |       |       unorc
    |   |   |   |   |           |   |   |   |           |   |       |       
    |   |   |   |   |           |   |   |   |           |   |       +---com.sun.star.comp.deployment.configuration.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |           |   |       |       backenddb.xml
    |   |   |   |   |           |   |   |   |           |   |       |       configmgr.ini
    |   |   |   |   |           |   |   |   |           |   |       |       
    |   |   |   |   |           |   |   |   |           |   |       +---com.sun.star.comp.deployment.help.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |           |   |       |       backenddb.xml
    |   |   |   |   |           |   |   |   |           |   |       |       
    |   |   |   |   |           |   |   |   |           |   |       \---com.sun.star.comp.deployment.script.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |           |   |               backenddb.xml
    |   |   |   |   |           |   |   |   |           |   |               
    |   |   |   |   |           |   |   |   |           |   +---shared
    |   |   |   |   |           |   |   |   |           |   |   |   lastsynchronized
    |   |   |   |   |           |   |   |   |           |   |   |   
    |   |   |   |   |           |   |   |   |           |   |   \---registry
    |   |   |   |   |           |   |   |   |           |   |       +---com.sun.star.comp.deployment.configuration.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |           |   |       |       backenddb.xml
    |   |   |   |   |           |   |   |   |           |   |       |       
    |   |   |   |   |           |   |   |   |           |   |       \---com.sun.star.comp.deployment.help.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |           |   |               backenddb.xml
    |   |   |   |   |           |   |   |   |           |   |               
    |   |   |   |   |           |   |   |   |           |   \---tmp
    |   |   |   |   |           |   |   |   |           |       \---registry
    |   |   |   |   |           |   |   |   |           |           +---com.sun.star.comp.deployment.configuration.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |           |           |       backenddb.xml
    |   |   |   |   |           |   |   |   |           |           |       
    |   |   |   |   |           |   |   |   |           |           \---com.sun.star.comp.deployment.help.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |           |                   backenddb.xml
    |   |   |   |   |           |   |   |   |           |                   
    |   |   |   |   |           |   |   |   |           +---gallery
    |   |   |   |   |           |   |   |   |           |       sg30.sdv
    |   |   |   |   |           |   |   |   |           |       sg30.thm
    |   |   |   |   |           |   |   |   |           |       
    |   |   |   |   |           |   |   |   |           +---pack
    |   |   |   |   |           |   |   |   |           |   |   ExtensionInfo.pack
    |   |   |   |   |           |   |   |   |           |   |   registrymodifications.pack
    |   |   |   |   |           |   |   |   |           |   |   
    |   |   |   |   |           |   |   |   |           |   +---autotext
    |   |   |   |   |           |   |   |   |           |   |       mytexts.pack
    |   |   |   |   |           |   |   |   |           |   |       
    |   |   |   |   |           |   |   |   |           |   +---basic
    |   |   |   |   |           |   |   |   |           |   |   |   dialog.pack
    |   |   |   |   |           |   |   |   |           |   |   |   script.pack
    |   |   |   |   |           |   |   |   |           |   |   |   
    |   |   |   |   |           |   |   |   |           |   |   \---Standard
    |   |   |   |   |           |   |   |   |           |   |           dialog.pack
    |   |   |   |   |           |   |   |   |           |   |           Module1.pack
    |   |   |   |   |           |   |   |   |           |   |           script.pack
    |   |   |   |   |           |   |   |   |           |   |           
    |   |   |   |   |           |   |   |   |           |   +---config
    |   |   |   |   |           |   |   |   |           |   |       autotbl.pack
    |   |   |   |   |           |   |   |   |           |   |       javasettings_Linux_X86_64.pack
    |   |   |   |   |           |   |   |   |           |   |       
    |   |   |   |   |           |   |   |   |           |   \---database
    |   |   |   |   |           |   |   |   |           |       |   biblio.pack
    |   |   |   |   |           |   |   |   |           |       |   evolocal.pack
    |   |   |   |   |           |   |   |   |           |       |   
    |   |   |   |   |           |   |   |   |           |       \---biblio
    |   |   |   |   |           |   |   |   |           |               biblio.pack
    |   |   |   |   |           |   |   |   |           |               
    |   |   |   |   |           |   |   |   |           \---uno_packages
    |   |   |   |   |           |   |   |   |               \---cache
    |   |   |   |   |           |   |   |   |                   \---registry
    |   |   |   |   |           |   |   |   |                       +---com.sun.star.comp.deployment.configuration.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |                       |       backenddb.xml
    |   |   |   |   |           |   |   |   |                       |       
    |   |   |   |   |           |   |   |   |                       \---com.sun.star.comp.deployment.help.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |                               backenddb.xml
    |   |   |   |   |           |   |   |   |                               
    |   |   |   |   |           |   |   |   +---neofetch
    |   |   |   |   |           |   |   |   |       config.conf
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---nitrogen
    |   |   |   |   |           |   |   |   |       nitrogen.cfg
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---pcmanfm
    |   |   |   |   |           |   |   |   |   +---asura
    |   |   |   |   |           |   |   |   |   |       desktop-items-0.conf
    |   |   |   |   |           |   |   |   |   |       pcmanfm.conf
    |   |   |   |   |           |   |   |   |   |       
    |   |   |   |   |           |   |   |   |   \---default
    |   |   |   |   |           |   |   |   |           desktop-items-0.conf
    |   |   |   |   |           |   |   |   |           pcmanfm.conf
    |   |   |   |   |           |   |   |   |           
    |   |   |   |   |           |   |   |   +---picom
    |   |   |   |   |           |   |   |   |       picom.conf
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---sxhkd
    |   |   |   |   |           |   |   |   |       bspwm_smart_move
    |   |   |   |   |           |   |   |   |       sxhkdrc
    |   |   |   |   |           |   |   |   |       sxhkdrc.default
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---vifm
    |   |   |   |   |           |   |   |   |   |   vifm-help.txt
    |   |   |   |   |           |   |   |   |   |   vifminfo.json
    |   |   |   |   |           |   |   |   |   |   vifmrc
    |   |   |   |   |           |   |   |   |   |   
    |   |   |   |   |           |   |   |   |   +---colors
    |   |   |   |   |           |   |   |   |   |       Default.vifm
    |   |   |   |   |           |   |   |   |   |       
    |   |   |   |   |           |   |   |   |   +---defaults
    |   |   |   |   |           |   |   |   |   |       vifm-help.txt
    |   |   |   |   |           |   |   |   |   |       vifmrc
    |   |   |   |   |           |   |   |   |   |       
    |   |   |   |   |           |   |   |   |   \---scripts
    |   |   |   |   |           |   |   |   |           README
    |   |   |   |   |           |   |   |   |           
    |   |   |   |   |           |   |   |   \---vis
    |   |   |   |   |           |   |   |       |   config
    |   |   |   |   |           |   |   |       |   vis.log
    |   |   |   |   |           |   |   |       |   
    |   |   |   |   |           |   |   |       \---colors
    |   |   |   |   |           |   |   |               basic_colors
    |   |   |   |   |           |   |   |               rainbow
    |   |   |   |   |           |   |   |               
    |   |   |   |   |           |   |   +---.icons
    |   |   |   |   |           |   |   |   |   cursors
    |   |   |   |   |           |   |   |   |   
    |   |   |   |   |           |   |   |   \---default
    |   |   |   |   |           |   |   |           cursors
    |   |   |   |   |           |   |   |           index.theme
    |   |   |   |   |           |   |   |           setcursor.sh
    |   |   |   |   |           |   |   |           
    |   |   |   |   |           |   |   +---.scripts
    |   |   |   |   |           |   |   |   |   clipkger.sh
    |   |   |   |   |           |   |   |   |   dotfilemgr.sh
    |   |   |   |   |           |   |   |   |   gitmgr.sh
    |   |   |   |   |           |   |   |   |   gtk_util.sh
    |   |   |   |   |           |   |   |   |   notepad.sh
    |   |   |   |   |           |   |   |   |   screenlocker.sh
    |   |   |   |   |           |   |   |   |   suckless_downloadpatches.sh
    |   |   |   |   |           |   |   |   |   
    |   |   |   |   |           |   |   |   +---libraries
    |   |   |   |   |           |   |   |   |       extlib.sh
    |   |   |   |   |           |   |   |   |       maths.sh
    |   |   |   |   |           |   |   |   |       pacman.sh
    |   |   |   |   |           |   |   |   |       rice.sh
    |   |   |   |   |           |   |   |   |       strutil.sh
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---st
    |   |   |   |   |           |   |   |   |       ff-blur
    |   |   |   |   |           |   |   |   |       ff-border
    |   |   |   |   |           |   |   |   |       ff-bright
    |   |   |   |   |           |   |   |   |       to_ff.sh
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   \---vim
    |   |   |   |   |           |   |   |           templatesel.sh
    |   |   |   |   |           |   |   |           
    |   |   |   |   |           |   |   +---.urxvt
    |   |   |   |   |           |   |   |   \---ext
    |   |   |   |   |           |   |   |           resize-font
    |   |   |   |   |           |   |   |           
    |   |   |   |   |           |   |   +---.vim
    |   |   |   |   |           |   |   |   |   .netrwhist
    |   |   |   |   |           |   |   |   |   vimrc
    |   |   |   |   |           |   |   |   |   
    |   |   |   |   |           |   |   |   +---autoload
    |   |   |   |   |           |   |   |   |       plug.vim
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   \---templates
    |   |   |   |   |           |   |   |           index.html
    |   |   |   |   |           |   |   |           main.c
    |   |   |   |   |           |   |   |           main.cpp
    |   |   |   |   |           |   |   |           main.cs
    |   |   |   |   |           |   |   |           main.css
    |   |   |   |   |           |   |   |           main.h
    |   |   |   |   |           |   |   |           main.java
    |   |   |   |   |           |   |   |           main.js
    |   |   |   |   |           |   |   |           main.min.sh
    |   |   |   |   |           |   |   |           main.py
    |   |   |   |   |           |   |   |           main.sh
    |   |   |   |   |           |   |   |           README.md
    |   |   |   |   |           |   |   |           
    |   |   |   |   |           |   |   +---Desktop
    |   |   |   |   |           |   |   |   +---apps
    |   |   |   |   |           |   |   |   |       rar
    |   |   |   |   |           |   |   |   |       unrar
    |   |   |   |   |           |   |   |   |       xmenu.sh
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---drafts
    |   |   |   |   |           |   |   |   |       archwiki-pages.sh
    |   |   |   |   |           |   |   |   |       bspwm_designer.sh
    |   |   |   |   |           |   |   |   |       cowsayer.sh
    |   |   |   |   |           |   |   |   |       pages
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   \---portable
    |   |   |   |   |           |   |   |       +---doc
    |   |   |   |   |           |   |   |       |   \---defaults
    |   |   |   |   |           |   |   |       |           sofficerc
    |   |   |   |   |           |   |   |       |           
    |   |   |   |   |           |   |   |       +---media
    |   |   |   |   |           |   |   |       |   \---Images
    |   |   |   |   |           |   |   |       |       +---JPG
    |   |   |   |   |           |   |   |       |       |       wallhaven-nature.jpg
    |   |   |   |   |           |   |   |       |       |       wallhaven-Ocean.jpg
    |   |   |   |   |           |   |   |       |       |       wallhaven-Tokyo.jpg
    |   |   |   |   |           |   |   |       |       |       
    |   |   |   |   |           |   |   |       |       \---PNG
    |   |   |   |   |           |   |   |       |               DigitalOcean
    |   |   |   |   |           |   |   |       |               nier-automata-menu-background.png
    |   |   |   |   |           |   |   |       |               wallhaven-win10.png
    |   |   |   |   |           |   |   |       |               
    |   |   |   |   |           |   |   |       +---projects
    |   |   |   |   |           |   |   |       |   +---coding
    |   |   |   |   |           |   |   |       |   |   +---cli
    |   |   |   |   |           |   |   |       |   |   |   \---PracticeGround_TestBench
    |   |   |   |   |           |   |   |       |   |   |       +---cpp
    |   |   |   |   |           |   |   |       |   |   |       |   \---workspace
    |   |   |   |   |           |   |   |       |   |   |       |       \---src
    |   |   |   |   |           |   |   |       |   |   |       |           |   extlib.h
    |   |   |   |   |           |   |   |       |   |   |       |           |   main.cpp
    |   |   |   |   |           |   |   |       |   |   |       |           |   main.exe
    |   |   |   |   |           |   |   |       |   |   |       |           |   make.sh
    |   |   |   |   |           |   |   |       |   |   |       |           |   
    |   |   |   |   |           |   |   |       |   |   |       |           \---resources
    |   |   |   |   |           |   |   |       |   |   |       |               |   changelogs
    |   |   |   |   |           |   |   |       |   |   |       |               |   
    |   |   |   |   |           |   |   |       |   |   |       |               \---out
    |   |   |   |   |           |   |   |       |   |   |       |                       out.txt
    |   |   |   |   |           |   |   |       |   |   |       |                       
    |   |   |   |   |           |   |   |       |   |   |       +---python
    |   |   |   |   |           |   |   |       |   |   |       |   \---workspace
    |   |   |   |   |           |   |   |       |   |   |       |       \---resources
    |   |   |   |   |           |   |   |       |   |   |       |           \---Dictionary
    |   |   |   |   |           |   |   |       |   |   |       |                   lang.py
    |   |   |   |   |           |   |   |       |   |   |       |                   
    |   |   |   |   |           |   |   |       |   |   |       \---resources
    |   |   |   |   |           |   |   |       |   |   |               README.md
    |   |   |   |   |           |   |   |       |   |   |               
    |   |   |   |   |           |   |   |       |   |   +---gui
    |   |   |   |   |           |   |   |       |   |   |   +---AutoGUI
    |   |   |   |   |           |   |   |       |   |   |   |   \---C++
    |   |   |   |   |           |   |   |       |   |   |   |       \---workspace
    |   |   |   |   |           |   |   |       |   |   |   |           +---resources
    |   |   |   |   |           |   |   |       |   |   |   |           |       README.md
    |   |   |   |   |           |   |   |       |   |   |   |           |       
    |   |   |   |   |           |   |   |       |   |   |   |           \---src
    |   |   |   |   |           |   |   |       |   |   |   |                   main.cpp
    |   |   |   |   |           |   |   |       |   |   |   |                   main.exe
    |   |   |   |   |           |   |   |       |   |   |   |                   make.sh
    |   |   |   |   |           |   |   |       |   |   |   |                   
    |   |   |   |   |           |   |   |       |   |   |   \---PracticeGround_TestBench
    |   |   |   |   |           |   |   |       |   |   |       +---cpp
    |   |   |   |   |           |   |   |       |   |   |       |   \---workspace
    |   |   |   |   |           |   |   |       |   |   |       |       \---src
    |   |   |   |   |           |   |   |       |   |   |       |           |   main.cpp
    |   |   |   |   |           |   |   |       |   |   |       |           |   main.exe
    |   |   |   |   |           |   |   |       |   |   |       |           |   make.sh
    |   |   |   |   |           |   |   |       |   |   |       |           |   wxGUI.cpp
    |   |   |   |   |           |   |   |       |   |   |       |           |   wxGUI.exe
    |   |   |   |   |           |   |   |       |   |   |       |           |   
    |   |   |   |   |           |   |   |       |   |   |       |           +---resources
    |   |   |   |   |           |   |   |       |   |   |       |           |   \---out
    |   |   |   |   |           |   |   |       |   |   |       |           |           out.txt
    |   |   |   |   |           |   |   |       |   |   |       |           |           
    |   |   |   |   |           |   |   |       |   |   |       |           \---samples
    |   |   |   |   |           |   |   |       |   |   |       |                   minimal.cpp
    |   |   |   |   |           |   |   |       |   |   |       |                   minimal.exe
    |   |   |   |   |           |   |   |       |   |   |       |                   
    |   |   |   |   |           |   |   |       |   |   |       +---python
    |   |   |   |   |           |   |   |       |   |   |       |   \---workspace
    |   |   |   |   |           |   |   |       |   |   |       |       \---resources
    |   |   |   |   |           |   |   |       |   |   |       |           \---Dictionary
    |   |   |   |   |           |   |   |       |   |   |       |                   lang.py
    |   |   |   |   |           |   |   |       |   |   |       |                   
    |   |   |   |   |           |   |   |       |   |   |       \---resources
    |   |   |   |   |           |   |   |       |   |   |               README.md
    |   |   |   |   |           |   |   |       |   |   |               
    |   |   |   |   |           |   |   |       |   |   +---python
    |   |   |   |   |           |   |   |       |   |   |   \---PracticeGround-TestBench
    |   |   |   |   |           |   |   |       |   |   |       \---workspace
    |   |   |   |   |           |   |   |       |   |   |           |   main.py
    |   |   |   |   |           |   |   |       |   |   |           |   
    |   |   |   |   |           |   |   |       |   |   |           \---resources
    |   |   |   |   |           |   |   |       |   |   |               \---Dictionary
    |   |   |   |   |           |   |   |       |   |   |                       lang.py
    |   |   |   |   |           |   |   |       |   |   |                       
    |   |   |   |   |           |   |   |       |   |   \---Template
    |   |   |   |   |           |   |   |       |   |       +---files
    |   |   |   |   |           |   |   |       |   |       |   |   make.sh
    |   |   |   |   |           |   |   |       |   |       |   |   
    |   |   |   |   |           |   |   |       |   |       |   +---ARCHIVE
    |   |   |   |   |           |   |   |       |   |       |   |   \---2021-04-25 0011H
    |   |   |   |   |           |   |   |       |   |       |   |           make.sh
    |   |   |   |   |           |   |   |       |   |       |   |           
    |   |   |   |   |           |   |   |       |   |       |   \---cpp
    |   |   |   |   |           |   |   |       |   |       |       \---GUI
    |   |   |   |   |           |   |   |       |   |       |           \---wxWidgets
    |   |   |   |   |           |   |   |       |   |       |                   main.cpp
    |   |   |   |   |           |   |   |       |   |       |                   
    |   |   |   |   |           |   |   |       |   |       \---structure
    |   |   |   |   |           |   |   |       |   |           +---cli
    |   |   |   |   |           |   |   |       |   |           |   \---cpp
    |   |   |   |   |           |   |   |       |   |           |       \---workspace
    |   |   |   |   |           |   |   |       |   |           |           +---resources
    |   |   |   |   |           |   |   |       |   |           |           |       README.md
    |   |   |   |   |           |   |   |       |   |           |           |       
    |   |   |   |   |           |   |   |       |   |           |           \---src
    |   |   |   |   |           |   |   |       |   |           |                   make.sh
    |   |   |   |   |           |   |   |       |   |           |                   
    |   |   |   |   |           |   |   |       |   |           +---gui
    |   |   |   |   |           |   |   |       |   |           |   \---cpp
    |   |   |   |   |           |   |   |       |   |           |       \---workspace
    |   |   |   |   |           |   |   |       |   |           |           +---resources
    |   |   |   |   |           |   |   |       |   |           |           |       README.md
    |   |   |   |   |           |   |   |       |   |           |           |       
    |   |   |   |   |           |   |   |       |   |           |           \---src
    |   |   |   |   |           |   |   |       |   |           |                   make.sh
    |   |   |   |   |           |   |   |       |   |           |                   
    |   |   |   |   |           |   |   |       |   |           +---java
    |   |   |   |   |           |   |   |       |   |           |   \---workspace
    |   |   |   |   |           |   |   |       |   |           |       |   README.md
    |   |   |   |   |           |   |   |       |   |           |       |   
    |   |   |   |   |           |   |   |       |   |           |       \---src
    |   |   |   |   |           |   |   |       |   |           |               make.sh
    |   |   |   |   |           |   |   |       |   |           |               
    |   |   |   |   |           |   |   |       |   |           +---python
    |   |   |   |   |           |   |   |       |   |           |   \---workspace
    |   |   |   |   |           |   |   |       |   |           |       |   README.md
    |   |   |   |   |           |   |   |       |   |           |       |   
    |   |   |   |   |           |   |   |       |   |           |       \---resources
    |   |   |   |   |           |   |   |       |   |           |           \---Dictionary
    |   |   |   |   |           |   |   |       |   |           |                   lang.py
    |   |   |   |   |           |   |   |       |   |           |                   
    |   |   |   |   |           |   |   |       |   |           \---web-design
    |   |   |   |   |           |   |   |       |   |               \---workspace
    |   |   |   |   |           |   |   |       |   |                   |   index.html
    |   |   |   |   |           |   |   |       |   |                   |   run.sh
    |   |   |   |   |           |   |   |       |   |                   |   
    |   |   |   |   |           |   |   |       |   |                   +---resources
    |   |   |   |   |           |   |   |       |   |                   |   +---docs
    |   |   |   |   |           |   |   |       |   |                   |   |       README.md
    |   |   |   |   |           |   |   |       |   |                   |   |       
    |   |   |   |   |           |   |   |       |   |                   |   \---styles
    |   |   |   |   |           |   |   |       |   |                   |           main.css
    |   |   |   |   |           |   |   |       |   |                   |           
    |   |   |   |   |           |   |   |       |   |                   \---scripts
    |   |   |   |   |           |   |   |       |   |                           main.js
    |   |   |   |   |           |   |   |       |   |                           
    |   |   |   |   |           |   |   |       |   +---Game-Guides
    |   |   |   |   |           |   |   |       |   |   \---AllGames
    |   |   |   |   |           |   |   |       |   |       \---workspace
    |   |   |   |   |           |   |   |       |   |           \---Python
    |   |   |   |   |           |   |   |       |   |               \---ProjEDEN
    |   |   |   |   |           |   |   |       |   |                   \---src
    |   |   |   |   |           |   |   |       |   |                           autorun.sh
    |   |   |   |   |           |   |   |       |   |                           main.py
    |   |   |   |   |           |   |   |       |   |                           out_data.txt
    |   |   |   |   |           |   |   |       |   |                           
    |   |   |   |   |           |   |   |       |   +---Linux
    |   |   |   |   |           |   |   |       |   |   +---general
    |   |   |   |   |           |   |   |       |   |   |       shlib.sh
    |   |   |   |   |           |   |   |       |   |   |       
    |   |   |   |   |           |   |   |       |   |   \---utilities
    |   |   |   |   |           |   |   |       |   |       +---cronjob-scripts
    |   |   |   |   |           |   |   |       |   |       |       debug.sh
    |   |   |   |   |           |   |   |       |   |       |       debug_21-04-16.log
    |   |   |   |   |           |   |   |       |   |       |       pkg-autoupdater.sh
    |   |   |   |   |           |   |   |       |   |       |       
    |   |   |   |   |           |   |   |       |   |       +---dmenu
    |   |   |   |   |           |   |   |       |   |       |   \---scripts
    |   |   |   |   |           |   |   |       |   |       |           templates
    |   |   |   |   |           |   |   |       |   |       |           
    |   |   |   |   |           |   |   |       |   |       +---git
    |   |   |   |   |           |   |   |       |   |       |       gitlib.sh
    |   |   |   |   |           |   |   |       |   |       |       gitmgr.sh
    |   |   |   |   |           |   |   |       |   |       |       
    |   |   |   |   |           |   |   |       |   |       +---setups
    |   |   |   |   |           |   |   |       |   |       |       install-aur.sh
    |   |   |   |   |           |   |   |       |   |       |       
    |   |   |   |   |           |   |   |       |   |       \---wrappers
    |   |   |   |   |           |   |   |       |   |           |   makelib.sh
    |   |   |   |   |           |   |   |       |   |           |   pacinstaller.sh
    |   |   |   |   |           |   |   |       |   |           |   screenshot.sh
    |   |   |   |   |           |   |   |       |   |           |   surfer.sh
    |   |   |   |   |           |   |   |       |   |           |   vimopen.sh
    |   |   |   |   |           |   |   |       |   |           |   
    |   |   |   |   |           |   |   |       |   |           +---apps
    |   |   |   |   |           |   |   |       |   |           |   \---eww
    |   |   |   |   |           |   |   |       |   |           |           wreww.sh
    |   |   |   |   |           |   |   |       |   |           |           
    |   |   |   |   |           |   |   |       |   |           \---multi-maker
    |   |   |   |   |           |   |   |       |   |                   make.sh
    |   |   |   |   |           |   |   |       |   |                   README.md
    |   |   |   |   |           |   |   |       |   |                   
    |   |   |   |   |           |   |   |       |   \---Templates
    |   |   |   |   |           |   |   |       |       |   autorun.sh
    |   |   |   |   |           |   |   |       |       |   make.sh
    |   |   |   |   |           |   |   |       |       |   
    |   |   |   |   |           |   |   |       |       \---ARCHIVE
    |   |   |   |   |           |   |   |       |           +---autorunner
    |   |   |   |   |           |   |   |       |           |   \---2021-03-31 0934H
    |   |   |   |   |           |   |   |       |           |           autorun.sh
    |   |   |   |   |           |   |   |       |           |           
    |   |   |   |   |           |   |   |       |           \---make_shellscript
    |   |   |   |   |           |   |   |       |               \---2021-04-25 0011H
    |   |   |   |   |           |   |   |       |                       make.sh
    |   |   |   |   |           |   |   |       |                       
    |   |   |   |   |           |   |   |       \---repos
    |   |   |   |   |           |   |   |           \---rar
    |   |   |   |   |           |   |   |                   nier_automata_cursor__hack_edition__v2_by_juliodrai_dc6aarz.rar
    |   |   |   |   |           |   |   |                   
    |   |   |   |   |           |   |   \---personal
    |   |   |   |   |           |   |       +---autostart
    |   |   |   |   |           |   |       |       autostart.sh
    |   |   |   |   |           |   |       |       wallpaper.jpg
    |   |   |   |   |           |   |       |       
    |   |   |   |   |           |   |       +---codes
    |   |   |   |   |           |   |       |       compilers.sh
    |   |   |   |   |           |   |       |       
    |   |   |   |   |           |   |       +---designs
    |   |   |   |   |           |   |       |   \---XOrg
    |   |   |   |   |           |   |       |       \---xresources
    |   |   |   |   |           |   |       |               genera.xresources
    |   |   |   |   |           |   |       |               gruvbox-dark.xresources
    |   |   |   |   |           |   |       |               matrix-green.xresources
    |   |   |   |   |           |   |       |               wal-nature.xresources
    |   |   |   |   |           |   |       |               
    |   |   |   |   |           |   |       +---dotfiles
    |   |   |   |   |           |   |       |   +---bars
    |   |   |   |   |           |   |       |   |   |   bar
    |   |   |   |   |           |   |       |   |   |   
    |   |   |   |   |           |   |       |   |   +---ARCHIVE
    |   |   |   |   |           |   |       |   |   |   \---2021-04-18 1207H
    |   |   |   |   |           |   |       |   |   |           bar
    |   |   |   |   |           |   |       |   |   |           
    |   |   |   |   |           |   |       |   |   \---lemonbar
    |   |   |   |   |           |   |       |   |       |   bspwm-widgets.sh
    |   |   |   |   |           |   |       |   |       |   lemonbar_Desc.sh
    |   |   |   |   |           |   |       |   |       |   lemonbar_Func.sh
    |   |   |   |   |           |   |       |   |       |   lemonbar_Run.sh
    |   |   |   |   |           |   |       |   |       |   widgets.sh
    |   |   |   |   |           |   |       |   |       |   
    |   |   |   |   |           |   |       |   |       +---profiles
    |   |   |   |   |           |   |       |   |       |   +---2021-04-17 2237H
    |   |   |   |   |           |   |       |   |       |   |       bar
    |   |   |   |   |           |   |       |   |       |   |       lemonbar.sh
    |   |   |   |   |           |   |       |   |       |   |       widgets.sh
    |   |   |   |   |           |   |       |   |       |   |       
    |   |   |   |   |           |   |       |   |       |   +---2021-04-18 0946H
    |   |   |   |   |           |   |       |   |       |   |       lemonbar_Desc.sh
    |   |   |   |   |           |   |       |   |       |   |       lemonbar_Run.sh
    |   |   |   |   |           |   |       |   |       |   |       widgets.sh
    |   |   |   |   |           |   |       |   |       |   |       
    |   |   |   |   |           |   |       |   |       |   +---2021-04-19 1007H
    |   |   |   |   |           |   |       |   |       |   |       lemonbar_Desc.sh
    |   |   |   |   |           |   |       |   |       |   |       lemonbar_Run.sh
    |   |   |   |   |           |   |       |   |       |   |       widgets.sh
    |   |   |   |   |           |   |       |   |       |   |       
    |   |   |   |   |           |   |       |   |       |   +---2021-04-19 1130H
    |   |   |   |   |           |   |       |   |       |   |       bspwm-widgets.sh
    |   |   |   |   |           |   |       |   |       |   |       lemonbar_Desc.sh
    |   |   |   |   |           |   |       |   |       |   |       lemonbar_Func.sh
    |   |   |   |   |           |   |       |   |       |   |       lemonbar_Run.sh
    |   |   |   |   |           |   |       |   |       |   |       widgets.sh
    |   |   |   |   |           |   |       |   |       |   |       
    |   |   |   |   |           |   |       |   |       |   \---2021-04-20 1001H
    |   |   |   |   |           |   |       |   |       |           bspwm-widgets.sh
    |   |   |   |   |           |   |       |   |       |           lemonbar_Desc.sh
    |   |   |   |   |           |   |       |   |       |           lemonbar_Func.sh
    |   |   |   |   |           |   |       |   |       |           lemonbar_Run.sh
    |   |   |   |   |           |   |       |   |       |           widgets.sh
    |   |   |   |   |           |   |       |   |       |           
    |   |   |   |   |           |   |       |   |       \---Templates
    |   |   |   |   |           |   |       |   |               bar
    |   |   |   |   |           |   |       |   |               bar-1
    |   |   |   |   |           |   |       |   |               lemonbar.sh
    |   |   |   |   |           |   |       |   |               widgets.sh
    |   |   |   |   |           |   |       |   |               
    |   |   |   |   |           |   |       |   +---bash
    |   |   |   |   |           |   |       |   |   |   .bashrc-personal
    |   |   |   |   |           |   |       |   |   |   .custom-paths
    |   |   |   |   |           |   |       |   |   |   .custom-scripts
    |   |   |   |   |           |   |       |   |   |   .custom-variables
    |   |   |   |   |           |   |       |   |   |   .installers
    |   |   |   |   |           |   |       |   |   |   
    |   |   |   |   |           |   |       |   |   +---aliases
    |   |   |   |   |           |   |       |   |   |       .build
    |   |   |   |   |           |   |       |   |   |       .customization
    |   |   |   |   |           |   |       |   |   |       .files
    |   |   |   |   |           |   |       |   |   |       .general
    |   |   |   |   |           |   |       |   |   |       .paths
    |   |   |   |   |           |   |       |   |   |       .pkgmgr
    |   |   |   |   |           |   |       |   |   |       .programs
    |   |   |   |   |           |   |       |   |   |       .services
    |   |   |   |   |           |   |       |   |   |       .systems
    |   |   |   |   |           |   |       |   |   |       .view_edit
    |   |   |   |   |           |   |       |   |   |       .windows
    |   |   |   |   |           |   |       |   |   |       .xorg
    |   |   |   |   |           |   |       |   |   |       
    |   |   |   |   |           |   |       |   |   +---customs
    |   |   |   |   |           |   |       |   |   |   |   .custom-aliases
    |   |   |   |   |           |   |       |   |   |   |   .custom-autostart
    |   |   |   |   |           |   |       |   |   |   |   .custom-variables
    |   |   |   |   |           |   |       |   |   |   |   .edit-aliases
    |   |   |   |   |           |   |       |   |   |   |   
    |   |   |   |   |           |   |       |   |   |   \---progs
    |   |   |   |   |           |   |       |   |   |           .compilers
    |   |   |   |   |           |   |       |   |   |           .runner
    |   |   |   |   |           |   |       |   |   |           
    |   |   |   |   |           |   |       |   |   +---functions
    |   |   |   |   |           |   |       |   |   |       datetimectl
    |   |   |   |   |           |   |       |   |   |       general
    |   |   |   |   |           |   |       |   |   |       package_manager
    |   |   |   |   |           |   |       |   |   |       
    |   |   |   |   |           |   |       |   |   +---package_manager
    |   |   |   |   |           |   |       |   |   |       .apt
    |   |   |   |   |           |   |       |   |   |       .pacman
    |   |   |   |   |           |   |       |   |   |       
    |   |   |   |   |           |   |       |   |   \---variables
    |   |   |   |   |           |   |       |   |           arrays
    |   |   |   |   |           |   |       |   |           commands
    |   |   |   |   |           |   |       |   |           general
    |   |   |   |   |           |   |       |   |           paths
    |   |   |   |   |           |   |       |   |           
    |   |   |   |   |           |   |       |   \---setup
    |   |   |   |   |           |   |       |       +---conky
    |   |   |   |   |           |   |       |       |       start.sh
    |   |   |   |   |           |   |       |       |       
    |   |   |   |   |           |   |       |       \---samba
    |   |   |   |   |           |   |       |               setup.sh
    |   |   |   |   |           |   |       |               
    |   |   |   |   |           |   |       \---scripts
    |   |   |   |   |           |   |           \---bash
    |   |   |   |   |           |   |               +---dmenu
    |   |   |   |   |           |   |               |       dmenu_Browsers.sh
    |   |   |   |   |           |   |               |       dmenu_fopener.sh
    |   |   |   |   |           |   |               |       dmenu_git.sh
    |   |   |   |   |           |   |               |       dmenu_pacman.sh
    |   |   |   |   |           |   |               |       dmenu_proc_ctrl.sh
    |   |   |   |   |           |   |               |       dmenu_Template.sh
    |   |   |   |   |           |   |               |       indexmenu.sh
    |   |   |   |   |           |   |               |       
    |   |   |   |   |           |   |               \---Tutorials_and_Guides
    |   |   |   |   |           |   |                   |   indexmenu-tutorials.sh
    |   |   |   |   |           |   |                   |   README.md
    |   |   |   |   |           |   |                   |   
    |   |   |   |   |           |   |                   \---Terminal
    |   |   |   |   |           |   |                           arrays.sh
    |   |   |   |   |           |   |                           receiving_pipe.sh
    |   |   |   |   |           |   |                           
    |   |   |   |   |           |   +---2021-06-26_1308H
    |   |   |   |   |           |   |   |   .bashrc
    |   |   |   |   |           |   |   |   .xinitrc
    |   |   |   |   |           |   |   |   .Xresources
    |   |   |   |   |           |   |   |   
    |   |   |   |   |           |   |   +---.config
    |   |   |   |   |           |   |   |   +---bspwm
    |   |   |   |   |           |   |   |   |       bspwmrc
    |   |   |   |   |           |   |   |   |       bspwmrc.test
    |   |   |   |   |           |   |   |   |       panel
    |   |   |   |   |           |   |   |   |       panel_bar
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---conky
    |   |   |   |   |           |   |   |   |       conky-keybindings.conf
    |   |   |   |   |           |   |   |   |       conky-middle_left.conf
    |   |   |   |   |           |   |   |   |       conky-middle_right.conf
    |   |   |   |   |           |   |   |   |       conky-TODOList.conf
    |   |   |   |   |           |   |   |   |       conky.conf.default
    |   |   |   |   |           |   |   |   |       conky.general.conf
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---dunst
    |   |   |   |   |           |   |   |   |       dunstrc
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---eww
    |   |   |   |   |           |   |   |   |   |   eww-bar.png
    |   |   |   |   |           |   |   |   |   |   eww.scss
    |   |   |   |   |           |   |   |   |   |   eww.xml
    |   |   |   |   |           |   |   |   |   |   
    |   |   |   |   |           |   |   |   |   \---scripts
    |   |   |   |   |           |   |   |   |           getram
    |   |   |   |   |           |   |   |   |           getvol
    |   |   |   |   |           |   |   |   |           
    |   |   |   |   |           |   |   |   +---htop
    |   |   |   |   |           |   |   |   |       htoprc
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---libfm
    |   |   |   |   |           |   |   |   |       libfm.conf
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---libreoffice
    |   |   |   |   |           |   |   |   |   \---4
    |   |   |   |   |           |   |   |   |       \---user
    |   |   |   |   |           |   |   |   |           |   registrymodifications.xcu
    |   |   |   |   |           |   |   |   |           |   
    |   |   |   |   |           |   |   |   |           +---autotext
    |   |   |   |   |           |   |   |   |           |       mytexts.bau
    |   |   |   |   |           |   |   |   |           |       
    |   |   |   |   |           |   |   |   |           +---basic
    |   |   |   |   |           |   |   |   |           |   |   dialog.xlc
    |   |   |   |   |           |   |   |   |           |   |   script.xlc
    |   |   |   |   |           |   |   |   |           |   |   
    |   |   |   |   |           |   |   |   |           |   \---Standard
    |   |   |   |   |           |   |   |   |           |           dialog.xlb
    |   |   |   |   |           |   |   |   |           |           Module1.xba
    |   |   |   |   |           |   |   |   |           |           script.xlb
    |   |   |   |   |           |   |   |   |           |           
    |   |   |   |   |           |   |   |   |           +---config
    |   |   |   |   |           |   |   |   |           |       autotbl.fmt
    |   |   |   |   |           |   |   |   |           |       javasettings_Linux_X86_64.xml
    |   |   |   |   |           |   |   |   |           |       
    |   |   |   |   |           |   |   |   |           +---database
    |   |   |   |   |           |   |   |   |           |   |   biblio.odb
    |   |   |   |   |           |   |   |   |           |   |   evolocal.odb
    |   |   |   |   |           |   |   |   |           |   |   
    |   |   |   |   |           |   |   |   |           |   \---biblio
    |   |   |   |   |           |   |   |   |           |           biblio.dbf
    |   |   |   |   |           |   |   |   |           |           biblio.dbt
    |   |   |   |   |           |   |   |   |           |           
    |   |   |   |   |           |   |   |   |           +---extensions
    |   |   |   |   |           |   |   |   |           |   |   buildid
    |   |   |   |   |           |   |   |   |           |   |   
    |   |   |   |   |           |   |   |   |           |   +---bundled
    |   |   |   |   |           |   |   |   |           |   |   |   extensions.pmap
    |   |   |   |   |           |   |   |   |           |   |   |   lastsynchronized
    |   |   |   |   |           |   |   |   |           |   |   |   
    |   |   |   |   |           |   |   |   |           |   |   \---registry
    |   |   |   |   |           |   |   |   |           |   |       +---com.sun.star.comp.deployment.bundle.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |           |   |       |       backenddb.xml
    |   |   |   |   |           |   |   |   |           |   |       |       
    |   |   |   |   |           |   |   |   |           |   |       +---com.sun.star.comp.deployment.component.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |           |   |       |       unorc
    |   |   |   |   |           |   |   |   |           |   |       |       
    |   |   |   |   |           |   |   |   |           |   |       +---com.sun.star.comp.deployment.configuration.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |           |   |       |       backenddb.xml
    |   |   |   |   |           |   |   |   |           |   |       |       configmgr.ini
    |   |   |   |   |           |   |   |   |           |   |       |       
    |   |   |   |   |           |   |   |   |           |   |       +---com.sun.star.comp.deployment.help.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |           |   |       |       backenddb.xml
    |   |   |   |   |           |   |   |   |           |   |       |       
    |   |   |   |   |           |   |   |   |           |   |       \---com.sun.star.comp.deployment.script.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |           |   |               backenddb.xml
    |   |   |   |   |           |   |   |   |           |   |               
    |   |   |   |   |           |   |   |   |           |   +---shared
    |   |   |   |   |           |   |   |   |           |   |   |   lastsynchronized
    |   |   |   |   |           |   |   |   |           |   |   |   
    |   |   |   |   |           |   |   |   |           |   |   \---registry
    |   |   |   |   |           |   |   |   |           |   |       +---com.sun.star.comp.deployment.configuration.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |           |   |       |       backenddb.xml
    |   |   |   |   |           |   |   |   |           |   |       |       
    |   |   |   |   |           |   |   |   |           |   |       \---com.sun.star.comp.deployment.help.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |           |   |               backenddb.xml
    |   |   |   |   |           |   |   |   |           |   |               
    |   |   |   |   |           |   |   |   |           |   \---tmp
    |   |   |   |   |           |   |   |   |           |       \---registry
    |   |   |   |   |           |   |   |   |           |           +---com.sun.star.comp.deployment.configuration.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |           |           |       backenddb.xml
    |   |   |   |   |           |   |   |   |           |           |       
    |   |   |   |   |           |   |   |   |           |           \---com.sun.star.comp.deployment.help.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |           |                   backenddb.xml
    |   |   |   |   |           |   |   |   |           |                   
    |   |   |   |   |           |   |   |   |           +---gallery
    |   |   |   |   |           |   |   |   |           |       sg30.sdv
    |   |   |   |   |           |   |   |   |           |       sg30.thm
    |   |   |   |   |           |   |   |   |           |       
    |   |   |   |   |           |   |   |   |           +---pack
    |   |   |   |   |           |   |   |   |           |   |   ExtensionInfo.pack
    |   |   |   |   |           |   |   |   |           |   |   registrymodifications.pack
    |   |   |   |   |           |   |   |   |           |   |   
    |   |   |   |   |           |   |   |   |           |   +---autotext
    |   |   |   |   |           |   |   |   |           |   |       mytexts.pack
    |   |   |   |   |           |   |   |   |           |   |       
    |   |   |   |   |           |   |   |   |           |   +---basic
    |   |   |   |   |           |   |   |   |           |   |   |   dialog.pack
    |   |   |   |   |           |   |   |   |           |   |   |   script.pack
    |   |   |   |   |           |   |   |   |           |   |   |   
    |   |   |   |   |           |   |   |   |           |   |   \---Standard
    |   |   |   |   |           |   |   |   |           |   |           dialog.pack
    |   |   |   |   |           |   |   |   |           |   |           Module1.pack
    |   |   |   |   |           |   |   |   |           |   |           script.pack
    |   |   |   |   |           |   |   |   |           |   |           
    |   |   |   |   |           |   |   |   |           |   +---config
    |   |   |   |   |           |   |   |   |           |   |       autotbl.pack
    |   |   |   |   |           |   |   |   |           |   |       javasettings_Linux_X86_64.pack
    |   |   |   |   |           |   |   |   |           |   |       
    |   |   |   |   |           |   |   |   |           |   \---database
    |   |   |   |   |           |   |   |   |           |       |   biblio.pack
    |   |   |   |   |           |   |   |   |           |       |   evolocal.pack
    |   |   |   |   |           |   |   |   |           |       |   
    |   |   |   |   |           |   |   |   |           |       \---biblio
    |   |   |   |   |           |   |   |   |           |               biblio.pack
    |   |   |   |   |           |   |   |   |           |               
    |   |   |   |   |           |   |   |   |           \---uno_packages
    |   |   |   |   |           |   |   |   |               \---cache
    |   |   |   |   |           |   |   |   |                   \---registry
    |   |   |   |   |           |   |   |   |                       +---com.sun.star.comp.deployment.configuration.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |                       |       backenddb.xml
    |   |   |   |   |           |   |   |   |                       |       
    |   |   |   |   |           |   |   |   |                       \---com.sun.star.comp.deployment.help.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |                               backenddb.xml
    |   |   |   |   |           |   |   |   |                               
    |   |   |   |   |           |   |   |   +---neofetch
    |   |   |   |   |           |   |   |   |       config.conf
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---nitrogen
    |   |   |   |   |           |   |   |   |       nitrogen.cfg
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---pcmanfm
    |   |   |   |   |           |   |   |   |   +---asura
    |   |   |   |   |           |   |   |   |   |       desktop-items-0.conf
    |   |   |   |   |           |   |   |   |   |       pcmanfm.conf
    |   |   |   |   |           |   |   |   |   |       
    |   |   |   |   |           |   |   |   |   \---default
    |   |   |   |   |           |   |   |   |           desktop-items-0.conf
    |   |   |   |   |           |   |   |   |           pcmanfm.conf
    |   |   |   |   |           |   |   |   |           
    |   |   |   |   |           |   |   |   +---picom
    |   |   |   |   |           |   |   |   |       picom.conf
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---sxhkd
    |   |   |   |   |           |   |   |   |       bspwm_smart_move
    |   |   |   |   |           |   |   |   |       sxhkdrc
    |   |   |   |   |           |   |   |   |       sxhkdrc.default
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---vifm
    |   |   |   |   |           |   |   |   |   |   vifm-help.txt
    |   |   |   |   |           |   |   |   |   |   vifminfo.json
    |   |   |   |   |           |   |   |   |   |   vifmrc
    |   |   |   |   |           |   |   |   |   |   
    |   |   |   |   |           |   |   |   |   +---colors
    |   |   |   |   |           |   |   |   |   |       Default.vifm
    |   |   |   |   |           |   |   |   |   |       
    |   |   |   |   |           |   |   |   |   +---defaults
    |   |   |   |   |           |   |   |   |   |       vifm-help.txt
    |   |   |   |   |           |   |   |   |   |       vifmrc
    |   |   |   |   |           |   |   |   |   |       
    |   |   |   |   |           |   |   |   |   \---scripts
    |   |   |   |   |           |   |   |   |           README
    |   |   |   |   |           |   |   |   |           
    |   |   |   |   |           |   |   |   \---vis
    |   |   |   |   |           |   |   |       |   config
    |   |   |   |   |           |   |   |       |   vis.log
    |   |   |   |   |           |   |   |       |   
    |   |   |   |   |           |   |   |       \---colors
    |   |   |   |   |           |   |   |               basic_colors
    |   |   |   |   |           |   |   |               rainbow
    |   |   |   |   |           |   |   |               
    |   |   |   |   |           |   |   +---.icons
    |   |   |   |   |           |   |   |   |   cursors
    |   |   |   |   |           |   |   |   |   
    |   |   |   |   |           |   |   |   \---default
    |   |   |   |   |           |   |   |           cursors
    |   |   |   |   |           |   |   |           index.theme
    |   |   |   |   |           |   |   |           setcursor.sh
    |   |   |   |   |           |   |   |           
    |   |   |   |   |           |   |   +---.scripts
    |   |   |   |   |           |   |   |   |   clipkger.sh
    |   |   |   |   |           |   |   |   |   dotfilemgr.sh
    |   |   |   |   |           |   |   |   |   gitmgr.sh
    |   |   |   |   |           |   |   |   |   gtk_util.sh
    |   |   |   |   |           |   |   |   |   notepad.sh
    |   |   |   |   |           |   |   |   |   screenlocker.sh
    |   |   |   |   |           |   |   |   |   suckless_downloadpatches.sh
    |   |   |   |   |           |   |   |   |   
    |   |   |   |   |           |   |   |   +---libraries
    |   |   |   |   |           |   |   |   |       extlib.sh
    |   |   |   |   |           |   |   |   |       maths.sh
    |   |   |   |   |           |   |   |   |       pacman.sh
    |   |   |   |   |           |   |   |   |       rice.sh
    |   |   |   |   |           |   |   |   |       strutil.sh
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---st
    |   |   |   |   |           |   |   |   |       ff-blur
    |   |   |   |   |           |   |   |   |       ff-border
    |   |   |   |   |           |   |   |   |       ff-bright
    |   |   |   |   |           |   |   |   |       to_ff.sh
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   \---vim
    |   |   |   |   |           |   |   |           templatesel.sh
    |   |   |   |   |           |   |   |           
    |   |   |   |   |           |   |   +---.urxvt
    |   |   |   |   |           |   |   |   \---ext
    |   |   |   |   |           |   |   |           resize-font
    |   |   |   |   |           |   |   |           
    |   |   |   |   |           |   |   +---.vim
    |   |   |   |   |           |   |   |   |   .netrwhist
    |   |   |   |   |           |   |   |   |   vimrc
    |   |   |   |   |           |   |   |   |   
    |   |   |   |   |           |   |   |   +---autoload
    |   |   |   |   |           |   |   |   |       plug.vim
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   \---templates
    |   |   |   |   |           |   |   |           index.html
    |   |   |   |   |           |   |   |           main.c
    |   |   |   |   |           |   |   |           main.cpp
    |   |   |   |   |           |   |   |           main.cs
    |   |   |   |   |           |   |   |           main.css
    |   |   |   |   |           |   |   |           main.h
    |   |   |   |   |           |   |   |           main.java
    |   |   |   |   |           |   |   |           main.js
    |   |   |   |   |           |   |   |           main.min.sh
    |   |   |   |   |           |   |   |           main.py
    |   |   |   |   |           |   |   |           main.sh
    |   |   |   |   |           |   |   |           README.md
    |   |   |   |   |           |   |   |           
    |   |   |   |   |           |   |   +---Desktop
    |   |   |   |   |           |   |   |   +---apps
    |   |   |   |   |           |   |   |   |       rar
    |   |   |   |   |           |   |   |   |       unrar
    |   |   |   |   |           |   |   |   |       xmenu.sh
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---drafts
    |   |   |   |   |           |   |   |   |       archwiki-pages.sh
    |   |   |   |   |           |   |   |   |       bspwm_designer.sh
    |   |   |   |   |           |   |   |   |       cowsayer.sh
    |   |   |   |   |           |   |   |   |       pages
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   \---portable
    |   |   |   |   |           |   |   |       +---doc
    |   |   |   |   |           |   |   |       |   \---defaults
    |   |   |   |   |           |   |   |       |           sofficerc
    |   |   |   |   |           |   |   |       |           
    |   |   |   |   |           |   |   |       +---media
    |   |   |   |   |           |   |   |       |   \---Images
    |   |   |   |   |           |   |   |       |       +---JPG
    |   |   |   |   |           |   |   |       |       |       wallhaven-nature.jpg
    |   |   |   |   |           |   |   |       |       |       wallhaven-Ocean.jpg
    |   |   |   |   |           |   |   |       |       |       wallhaven-Tokyo.jpg
    |   |   |   |   |           |   |   |       |       |       
    |   |   |   |   |           |   |   |       |       \---PNG
    |   |   |   |   |           |   |   |       |               DigitalOcean
    |   |   |   |   |           |   |   |       |               nier-automata-menu-background.png
    |   |   |   |   |           |   |   |       |               wallhaven-win10.png
    |   |   |   |   |           |   |   |       |               
    |   |   |   |   |           |   |   |       +---projects
    |   |   |   |   |           |   |   |       |   +---coding
    |   |   |   |   |           |   |   |       |   |   +---cli
    |   |   |   |   |           |   |   |       |   |   |   \---PracticeGround_TestBench
    |   |   |   |   |           |   |   |       |   |   |       +---cpp
    |   |   |   |   |           |   |   |       |   |   |       |   \---workspace
    |   |   |   |   |           |   |   |       |   |   |       |       \---src
    |   |   |   |   |           |   |   |       |   |   |       |           |   extlib.h
    |   |   |   |   |           |   |   |       |   |   |       |           |   main.cpp
    |   |   |   |   |           |   |   |       |   |   |       |           |   main.exe
    |   |   |   |   |           |   |   |       |   |   |       |           |   make.sh
    |   |   |   |   |           |   |   |       |   |   |       |           |   
    |   |   |   |   |           |   |   |       |   |   |       |           \---resources
    |   |   |   |   |           |   |   |       |   |   |       |               |   changelogs
    |   |   |   |   |           |   |   |       |   |   |       |               |   
    |   |   |   |   |           |   |   |       |   |   |       |               \---out
    |   |   |   |   |           |   |   |       |   |   |       |                       out.txt
    |   |   |   |   |           |   |   |       |   |   |       |                       
    |   |   |   |   |           |   |   |       |   |   |       +---python
    |   |   |   |   |           |   |   |       |   |   |       |   \---workspace
    |   |   |   |   |           |   |   |       |   |   |       |       \---resources
    |   |   |   |   |           |   |   |       |   |   |       |           \---Dictionary
    |   |   |   |   |           |   |   |       |   |   |       |                   lang.py
    |   |   |   |   |           |   |   |       |   |   |       |                   
    |   |   |   |   |           |   |   |       |   |   |       \---resources
    |   |   |   |   |           |   |   |       |   |   |               README.md
    |   |   |   |   |           |   |   |       |   |   |               
    |   |   |   |   |           |   |   |       |   |   +---gui
    |   |   |   |   |           |   |   |       |   |   |   +---AutoGUI
    |   |   |   |   |           |   |   |       |   |   |   |   \---C++
    |   |   |   |   |           |   |   |       |   |   |   |       \---workspace
    |   |   |   |   |           |   |   |       |   |   |   |           +---resources
    |   |   |   |   |           |   |   |       |   |   |   |           |       README.md
    |   |   |   |   |           |   |   |       |   |   |   |           |       
    |   |   |   |   |           |   |   |       |   |   |   |           \---src
    |   |   |   |   |           |   |   |       |   |   |   |                   main.cpp
    |   |   |   |   |           |   |   |       |   |   |   |                   main.exe
    |   |   |   |   |           |   |   |       |   |   |   |                   make.sh
    |   |   |   |   |           |   |   |       |   |   |   |                   
    |   |   |   |   |           |   |   |       |   |   |   \---PracticeGround_TestBench
    |   |   |   |   |           |   |   |       |   |   |       +---cpp
    |   |   |   |   |           |   |   |       |   |   |       |   \---workspace
    |   |   |   |   |           |   |   |       |   |   |       |       \---src
    |   |   |   |   |           |   |   |       |   |   |       |           |   main.cpp
    |   |   |   |   |           |   |   |       |   |   |       |           |   main.exe
    |   |   |   |   |           |   |   |       |   |   |       |           |   make.sh
    |   |   |   |   |           |   |   |       |   |   |       |           |   wxGUI.cpp
    |   |   |   |   |           |   |   |       |   |   |       |           |   wxGUI.exe
    |   |   |   |   |           |   |   |       |   |   |       |           |   
    |   |   |   |   |           |   |   |       |   |   |       |           +---resources
    |   |   |   |   |           |   |   |       |   |   |       |           |   \---out
    |   |   |   |   |           |   |   |       |   |   |       |           |           out.txt
    |   |   |   |   |           |   |   |       |   |   |       |           |           
    |   |   |   |   |           |   |   |       |   |   |       |           \---samples
    |   |   |   |   |           |   |   |       |   |   |       |                   minimal.cpp
    |   |   |   |   |           |   |   |       |   |   |       |                   minimal.exe
    |   |   |   |   |           |   |   |       |   |   |       |                   
    |   |   |   |   |           |   |   |       |   |   |       +---python
    |   |   |   |   |           |   |   |       |   |   |       |   \---workspace
    |   |   |   |   |           |   |   |       |   |   |       |       \---resources
    |   |   |   |   |           |   |   |       |   |   |       |           \---Dictionary
    |   |   |   |   |           |   |   |       |   |   |       |                   lang.py
    |   |   |   |   |           |   |   |       |   |   |       |                   
    |   |   |   |   |           |   |   |       |   |   |       \---resources
    |   |   |   |   |           |   |   |       |   |   |               README.md
    |   |   |   |   |           |   |   |       |   |   |               
    |   |   |   |   |           |   |   |       |   |   +---python
    |   |   |   |   |           |   |   |       |   |   |   \---PracticeGround-TestBench
    |   |   |   |   |           |   |   |       |   |   |       \---workspace
    |   |   |   |   |           |   |   |       |   |   |           |   main.py
    |   |   |   |   |           |   |   |       |   |   |           |   
    |   |   |   |   |           |   |   |       |   |   |           \---resources
    |   |   |   |   |           |   |   |       |   |   |               \---Dictionary
    |   |   |   |   |           |   |   |       |   |   |                       lang.py
    |   |   |   |   |           |   |   |       |   |   |                       
    |   |   |   |   |           |   |   |       |   |   \---Template
    |   |   |   |   |           |   |   |       |   |       +---files
    |   |   |   |   |           |   |   |       |   |       |   |   make.sh
    |   |   |   |   |           |   |   |       |   |       |   |   
    |   |   |   |   |           |   |   |       |   |       |   +---ARCHIVE
    |   |   |   |   |           |   |   |       |   |       |   |   \---2021-04-25 0011H
    |   |   |   |   |           |   |   |       |   |       |   |           make.sh
    |   |   |   |   |           |   |   |       |   |       |   |           
    |   |   |   |   |           |   |   |       |   |       |   \---cpp
    |   |   |   |   |           |   |   |       |   |       |       \---GUI
    |   |   |   |   |           |   |   |       |   |       |           \---wxWidgets
    |   |   |   |   |           |   |   |       |   |       |                   main.cpp
    |   |   |   |   |           |   |   |       |   |       |                   
    |   |   |   |   |           |   |   |       |   |       \---structure
    |   |   |   |   |           |   |   |       |   |           +---cli
    |   |   |   |   |           |   |   |       |   |           |   \---cpp
    |   |   |   |   |           |   |   |       |   |           |       \---workspace
    |   |   |   |   |           |   |   |       |   |           |           +---resources
    |   |   |   |   |           |   |   |       |   |           |           |       README.md
    |   |   |   |   |           |   |   |       |   |           |           |       
    |   |   |   |   |           |   |   |       |   |           |           \---src
    |   |   |   |   |           |   |   |       |   |           |                   make.sh
    |   |   |   |   |           |   |   |       |   |           |                   
    |   |   |   |   |           |   |   |       |   |           +---gui
    |   |   |   |   |           |   |   |       |   |           |   \---cpp
    |   |   |   |   |           |   |   |       |   |           |       \---workspace
    |   |   |   |   |           |   |   |       |   |           |           +---resources
    |   |   |   |   |           |   |   |       |   |           |           |       README.md
    |   |   |   |   |           |   |   |       |   |           |           |       
    |   |   |   |   |           |   |   |       |   |           |           \---src
    |   |   |   |   |           |   |   |       |   |           |                   make.sh
    |   |   |   |   |           |   |   |       |   |           |                   
    |   |   |   |   |           |   |   |       |   |           +---java
    |   |   |   |   |           |   |   |       |   |           |   \---workspace
    |   |   |   |   |           |   |   |       |   |           |       |   README.md
    |   |   |   |   |           |   |   |       |   |           |       |   
    |   |   |   |   |           |   |   |       |   |           |       \---src
    |   |   |   |   |           |   |   |       |   |           |               make.sh
    |   |   |   |   |           |   |   |       |   |           |               
    |   |   |   |   |           |   |   |       |   |           +---python
    |   |   |   |   |           |   |   |       |   |           |   \---workspace
    |   |   |   |   |           |   |   |       |   |           |       |   README.md
    |   |   |   |   |           |   |   |       |   |           |       |   
    |   |   |   |   |           |   |   |       |   |           |       \---resources
    |   |   |   |   |           |   |   |       |   |           |           \---Dictionary
    |   |   |   |   |           |   |   |       |   |           |                   lang.py
    |   |   |   |   |           |   |   |       |   |           |                   
    |   |   |   |   |           |   |   |       |   |           \---web-design
    |   |   |   |   |           |   |   |       |   |               \---workspace
    |   |   |   |   |           |   |   |       |   |                   |   index.html
    |   |   |   |   |           |   |   |       |   |                   |   run.sh
    |   |   |   |   |           |   |   |       |   |                   |   
    |   |   |   |   |           |   |   |       |   |                   +---resources
    |   |   |   |   |           |   |   |       |   |                   |   +---docs
    |   |   |   |   |           |   |   |       |   |                   |   |       README.md
    |   |   |   |   |           |   |   |       |   |                   |   |       
    |   |   |   |   |           |   |   |       |   |                   |   \---styles
    |   |   |   |   |           |   |   |       |   |                   |           main.css
    |   |   |   |   |           |   |   |       |   |                   |           
    |   |   |   |   |           |   |   |       |   |                   \---scripts
    |   |   |   |   |           |   |   |       |   |                           main.js
    |   |   |   |   |           |   |   |       |   |                           
    |   |   |   |   |           |   |   |       |   +---Game-Guides
    |   |   |   |   |           |   |   |       |   |   \---AllGames
    |   |   |   |   |           |   |   |       |   |       \---workspace
    |   |   |   |   |           |   |   |       |   |           \---Python
    |   |   |   |   |           |   |   |       |   |               \---ProjEDEN
    |   |   |   |   |           |   |   |       |   |                   \---src
    |   |   |   |   |           |   |   |       |   |                           autorun.sh
    |   |   |   |   |           |   |   |       |   |                           main.py
    |   |   |   |   |           |   |   |       |   |                           out_data.txt
    |   |   |   |   |           |   |   |       |   |                           
    |   |   |   |   |           |   |   |       |   +---Linux
    |   |   |   |   |           |   |   |       |   |   +---general
    |   |   |   |   |           |   |   |       |   |   |       shlib.sh
    |   |   |   |   |           |   |   |       |   |   |       
    |   |   |   |   |           |   |   |       |   |   \---utilities
    |   |   |   |   |           |   |   |       |   |       +---cronjob-scripts
    |   |   |   |   |           |   |   |       |   |       |       debug.sh
    |   |   |   |   |           |   |   |       |   |       |       debug_21-04-16.log
    |   |   |   |   |           |   |   |       |   |       |       pkg-autoupdater.sh
    |   |   |   |   |           |   |   |       |   |       |       
    |   |   |   |   |           |   |   |       |   |       +---dmenu
    |   |   |   |   |           |   |   |       |   |       |   \---scripts
    |   |   |   |   |           |   |   |       |   |       |           templates
    |   |   |   |   |           |   |   |       |   |       |           
    |   |   |   |   |           |   |   |       |   |       +---git
    |   |   |   |   |           |   |   |       |   |       |       gitlib.sh
    |   |   |   |   |           |   |   |       |   |       |       gitmgr.sh
    |   |   |   |   |           |   |   |       |   |       |       
    |   |   |   |   |           |   |   |       |   |       +---setups
    |   |   |   |   |           |   |   |       |   |       |       install-aur.sh
    |   |   |   |   |           |   |   |       |   |       |       
    |   |   |   |   |           |   |   |       |   |       \---wrappers
    |   |   |   |   |           |   |   |       |   |           |   makelib.sh
    |   |   |   |   |           |   |   |       |   |           |   pacinstaller.sh
    |   |   |   |   |           |   |   |       |   |           |   screenshot.sh
    |   |   |   |   |           |   |   |       |   |           |   surfer.sh
    |   |   |   |   |           |   |   |       |   |           |   vimopen.sh
    |   |   |   |   |           |   |   |       |   |           |   
    |   |   |   |   |           |   |   |       |   |           +---apps
    |   |   |   |   |           |   |   |       |   |           |   \---eww
    |   |   |   |   |           |   |   |       |   |           |           wreww.sh
    |   |   |   |   |           |   |   |       |   |           |           
    |   |   |   |   |           |   |   |       |   |           \---multi-maker
    |   |   |   |   |           |   |   |       |   |                   make.sh
    |   |   |   |   |           |   |   |       |   |                   README.md
    |   |   |   |   |           |   |   |       |   |                   
    |   |   |   |   |           |   |   |       |   \---Templates
    |   |   |   |   |           |   |   |       |       |   autorun.sh
    |   |   |   |   |           |   |   |       |       |   make.sh
    |   |   |   |   |           |   |   |       |       |   
    |   |   |   |   |           |   |   |       |       \---ARCHIVE
    |   |   |   |   |           |   |   |       |           +---autorunner
    |   |   |   |   |           |   |   |       |           |   \---2021-03-31 0934H
    |   |   |   |   |           |   |   |       |           |           autorun.sh
    |   |   |   |   |           |   |   |       |           |           
    |   |   |   |   |           |   |   |       |           \---make_shellscript
    |   |   |   |   |           |   |   |       |               \---2021-04-25 0011H
    |   |   |   |   |           |   |   |       |                       make.sh
    |   |   |   |   |           |   |   |       |                       
    |   |   |   |   |           |   |   |       \---repos
    |   |   |   |   |           |   |   |           \---rar
    |   |   |   |   |           |   |   |                   nier_automata_cursor__hack_edition__v2_by_juliodrai_dc6aarz.rar
    |   |   |   |   |           |   |   |                   
    |   |   |   |   |           |   |   \---personal
    |   |   |   |   |           |   |       +---autostart
    |   |   |   |   |           |   |       |       autostart.sh
    |   |   |   |   |           |   |       |       wallpaper.jpg
    |   |   |   |   |           |   |       |       
    |   |   |   |   |           |   |       +---codes
    |   |   |   |   |           |   |       |       compilers.sh
    |   |   |   |   |           |   |       |       
    |   |   |   |   |           |   |       +---designs
    |   |   |   |   |           |   |       |   \---XOrg
    |   |   |   |   |           |   |       |       \---xresources
    |   |   |   |   |           |   |       |               genera.xresources
    |   |   |   |   |           |   |       |               gruvbox-dark.xresources
    |   |   |   |   |           |   |       |               matrix-green.xresources
    |   |   |   |   |           |   |       |               wal-nature.xresources
    |   |   |   |   |           |   |       |               
    |   |   |   |   |           |   |       +---dotfiles
    |   |   |   |   |           |   |       |   +---bars
    |   |   |   |   |           |   |       |   |   |   bar
    |   |   |   |   |           |   |       |   |   |   
    |   |   |   |   |           |   |       |   |   +---ARCHIVE
    |   |   |   |   |           |   |       |   |   |   \---2021-04-18 1207H
    |   |   |   |   |           |   |       |   |   |           bar
    |   |   |   |   |           |   |       |   |   |           
    |   |   |   |   |           |   |       |   |   \---lemonbar
    |   |   |   |   |           |   |       |   |       |   bspwm-widgets.sh
    |   |   |   |   |           |   |       |   |       |   lemonbar_Desc.sh
    |   |   |   |   |           |   |       |   |       |   lemonbar_Func.sh
    |   |   |   |   |           |   |       |   |       |   lemonbar_Run.sh
    |   |   |   |   |           |   |       |   |       |   widgets.sh
    |   |   |   |   |           |   |       |   |       |   
    |   |   |   |   |           |   |       |   |       +---profiles
    |   |   |   |   |           |   |       |   |       |   +---2021-04-17 2237H
    |   |   |   |   |           |   |       |   |       |   |       bar
    |   |   |   |   |           |   |       |   |       |   |       lemonbar.sh
    |   |   |   |   |           |   |       |   |       |   |       widgets.sh
    |   |   |   |   |           |   |       |   |       |   |       
    |   |   |   |   |           |   |       |   |       |   +---2021-04-18 0946H
    |   |   |   |   |           |   |       |   |       |   |       lemonbar_Desc.sh
    |   |   |   |   |           |   |       |   |       |   |       lemonbar_Run.sh
    |   |   |   |   |           |   |       |   |       |   |       widgets.sh
    |   |   |   |   |           |   |       |   |       |   |       
    |   |   |   |   |           |   |       |   |       |   +---2021-04-19 1007H
    |   |   |   |   |           |   |       |   |       |   |       lemonbar_Desc.sh
    |   |   |   |   |           |   |       |   |       |   |       lemonbar_Run.sh
    |   |   |   |   |           |   |       |   |       |   |       widgets.sh
    |   |   |   |   |           |   |       |   |       |   |       
    |   |   |   |   |           |   |       |   |       |   +---2021-04-19 1130H
    |   |   |   |   |           |   |       |   |       |   |       bspwm-widgets.sh
    |   |   |   |   |           |   |       |   |       |   |       lemonbar_Desc.sh
    |   |   |   |   |           |   |       |   |       |   |       lemonbar_Func.sh
    |   |   |   |   |           |   |       |   |       |   |       lemonbar_Run.sh
    |   |   |   |   |           |   |       |   |       |   |       widgets.sh
    |   |   |   |   |           |   |       |   |       |   |       
    |   |   |   |   |           |   |       |   |       |   \---2021-04-20 1001H
    |   |   |   |   |           |   |       |   |       |           bspwm-widgets.sh
    |   |   |   |   |           |   |       |   |       |           lemonbar_Desc.sh
    |   |   |   |   |           |   |       |   |       |           lemonbar_Func.sh
    |   |   |   |   |           |   |       |   |       |           lemonbar_Run.sh
    |   |   |   |   |           |   |       |   |       |           widgets.sh
    |   |   |   |   |           |   |       |   |       |           
    |   |   |   |   |           |   |       |   |       \---Templates
    |   |   |   |   |           |   |       |   |               bar
    |   |   |   |   |           |   |       |   |               bar-1
    |   |   |   |   |           |   |       |   |               lemonbar.sh
    |   |   |   |   |           |   |       |   |               widgets.sh
    |   |   |   |   |           |   |       |   |               
    |   |   |   |   |           |   |       |   +---bash
    |   |   |   |   |           |   |       |   |   |   .bashrc-personal
    |   |   |   |   |           |   |       |   |   |   .custom-paths
    |   |   |   |   |           |   |       |   |   |   .custom-scripts
    |   |   |   |   |           |   |       |   |   |   .custom-variables
    |   |   |   |   |           |   |       |   |   |   .installers
    |   |   |   |   |           |   |       |   |   |   
    |   |   |   |   |           |   |       |   |   +---aliases
    |   |   |   |   |           |   |       |   |   |       .build
    |   |   |   |   |           |   |       |   |   |       .customization
    |   |   |   |   |           |   |       |   |   |       .files
    |   |   |   |   |           |   |       |   |   |       .general
    |   |   |   |   |           |   |       |   |   |       .paths
    |   |   |   |   |           |   |       |   |   |       .pkgmgr
    |   |   |   |   |           |   |       |   |   |       .programs
    |   |   |   |   |           |   |       |   |   |       .services
    |   |   |   |   |           |   |       |   |   |       .systems
    |   |   |   |   |           |   |       |   |   |       .view_edit
    |   |   |   |   |           |   |       |   |   |       .windows
    |   |   |   |   |           |   |       |   |   |       .xorg
    |   |   |   |   |           |   |       |   |   |       
    |   |   |   |   |           |   |       |   |   +---customs
    |   |   |   |   |           |   |       |   |   |   |   .custom-aliases
    |   |   |   |   |           |   |       |   |   |   |   .custom-autostart
    |   |   |   |   |           |   |       |   |   |   |   .custom-variables
    |   |   |   |   |           |   |       |   |   |   |   .edit-aliases
    |   |   |   |   |           |   |       |   |   |   |   
    |   |   |   |   |           |   |       |   |   |   \---progs
    |   |   |   |   |           |   |       |   |   |           .compilers
    |   |   |   |   |           |   |       |   |   |           .runner
    |   |   |   |   |           |   |       |   |   |           
    |   |   |   |   |           |   |       |   |   +---functions
    |   |   |   |   |           |   |       |   |   |       datetimectl
    |   |   |   |   |           |   |       |   |   |       general
    |   |   |   |   |           |   |       |   |   |       package_manager
    |   |   |   |   |           |   |       |   |   |       
    |   |   |   |   |           |   |       |   |   +---package_manager
    |   |   |   |   |           |   |       |   |   |       .apt
    |   |   |   |   |           |   |       |   |   |       .pacman
    |   |   |   |   |           |   |       |   |   |       
    |   |   |   |   |           |   |       |   |   \---variables
    |   |   |   |   |           |   |       |   |           arrays
    |   |   |   |   |           |   |       |   |           commands
    |   |   |   |   |           |   |       |   |           general
    |   |   |   |   |           |   |       |   |           paths
    |   |   |   |   |           |   |       |   |           
    |   |   |   |   |           |   |       |   \---setup
    |   |   |   |   |           |   |       |       +---conky
    |   |   |   |   |           |   |       |       |       start.sh
    |   |   |   |   |           |   |       |       |       
    |   |   |   |   |           |   |       |       \---samba
    |   |   |   |   |           |   |       |               setup.sh
    |   |   |   |   |           |   |       |               
    |   |   |   |   |           |   |       \---scripts
    |   |   |   |   |           |   |           \---bash
    |   |   |   |   |           |   |               +---dmenu
    |   |   |   |   |           |   |               |       dmenu_Browsers.sh
    |   |   |   |   |           |   |               |       dmenu_fopener.sh
    |   |   |   |   |           |   |               |       dmenu_git.sh
    |   |   |   |   |           |   |               |       dmenu_pacman.sh
    |   |   |   |   |           |   |               |       dmenu_proc_ctrl.sh
    |   |   |   |   |           |   |               |       dmenu_Template.sh
    |   |   |   |   |           |   |               |       indexmenu.sh
    |   |   |   |   |           |   |               |       
    |   |   |   |   |           |   |               \---Tutorials_and_Guides
    |   |   |   |   |           |   |                   |   indexmenu-tutorials.sh
    |   |   |   |   |           |   |                   |   README.md
    |   |   |   |   |           |   |                   |   
    |   |   |   |   |           |   |                   \---Terminal
    |   |   |   |   |           |   |                           arrays.sh
    |   |   |   |   |           |   |                           receiving_pipe.sh
    |   |   |   |   |           |   |                           
    |   |   |   |   |           |   +---2021-06-28_1012H
    |   |   |   |   |           |   |   |   .bashrc
    |   |   |   |   |           |   |   |   .xinitrc
    |   |   |   |   |           |   |   |   .Xresources
    |   |   |   |   |           |   |   |   
    |   |   |   |   |           |   |   +---.config
    |   |   |   |   |           |   |   |   +---bspwm
    |   |   |   |   |           |   |   |   |       bspwmrc
    |   |   |   |   |           |   |   |   |       bspwmrc.test
    |   |   |   |   |           |   |   |   |       panel
    |   |   |   |   |           |   |   |   |       panel_bar
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---conky
    |   |   |   |   |           |   |   |   |       conky-keybindings.conf
    |   |   |   |   |           |   |   |   |       conky-middle_left.conf
    |   |   |   |   |           |   |   |   |       conky-middle_right.conf
    |   |   |   |   |           |   |   |   |       conky-TODOList.conf
    |   |   |   |   |           |   |   |   |       conky.conf.default
    |   |   |   |   |           |   |   |   |       conky.general.conf
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---dunst
    |   |   |   |   |           |   |   |   |       dunstrc
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---eww
    |   |   |   |   |           |   |   |   |   |   eww-bar.png
    |   |   |   |   |           |   |   |   |   |   eww.scss
    |   |   |   |   |           |   |   |   |   |   eww.xml
    |   |   |   |   |           |   |   |   |   |   
    |   |   |   |   |           |   |   |   |   \---scripts
    |   |   |   |   |           |   |   |   |           getram
    |   |   |   |   |           |   |   |   |           getvol
    |   |   |   |   |           |   |   |   |           
    |   |   |   |   |           |   |   |   +---htop
    |   |   |   |   |           |   |   |   |       htoprc
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---libfm
    |   |   |   |   |           |   |   |   |       libfm.conf
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---libreoffice
    |   |   |   |   |           |   |   |   |   \---4
    |   |   |   |   |           |   |   |   |       \---user
    |   |   |   |   |           |   |   |   |           |   registrymodifications.xcu
    |   |   |   |   |           |   |   |   |           |   
    |   |   |   |   |           |   |   |   |           +---autotext
    |   |   |   |   |           |   |   |   |           |       mytexts.bau
    |   |   |   |   |           |   |   |   |           |       
    |   |   |   |   |           |   |   |   |           +---basic
    |   |   |   |   |           |   |   |   |           |   |   dialog.xlc
    |   |   |   |   |           |   |   |   |           |   |   script.xlc
    |   |   |   |   |           |   |   |   |           |   |   
    |   |   |   |   |           |   |   |   |           |   \---Standard
    |   |   |   |   |           |   |   |   |           |           dialog.xlb
    |   |   |   |   |           |   |   |   |           |           Module1.xba
    |   |   |   |   |           |   |   |   |           |           script.xlb
    |   |   |   |   |           |   |   |   |           |           
    |   |   |   |   |           |   |   |   |           +---config
    |   |   |   |   |           |   |   |   |           |       autotbl.fmt
    |   |   |   |   |           |   |   |   |           |       javasettings_Linux_X86_64.xml
    |   |   |   |   |           |   |   |   |           |       
    |   |   |   |   |           |   |   |   |           +---database
    |   |   |   |   |           |   |   |   |           |   |   biblio.odb
    |   |   |   |   |           |   |   |   |           |   |   evolocal.odb
    |   |   |   |   |           |   |   |   |           |   |   
    |   |   |   |   |           |   |   |   |           |   \---biblio
    |   |   |   |   |           |   |   |   |           |           biblio.dbf
    |   |   |   |   |           |   |   |   |           |           biblio.dbt
    |   |   |   |   |           |   |   |   |           |           
    |   |   |   |   |           |   |   |   |           +---extensions
    |   |   |   |   |           |   |   |   |           |   |   buildid
    |   |   |   |   |           |   |   |   |           |   |   
    |   |   |   |   |           |   |   |   |           |   +---bundled
    |   |   |   |   |           |   |   |   |           |   |   |   extensions.pmap
    |   |   |   |   |           |   |   |   |           |   |   |   lastsynchronized
    |   |   |   |   |           |   |   |   |           |   |   |   
    |   |   |   |   |           |   |   |   |           |   |   \---registry
    |   |   |   |   |           |   |   |   |           |   |       +---com.sun.star.comp.deployment.bundle.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |           |   |       |       backenddb.xml
    |   |   |   |   |           |   |   |   |           |   |       |       
    |   |   |   |   |           |   |   |   |           |   |       +---com.sun.star.comp.deployment.component.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |           |   |       |       unorc
    |   |   |   |   |           |   |   |   |           |   |       |       
    |   |   |   |   |           |   |   |   |           |   |       +---com.sun.star.comp.deployment.configuration.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |           |   |       |       backenddb.xml
    |   |   |   |   |           |   |   |   |           |   |       |       configmgr.ini
    |   |   |   |   |           |   |   |   |           |   |       |       
    |   |   |   |   |           |   |   |   |           |   |       +---com.sun.star.comp.deployment.help.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |           |   |       |       backenddb.xml
    |   |   |   |   |           |   |   |   |           |   |       |       
    |   |   |   |   |           |   |   |   |           |   |       \---com.sun.star.comp.deployment.script.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |           |   |               backenddb.xml
    |   |   |   |   |           |   |   |   |           |   |               
    |   |   |   |   |           |   |   |   |           |   +---shared
    |   |   |   |   |           |   |   |   |           |   |   |   lastsynchronized
    |   |   |   |   |           |   |   |   |           |   |   |   
    |   |   |   |   |           |   |   |   |           |   |   \---registry
    |   |   |   |   |           |   |   |   |           |   |       +---com.sun.star.comp.deployment.configuration.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |           |   |       |       backenddb.xml
    |   |   |   |   |           |   |   |   |           |   |       |       
    |   |   |   |   |           |   |   |   |           |   |       \---com.sun.star.comp.deployment.help.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |           |   |               backenddb.xml
    |   |   |   |   |           |   |   |   |           |   |               
    |   |   |   |   |           |   |   |   |           |   \---tmp
    |   |   |   |   |           |   |   |   |           |       \---registry
    |   |   |   |   |           |   |   |   |           |           +---com.sun.star.comp.deployment.configuration.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |           |           |       backenddb.xml
    |   |   |   |   |           |   |   |   |           |           |       
    |   |   |   |   |           |   |   |   |           |           \---com.sun.star.comp.deployment.help.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |           |                   backenddb.xml
    |   |   |   |   |           |   |   |   |           |                   
    |   |   |   |   |           |   |   |   |           +---gallery
    |   |   |   |   |           |   |   |   |           |       sg30.sdv
    |   |   |   |   |           |   |   |   |           |       sg30.thm
    |   |   |   |   |           |   |   |   |           |       
    |   |   |   |   |           |   |   |   |           +---pack
    |   |   |   |   |           |   |   |   |           |   |   ExtensionInfo.pack
    |   |   |   |   |           |   |   |   |           |   |   registrymodifications.pack
    |   |   |   |   |           |   |   |   |           |   |   
    |   |   |   |   |           |   |   |   |           |   +---autotext
    |   |   |   |   |           |   |   |   |           |   |       mytexts.pack
    |   |   |   |   |           |   |   |   |           |   |       
    |   |   |   |   |           |   |   |   |           |   +---basic
    |   |   |   |   |           |   |   |   |           |   |   |   dialog.pack
    |   |   |   |   |           |   |   |   |           |   |   |   script.pack
    |   |   |   |   |           |   |   |   |           |   |   |   
    |   |   |   |   |           |   |   |   |           |   |   \---Standard
    |   |   |   |   |           |   |   |   |           |   |           dialog.pack
    |   |   |   |   |           |   |   |   |           |   |           Module1.pack
    |   |   |   |   |           |   |   |   |           |   |           script.pack
    |   |   |   |   |           |   |   |   |           |   |           
    |   |   |   |   |           |   |   |   |           |   +---config
    |   |   |   |   |           |   |   |   |           |   |       autotbl.pack
    |   |   |   |   |           |   |   |   |           |   |       javasettings_Linux_X86_64.pack
    |   |   |   |   |           |   |   |   |           |   |       
    |   |   |   |   |           |   |   |   |           |   \---database
    |   |   |   |   |           |   |   |   |           |       |   biblio.pack
    |   |   |   |   |           |   |   |   |           |       |   evolocal.pack
    |   |   |   |   |           |   |   |   |           |       |   
    |   |   |   |   |           |   |   |   |           |       \---biblio
    |   |   |   |   |           |   |   |   |           |               biblio.pack
    |   |   |   |   |           |   |   |   |           |               
    |   |   |   |   |           |   |   |   |           \---uno_packages
    |   |   |   |   |           |   |   |   |               \---cache
    |   |   |   |   |           |   |   |   |                   \---registry
    |   |   |   |   |           |   |   |   |                       +---com.sun.star.comp.deployment.configuration.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |                       |       backenddb.xml
    |   |   |   |   |           |   |   |   |                       |       
    |   |   |   |   |           |   |   |   |                       \---com.sun.star.comp.deployment.help.PackageRegistryBackend
    |   |   |   |   |           |   |   |   |                               backenddb.xml
    |   |   |   |   |           |   |   |   |                               
    |   |   |   |   |           |   |   |   +---neofetch
    |   |   |   |   |           |   |   |   |       config.conf
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---nitrogen
    |   |   |   |   |           |   |   |   |       nitrogen.cfg
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---pcmanfm
    |   |   |   |   |           |   |   |   |   +---asura
    |   |   |   |   |           |   |   |   |   |       desktop-items-0.conf
    |   |   |   |   |           |   |   |   |   |       pcmanfm.conf
    |   |   |   |   |           |   |   |   |   |       
    |   |   |   |   |           |   |   |   |   \---default
    |   |   |   |   |           |   |   |   |           desktop-items-0.conf
    |   |   |   |   |           |   |   |   |           pcmanfm.conf
    |   |   |   |   |           |   |   |   |           
    |   |   |   |   |           |   |   |   +---picom
    |   |   |   |   |           |   |   |   |       picom.conf
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---sxhkd
    |   |   |   |   |           |   |   |   |       bspwm_smart_move
    |   |   |   |   |           |   |   |   |       sxhkdrc
    |   |   |   |   |           |   |   |   |       sxhkdrc.default
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---vifm
    |   |   |   |   |           |   |   |   |   |   vifm-help.txt
    |   |   |   |   |           |   |   |   |   |   vifminfo.json
    |   |   |   |   |           |   |   |   |   |   vifmrc
    |   |   |   |   |           |   |   |   |   |   
    |   |   |   |   |           |   |   |   |   +---colors
    |   |   |   |   |           |   |   |   |   |       Default.vifm
    |   |   |   |   |           |   |   |   |   |       
    |   |   |   |   |           |   |   |   |   +---defaults
    |   |   |   |   |           |   |   |   |   |       vifm-help.txt
    |   |   |   |   |           |   |   |   |   |       vifmrc
    |   |   |   |   |           |   |   |   |   |       
    |   |   |   |   |           |   |   |   |   \---scripts
    |   |   |   |   |           |   |   |   |           README
    |   |   |   |   |           |   |   |   |           
    |   |   |   |   |           |   |   |   \---vis
    |   |   |   |   |           |   |   |       |   config
    |   |   |   |   |           |   |   |       |   vis.log
    |   |   |   |   |           |   |   |       |   
    |   |   |   |   |           |   |   |       \---colors
    |   |   |   |   |           |   |   |               basic_colors
    |   |   |   |   |           |   |   |               rainbow
    |   |   |   |   |           |   |   |               
    |   |   |   |   |           |   |   +---.icons
    |   |   |   |   |           |   |   |   |   cursors
    |   |   |   |   |           |   |   |   |   
    |   |   |   |   |           |   |   |   \---default
    |   |   |   |   |           |   |   |           cursors
    |   |   |   |   |           |   |   |           index.theme
    |   |   |   |   |           |   |   |           setcursor.sh
    |   |   |   |   |           |   |   |           
    |   |   |   |   |           |   |   +---.scripts
    |   |   |   |   |           |   |   |   |   clipkger.sh
    |   |   |   |   |           |   |   |   |   dotfilemgr.sh
    |   |   |   |   |           |   |   |   |   gitmgr.sh
    |   |   |   |   |           |   |   |   |   gtk_util.sh
    |   |   |   |   |           |   |   |   |   notepad.sh
    |   |   |   |   |           |   |   |   |   screenlocker.sh
    |   |   |   |   |           |   |   |   |   suckless_downloadpatches.sh
    |   |   |   |   |           |   |   |   |   
    |   |   |   |   |           |   |   |   +---libraries
    |   |   |   |   |           |   |   |   |       extlib.sh
    |   |   |   |   |           |   |   |   |       maths.sh
    |   |   |   |   |           |   |   |   |       pacman.sh
    |   |   |   |   |           |   |   |   |       rice.sh
    |   |   |   |   |           |   |   |   |       strutil.sh
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---st
    |   |   |   |   |           |   |   |   |       ff-blur
    |   |   |   |   |           |   |   |   |       ff-border
    |   |   |   |   |           |   |   |   |       ff-bright
    |   |   |   |   |           |   |   |   |       to_ff.sh
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   \---vim
    |   |   |   |   |           |   |   |           templatesel.sh
    |   |   |   |   |           |   |   |           
    |   |   |   |   |           |   |   +---.urxvt
    |   |   |   |   |           |   |   |   \---ext
    |   |   |   |   |           |   |   |           resize-font
    |   |   |   |   |           |   |   |           
    |   |   |   |   |           |   |   +---.vim
    |   |   |   |   |           |   |   |   |   .netrwhist
    |   |   |   |   |           |   |   |   |   vimrc
    |   |   |   |   |           |   |   |   |   
    |   |   |   |   |           |   |   |   +---autoload
    |   |   |   |   |           |   |   |   |       plug.vim
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   \---templates
    |   |   |   |   |           |   |   |           index.html
    |   |   |   |   |           |   |   |           main.c
    |   |   |   |   |           |   |   |           main.cpp
    |   |   |   |   |           |   |   |           main.cs
    |   |   |   |   |           |   |   |           main.css
    |   |   |   |   |           |   |   |           main.h
    |   |   |   |   |           |   |   |           main.java
    |   |   |   |   |           |   |   |           main.js
    |   |   |   |   |           |   |   |           main.min.sh
    |   |   |   |   |           |   |   |           main.py
    |   |   |   |   |           |   |   |           main.sh
    |   |   |   |   |           |   |   |           README.md
    |   |   |   |   |           |   |   |           
    |   |   |   |   |           |   |   +---Desktop
    |   |   |   |   |           |   |   |   +---apps
    |   |   |   |   |           |   |   |   |       rar
    |   |   |   |   |           |   |   |   |       unrar
    |   |   |   |   |           |   |   |   |       xmenu.sh
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   +---drafts
    |   |   |   |   |           |   |   |   |       archwiki-pages.sh
    |   |   |   |   |           |   |   |   |       bspwm_designer.sh
    |   |   |   |   |           |   |   |   |       cowsayer.sh
    |   |   |   |   |           |   |   |   |       pages
    |   |   |   |   |           |   |   |   |       
    |   |   |   |   |           |   |   |   \---portable
    |   |   |   |   |           |   |   |       +---doc
    |   |   |   |   |           |   |   |       |   \---defaults
    |   |   |   |   |           |   |   |       |           sofficerc
    |   |   |   |   |           |   |   |       |           
    |   |   |   |   |           |   |   |       +---media
    |   |   |   |   |           |   |   |       |   \---Images
    |   |   |   |   |           |   |   |       |       +---JPG
    |   |   |   |   |           |   |   |       |       |       wallhaven-nature.jpg
    |   |   |   |   |           |   |   |       |       |       wallhaven-Ocean.jpg
    |   |   |   |   |           |   |   |       |       |       wallhaven-Tokyo.jpg
    |   |   |   |   |           |   |   |       |       |       
    |   |   |   |   |           |   |   |       |       \---PNG
    |   |   |   |   |           |   |   |       |               DigitalOcean
    |   |   |   |   |           |   |   |       |               nier-automata-menu-background.png
    |   |   |   |   |           |   |   |       |               wallhaven-win10.png
    |   |   |   |   |           |   |   |       |               
    |   |   |   |   |           |   |   |       +---projects
    |   |   |   |   |           |   |   |       |   +---coding
    |   |   |   |   |           |   |   |       |   |   +---cli
    |   |   |   |   |           |   |   |       |   |   |   \---PracticeGround_TestBench
    |   |   |   |   |           |   |   |       |   |   |       +---cpp
    |   |   |   |   |           |   |   |       |   |   |       |   \---workspace
    |   |   |   |   |           |   |   |       |   |   |       |       \---src
    |   |   |   |   |           |   |   |       |   |   |       |           |   extlib.h
    |   |   |   |   |           |   |   |       |   |   |       |           |   main.cpp
    |   |   |   |   |           |   |   |       |   |   |       |           |   main.exe
    |   |   |   |   |           |   |   |       |   |   |       |           |   make.sh
    |   |   |   |   |           |   |   |       |   |   |       |           |   
    |   |   |   |   |           |   |   |       |   |   |       |           \---resources
    |   |   |   |   |           |   |   |       |   |   |       |               |   changelogs
    |   |   |   |   |           |   |   |       |   |   |       |               |   
    |   |   |   |   |           |   |   |       |   |   |       |               \---out
    |   |   |   |   |           |   |   |       |   |   |       |                       out.txt
    |   |   |   |   |           |   |   |       |   |   |       |                       
    |   |   |   |   |           |   |   |       |   |   |       +---python
    |   |   |   |   |           |   |   |       |   |   |       |   \---workspace
    |   |   |   |   |           |   |   |       |   |   |       |       \---resources
    |   |   |   |   |           |   |   |       |   |   |       |           \---Dictionary
    |   |   |   |   |           |   |   |       |   |   |       |                   lang.py
    |   |   |   |   |           |   |   |       |   |   |       |                   
    |   |   |   |   |           |   |   |       |   |   |       \---resources
    |   |   |   |   |           |   |   |       |   |   |               README.md
    |   |   |   |   |           |   |   |       |   |   |               
    |   |   |   |   |           |   |   |       |   |   +---gui
    |   |   |   |   |           |   |   |       |   |   |   +---AutoGUI
    |   |   |   |   |           |   |   |       |   |   |   |   \---C++
    |   |   |   |   |           |   |   |       |   |   |   |       \---workspace
    |   |   |   |   |           |   |   |       |   |   |   |           +---resources
    |   |   |   |   |           |   |   |       |   |   |   |           |       README.md
    |   |   |   |   |           |   |   |       |   |   |   |           |       
    |   |   |   |   |           |   |   |       |   |   |   |           \---src
    |   |   |   |   |           |   |   |       |   |   |   |                   main.cpp
    |   |   |   |   |           |   |   |       |   |   |   |                   main.exe
    |   |   |   |   |           |   |   |       |   |   |   |                   make.sh
    |   |   |   |   |           |   |   |       |   |   |   |                   
    |   |   |   |   |           |   |   |       |   |   |   \---PracticeGround_TestBench
    |   |   |   |   |           |   |   |       |   |   |       +---cpp
    |   |   |   |   |           |   |   |       |   |   |       |   \---workspace
    |   |   |   |   |           |   |   |       |   |   |       |       \---src
    |   |   |   |   |           |   |   |       |   |   |       |           |   main.cpp
    |   |   |   |   |           |   |   |       |   |   |       |           |   main.exe
    |   |   |   |   |           |   |   |       |   |   |       |           |   make.sh
    |   |   |   |   |           |   |   |       |   |   |       |           |   wxGUI.cpp
    |   |   |   |   |           |   |   |       |   |   |       |           |   wxGUI.exe
    |   |   |   |   |           |   |   |       |   |   |       |           |   
    |   |   |   |   |           |   |   |       |   |   |       |           +---resources
    |   |   |   |   |           |   |   |       |   |   |       |           |   \---out
    |   |   |   |   |           |   |   |       |   |   |       |           |           out.txt
    |   |   |   |   |           |   |   |       |   |   |       |           |           
    |   |   |   |   |           |   |   |       |   |   |       |           \---samples
    |   |   |   |   |           |   |   |       |   |   |       |                   minimal.cpp
    |   |   |   |   |           |   |   |       |   |   |       |                   minimal.exe
    |   |   |   |   |           |   |   |       |   |   |       |                   
    |   |   |   |   |           |   |   |       |   |   |       +---python
    |   |   |   |   |           |   |   |       |   |   |       |   \---workspace
    |   |   |   |   |           |   |   |       |   |   |       |       \---resources
    |   |   |   |   |           |   |   |       |   |   |       |           \---Dictionary
    |   |   |   |   |           |   |   |       |   |   |       |                   lang.py
    |   |   |   |   |           |   |   |       |   |   |       |                   
    |   |   |   |   |           |   |   |       |   |   |       \---resources
    |   |   |   |   |           |   |   |       |   |   |               README.md
    |   |   |   |   |           |   |   |       |   |   |               
    |   |   |   |   |           |   |   |       |   |   +---python
    |   |   |   |   |           |   |   |       |   |   |   \---PracticeGround-TestBench
    |   |   |   |   |           |   |   |       |   |   |       \---workspace
    |   |   |   |   |           |   |   |       |   |   |           |   main.py
    |   |   |   |   |           |   |   |       |   |   |           |   
    |   |   |   |   |           |   |   |       |   |   |           \---resources
    |   |   |   |   |           |   |   |       |   |   |               \---Dictionary
    |   |   |   |   |           |   |   |       |   |   |                       lang.py
    |   |   |   |   |           |   |   |       |   |   |                       
    |   |   |   |   |           |   |   |       |   |   \---Template
    |   |   |   |   |           |   |   |       |   |       +---files
    |   |   |   |   |           |   |   |       |   |       |   |   make.sh
    |   |   |   |   |           |   |   |       |   |       |   |   
    |   |   |   |   |           |   |   |       |   |       |   +---ARCHIVE
    |   |   |   |   |           |   |   |       |   |       |   |   \---2021-04-25 0011H
    |   |   |   |   |           |   |   |       |   |       |   |           make.sh
    |   |   |   |   |           |   |   |       |   |       |   |           
    |   |   |   |   |           |   |   |       |   |       |   \---cpp
    |   |   |   |   |           |   |   |       |   |       |       \---GUI
    |   |   |   |   |           |   |   |       |   |       |           \---wxWidgets
    |   |   |   |   |           |   |   |       |   |       |                   main.cpp
    |   |   |   |   |           |   |   |       |   |       |                   
    |   |   |   |   |           |   |   |       |   |       \---structure
    |   |   |   |   |           |   |   |       |   |           +---cli
    |   |   |   |   |           |   |   |       |   |           |   \---cpp
    |   |   |   |   |           |   |   |       |   |           |       \---workspace
    |   |   |   |   |           |   |   |       |   |           |           +---resources
    |   |   |   |   |           |   |   |       |   |           |           |       README.md
    |   |   |   |   |           |   |   |       |   |           |           |       
    |   |   |   |   |           |   |   |       |   |           |           \---src
    |   |   |   |   |           |   |   |       |   |           |                   make.sh
    |   |   |   |   |           |   |   |       |   |           |                   
    |   |   |   |   |           |   |   |       |   |           +---gui
    |   |   |   |   |           |   |   |       |   |           |   \---cpp
    |   |   |   |   |           |   |   |       |   |           |       \---workspace
    |   |   |   |   |           |   |   |       |   |           |           +---resources
    |   |   |   |   |           |   |   |       |   |           |           |       README.md
    |   |   |   |   |           |   |   |       |   |           |           |       
    |   |   |   |   |           |   |   |       |   |           |           \---src
    |   |   |   |   |           |   |   |       |   |           |                   make.sh
    |   |   |   |   |           |   |   |       |   |           |                   
    |   |   |   |   |           |   |   |       |   |           +---java
    |   |   |   |   |           |   |   |       |   |           |   \---workspace
    |   |   |   |   |           |   |   |       |   |           |       |   README.md
    |   |   |   |   |           |   |   |       |   |           |       |   
    |   |   |   |   |           |   |   |       |   |           |       \---src
    |   |   |   |   |           |   |   |       |   |           |               make.sh
    |   |   |   |   |           |   |   |       |   |           |               
    |   |   |   |   |           |   |   |       |   |           +---python
    |   |   |   |   |           |   |   |       |   |           |   \---workspace
    |   |   |   |   |           |   |   |       |   |           |       |   README.md
    |   |   |   |   |           |   |   |       |   |           |       |   
    |   |   |   |   |           |   |   |       |   |           |       \---resources
    |   |   |   |   |           |   |   |       |   |           |           \---Dictionary
    |   |   |   |   |           |   |   |       |   |           |                   lang.py
    |   |   |   |   |           |   |   |       |   |           |                   
    |   |   |   |   |           |   |   |       |   |           \---web-design
    |   |   |   |   |           |   |   |       |   |               \---workspace
    |   |   |   |   |           |   |   |       |   |                   |   index.html
    |   |   |   |   |           |   |   |       |   |                   |   run.sh
    |   |   |   |   |           |   |   |       |   |                   |   
    |   |   |   |   |           |   |   |       |   |                   +---resources
    |   |   |   |   |           |   |   |       |   |                   |   +---docs
    |   |   |   |   |           |   |   |       |   |                   |   |       README.md
    |   |   |   |   |           |   |   |       |   |                   |   |       
    |   |   |   |   |           |   |   |       |   |                   |   \---styles
    |   |   |   |   |           |   |   |       |   |                   |           main.css
    |   |   |   |   |           |   |   |       |   |                   |           
    |   |   |   |   |           |   |   |       |   |                   \---scripts
    |   |   |   |   |           |   |   |       |   |                           main.js
    |   |   |   |   |           |   |   |       |   |                           
    |   |   |   |   |           |   |   |       |   +---Game-Guides
    |   |   |   |   |           |   |   |       |   |   \---AllGames
    |   |   |   |   |           |   |   |       |   |       \---workspace
    |   |   |   |   |           |   |   |       |   |           \---Python
    |   |   |   |   |           |   |   |       |   |               \---ProjEDEN
    |   |   |   |   |           |   |   |       |   |                   \---src
    |   |   |   |   |           |   |   |       |   |                           autorun.sh
    |   |   |   |   |           |   |   |       |   |                           main.py
    |   |   |   |   |           |   |   |       |   |                           out_data.txt
    |   |   |   |   |           |   |   |       |   |                           
    |   |   |   |   |           |   |   |       |   +---Linux
    |   |   |   |   |           |   |   |       |   |   +---general
    |   |   |   |   |           |   |   |       |   |   |       shlib.sh
    |   |   |   |   |           |   |   |       |   |   |       
    |   |   |   |   |           |   |   |       |   |   \---utilities
    |   |   |   |   |           |   |   |       |   |       +---cronjob-scripts
    |   |   |   |   |           |   |   |       |   |       |       debug.sh
    |   |   |   |   |           |   |   |       |   |       |       debug_21-04-16.log
    |   |   |   |   |           |   |   |       |   |       |       pkg-autoupdater.sh
    |   |   |   |   |           |   |   |       |   |       |       
    |   |   |   |   |           |   |   |       |   |       +---dmenu
    |   |   |   |   |           |   |   |       |   |       |   \---scripts
    |   |   |   |   |           |   |   |       |   |       |           templates
    |   |   |   |   |           |   |   |       |   |       |           
    |   |   |   |   |           |   |   |       |   |       +---git
    |   |   |   |   |           |   |   |       |   |       |       gitlib.sh
    |   |   |   |   |           |   |   |       |   |       |       gitmgr.sh
    |   |   |   |   |           |   |   |       |   |       |       
    |   |   |   |   |           |   |   |       |   |       +---setups
    |   |   |   |   |           |   |   |       |   |       |       install-aur.sh
    |   |   |   |   |           |   |   |       |   |       |       
    |   |   |   |   |           |   |   |       |   |       \---wrappers
    |   |   |   |   |           |   |   |       |   |           |   makelib.sh
    |   |   |   |   |           |   |   |       |   |           |   pacinstaller.sh
    |   |   |   |   |           |   |   |       |   |           |   screenshot.sh
    |   |   |   |   |           |   |   |       |   |           |   surfer.sh
    |   |   |   |   |           |   |   |       |   |           |   vimopen.sh
    |   |   |   |   |           |   |   |       |   |           |   
    |   |   |   |   |           |   |   |       |   |           +---apps
    |   |   |   |   |           |   |   |       |   |           |   \---eww
    |   |   |   |   |           |   |   |       |   |           |           wreww.sh
    |   |   |   |   |           |   |   |       |   |           |           
    |   |   |   |   |           |   |   |       |   |           \---multi-maker
    |   |   |   |   |           |   |   |       |   |                   make.sh
    |   |   |   |   |           |   |   |       |   |                   README.md
    |   |   |   |   |           |   |   |       |   |                   
    |   |   |   |   |           |   |   |       |   \---Templates
    |   |   |   |   |           |   |   |       |       |   autorun.sh
    |   |   |   |   |           |   |   |       |       |   make.sh
    |   |   |   |   |           |   |   |       |       |   
    |   |   |   |   |           |   |   |       |       \---ARCHIVE
    |   |   |   |   |           |   |   |       |           +---autorunner
    |   |   |   |   |           |   |   |       |           |   \---2021-03-31 0934H
    |   |   |   |   |           |   |   |       |           |           autorun.sh
    |   |   |   |   |           |   |   |       |           |           
    |   |   |   |   |           |   |   |       |           \---make_shellscript
    |   |   |   |   |           |   |   |       |               \---2021-04-25 0011H
    |   |   |   |   |           |   |   |       |                       make.sh
    |   |   |   |   |           |   |   |       |                       
    |   |   |   |   |           |   |   |       \---repos
    |   |   |   |   |           |   |   |           \---rar
    |   |   |   |   |           |   |   |                   nier_automata_cursor__hack_edition__v2_by_juliodrai_dc6aarz.rar
    |   |   |   |   |           |   |   |                   
    |   |   |   |   |           |   |   \---personal
    |   |   |   |   |           |   |       +---autostart
    |   |   |   |   |           |   |       |       autostart.sh
    |   |   |   |   |           |   |       |       wallpaper.jpg
    |   |   |   |   |           |   |       |       
    |   |   |   |   |           |   |       +---codes
    |   |   |   |   |           |   |       |       compilers.sh
    |   |   |   |   |           |   |       |       
    |   |   |   |   |           |   |       +---designs
    |   |   |   |   |           |   |       |   \---XOrg
    |   |   |   |   |           |   |       |       \---xresources
    |   |   |   |   |           |   |       |               genera.xresources
    |   |   |   |   |           |   |       |               gruvbox-dark.xresources
    |   |   |   |   |           |   |       |               matrix-green.xresources
    |   |   |   |   |           |   |       |               wal-nature.xresources
    |   |   |   |   |           |   |       |               
    |   |   |   |   |           |   |       +---dotfiles
    |   |   |   |   |           |   |       |   +---bars
    |   |   |   |   |           |   |       |   |   |   bar
    |   |   |   |   |           |   |       |   |   |   
    |   |   |   |   |           |   |       |   |   +---ARCHIVE
    |   |   |   |   |           |   |       |   |   |   \---2021-04-18 1207H
    |   |   |   |   |           |   |       |   |   |           bar
    |   |   |   |   |           |   |       |   |   |           
    |   |   |   |   |           |   |       |   |   \---lemonbar
    |   |   |   |   |           |   |       |   |       |   bspwm-widgets.sh
    |   |   |   |   |           |   |       |   |       |   lemonbar_Desc.sh
    |   |   |   |   |           |   |       |   |       |   lemonbar_Func.sh
    |   |   |   |   |           |   |       |   |       |   lemonbar_Run.sh
    |   |   |   |   |           |   |       |   |       |   widgets.sh
    |   |   |   |   |           |   |       |   |       |   
    |   |   |   |   |           |   |       |   |       +---profiles
    |   |   |   |   |           |   |       |   |       |   +---2021-04-17 2237H
    |   |   |   |   |           |   |       |   |       |   |       bar
    |   |   |   |   |           |   |       |   |       |   |       lemonbar.sh
    |   |   |   |   |           |   |       |   |       |   |       widgets.sh
    |   |   |   |   |           |   |       |   |       |   |       
    |   |   |   |   |           |   |       |   |       |   +---2021-04-18 0946H
    |   |   |   |   |           |   |       |   |       |   |       lemonbar_Desc.sh
    |   |   |   |   |           |   |       |   |       |   |       lemonbar_Run.sh
    |   |   |   |   |           |   |       |   |       |   |       widgets.sh
    |   |   |   |   |           |   |       |   |       |   |       
    |   |   |   |   |           |   |       |   |       |   +---2021-04-19 1007H
    |   |   |   |   |           |   |       |   |       |   |       lemonbar_Desc.sh
    |   |   |   |   |           |   |       |   |       |   |       lemonbar_Run.sh
    |   |   |   |   |           |   |       |   |       |   |       widgets.sh
    |   |   |   |   |           |   |       |   |       |   |       
    |   |   |   |   |           |   |       |   |       |   +---2021-04-19 1130H
    |   |   |   |   |           |   |       |   |       |   |       bspwm-widgets.sh
    |   |   |   |   |           |   |       |   |       |   |       lemonbar_Desc.sh
    |   |   |   |   |           |   |       |   |       |   |       lemonbar_Func.sh
    |   |   |   |   |           |   |       |   |       |   |       lemonbar_Run.sh
    |   |   |   |   |           |   |       |   |       |   |       widgets.sh
    |   |   |   |   |           |   |       |   |       |   |       
    |   |   |   |   |           |   |       |   |       |   \---2021-04-20 1001H
    |   |   |   |   |           |   |       |   |       |           bspwm-widgets.sh
    |   |   |   |   |           |   |       |   |       |           lemonbar_Desc.sh
    |   |   |   |   |           |   |       |   |       |           lemonbar_Func.sh
    |   |   |   |   |           |   |       |   |       |           lemonbar_Run.sh
    |   |   |   |   |           |   |       |   |       |           widgets.sh
    |   |   |   |   |           |   |       |   |       |           
    |   |   |   |   |           |   |       |   |       \---Templates
    |   |   |   |   |           |   |       |   |               bar
    |   |   |   |   |           |   |       |   |               bar-1
    |   |   |   |   |           |   |       |   |               lemonbar.sh
    |   |   |   |   |           |   |       |   |               widgets.sh
    |   |   |   |   |           |   |       |   |               
    |   |   |   |   |           |   |       |   +---bash
    |   |   |   |   |           |   |       |   |   |   .bashrc-personal
    |   |   |   |   |           |   |       |   |   |   .custom-paths
    |   |   |   |   |           |   |       |   |   |   .custom-scripts
    |   |   |   |   |           |   |       |   |   |   .custom-variables
    |   |   |   |   |           |   |       |   |   |   .installers
    |   |   |   |   |           |   |       |   |   |   
    |   |   |   |   |           |   |       |   |   +---aliases
    |   |   |   |   |           |   |       |   |   |       .build
    |   |   |   |   |           |   |       |   |   |       .customization
    |   |   |   |   |           |   |       |   |   |       .files
    |   |   |   |   |           |   |       |   |   |       .general
    |   |   |   |   |           |   |       |   |   |       .paths
    |   |   |   |   |           |   |       |   |   |       .pkgmgr
    |   |   |   |   |           |   |       |   |   |       .programs
    |   |   |   |   |           |   |       |   |   |       .services
    |   |   |   |   |           |   |       |   |   |       .systems
    |   |   |   |   |           |   |       |   |   |       .view_edit
    |   |   |   |   |           |   |       |   |   |       .windows
    |   |   |   |   |           |   |       |   |   |       .xorg
    |   |   |   |   |           |   |       |   |   |       
    |   |   |   |   |           |   |       |   |   +---customs
    |   |   |   |   |           |   |       |   |   |   |   .custom-aliases
    |   |   |   |   |           |   |       |   |   |   |   .custom-autostart
    |   |   |   |   |           |   |       |   |   |   |   .custom-variables
    |   |   |   |   |           |   |       |   |   |   |   .edit-aliases
    |   |   |   |   |           |   |       |   |   |   |   
    |   |   |   |   |           |   |       |   |   |   \---progs
    |   |   |   |   |           |   |       |   |   |           .compilers
    |   |   |   |   |           |   |       |   |   |           .runner
    |   |   |   |   |           |   |       |   |   |           
    |   |   |   |   |           |   |       |   |   +---functions
    |   |   |   |   |           |   |       |   |   |       datetimectl
    |   |   |   |   |           |   |       |   |   |       general
    |   |   |   |   |           |   |       |   |   |       package_manager
    |   |   |   |   |           |   |       |   |   |       
    |   |   |   |   |           |   |       |   |   +---package_manager
    |   |   |   |   |           |   |       |   |   |       .apt
    |   |   |   |   |           |   |       |   |   |       .pacman
    |   |   |   |   |           |   |       |   |   |       
    |   |   |   |   |           |   |       |   |   \---variables
    |   |   |   |   |           |   |       |   |           arrays
    |   |   |   |   |           |   |       |   |           commands
    |   |   |   |   |           |   |       |   |           general
    |   |   |   |   |           |   |       |   |           paths
    |   |   |   |   |           |   |       |   |           
    |   |   |   |   |           |   |       |   \---setup
    |   |   |   |   |           |   |       |       +---conky
    |   |   |   |   |           |   |       |       |       start.sh
    |   |   |   |   |           |   |       |       |       
    |   |   |   |   |           |   |       |       \---samba
    |   |   |   |   |           |   |       |               setup.sh
    |   |   |   |   |           |   |       |               
    |   |   |   |   |           |   |       \---scripts
    |   |   |   |   |           |   |           \---bash
    |   |   |   |   |           |   |               +---dmenu
    |   |   |   |   |           |   |               |       dmenu_Browsers.sh
    |   |   |   |   |           |   |               |       dmenu_fopener.sh
    |   |   |   |   |           |   |               |       dmenu_git.sh
    |   |   |   |   |           |   |               |       dmenu_pacman.sh
    |   |   |   |   |           |   |               |       dmenu_proc_ctrl.sh
    |   |   |   |   |           |   |               |       dmenu_Template.sh
    |   |   |   |   |           |   |               |       indexmenu.sh
    |   |   |   |   |           |   |               |       
    |   |   |   |   |           |   |               \---Tutorials_and_Guides
    |   |   |   |   |           |   |                   |   indexmenu-tutorials.sh
    |   |   |   |   |           |   |                   |   README.md
    |   |   |   |   |           |   |                   |   
    |   |   |   |   |           |   |                   \---Terminal
    |   |   |   |   |           |   |                           arrays.sh
    |   |   |   |   |           |   |                           receiving_pipe.sh
    |   |   |   |   |           |   |                           
    |   |   |   |   |           |   \---2021-07-08_1522H
    |   |   |   |   |           |       |   .bashrc
    |   |   |   |   |           |       |   .xinitrc
    |   |   |   |   |           |       |   .Xresources
    |   |   |   |   |           |       |   
    |   |   |   |   |           |       +---.config
    |   |   |   |   |           |       |   +---bspwm
    |   |   |   |   |           |       |   |       bspwmrc
    |   |   |   |   |           |       |   |       bspwmrc.test
    |   |   |   |   |           |       |   |       panel
    |   |   |   |   |           |       |   |       panel_bar
    |   |   |   |   |           |       |   |       
    |   |   |   |   |           |       |   +---conky
    |   |   |   |   |           |       |   |       conky-keybindings.conf
    |   |   |   |   |           |       |   |       conky-middle_left.conf
    |   |   |   |   |           |       |   |       conky-middle_right.conf
    |   |   |   |   |           |       |   |       conky-TODOList.conf
    |   |   |   |   |           |       |   |       conky.conf.default
    |   |   |   |   |           |       |   |       conky.general.conf
    |   |   |   |   |           |       |   |       
    |   |   |   |   |           |       |   +---dunst
    |   |   |   |   |           |       |   |       dunstrc
    |   |   |   |   |           |       |   |       
    |   |   |   |   |           |       |   +---eww
    |   |   |   |   |           |       |   |   |   eww-bar.png
    |   |   |   |   |           |       |   |   |   eww.scss
    |   |   |   |   |           |       |   |   |   eww.xml
    |   |   |   |   |           |       |   |   |   
    |   |   |   |   |           |       |   |   \---scripts
    |   |   |   |   |           |       |   |           getram
    |   |   |   |   |           |       |   |           getvol
    |   |   |   |   |           |       |   |           
    |   |   |   |   |           |       |   +---htop
    |   |   |   |   |           |       |   |       htoprc
    |   |   |   |   |           |       |   |       
    |   |   |   |   |           |       |   +---libfm
    |   |   |   |   |           |       |   |       libfm.conf
    |   |   |   |   |           |       |   |       
    |   |   |   |   |           |       |   +---libreoffice
    |   |   |   |   |           |       |   |   \---4
    |   |   |   |   |           |       |   |       \---user
    |   |   |   |   |           |       |   |           |   registrymodifications.xcu
    |   |   |   |   |           |       |   |           |   
    |   |   |   |   |           |       |   |           +---autotext
    |   |   |   |   |           |       |   |           |       mytexts.bau
    |   |   |   |   |           |       |   |           |       
    |   |   |   |   |           |       |   |           +---basic
    |   |   |   |   |           |       |   |           |   |   dialog.xlc
    |   |   |   |   |           |       |   |           |   |   script.xlc
    |   |   |   |   |           |       |   |           |   |   
    |   |   |   |   |           |       |   |           |   \---Standard
    |   |   |   |   |           |       |   |           |           dialog.xlb
    |   |   |   |   |           |       |   |           |           Module1.xba
    |   |   |   |   |           |       |   |           |           script.xlb
    |   |   |   |   |           |       |   |           |           
    |   |   |   |   |           |       |   |           +---config
    |   |   |   |   |           |       |   |           |       autotbl.fmt
    |   |   |   |   |           |       |   |           |       javasettings_Linux_X86_64.xml
    |   |   |   |   |           |       |   |           |       
    |   |   |   |   |           |       |   |           +---database
    |   |   |   |   |           |       |   |           |   |   biblio.odb
    |   |   |   |   |           |       |   |           |   |   evolocal.odb
    |   |   |   |   |           |       |   |           |   |   
    |   |   |   |   |           |       |   |           |   \---biblio
    |   |   |   |   |           |       |   |           |           biblio.dbf
    |   |   |   |   |           |       |   |           |           biblio.dbt
    |   |   |   |   |           |       |   |           |           
    |   |   |   |   |           |       |   |           +---extensions
    |   |   |   |   |           |       |   |           |   |   buildid
    |   |   |   |   |           |       |   |           |   |   
    |   |   |   |   |           |       |   |           |   +---bundled
    |   |   |   |   |           |       |   |           |   |   |   extensions.pmap
    |   |   |   |   |           |       |   |           |   |   |   lastsynchronized
    |   |   |   |   |           |       |   |           |   |   |   
    |   |   |   |   |           |       |   |           |   |   \---registry
    |   |   |   |   |           |       |   |           |   |       +---com.sun.star.comp.deployment.bundle.PackageRegistryBackend
    |   |   |   |   |           |       |   |           |   |       |       backenddb.xml
    |   |   |   |   |           |       |   |           |   |       |       
    |   |   |   |   |           |       |   |           |   |       +---com.sun.star.comp.deployment.component.PackageRegistryBackend
    |   |   |   |   |           |       |   |           |   |       |       unorc
    |   |   |   |   |           |       |   |           |   |       |       
    |   |   |   |   |           |       |   |           |   |       +---com.sun.star.comp.deployment.configuration.PackageRegistryBackend
    |   |   |   |   |           |       |   |           |   |       |       backenddb.xml
    |   |   |   |   |           |       |   |           |   |       |       configmgr.ini
    |   |   |   |   |           |       |   |           |   |       |       
    |   |   |   |   |           |       |   |           |   |       +---com.sun.star.comp.deployment.help.PackageRegistryBackend
    |   |   |   |   |           |       |   |           |   |       |       backenddb.xml
    |   |   |   |   |           |       |   |           |   |       |       
    |   |   |   |   |           |       |   |           |   |       \---com.sun.star.comp.deployment.script.PackageRegistryBackend
    |   |   |   |   |           |       |   |           |   |               backenddb.xml
    |   |   |   |   |           |       |   |           |   |               
    |   |   |   |   |           |       |   |           |   +---shared
    |   |   |   |   |           |       |   |           |   |   |   lastsynchronized
    |   |   |   |   |           |       |   |           |   |   |   
    |   |   |   |   |           |       |   |           |   |   \---registry
    |   |   |   |   |           |       |   |           |   |       +---com.sun.star.comp.deployment.configuration.PackageRegistryBackend
    |   |   |   |   |           |       |   |           |   |       |       backenddb.xml
    |   |   |   |   |           |       |   |           |   |       |       
    |   |   |   |   |           |       |   |           |   |       \---com.sun.star.comp.deployment.help.PackageRegistryBackend
    |   |   |   |   |           |       |   |           |   |               backenddb.xml
    |   |   |   |   |           |       |   |           |   |               
    |   |   |   |   |           |       |   |           |   \---tmp
    |   |   |   |   |           |       |   |           |       \---registry
    |   |   |   |   |           |       |   |           |           +---com.sun.star.comp.deployment.configuration.PackageRegistryBackend
    |   |   |   |   |           |       |   |           |           |       backenddb.xml
    |   |   |   |   |           |       |   |           |           |       
    |   |   |   |   |           |       |   |           |           \---com.sun.star.comp.deployment.help.PackageRegistryBackend
    |   |   |   |   |           |       |   |           |                   backenddb.xml
    |   |   |   |   |           |       |   |           |                   
    |   |   |   |   |           |       |   |           +---gallery
    |   |   |   |   |           |       |   |           |       sg30.sdv
    |   |   |   |   |           |       |   |           |       sg30.thm
    |   |   |   |   |           |       |   |           |       
    |   |   |   |   |           |       |   |           +---pack
    |   |   |   |   |           |       |   |           |   |   ExtensionInfo.pack
    |   |   |   |   |           |       |   |           |   |   registrymodifications.pack
    |   |   |   |   |           |       |   |           |   |   
    |   |   |   |   |           |       |   |           |   +---autotext
    |   |   |   |   |           |       |   |           |   |       mytexts.pack
    |   |   |   |   |           |       |   |           |   |       
    |   |   |   |   |           |       |   |           |   +---basic
    |   |   |   |   |           |       |   |           |   |   |   dialog.pack
    |   |   |   |   |           |       |   |           |   |   |   script.pack
    |   |   |   |   |           |       |   |           |   |   |   
    |   |   |   |   |           |       |   |           |   |   \---Standard
    |   |   |   |   |           |       |   |           |   |           dialog.pack
    |   |   |   |   |           |       |   |           |   |           Module1.pack
    |   |   |   |   |           |       |   |           |   |           script.pack
    |   |   |   |   |           |       |   |           |   |           
    |   |   |   |   |           |       |   |           |   +---config
    |   |   |   |   |           |       |   |           |   |       autotbl.pack
    |   |   |   |   |           |       |   |           |   |       javasettings_Linux_X86_64.pack
    |   |   |   |   |           |       |   |           |   |       
    |   |   |   |   |           |       |   |           |   \---database
    |   |   |   |   |           |       |   |           |       |   biblio.pack
    |   |   |   |   |           |       |   |           |       |   evolocal.pack
    |   |   |   |   |           |       |   |           |       |   
    |   |   |   |   |           |       |   |           |       \---biblio
    |   |   |   |   |           |       |   |           |               biblio.pack
    |   |   |   |   |           |       |   |           |               
    |   |   |   |   |           |       |   |           \---uno_packages
    |   |   |   |   |           |       |   |               \---cache
    |   |   |   |   |           |       |   |                   \---registry
    |   |   |   |   |           |       |   |                       +---com.sun.star.comp.deployment.configuration.PackageRegistryBackend
    |   |   |   |   |           |       |   |                       |       backenddb.xml
    |   |   |   |   |           |       |   |                       |       
    |   |   |   |   |           |       |   |                       \---com.sun.star.comp.deployment.help.PackageRegistryBackend
    |   |   |   |   |           |       |   |                               backenddb.xml
    |   |   |   |   |           |       |   |                               
    |   |   |   |   |           |       |   +---neofetch
    |   |   |   |   |           |       |   |       config.conf
    |   |   |   |   |           |       |   |       
    |   |   |   |   |           |       |   +---nitrogen
    |   |   |   |   |           |       |   |       nitrogen.cfg
    |   |   |   |   |           |       |   |       
    |   |   |   |   |           |       |   +---pcmanfm
    |   |   |   |   |           |       |   |   +---asura
    |   |   |   |   |           |       |   |   |       desktop-items-0.conf
    |   |   |   |   |           |       |   |   |       pcmanfm.conf
    |   |   |   |   |           |       |   |   |       
    |   |   |   |   |           |       |   |   \---default
    |   |   |   |   |           |       |   |           desktop-items-0.conf
    |   |   |   |   |           |       |   |           pcmanfm.conf
    |   |   |   |   |           |       |   |           
    |   |   |   |   |           |       |   +---picom
    |   |   |   |   |           |       |   |       picom.conf
    |   |   |   |   |           |       |   |       
    |   |   |   |   |           |       |   +---sxhkd
    |   |   |   |   |           |       |   |       bspwm_smart_move
    |   |   |   |   |           |       |   |       sxhkdrc
    |   |   |   |   |           |       |   |       sxhkdrc.default
    |   |   |   |   |           |       |   |       
    |   |   |   |   |           |       |   +---vifm
    |   |   |   |   |           |       |   |   |   vifm-help.txt
    |   |   |   |   |           |       |   |   |   vifminfo.json
    |   |   |   |   |           |       |   |   |   vifmrc
    |   |   |   |   |           |       |   |   |   
    |   |   |   |   |           |       |   |   +---colors
    |   |   |   |   |           |       |   |   |       Default.vifm
    |   |   |   |   |           |       |   |   |       
    |   |   |   |   |           |       |   |   +---defaults
    |   |   |   |   |           |       |   |   |       vifm-help.txt
    |   |   |   |   |           |       |   |   |       vifmrc
    |   |   |   |   |           |       |   |   |       
    |   |   |   |   |           |       |   |   \---scripts
    |   |   |   |   |           |       |   |           README
    |   |   |   |   |           |       |   |           
    |   |   |   |   |           |       |   \---vis
    |   |   |   |   |           |       |       |   config
    |   |   |   |   |           |       |       |   vis.log
    |   |   |   |   |           |       |       |   
    |   |   |   |   |           |       |       \---colors
    |   |   |   |   |           |       |               basic_colors
    |   |   |   |   |           |       |               rainbow
    |   |   |   |   |           |       |               
    |   |   |   |   |           |       +---.icons
    |   |   |   |   |           |       |   |   cursors
    |   |   |   |   |           |       |   |   
    |   |   |   |   |           |       |   \---default
    |   |   |   |   |           |       |           cursors
    |   |   |   |   |           |       |           index.theme
    |   |   |   |   |           |       |           setcursor.sh
    |   |   |   |   |           |       |           
    |   |   |   |   |           |       +---.scripts
    |   |   |   |   |           |       |   |   clipkger.sh
    |   |   |   |   |           |       |   |   dotfilemgr.sh
    |   |   |   |   |           |       |   |   gitmgr.sh
    |   |   |   |   |           |       |   |   gtk_util.sh
    |   |   |   |   |           |       |   |   notepad.sh
    |   |   |   |   |           |       |   |   scratchtermtoggle
    |   |   |   |   |           |       |   |   screenlocker.sh
    |   |   |   |   |           |       |   |   suckless_downloadpatches.sh
    |   |   |   |   |           |       |   |   
    |   |   |   |   |           |       |   +---libraries
    |   |   |   |   |           |       |   |       extlib.sh
    |   |   |   |   |           |       |   |       maths.sh
    |   |   |   |   |           |       |   |       pacman.sh
    |   |   |   |   |           |       |   |       rice.sh
    |   |   |   |   |           |       |   |       strutil.sh
    |   |   |   |   |           |       |   |       
    |   |   |   |   |           |       |   +---st
    |   |   |   |   |           |       |   |       ff-blur
    |   |   |   |   |           |       |   |       ff-border
    |   |   |   |   |           |       |   |       ff-bright
    |   |   |   |   |           |       |   |       to_ff.sh
    |   |   |   |   |           |       |   |       
    |   |   |   |   |           |       |   \---vim
    |   |   |   |   |           |       |           templatesel.sh
    |   |   |   |   |           |       |           
    |   |   |   |   |           |       +---.urxvt
    |   |   |   |   |           |       |   \---ext
    |   |   |   |   |           |       |           resize-font
    |   |   |   |   |           |       |           
    |   |   |   |   |           |       +---.vim
    |   |   |   |   |           |       |   |   .netrwhist
    |   |   |   |   |           |       |   |   vimrc
    |   |   |   |   |           |       |   |   
    |   |   |   |   |           |       |   +---autoload
    |   |   |   |   |           |       |   |       plug.vim
    |   |   |   |   |           |       |   |       
    |   |   |   |   |           |       |   \---templates
    |   |   |   |   |           |       |           index.html
    |   |   |   |   |           |       |           main.c
    |   |   |   |   |           |       |           main.cpp
    |   |   |   |   |           |       |           main.cs
    |   |   |   |   |           |       |           main.css
    |   |   |   |   |           |       |           main.h
    |   |   |   |   |           |       |           main.java
    |   |   |   |   |           |       |           main.js
    |   |   |   |   |           |       |           main.min.sh
    |   |   |   |   |           |       |           main.py
    |   |   |   |   |           |       |           main.sh
    |   |   |   |   |           |       |           README.md
    |   |   |   |   |           |       |           
    |   |   |   |   |           |       +---Desktop
    |   |   |   |   |           |       |   +---apps
    |   |   |   |   |           |       |   |       rar
    |   |   |   |   |           |       |   |       unrar
    |   |   |   |   |           |       |   |       xmenu.sh
    |   |   |   |   |           |       |   |       
    |   |   |   |   |           |       |   +---drafts
    |   |   |   |   |           |       |   |       archwiki-pages.sh
    |   |   |   |   |           |       |   |       bspwm_designer.sh
    |   |   |   |   |           |       |   |       cowsayer.sh
    |   |   |   |   |           |       |   |       pages
    |   |   |   |   |           |       |   |       
    |   |   |   |   |           |       |   \---portable
    |   |   |   |   |           |       |       +---doc
    |   |   |   |   |           |       |       |   \---defaults
    |   |   |   |   |           |       |       |           sofficerc
    |   |   |   |   |           |       |       |           
    |   |   |   |   |           |       |       +---media
    |   |   |   |   |           |       |       |   \---Images
    |   |   |   |   |           |       |       |       +---JPG
    |   |   |   |   |           |       |       |       |       wallhaven-nature.jpg
    |   |   |   |   |           |       |       |       |       wallhaven-Ocean.jpg
    |   |   |   |   |           |       |       |       |       wallhaven-Tokyo.jpg
    |   |   |   |   |           |       |       |       |       
    |   |   |   |   |           |       |       |       \---PNG
    |   |   |   |   |           |       |       |               DigitalOcean
    |   |   |   |   |           |       |       |               nier-automata-menu-background.png
    |   |   |   |   |           |       |       |               wallhaven-win10.png
    |   |   |   |   |           |       |       |               
    |   |   |   |   |           |       |       +---projects
    |   |   |   |   |           |       |       |   +---coding
    |   |   |   |   |           |       |       |   |   +---cli
    |   |   |   |   |           |       |       |   |   |   \---PracticeGround_TestBench
    |   |   |   |   |           |       |       |   |   |       +---cpp
    |   |   |   |   |           |       |       |   |   |       |   \---workspace
    |   |   |   |   |           |       |       |   |   |       |       \---src
    |   |   |   |   |           |       |       |   |   |       |           |   extlib.h
    |   |   |   |   |           |       |       |   |   |       |           |   main.cpp
    |   |   |   |   |           |       |       |   |   |       |           |   main.exe
    |   |   |   |   |           |       |       |   |   |       |           |   make.sh
    |   |   |   |   |           |       |       |   |   |       |           |   
    |   |   |   |   |           |       |       |   |   |       |           \---resources
    |   |   |   |   |           |       |       |   |   |       |               |   changelogs
    |   |   |   |   |           |       |       |   |   |       |               |   
    |   |   |   |   |           |       |       |   |   |       |               \---out
    |   |   |   |   |           |       |       |   |   |       |                       out.txt
    |   |   |   |   |           |       |       |   |   |       |                       
    |   |   |   |   |           |       |       |   |   |       +---python
    |   |   |   |   |           |       |       |   |   |       |   \---workspace
    |   |   |   |   |           |       |       |   |   |       |       \---resources
    |   |   |   |   |           |       |       |   |   |       |           \---Dictionary
    |   |   |   |   |           |       |       |   |   |       |                   lang.py
    |   |   |   |   |           |       |       |   |   |       |                   
    |   |   |   |   |           |       |       |   |   |       \---resources
    |   |   |   |   |           |       |       |   |   |               README.md
    |   |   |   |   |           |       |       |   |   |               
    |   |   |   |   |           |       |       |   |   +---gui
    |   |   |   |   |           |       |       |   |   |   +---AutoGUI
    |   |   |   |   |           |       |       |   |   |   |   \---C++
    |   |   |   |   |           |       |       |   |   |   |       \---workspace
    |   |   |   |   |           |       |       |   |   |   |           +---resources
    |   |   |   |   |           |       |       |   |   |   |           |       README.md
    |   |   |   |   |           |       |       |   |   |   |           |       
    |   |   |   |   |           |       |       |   |   |   |           \---src
    |   |   |   |   |           |       |       |   |   |   |                   main.cpp
    |   |   |   |   |           |       |       |   |   |   |                   main.exe
    |   |   |   |   |           |       |       |   |   |   |                   make.sh
    |   |   |   |   |           |       |       |   |   |   |                   
    |   |   |   |   |           |       |       |   |   |   \---PracticeGround_TestBench
    |   |   |   |   |           |       |       |   |   |       +---cpp
    |   |   |   |   |           |       |       |   |   |       |   \---workspace
    |   |   |   |   |           |       |       |   |   |       |       \---src
    |   |   |   |   |           |       |       |   |   |       |           |   main.cpp
    |   |   |   |   |           |       |       |   |   |       |           |   main.exe
    |   |   |   |   |           |       |       |   |   |       |           |   make.sh
    |   |   |   |   |           |       |       |   |   |       |           |   wxGUI.cpp
    |   |   |   |   |           |       |       |   |   |       |           |   wxGUI.exe
    |   |   |   |   |           |       |       |   |   |       |           |   
    |   |   |   |   |           |       |       |   |   |       |           +---resources
    |   |   |   |   |           |       |       |   |   |       |           |   \---out
    |   |   |   |   |           |       |       |   |   |       |           |           out.txt
    |   |   |   |   |           |       |       |   |   |       |           |           
    |   |   |   |   |           |       |       |   |   |       |           \---samples
    |   |   |   |   |           |       |       |   |   |       |                   minimal.cpp
    |   |   |   |   |           |       |       |   |   |       |                   minimal.exe
    |   |   |   |   |           |       |       |   |   |       |                   
    |   |   |   |   |           |       |       |   |   |       +---python
    |   |   |   |   |           |       |       |   |   |       |   \---workspace
    |   |   |   |   |           |       |       |   |   |       |       \---resources
    |   |   |   |   |           |       |       |   |   |       |           \---Dictionary
    |   |   |   |   |           |       |       |   |   |       |                   lang.py
    |   |   |   |   |           |       |       |   |   |       |                   
    |   |   |   |   |           |       |       |   |   |       \---resources
    |   |   |   |   |           |       |       |   |   |               README.md
    |   |   |   |   |           |       |       |   |   |               
    |   |   |   |   |           |       |       |   |   +---python
    |   |   |   |   |           |       |       |   |   |   \---PracticeGround-TestBench
    |   |   |   |   |           |       |       |   |   |       \---workspace
    |   |   |   |   |           |       |       |   |   |           |   main.py
    |   |   |   |   |           |       |       |   |   |           |   
    |   |   |   |   |           |       |       |   |   |           \---resources
    |   |   |   |   |           |       |       |   |   |               \---Dictionary
    |   |   |   |   |           |       |       |   |   |                       lang.py
    |   |   |   |   |           |       |       |   |   |                       
    |   |   |   |   |           |       |       |   |   \---Template
    |   |   |   |   |           |       |       |   |       +---files
    |   |   |   |   |           |       |       |   |       |   |   make.sh
    |   |   |   |   |           |       |       |   |       |   |   
    |   |   |   |   |           |       |       |   |       |   +---ARCHIVE
    |   |   |   |   |           |       |       |   |       |   |   \---2021-04-25 0011H
    |   |   |   |   |           |       |       |   |       |   |           make.sh
    |   |   |   |   |           |       |       |   |       |   |           
    |   |   |   |   |           |       |       |   |       |   \---cpp
    |   |   |   |   |           |       |       |   |       |       \---GUI
    |   |   |   |   |           |       |       |   |       |           \---wxWidgets
    |   |   |   |   |           |       |       |   |       |                   main.cpp
    |   |   |   |   |           |       |       |   |       |                   
    |   |   |   |   |           |       |       |   |       \---structure
    |   |   |   |   |           |       |       |   |           +---cli
    |   |   |   |   |           |       |       |   |           |   \---cpp
    |   |   |   |   |           |       |       |   |           |       \---workspace
    |   |   |   |   |           |       |       |   |           |           +---resources
    |   |   |   |   |           |       |       |   |           |           |       README.md
    |   |   |   |   |           |       |       |   |           |           |       
    |   |   |   |   |           |       |       |   |           |           \---src
    |   |   |   |   |           |       |       |   |           |                   make.sh
    |   |   |   |   |           |       |       |   |           |                   
    |   |   |   |   |           |       |       |   |           +---gui
    |   |   |   |   |           |       |       |   |           |   \---cpp
    |   |   |   |   |           |       |       |   |           |       \---workspace
    |   |   |   |   |           |       |       |   |           |           +---resources
    |   |   |   |   |           |       |       |   |           |           |       README.md
    |   |   |   |   |           |       |       |   |           |           |       
    |   |   |   |   |           |       |       |   |           |           \---src
    |   |   |   |   |           |       |       |   |           |                   make.sh
    |   |   |   |   |           |       |       |   |           |                   
    |   |   |   |   |           |       |       |   |           +---java
    |   |   |   |   |           |       |       |   |           |   \---workspace
    |   |   |   |   |           |       |       |   |           |       |   README.md
    |   |   |   |   |           |       |       |   |           |       |   
    |   |   |   |   |           |       |       |   |           |       \---src
    |   |   |   |   |           |       |       |   |           |               make.sh
    |   |   |   |   |           |       |       |   |           |               
    |   |   |   |   |           |       |       |   |           +---python
    |   |   |   |   |           |       |       |   |           |   \---workspace
    |   |   |   |   |           |       |       |   |           |       |   README.md
    |   |   |   |   |           |       |       |   |           |       |   
    |   |   |   |   |           |       |       |   |           |       \---resources
    |   |   |   |   |           |       |       |   |           |           \---Dictionary
    |   |   |   |   |           |       |       |   |           |                   lang.py
    |   |   |   |   |           |       |       |   |           |                   
    |   |   |   |   |           |       |       |   |           \---web-design
    |   |   |   |   |           |       |       |   |               \---workspace
    |   |   |   |   |           |       |       |   |                   |   index.html
    |   |   |   |   |           |       |       |   |                   |   run.sh
    |   |   |   |   |           |       |       |   |                   |   
    |   |   |   |   |           |       |       |   |                   +---resources
    |   |   |   |   |           |       |       |   |                   |   +---docs
    |   |   |   |   |           |       |       |   |                   |   |       README.md
    |   |   |   |   |           |       |       |   |                   |   |       
    |   |   |   |   |           |       |       |   |                   |   \---styles
    |   |   |   |   |           |       |       |   |                   |           main.css
    |   |   |   |   |           |       |       |   |                   |           
    |   |   |   |   |           |       |       |   |                   \---scripts
    |   |   |   |   |           |       |       |   |                           main.js
    |   |   |   |   |           |       |       |   |                           
    |   |   |   |   |           |       |       |   +---Game-Guides
    |   |   |   |   |           |       |       |   |   \---AllGames
    |   |   |   |   |           |       |       |   |       \---workspace
    |   |   |   |   |           |       |       |   |           \---Python
    |   |   |   |   |           |       |       |   |               \---ProjEDEN
    |   |   |   |   |           |       |       |   |                   \---src
    |   |   |   |   |           |       |       |   |                           autorun.sh
    |   |   |   |   |           |       |       |   |                           main.py
    |   |   |   |   |           |       |       |   |                           out_data.txt
    |   |   |   |   |           |       |       |   |                           
    |   |   |   |   |           |       |       |   +---Linux
    |   |   |   |   |           |       |       |   |   +---general
    |   |   |   |   |           |       |       |   |   |       shlib.sh
    |   |   |   |   |           |       |       |   |   |       
    |   |   |   |   |           |       |       |   |   \---utilities
    |   |   |   |   |           |       |       |   |       +---cronjob-scripts
    |   |   |   |   |           |       |       |   |       |       debug.sh
    |   |   |   |   |           |       |       |   |       |       debug_21-04-16.log
    |   |   |   |   |           |       |       |   |       |       pkg-autoupdater.sh
    |   |   |   |   |           |       |       |   |       |       
    |   |   |   |   |           |       |       |   |       +---dmenu
    |   |   |   |   |           |       |       |   |       |   \---scripts
    |   |   |   |   |           |       |       |   |       |           templates
    |   |   |   |   |           |       |       |   |       |           
    |   |   |   |   |           |       |       |   |       +---git
    |   |   |   |   |           |       |       |   |       |       gitlib.sh
    |   |   |   |   |           |       |       |   |       |       gitmgr.sh
    |   |   |   |   |           |       |       |   |       |       
    |   |   |   |   |           |       |       |   |       +---setups
    |   |   |   |   |           |       |       |   |       |       install-aur.sh
    |   |   |   |   |           |       |       |   |       |       
    |   |   |   |   |           |       |       |   |       \---wrappers
    |   |   |   |   |           |       |       |   |           |   makelib.sh
    |   |   |   |   |           |       |       |   |           |   pacinstaller.sh
    |   |   |   |   |           |       |       |   |           |   screenshot.sh
    |   |   |   |   |           |       |       |   |           |   surfer.sh
    |   |   |   |   |           |       |       |   |           |   vimopen.sh
    |   |   |   |   |           |       |       |   |           |   
    |   |   |   |   |           |       |       |   |           +---apps
    |   |   |   |   |           |       |       |   |           |   \---eww
    |   |   |   |   |           |       |       |   |           |           wreww.sh
    |   |   |   |   |           |       |       |   |           |           
    |   |   |   |   |           |       |       |   |           \---multi-maker
    |   |   |   |   |           |       |       |   |                   make.sh
    |   |   |   |   |           |       |       |   |                   README.md
    |   |   |   |   |           |       |       |   |                   
    |   |   |   |   |           |       |       |   \---Templates
    |   |   |   |   |           |       |       |       |   autorun.sh
    |   |   |   |   |           |       |       |       |   make.sh
    |   |   |   |   |           |       |       |       |   
    |   |   |   |   |           |       |       |       \---ARCHIVE
    |   |   |   |   |           |       |       |           +---autorunner
    |   |   |   |   |           |       |       |           |   \---2021-03-31 0934H
    |   |   |   |   |           |       |       |           |           autorun.sh
    |   |   |   |   |           |       |       |           |           
    |   |   |   |   |           |       |       |           \---make_shellscript
    |   |   |   |   |           |       |       |               \---2021-04-25 0011H
    |   |   |   |   |           |       |       |                       make.sh
    |   |   |   |   |           |       |       |                       
    |   |   |   |   |           |       |       \---repos
    |   |   |   |   |           |       |           \---rar
    |   |   |   |   |           |       |                   nier_automata_cursor__hack_edition__v2_by_juliodrai_dc6aarz.rar
    |   |   |   |   |           |       |                   
    |   |   |   |   |           |       \---personal
    |   |   |   |   |           |           +---autostart
    |   |   |   |   |           |           |       autostart.sh
    |   |   |   |   |           |           |       wallpaper.jpg
    |   |   |   |   |           |           |       
    |   |   |   |   |           |           +---codes
    |   |   |   |   |           |           |       compilers.sh
    |   |   |   |   |           |           |       
    |   |   |   |   |           |           +---designs
    |   |   |   |   |           |           |   \---XOrg
    |   |   |   |   |           |           |       \---xresources
    |   |   |   |   |           |           |               genera.xresources
    |   |   |   |   |           |           |               gruvbox-dark.xresources
    |   |   |   |   |           |           |               matrix-green.xresources
    |   |   |   |   |           |           |               wal-nature.xresources
    |   |   |   |   |           |           |               
    |   |   |   |   |           |           +---dotfiles
    |   |   |   |   |           |           |   +---bars
    |   |   |   |   |           |           |   |   |   bar
    |   |   |   |   |           |           |   |   |   
    |   |   |   |   |           |           |   |   +---ARCHIVE
    |   |   |   |   |           |           |   |   |   \---2021-04-18 1207H
    |   |   |   |   |           |           |   |   |           bar
    |   |   |   |   |           |           |   |   |           
    |   |   |   |   |           |           |   |   \---lemonbar
    |   |   |   |   |           |           |   |       |   bspwm-widgets.sh
    |   |   |   |   |           |           |   |       |   lemonbar_Desc.sh
    |   |   |   |   |           |           |   |       |   lemonbar_Func.sh
    |   |   |   |   |           |           |   |       |   lemonbar_Run.sh
    |   |   |   |   |           |           |   |       |   widgets.sh
    |   |   |   |   |           |           |   |       |   
    |   |   |   |   |           |           |   |       +---profiles
    |   |   |   |   |           |           |   |       |   +---2021-04-17 2237H
    |   |   |   |   |           |           |   |       |   |       bar
    |   |   |   |   |           |           |   |       |   |       lemonbar.sh
    |   |   |   |   |           |           |   |       |   |       widgets.sh
    |   |   |   |   |           |           |   |       |   |       
    |   |   |   |   |           |           |   |       |   +---2021-04-18 0946H
    |   |   |   |   |           |           |   |       |   |       lemonbar_Desc.sh
    |   |   |   |   |           |           |   |       |   |       lemonbar_Run.sh
    |   |   |   |   |           |           |   |       |   |       widgets.sh
    |   |   |   |   |           |           |   |       |   |       
    |   |   |   |   |           |           |   |       |   +---2021-04-19 1007H
    |   |   |   |   |           |           |   |       |   |       lemonbar_Desc.sh
    |   |   |   |   |           |           |   |       |   |       lemonbar_Run.sh
    |   |   |   |   |           |           |   |       |   |       widgets.sh
    |   |   |   |   |           |           |   |       |   |       
    |   |   |   |   |           |           |   |       |   +---2021-04-19 1130H
    |   |   |   |   |           |           |   |       |   |       bspwm-widgets.sh
    |   |   |   |   |           |           |   |       |   |       lemonbar_Desc.sh
    |   |   |   |   |           |           |   |       |   |       lemonbar_Func.sh
    |   |   |   |   |           |           |   |       |   |       lemonbar_Run.sh
    |   |   |   |   |           |           |   |       |   |       widgets.sh
    |   |   |   |   |           |           |   |       |   |       
    |   |   |   |   |           |           |   |       |   \---2021-04-20 1001H
    |   |   |   |   |           |           |   |       |           bspwm-widgets.sh
    |   |   |   |   |           |           |   |       |           lemonbar_Desc.sh
    |   |   |   |   |           |           |   |       |           lemonbar_Func.sh
    |   |   |   |   |           |           |   |       |           lemonbar_Run.sh
    |   |   |   |   |           |           |   |       |           widgets.sh
    |   |   |   |   |           |           |   |       |           
    |   |   |   |   |           |           |   |       \---Templates
    |   |   |   |   |           |           |   |               bar
    |   |   |   |   |           |           |   |               bar-1
    |   |   |   |   |           |           |   |               lemonbar.sh
    |   |   |   |   |           |           |   |               widgets.sh
    |   |   |   |   |           |           |   |               
    |   |   |   |   |           |           |   +---bash
    |   |   |   |   |           |           |   |   |   .bashrc-personal
    |   |   |   |   |           |           |   |   |   .custom-paths
    |   |   |   |   |           |           |   |   |   .custom-scripts
    |   |   |   |   |           |           |   |   |   .custom-variables
    |   |   |   |   |           |           |   |   |   .installers
    |   |   |   |   |           |           |   |   |   
    |   |   |   |   |           |           |   |   +---aliases
    |   |   |   |   |           |           |   |   |       .build
    |   |   |   |   |           |           |   |   |       .customization
    |   |   |   |   |           |           |   |   |       .files
    |   |   |   |   |           |           |   |   |       .general
    |   |   |   |   |           |           |   |   |       .paths
    |   |   |   |   |           |           |   |   |       .pkgmgr
    |   |   |   |   |           |           |   |   |       .programs
    |   |   |   |   |           |           |   |   |       .services
    |   |   |   |   |           |           |   |   |       .systems
    |   |   |   |   |           |           |   |   |       .view_edit
    |   |   |   |   |           |           |   |   |       .windows
    |   |   |   |   |           |           |   |   |       .xorg
    |   |   |   |   |           |           |   |   |       
    |   |   |   |   |           |           |   |   +---customs
    |   |   |   |   |           |           |   |   |   |   .custom-aliases
    |   |   |   |   |           |           |   |   |   |   .custom-autostart
    |   |   |   |   |           |           |   |   |   |   .custom-variables
    |   |   |   |   |           |           |   |   |   |   .edit-aliases
    |   |   |   |   |           |           |   |   |   |   
    |   |   |   |   |           |           |   |   |   \---progs
    |   |   |   |   |           |           |   |   |           .compilers
    |   |   |   |   |           |           |   |   |           .runner
    |   |   |   |   |           |           |   |   |           
    |   |   |   |   |           |           |   |   +---functions
    |   |   |   |   |           |           |   |   |       datetimectl
    |   |   |   |   |           |           |   |   |       general
    |   |   |   |   |           |           |   |   |       package_manager
    |   |   |   |   |           |           |   |   |       
    |   |   |   |   |           |           |   |   +---package_manager
    |   |   |   |   |           |           |   |   |       .apt
    |   |   |   |   |           |           |   |   |       .pacman
    |   |   |   |   |           |           |   |   |       
    |   |   |   |   |           |           |   |   \---variables
    |   |   |   |   |           |           |   |           arrays
    |   |   |   |   |           |           |   |           commands
    |   |   |   |   |           |           |   |           general
    |   |   |   |   |           |           |   |           paths
    |   |   |   |   |           |           |   |           
    |   |   |   |   |           |           |   \---setup
    |   |   |   |   |           |           |       +---conky
    |   |   |   |   |           |           |       |       start.sh
    |   |   |   |   |           |           |       |       
    |   |   |   |   |           |           |       \---samba
    |   |   |   |   |           |           |               setup.sh
    |   |   |   |   |           |           |               
    |   |   |   |   |           |           \---scripts
    |   |   |   |   |           |               \---bash
    |   |   |   |   |           |                   +---dmenu
    |   |   |   |   |           |                   |       dmenu_Browsers.sh
    |   |   |   |   |           |                   |       dmenu_fopener.sh
    |   |   |   |   |           |                   |       dmenu_git.sh
    |   |   |   |   |           |                   |       dmenu_pacman.sh
    |   |   |   |   |           |                   |       dmenu_proc_ctrl.sh
    |   |   |   |   |           |                   |       dmenu_Template.sh
    |   |   |   |   |           |                   |       indexmenu.sh
    |   |   |   |   |           |                   |       
    |   |   |   |   |           |                   \---Tutorials_and_Guides
    |   |   |   |   |           |                       |   indexmenu-tutorials.sh
    |   |   |   |   |           |                       |   README.md
    |   |   |   |   |           |                       |   
    |   |   |   |   |           |                       \---Terminal
    |   |   |   |   |           |                               arrays.sh
    |   |   |   |   |           |                               receiving_pipe.sh
    |   |   |   |   |           |                               
    |   |   |   |   |           \---install-scripts
    |   |   |   |   |                   example.sh
    |   |   |   |   |                   installer-manual.sh
    |   |   |   |   |                   installer-ux.min.sh
    |   |   |   |   |                   installer.sh
    |   |   |   |   |                   postinstallation-core-packages.sh
    |   |   |   |   |                   
    |   |   |   |   \---Gentoo
    |   |   |   |       \---Reference_Profile-1
    |   |   |   |           +---Documents
    |   |   |   |           |       profile-list
    |   |   |   |           |       
    |   |   |   |           \---install-scripts
    |   |   |   |                   example.sh
    |   |   |   |                   installer-manual.sh
    |   |   |   |                   installer-ux.min.sh
    |   |   |   |                   installer.sh
    |   |   |   |                   postinstallation-core-packages.sh
    |   |   |   |                   postinstallations-root.sh
    |   |   |   |                   postinstallations.sh
    |   |   |   |                   
    |   |   |   \---profiles
    |   |   |       |   README.md
    |   |   |       |   
    |   |   |       +---Asura-1
    |   |   |       |   +---Dotfiles
    |   |   |       |   |       dotfiles_here
    |   |   |       |   |       pkglist
    |   |   |       |   |       
    |   |   |       |   \---install-scripts
    |   |   |       |           customDE-designer.txt
    |   |   |       |           customDE-REMAKE.sh
    |   |   |       |           customDE-simple_flow.sh
    |   |   |       |           customDE.sh
    |   |   |       |           
    |   |   |       \---Reference_Profile_1_Name
    |   |   |           +---Dotfiles
    |   |   |           |       dotfiles_here
    |   |   |           |       pkglist
    |   |   |           |       
    |   |   |           \---install-scripts
    |   |   |                   customDE.sh
    |   |   |                   
    |   |   +---GTK
    |   |   |   |   README.md
    |   |   |   |   
    |   |   |   \---Themeing
    |   |   +---Guides
    |   |   |       customization-packages-masterlist.md
    |   |   |       essential-steps.md
    |   |   |       
    |   |   +---Repositories
    |   |   |       ricing-recommendations.md
    |   |   |       
    |   |   +---Resources
    |   |   |   |   resources-masterlist.txt
    |   |   |   |   
    |   |   |   +---Fonts
    |   |   |   \---Icons
    |   |   |       +---Cursor Icons
    |   |   |       \---Font Icons (Glyphs)
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
    |   +---Cheatsheets
    |   \---Formulas
    |           probability-and-statistics.md
    |           trigonometry.md
    |           
    +---Music
    |   \---Lyrics
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
    |       |       
    |       +---Guides
    |       |   +---Network
    |       |   |   \---Usages
    |       |   |           mounting.md
    |       |   |           
    |       |   \---Servers
    |       |       \---File Server
    |       +---Registry
    |       |       basics.md
    |       |       
    |       +---Windows 10
    |       |       Changing System Fonts.txt
    |       |       Environment Variables.txt
    |       |       KMS Servers.txt
    |       |       
    |       +---Windows-PE
    |       |   \---commands
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
    |   +---Configuration-Files
    |   |       file-formats.md
    |   |       
    |   +---Data-Serialization
    |   |   \---Languages
    |   |       +---cheatsheets
    |   |       |       yaml.md
    |   |       |       
    |   |       \---YAML
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
    |   +---Guides
    |   |   |   project-ideas.md
    |   |   |   promoting.md
    |   |   |   
    |   |   \---Concepts
    |   |       \---Signals
    |   |               basics.md
    |   |               signals.md
    |   |               
    |   +---IoT
    |   +---Languages
    |   |   +---ASSEMBLY
    |   |   |   |   README.md
    |   |   |   |   starters.md
    |   |   |   |   
    |   |   |   \---x86_64
    |   |   |           basics.md
    |   |   |           
    |   |   +---Batch
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
    |   |   |   +---Code-Snippets
    |   |   |   |   \---HelloWorld
    |   |   |   |           compile.bat
    |   |   |   |           main.c
    |   |   |   |           main.exe
    |   |   |   |           
    |   |   |   \---Templates
    |   |   |       \---Project structure
    |   |   |           \---Project_Name
    |   |   |               +---app
    |   |   |               |   \---src
    |   |   |               |           main.c
    |   |   |               |           
    |   |   |               \---docs
    |   |   |                       program_designer.md
    |   |   |                       
    |   |   +---C#
    |   |   |   +---Basics
    |   |   |   |       syntax.txt
    |   |   |   |       
    |   |   |   \---IDE
    |   |   |       \---Visual-Studio
    |   |   |               keybindings.txt
    |   |   |               
    |   |   +---CPP
    |   |   |   |   best-practices.txt
    |   |   |   |   
    |   |   |   +---Code-Snippets
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
    |   |   |   \---topics
    |   |   |           encapsulation.txt
    |   |   |           macros.txt
    |   |   |           vector.txt
    |   |   |           
    |   |   +---Java
    |   |   |   +---Guides
    |   |   |   |       android-java-guides.md
    |   |   |   |       class.md
    |   |   |   |       
    |   |   |   +---Libraries
    |   |   |   |   |   external-libraries-masterlist.txt
    |   |   |   |   |   
    |   |   |   |   +---Built-In
    |   |   |   |   \---External Libraries
    |   |   |   |       +---Apache
    |   |   |   |       |   \---HttpClient
    |   |   |   |       \---JUnit
    |   |   |   |               basics.txt
    |   |   |   |               
    |   |   |   \---Topics
    |   |   |       \---JSON
    |   |   +---LaTeX
    |   |   |       basics.txt
    |   |   |       
    |   |   +---Lua
    |   |   |   \---APIs
    |   |   |       \---vim
    |   |   |               basics.md
    |   |   |               
    |   |   +---Markdown
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
    |   |   |   +---Examples
    |   |   |   |   +---Code-Snippets
    |   |   |   |   |   |   Substitution-Cipher.py
    |   |   |   |   |   |   web-scraping.md
    |   |   |   |   |   |   
    |   |   |   |   |   +---CSV-Reader
    |   |   |   |   |   |   |   runner.bat
    |   |   |   |   |   |   |   
    |   |   |   |   |   |   +---app
    |   |   |   |   |   |   |   \---src
    |   |   |   |   |   |   |       |   Contact.csv
    |   |   |   |   |   |   |       |   main.py
    |   |   |   |   |   |   |       |   setup.py
    |   |   |   |   |   |   |       |   
    |   |   |   |   |   |   |       \---lib
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
    |   |   |   \---Virtual Environments
    |   |   |           start_venv.bat
    |   |   |           start_venv.sh
    |   |   |           venv-setup.md
    |   |   |           
    |   |   \---Rust
    |   |       \---Basics
    |   |               Built-in Libraries.md
    |   |               Syntax.md
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
    |   |       |   +---androidx
    |   |       |   \---Volley
    |   |       |           README.md
    |   |       |           
    |   |       +---Project
    |   |       |       File Structure.txt
    |   |       |       Files.txt
    |   |       |       Makefile.gen-android-fs
    |   |       |       things-to-do-before-proceeding.md
    |   |       |       
    |   |       \---Snippets
    |   |           +---HTTP REST
    |   |           +---Options Menu
    |   |           |       README.md
    |   |           |       
    |   |           +---SharedPreferences
    |   |           \---SQLite
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
    |   +---Security
    |   +---Shellscript
    |   |   |   best-practices.md
    |   |   |   
    |   |   +---Code-Snippets
    |   |   |       check-sudo.md
    |   |   |       command-line-argument.md
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
    |   |   |   +---distro_specific
    |   |   |   |   \---ArchLinux
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
    |   |       +---Frameworks
    |   |       \---Planning
    |   |               Design Template.txt
    |   |               guide-naming-version-release.txt
    |   |               software-development-lifecycle.txt
    |   |               specs-list.txt
    |   |               
    |   \---Vim
    |       |   base-information.txt
    |       |   controls.md
    |       |   fullguide.md
    |       |   README.md
    |       |   
    |       +---Configuration
    |       |       Autocommands.md
    |       |       Functions_and_Commands.md
    |       |       Highlight.md
    |       |       Remappings.md
    |       |       Settings.md
    |       |       
    |       +---Distros
    |       |   \---Neovim
    |       |       |   base-information.md
    |       |       |   
    |       |       +---Guides
    |       |       |   \---api
    |       |       \---Lua
    |       |               autocmds.md
    |       |               terminologies.md
    |       |               
    |       +---Documents
    |       |       devhints.io-Vim scripting cheatsheet.pdf
    |       |       turn-vim-into-an-ide.txt
    |       |       vim-must-haves.txt
    |       |       
    |       +---Guides
    |       |   +---Beginner's Guide
    |       |   |       basic-keybindings.txt
    |       |   |       
    |       |   \---Plugins
    |       |           basics.txt
    |       |           
    |       +---Tips-n-Tricks
    |       |   \---Essentials
    |       |           Autocommands.txt
    |       |           Remappings.txt
    |       |           Settings.txt
    |       |           
    |       \---Vimscript
    |           \---Topics
    |                   Using Dictionary.txt
    |                   Using Lists.txt
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
    |   \---Developer-API
    |       \---PubNub
    |           \---API
    |                   python.md
    |                   
    +---Software
    |   +---Bootable Live-USB
    |   |   +---Etcher
    |   |   +---Multiboot
    |   |   |   \---Ventoy
    |   |   \---Rufus
    |   +---Browsers
    |   |   \---FireFox
    |   |           plugins.txt
    |   |           
    |   +---Microsoft
    |   |   \---Excel
    |   |           automation-and-QoL.md
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
    |   |       basics.txt
    |   |       
    |   \---Video Downloader
    |       \---yt-dlp
    |               cheatsheet.txt
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
    |           |   README.md
    |           |   
    |           +---Files
    |           |       dictionary.md
    |           |       docker-images.md
    |           |       error-codes.txt
    |           |       file-locations.md
    |           |       packages.md
    |           |       parameter-comparison.md
    |           |       resources.md
    |           |       things to do after installing.md
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
    |           |   +---Components
    |           |   +---Docker Compose
    |           |   |       docker-compose YAML Configuration.md
    |           |   |       docker-compose.md
    |           |   |       Named Volumes.md
    |           |   |       
    |           |   +---Fundamentals
    |           |   \---Manuals
    |           |           container.md
    |           |           volumes.md
    |           |           
    |           \---Snippets
    |               \---docker-compose
    +---Texts
    |   \---Unicode
    |           glyphicons.md
    |           
    +---Virtual Machines
    |   |   README.md
    |   |   
    |   +---QEMU-KVM
    |   |   |   cheatsheets.txt
    |   |   |   setup.txt
    |   |   |   
    |   |   \---scripts
    |   |       +---Linux
    |   |       |       conv_img.sh
    |   |       |       start_kvm.sh
    |   |       |       
    |   |       \---Windows
    |   |               conv_img.bat
    |   |               start_kvm.bat
    |   |               
    |   \---VirtualBox
    |       |   Guest Additions.md
    |       |   
    |       +---Command-Line
    |       |       vboxheadless.md
    |       |       vboxmanage.md
    |       |       
    |       \---Scripts
    |           +---Batch-DOS
    |           |       convert_usb_to_vmdk.bat
    |           |       convert_vdi_to_img.bat
    |           |       create_virtualmachine.bat
    |           |       launch_usb_boot.bat
    |           |       start_vbox_with_personal_config.bat
    |           |       
    |           \---Shellscript
    |                   install-vbox-guest-additions.sh
    |                   
    \---WebDevelopment
        +---Cheatsheets
        |       css.md
        |       html.txt
        |       javascript.txt
        |       
        +---Frameworks
        |   \---ReactJS
        |           setup.txt
        |           
        +---Github
        |   \---Pages
        |           1. How to deploy on GitHub Pages
        |           
        +---Guides
        |   |   software-stacks.md
        |   |   
        |   \---Dynamic-Websites
        +---HTML
        |       basics.txt
        |       tags.md
        |       
        +---Javascript
        |   |   tips-n-tricks.txt
        |   |   
        |   \---Frameworks
        |       |   README.md
        |       |   
        |       +---Angular-JS
        |       +---Node-JS
        |       |   +---express-js
        |       |   |       README.md
        |       |   |       
        |       |   \---npm
        |       |           cheatsheet.txt
        |       |           
        |       +---React-JS
        |       \---Vue-JS
        +---Languages
        |   \---CSS
        |       \---Guides
        |               importing-css.md
        |               
        +---PHP
        |   \---libraries
        |           phpext.php
        |           
        +---Utilities
        |   \---Static Site Generators
        |       \---Jekyll
        \---Web Hosting
            \---Files
                    free-dns-services.txt
                    free-dynamic-web-services.txt
                    free-static-web-services.txt
```
