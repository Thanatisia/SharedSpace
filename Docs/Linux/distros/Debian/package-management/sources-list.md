# Apt source.list Compilation

## Information 
### DESCRIPTION
``` 
A Masterlist/Compilation of various apt sources.list from various Debian-based Distributions in a central location for reference
```

## Basics
### apt sources.list
- apt uses the '/etc/apt/sources.list' file to add "Mirrors" for various Repositories and branches into the apt package database
    - you can add as many mirrors/Repositories
        + the more you add, the bigger the package database, so this is not recommended 

### apt sources.list.d
- apt places all repository branch-related files into the '/etc/apt/sources.list.d/[branch].list' directory
    - the file /etc/apt/sources.list should only contain the main branch(es)
        - while additional branches should go in /etc/apt/sources.list.d/
            + one branch per file.

### Converting to another Debian-based Distribution
```
In Debian, one way to install packages/tools from another Debian-based Distribution - aka to convert/transform to another Debian-based distribution from one 
- is to add the repositories/mirrors found in the debian-based Distribution's apt sources.list file or their available mirrors/Repositories into '/etc/sources.list{.d}'
```

## Setup 
### Pre-Requisites
+ debian-system or uses the apt package manager
+ backup your system before proceeding

## Documentation
### Synopsis/Syntax
- the /etc/apt/sources.list file follows the following Syntax
    ```
    [archive] [mirror-url] [repository-branch] [components]
    ```

### Components
- Archive : The package/file types; depending if you want a package or the source of the package
    - deb (Regular Binary)
    - deb-src (Source)

- Mirror : The URL to the repository branch you want to add

- Branch : What version of the package/repository you wish to use.

- Components : what packages you wish to use, based on the Debian Free Software Guidelines (DFSG). 
    + main : Use everything

### Usage
- Adding of main repositories/branches into apt package database
    - Add the mirror into your '/etc/apt/sources.list' file
    - Update your package repositories database
    - (OPTIONAL) Upgrade your package Repositories database

- Adding of additional/external repositories/branches into apt package database
    - Add the mirror into your '/etc/apt/sources.list.d/[repository|branch-name].list' file
    - Update your package repositories database
    - (OPTIONAL) Upgrade your package Repositories database 

- Removing additional/external repositories/branches from apt package database
    - Remove the [repository|branch-name].list file from '/etc/apt/sources.list.d' directory 
    - Update your package repositories database
    - (OPTIONAL) Upgrade your package Repositories database

## Repositories Database
### Kali Linux 
```
Sources.list Format:
deb http://http.kali.org/kali kali-rolling main contrib non-free 
<Archive>         <Mirror>        <Branch> <Components>

Explanation
Mirror : http://http.kali.org is Kali's load balancer, thus it will direct to their best mirror
Components : By default, Kali will use everything
```
#### Main Branches
+ Kali Rolling Release : deb http://http.kali.org/kali kali-rolling main contrib non-free
+ Kali Last Snapshot : deb http://http.kali.org/kali kali-last-snapshot main contrib non-free

#### Additional Branches
+ Kali Experimental : deb http://http.kali.org/kali kali-experimental main contrib non-free
+ Kali Bleeding Edge : deb http://http.kali.org/kali kali-bleeding-edge main contrib non-free

### Raspberry Pi OS
```
Sources.list Format:
deb http://raspbian.raspberrypi.org/raspbian/ [debian-codename] main contrib non-free rpi

Explanation
Branch : Replace the debian-codename with the Debian version you want to install

Debian Versions:
- Debian 11 = bullseye
- Debian 12 = bookworm
```
#### Main Branches
+ Debian 11 Bullseye : deb http://raspbian.raspberrypi.org/raspbian/ bullseye main contrib non-free rpi
+ Debian 12 Bookworm : deb http://raspbian.raspberrypi.org/raspbian/ bookworm main contrib non-free rpi

## References
+ [Kali Linux Docs - Sources.list Repositories](https://www.kali.org/docs/general-use/kali-linux-sources-list-repositories/)
+ [Raspberry Tips - Update Raspberry Pi to the latest version](https://raspberrytips.com/update-raspberry-pi-latest-version/)

## Resources

## Remarks 
