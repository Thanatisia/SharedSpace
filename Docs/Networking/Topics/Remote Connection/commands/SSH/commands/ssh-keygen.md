# ssh-keygen

## Information
### DESCRIPTION
```
Used to handle/generate SSH Public-Private Key Pairs
```

## Documentation

### Synopsis/Syntax
```
ssh-keygen {options} <arguments>
```

### Parameters
#### Positional
- -t [key-type] : Specify Key Type
    - Key Types
        + rsa : RSA protocol version 2
        + rsa1 : RSA protocol version 1
        + dsa
        + ecdsa
        + ed25519
#### Optionals
+ -b [bits] : Number of bits to create
+ -C [new-comment] : Set a new comment to the key
+ -f [filepath_name] : Specify filename of the key file (/path/to/file.key)
+ -p : To change the passphrase for an existing private key
+ -R [ip-address] : Remove SSH Key pair for the specified target ip/domain

### Usage

- Create RSA Private-Public Key Pair 
    ```console
    ssh-keygen -t rsa
    ```

- Add/Replace a passphrase for an existing private key
    ```console
    ssh-keygen -p
    ```

## Wiki

## Resources

## References

## Remarks

