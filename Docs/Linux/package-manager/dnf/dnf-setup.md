# dnf/yum package management repository setup

Pre-Requisite/setup steps for dnf package management

## Notes
* This is important if you are using a non-Fedora distribution

## Table of Contents
+ [Setup](#setup)
+ [Documentation](#documentation)
+ [Wiki](#wiki)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Setup
### Pre-Requisites
- Create folders 
    - /etc/dnf
        ```console
        sudo mkdir -p /etc/dnf
        ```
    - /etc/yum.repos.d
        ```console
        sudo mkdir -p /etc/yum.repos.d
        ```
    - /etc/pki/rpm-gpg
        ```console
        sudo mkdir -p /etc/pki/rpm-gpg
        ```
- Create dnf configuration file '/etc/dnf/dnf.conf' : Contain configuration information for DNF and related utilities
    ```console
    sudo touch /etc/dnf/dnf.conf
    ```
- Setup Distribution Repositories
    - Fedora
        - Fedora Repository Definitions
            - Information
                + The Repository definition files are stored in the '/etc/yum.repos.d' folder
                + The Fedora repositories can be found here: https://src.fedoraproject.org/rpms/fedora-repos/tree/[branch]
            - Download Repository mirror/definitions
                - Using curl
                    ```console
                    curl -L -O https://src.fedoraproject.org/rpms/fedora-repos/raw/[branch]/f/fedora.repo
                    ```
                - Using wget
                    ```console
                    wget https://src.fedoraproject.org/rpms/fedora-repos/raw/[branch]/f/fedora.repo
                    ```
            - Copy the repository mirror into the folder '/etc/yum.repos.d' folder
                ```console
                sudo cp fedora.repo /etc/yum.repos.d
                ```
        - Fedora RPM-GPG key
            - Information
                + The gpg keys are stored in the '/etc/pki/rpm-gpg' folder
                + The Fedora RPM-GPG Keys can be found here: https://src.fedoraproject.org/rpms/fedora-repos/tree/[branch]
                    - All/Development Branch : Rawhide
                        + [Fedora - All RPM-GPG Keys](https://src.fedoraproject.org/rpms/fedora-repos/tree/rawhide)
                    + Find the rpm-gpg key of the target group
                    + The RPM-GPG keys are seperated to 2 forms: Primary and Secondary
                + The RPM Fusion RPM-GPG Keys for Fedora can be found here: https://rpmfusion.org/keys
            - Download Fedora's RPM-GPG Key(s) for the group
                - Using curl
                    ```console
                    curl -L -O https://src.fedoraproject.org/rpms/fedora-repos/raw/[branch]/f/RPM-GPG-KEY-fedora-[release-version]-{primary|secondary]
                    ```
                - Using wget
                    ```console
                    wget https://src.fedoraproject.org/rpms/fedora-repos/raw/[branch]/f/RPM-GPG-KEY-fedora-[version]-primary
                    ```
            - Copy the RPM-GPG keys into the folder '/etc/pki/rpm-gpg' folder
                ```console
                sudo cp RPM-GPG-KEY-* /etc/pki/rpm-gpg
                ```
            - For RPM-GPG-KEY-fedora-[version]-[architecture] keys
                + Just symlink or copy the primary/secondary key architecture
                - Using Symlink
                    ```console
                    sudo ln -s RPM-GPG-KEY-fedora-[version]-primary RPM-GPG-KEY-fedora-[version]-x86_64
                    ```
                - Using cp
                    ```console
                    sudo cp RPM-GPG-KEY-fedora-[version]-primary RPM-GPG-KEY-fedora-[version]-x86_64
                    ```

## Documentation
### Files
+ /var/cache/dnf : cache files
+ /etc/dnf : To store all dnf configuration files
+ /etc/yum.repos.d : To store all yum package management repositories
+ /etc/pki/rpm-gpg : This is where Fedora stores the GPG keys

### Components/Sections
- /etc/dnf/dnf.conf
    + [main] : Main body 
    + [your-repository-id] : Specify the repository id of the target repository; Allows you to set repository-specific options; Can contain one or more in the [main] section
        > Note, this is incomplete and not all possible options
        - Key-Values:
            - name : Specify name of the repository
            - baseurl : Specify URL/Domain of the repository
            - repo_gpgcheck : Check repository gpg
                - Values
                    + Type: Integer
                    - Valid Values: 
                        + 0 : Do not check
                        + 1 : Check
            - enabled : Enable/disable the repository
                - Values
                    + Type: Integer
                    - Valid Values:
                        + 0 : Disable the repository
                        + 1 : Enable the repository
            - gpgkey : Specify URL of the GPG key
                - Values
                    + Type: String
            - sslverify : Verify using SSL
                - Values
                    + Type: Integer
                    - Valid Values: 
                        + 0 : Do not check
                        + 1 : Check
            - sslcacert : Specify location of the SSL Certificate Authority (CA) Certificate
                - Values
                    + Type: String

### Syntax/Synopsis
- /etc/dnf/dnf.conf
    ```
    [main]
        - Can contain one or more [repository] sections

    [your-repository-id]
    ...
    ```
- /etc/yum.repos.d/[repository-id].repo
    + This is just a basic syntax structure
    ```
    [repositoryID]
    # Repository Name
    name=Fedora $releasever - Source

    # Your mirror/base Url, can be ignored if you are using mirrorlist
    #baseurl=http://download.example/pub/fedora/linux/releases/$releasever/Everything/source/tree/

    # Mirror to use; similar to 'mirrorlists'
    metalink=https://mirrors.fedoraproject.org/metalink?repo=fedora-source-$releasever&arch=$basearch

    # Enable the repository
    enabled=0

    # metadata expiry TTL before you need to refresh
    metadata_expire=7d

    # If want to enable repository gpg check
    repo_gpgcheck=0

    # Repsitory type (i.e. dnf, yum, rpm)
    type=rpm

    # Check packages with gpg
    gpgcheck=1

    # Specify the gpg key; required if gpgcheck is enabled
    gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch

    # If want to skip the package if unavailable
    skip_if_unavailable=False
    ```

### Structure
```
[main]
key=value
```

### Repository Steps
- Set the [repository] section options
    > 2 methods: Add to '/etc/dnf/dnf.conf' or '/etc/yum.repos.d/'
    - Manually
        - Create repository section
            - In '/etc/yum.repos.d'
                - Create a new file with the extension '.repo'
                    - in '/etc/yum.repos.d'
                        ```console
                        sudo touch /etc/yum.repos.d/[repository-name].repo
                        ```
                - Add a '[repository]' section to the '/etc/yum.repos.d/[repsository-name].repo' file
                    + Replace 'your-repository-id' with the repository's ID/name
                    ```console
                    echo -e "[repository]" >> /etc/yum.repos.d/[repository-name].repo
                    ```
                    + Add options under the repository section
            - In '/etc/dnf/dnf.conf
                - Add a '[repository]' section to the '/etc/dnf/dnf.conf' file
                    + Replace 'your-repository-id' with the repository's ID/name
                    ```console
                    echo -e "[your-repository-id]" >> /etc/dnf/dnf.conf
                    ```
        - Add options under the repository section
            - Important Options
                + baseurl=[url]
                + mirrorlist=[url]
                    + Please refer to the [Fedora Public Active Mirrors](https://admin.fedoraproject.org/mirrormanager/) for the current mirrors of various dnf projects (i.e. Fedora, CentOS)
            - Examples
                - Fedora repo
                    ```
                    [fedora]
                    name=Fedora $releasever - $basearch
                    #baseurl=http://download.example/pub/fedora/linux/releases/$releasever/Everything/$basearch/os/
                    metalink=https://mirrors.fedoraproject.org/metalink?repo=fedora-$releasever&arch=$basearch
                    enabled=1
                    countme=1
                    metadata_expire=7d
                    repo_gpgcheck=0
                    type=rpm
                    gpgcheck=1
                    gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch
                    skip_if_unavailable=False

                    [fedora-debuginfo]
                    name=Fedora $releasever - $basearch - Debug
                    #baseurl=http://download.example/pub/fedora/linux/releases/$releasever/Everything/$basearch/debug/tree/
                    metalink=https://mirrors.fedoraproject.org/metalink?repo=fedora-debug-$releasever&arch=$basearch
                    enabled=0
                    metadata_expire=7d
                    repo_gpgcheck=0
                    type=rpm
                    gpgcheck=1
                    gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch
                    skip_if_unavailable=False

                    [fedora-source]
                    name=Fedora $releasever - Source
                    #baseurl=http://download.example/pub/fedora/linux/releases/$releasever/Everything/source/tree/
                    metalink=https://mirrors.fedoraproject.org/metalink?repo=fedora-source-$releasever&arch=$basearch
                    enabled=0
                    metadata_expire=7d
                    repo_gpgcheck=0
                    type=rpm
                    gpgcheck=1
                    gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch
                    skip_if_unavailable=False
                    ```
- Define/Add a DNF repository
    - Automatically
        - By using the 'dnf config-manager' command
            ```console
            dnf config-manager --add-repo [repository-url]
            ```
- Enable a DNF repository added to your system
    - Automatically
        - By using the 'dnf config-manager' command
            + Refer to '[RHEL Documentation - Listing Repositories](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/managing_software_with_the_dnf_tool/assembly_searching-for-rhel-9-content_managing-software-with-the-dnf-tool#proc_listing-repositories_assembly_searching-for-rhel-9-content)' for listing repositories
            ```console
            dnf config-manager --enable [unique-repository-ID]
            ```
- Disable a DNF repository added to your system
    - Automatically
        - By using the 'dnf config-manager' command
            + Refer to '[RHEL Documentation - Listing Repositories](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/managing_software_with_the_dnf_tool/assembly_searching-for-rhel-9-content_managing-software-with-the-dnf-tool#proc_listing-repositories_assembly_searching-for-rhel-9-content)' for listing repositories
            ```console
            dnf config-manager --disable [unique-repository-ID]
            ```

## Wiki
### Fedora Versions/Codenames
+ rawhide : Ongoing-Development branch

### Commands
- dnf
    - Actions
        - `config-manager {options} <arguments>` : Used to handle configurations
            - Options
                - Optionals
                    - --add-repo [repository-url] : Add a repository to the system
                        - repository-url
                            + Local Repository location: You can use a local repository to specify the created repository definition; i.e. `dnf config-manager --add-repo /etc/yum.repos.d/[repository-name].repo`
                    + --enable [repository-ID]    : Enable a repository
                    + --disable [repository-ID]   : Disable a repository
        - `repolist {options}` : List enabled/disabled repositories on your system
            - Options
                - Optionals
                    + --all : List both enabled/disabled repositories
                    + --disabled : List all disabled repositories on your system
        - `repoinfo` : List additional information about the repositories

## Resources
+ [RHEL Documentation - Listing Repositories](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/managing_software_with_the_dnf_tool/assembly_searching-for-rhel-9-content_managing-software-with-the-dnf-tool#proc_listing-repositories_assembly_searching-for-rhel-9-content)
+ [Fedora - GPG Keys](https://getfedora.org/security/)
+ [Fedora - Repositories](https://src.fedoraproject.org/rpms/fedora-repos)
+ Fedora - Repository Files: https://src.fedoraproject.org/rpms/fedora-repos/blob/[branch]/f/fedora.repo
+ [Fedora - All RPM-GPG Keys](https://src.fedoraproject.org/rpms/fedora-repos/tree/rawhide)
+ [RPM Fusion GPG Keys](https://rpmfusion.org/keys)

## References
+ [Fedora - Mirrors](https://admin.fedoraproject.org/mirrormanager/)
+ [Fedora - Updates](https://download.nus.edu.sg/mirror/fedora/linux/updates/)
+ [Fedora - Releases](https://download.nus.edu.sg/mirror/fedora/linux/releases/)

### Queries
+ [Superuser - Missing RPM-GPG-KEY-fedora-32-x86_64 during system upgrade](https://superuser.com/questions/1550002/missing-rpm-gpg-key-fedora-32-x86-64-during-system-upgrade)

## Remarks

