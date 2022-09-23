# SSH

## Information
### DESCRIPTION
```
Stands for 'Secured Shell', SSH is a Secured Remote Login protocol that utilizes a Cryptographic Public-Private Key Pair - via Public Key Encryption (PKE)/Public Key Infrastructure (PKI) - to configure the Public Key on a server to authorize and authenticate access
to anyone who has a copy of the private key to the server.
    - These Key are known as 'SSH Keys'

SSH can also be used alongside other protocols to add Secured Authentication and Authorization and enhance security by utilizing Encryption
    - such as SFTP, which is FTP that runs over SSH

- SSH uses port 22.
- SSH is a descendent of Telnet, an unencrypted, insecured remote login protocol
```

## Commands
+ [ssh](commands/ssh.md) : General SSH Remote login utility
+ [ssh-agent](commands/ssh-agent.md) : To create a list of key passphrases and add a key pass-phrase 
+ [ssh-add](commands/ssh-add.md) : To prompt the user for a private key passphrase and add the private key pass-phrase to the list maintained by ssh-agent
+ [ssh-copy-id](commands/ssh-copy-id.md) : To Install Public SSH Key
+ [ssh-keygen](commands/ssh-keygen.md) : Used to handle/generate SSH Public-Private Key Pairs
+ [scp](commands/scp.md) : Secured Copy; copy a file to/from a remote host using SSH Encryption
+ [sftp](commands/sftp.md) : FTP file transfer using SSH Encryption

## Quickstart Guide
- SSH into a system
    ```console
    ssh [username]@[ip-address|domain-name]
    ```

- Regenerate SSH Keys for a IP address
    ```console
    ssh-keygen -R [ip-address]
    ```

## Quickstart Files
> Some general things to do to prepare and kickstart using SSH
+ [Setup](setup.md)

## Useful Links
+ [Things to do after installing](things-to-do-after-installing.md)

## Remarks

## Resources

## References
+ [SSH Academy - SSH Protocol](https://www.ssh.com/academy/ssh/protocol)
