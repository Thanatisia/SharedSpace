# Linux Filesystem Structure

## Table of Contents
+ [Background](#background)
+ [Structure](#structure)
+ [File Locations](#file-locations)
+ [Resources](#resources)

## Background
```
Documentation and write-up on GNU/Linux's Filesystem Structure
```

## Structure:
```
Full Linux File Structures (as much as possible)

- Root:
    /
    |
    |-- bin/
    |-- boot/
    |-- dev/
    |-- etc/
    |-- home/
    |-- lib/
    |-- media/
    |-- mnt/
    |-- opt/
    |-- proc/
    |-- root/
    |-- sbin/
    |-- srv/
    |-- tmp/
    |-- usr/
    |-- var/

- Home Directory:
    ~/
    |-- .config/
         |-- config-folders/
    |-- .local/
         |-- share/
         |-- fonts/
         |-- icons/
    |-- .icons/
         |-- default/
         |-- cursors/
    |-- .bashrc
    |-- .bash_profile
    |-- .profile
    |-- .inputrc
    |-- .xinitrc
    |-- .Xresources
    |...
```
    
## File Locations
```
File Structure folder purpose, use-case and usage
```
### Folders
- / : Linux Root Directory
    - bin/   : Contains User binary executables; common linux commands needed to use by single-user modes; commands used by all users of the system
    - boot/  : Contains bootloader-related files; Examples include - Kernel initrd, vmlinux, GRUB files (if using GRUB Bootloader)
    - dev/   : Contains device files; including terminal devices, usbs or any devices attached to the system
    - etc/   : contains Configuration Files required by all programs; Contains startup and shutdown shellscripts used to start/stop individual programs
    - home/  : Home directory path/partition; Contains user personal data/userspace
    - lib/   : Contains system library files that supports the binaries located under /bin and /sbin; Library files are either 'ld*' or 'lib*.so.*'
    - media/ : Temporary mount directory for removal devices such as - CD-ROM, floppy drives, cdrecorder for CD writer
    - mnt/   : Mount directory; Temporary mount directory where sysadmins can mount filesystems
    - opt/   : opt = Optional; Contains Optional Add-on applications from individual vendors/locations
    - proc/  : Contains system process information; This is a pseudo-filesystem that contains information about running processes; contains a directory named 'PID' (Process ID) containing information about the process with that PID
    - root/  : Root Administrator (sudo)'s account
    - sbin/  : Contains System Binary executables; linux commands located here are used typically by System Administrators or for system maintenance purposes
    - srv/   : srv = Service, contains Server-specific related data
    - tmp/   : Contains temporary files created by system and users; files here will be deleted after rebooting
    - usr/   : Contains binaries, libraries, documentation and source code for user programs (aka second-level programs)
    - var/   : Contains variable files; Content of the files are expected to grow (i.e. system log files, database files, emails, webservers, lock files, print queues, temporary files needed across reboots etc)

### Files
- /
    - etc/
        + fstab : The Filesystems Table
        + resolv.conf : System DNS resolver configuration file
        + sudoers : Contains the sudo permissions configuration file
    	- wpa_supplicant/ : For WPASupplicant WiFi configuration
        	+ wpa_supplicant.conf : WiFi configuration file (all your wifi are stored here)
    - media/
        - cdrecorder : CD Writer
        - cdrom/ : CD-ROM
        - floppy/: Floppy drives
    - usr/
        - bin/	: Contains binary files for user programs; Alternate path for /bin
        - lib/	: Contains libraries for /usr/bin and /usr/sbin
        - local/: Contains user programs that you installed from source; Example -  compiling apache from source -> /usr/local/apache2
        - sbin/ : Contains binary files for System Administrators; Alternate path for /sbin
    - var/
        - lib/ 	 : Packages and database files
        - lock/  : Lock files
        - log/ 	 : System Log files
        - mail/  : Emails
        - spool/ : Print queues (Spooling files)
        - tmp/	 : Temporary files needed across reboots

- ~/
    - .bashrc : The Bash Resource Control File; A settings file for bash that contains various configuration such as Environment Variables; local variables; autostarts etc. The bashrc is read everytime the shell is started and/or a new Terminal is open
    - .bash_profile : The Bash Profile File; This file is called only during the login/initial login to the shell (i.e. if you are using the tty to login and not a display manager - the bash_profile will be sourced after loggig in).
    - .inputrc : Used by all shell (typically used by bash) to edit or interact with the command line (i.e. change settings, keybindings etc)

## Resources
+ [ArchWiki | Readline](https://wiki.archlinux.org/title/readline)
+ [Jake@Linux | Custom Bash config - Set up of .bashrc/.inputrc files for a fast and efficient shell experience](https://www.youtube.com/watch?v=iKzoYUErEM0)
