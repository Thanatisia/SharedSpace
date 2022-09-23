# SSH-powered : scp

## Information
### DESCRIPTION
```
Stands for 'Secured Copy', scpis  remote file sharing utility that allows for secured file transfers to and from a remote guest connected with SSH.

- essentially allows you to copy a file to/from a remote host with SSH Encryption, Authentication and Authorization.
```

## Documentation

### Synopsis/Syntax

- Copy from local host to remote guest
    ```console
    scp {options} <arguments> [source-folder/files...] [username]:[remote-ip-address|domain-name]:[destination-folder]
    ```

- Copy from remote guest to local host
    ```console
    scp {options} <arguments> [username]:[remote-ip-address|domain-name]:[source-folder/files...] [destination-local-folder/files...]
    ```

### Parameters
#### Positional
- ssh-domain : Specify username-domain to SSH to
    + Syntax: [username]@[ip-address|domain-name]

#### Optionals
+ -r : Recursively Copy

### Usage
- Install/Copy your Public Key file in to server
    ```console
    scp $HOME/.ssh/id_rsa.pub [username]:[ip-address|domain-name]:~/.ssh/authorized_keys
    ```

## Resources

## References

## Remarks

