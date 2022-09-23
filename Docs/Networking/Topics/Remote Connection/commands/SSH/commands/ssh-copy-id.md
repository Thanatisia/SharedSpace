# SSH - ssh-copy-id

## Information
### DESCRIPTION
```
A command used to install the SSH
```

## Documentation

## Parameters

### Positional
- SSH-domain : Specify username-domain to SSH 
    + Syntax: [username]@[ip-address|domain-name]
### Optionals
+ -i [public_key] : Specify public key to install

## Usage

- To install the Public Key in the Remote Server
    ```console
    ssh-copy-id -i $HOME/.ssh/id_rsa.pub [username]@[ip-address|domain-name]
    ```

## Wiki 


## Resources

## References

## Remarks
 
