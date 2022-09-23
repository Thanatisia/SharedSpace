# SSH Setup

## Information
### DESCRIPTION
```
This is a write-up/documentation to Setup SSH on your system
```

### Packages
+ apt : ssh
+ pacman : openssh

## Table of Contents
+ [Pre-Requisites](#pre-requisites)
+ [Dependencies](#dependencies)
- [Obtaining SSH](#obtaining-ssh)
    + [Installation](#installation)
    + [Post-Installation](#post-installation)
+ [Setup SSH Keys](#setup-ssh-keys)

## Pre-Requisites 

## Dependencies

## SSH Infrastructure

### Structure
> This is generally how the structure of a SSH server is like
```
                  [Internet]
                      |
                      |
                      |
    [Server]  *---------------* [Client]
    with                    
    - OpenSSH             
    192.168.1.1                 192.168.1.2
    server1.domain.name         client1.domain.name
```

### Explanation
+ Server : You store your Public key on the Remote Hosts (Client) and you have an account on this Server
+ Client : Your private key stays on the client computer/local server and
    - You use the Private Key to connect to the Server
    - This private key is unique and should only be used by you
        + Do not share or give your private key to anyone

## Obtaining SSH
### Installation
```
Generally, SSH should already be installed in a vast majority of Operating Systems and Linux Distributions.

however, there are some that may be "D-I-Y", such as ArchLinux, that will require base installation
```

- Using Package Manager
    - Debian-based (apt)
        ```console
        sudo apt(-get) install ssh
        ```

    - Arch-based (pacman)
        ```console
        sudo pacman -S openssh
        ```

### Post-Installation
- Setup Services
    - On Linux Distributions
        - Startup SSH Services
            - Using 'service'
                ```console
                service sshd start
                ```
            - Using systemd
                ```console
                systemctl start sshd
                ```

        - Enable SSH Service
            > This will basically startup SSH on every boot
            - Using 'service'
                ```console
                service sshd enable
                ```
            - Using systemd
                ```console
                systemctl enable sshd
                ```

        - Verify service
            - Using 'service'
                ```console
                service sshd status
                ```
            - Using systemd
                ```console
                systemctl status sshd
                ```

## Setup SSH Key-based Authorization/Authentication
> Steps to setup secure SSH keys
### SSH Public Key Infrastructure setup
- Create .ssh home directory
    ```console
    mkdir -p ~/.ssh
    chmod 0700 ~/.ssh
    ```

- Create SSH Public-Private Key Pair
    + Explanation : Generate a SSH Key Pair of Type RSA (Rivett-Shamir-Ackermann)
    - Parameters
        - -t [key-type] : Specify Key Type
            - Key Types
                + rsa : RSA protocol version 2
                + rsa1 : RSA protocol version 1
                + dsa
                + ecdsa
                + ed25519
    - Optionals
        + -b [bits] : Number of bits to create
        + -C [new-comment] : Set a new comment to the key
        + -f [filepath_name] : Specify filename of the key file (/path/to/file.key)
    ```console
    ssh-keygen -t rsa {-b 4096 -f ~/.ssh/file.key -C "new comment for key"}
    ```
    - Set the key pair location and name
        - Default Location: $HOME/.ssh
        - Default Private Key Name: id_rsa 
        - Default Public Key Name: id_rsa.pub

    - Set the passphrase/password for your Private Key

    - Output
        + This will create the Public Key and Private Key in the specified location

- Copy and install Public SSH key to server
    - using ssh-copy-id
        - Positional
            - ssh domain : Specify username-domain to SSH to
                + Syntax: [username]@[ip-address|domain-name]
        - Options
            + -i [public_key] : Specify public key to install
        ```console
        ssh-copy-id -i ~/.ssh/id_rsa.pub [ssh-domain]
        ```
    - using scp
        + scp = Secured Copy
        - Explanation
            + Secured Copy the RSA public key into the '~/.ssh/authorized_keys' file within the specified ssh_domain
        - Parameters
            - Positional
                - ssh-domain : Specify username-domain to SSH to
                    + Syntax: [username]@[ip-address|domain-name]
        ```console
        scp ~/.ssh/id_rsa.pub [ssh-domain]:~/.ssh/authorized_keys
        ```

### Security
- Add user to 'sudo' or 'wheel' groups (admin account)
    ```console
    usermod -aG {sudo|wheel} [username]
    ```

- Disable password login for root account
    - in Client
        - Add private key passphrase to list
            ```console
            eval $(ssh-agent)
            ssh-add
            ssh [username]@[ip-address|domain-name]
            ```
    - in Linux Server
        - Edit '/etc/ssh/sshd_config'
            + Set 'PermitRootLogin' to 'no'
                ```
                # /etc/ssh/sshd_config
                PermitRootLogin no
                ```
        - Reload 'sshd' service
            - Using 'service'
                ```console
                service sshd reload
                ```
            - Using systemd
                ```console
                systemctl reload sshd
                ```

- Test your password-less SSH keys login
    - Login to server
        ```console
        ssh [username]@[ip-address|domain-name]
        ```
    - Login using your private key
        ```console
        ssh -i ~/.ssh/your-key [username]@[server-ip-address|domain-name]
        ```
    - Copy a file to the server
        ```console
        scp [source-file-name] [username]@[ip-address|domain-name]:[destination-folder]
        ```

## Resources

## References
+ [Cyberciti - Setup SSH Keys on Linux](https://www.cyberciti.biz/faq/how-to-set-up-ssh-keys-on-linux-unix/)

## Remarks
