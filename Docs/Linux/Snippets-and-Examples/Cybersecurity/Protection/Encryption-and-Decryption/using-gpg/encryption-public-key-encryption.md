# Linux Snippets - Cybersecurity - Protection - Encryption and Decryption - Using gpg - Encrypt a file using Asymmetric (Public-Private) Key Encryption

## Information
### Description
+ Linux snippet to encrypt a file using Aymmetric Key Encryption (Public-Private Key Encryption)

### Basics
+ gpg : The GnuPG system, an open source variant of the PGP encryption and signing tool

## Steps

### Setup and Preparation
1. Generating a new private key using a Public-Private Key Encryption algorithm/scheme (PKE)
    ```bash
    gpg --gen-key
    ```

2. List your secret/private keys
    ```bash
    gpg --list-secret-keys
    ```

3. Export the generated private key in ASCII format
    - Explanation
        + `--export-secret-keys [private-key]` : Export the specified private/secret key into a key file for encrypting and decrypting
        + `--armor` : This flag will export the private/secret key in an armored (ASCII) format in a human readable format for cold storage
    ```bash
    gpg --export-secret-keys --armor [private-key] > prvkey.asc
    ```

### Encrypting a file
- (Optional) Importing a public key
    - Explanation
        + If you are decrypting a PKE-encrypted file from a sender, you will need to import the public key to decrypt it
        + Note: This can also be used for private keys (if you are changing server)
    ```bash
    gpg --import [public-key-file]
    ```

- Encrypting with Public Key Encryption (PKE)
    - Explanation
        - GPG will prompt you to enter the target recipient's email address and an ID or an email for authentication
            + GPG will generate the recipient's public key file in a '.gpg' binary file, you can encrypt messages that only they (the recipients) can decrypt
    ```bash
    gpg --encrypt [target-file]
    ```

- Encrypting with custom recipient
    - Explanation
        - GPG will prompt you to enter the target recipient's email address and an ID or an email for authentication
            + GPG will generate the recipient's public key file in a '.gpg' binary file, you can encrypt messages that only they (the recipients) can decrypt
    ```bash
    gpg --recipient [target-email] --encrypt [target-file]
    ```

- Encrypting using PKE with an ASCII format output instead of binary
    - Explanation
        - GPG will prompt you to enter the target recipient's email address and an ID or an email for authentication
            + GPG will generate the recipient's public key file in a '.asc' ASCII format file, you can encrypt messages that only they (the recipients) can decrypt
        + Take note that when decrypting, you will need to use the '--armor' flag if you used it for encrypting
    ```bash
    gpg --armor --recipient [target-email] --encrypt [target-file]
    ```

- Encryption with Digital Signature signing all in the single output file
    - Explanation
        - `--encrypt` will prompt you to enter the target recipient's email address and an ID or an email for authentication
            + GPG will generate the recipient's public key file in a '.asc' ASCII format file, you can encrypt messages that only they (the recipients) can decrypt
        + `--sign` will digitally sign the file with the symmetric key passphrase 
    ```bash
    gpg --encrypt --sign --recipient [target-email] [target-file]
    ```

### Backup and Recovery of keys
- Moving the Private/Symmetric key to another location
    ```bash
    scp prvkey.{gpg|asc} [server-username]@[server-ip-address]:[backup-directory-location]
    ```

- Recovery of private key from remote location to device
    ```bash
    scp [server-username]@[server-ip-address]:[backup-directory-location]/prvkey.{gpg|asc} .
    ```

## Snippets

> Setup and Preparation

```bash
# Generating a new private key using a Public-Private Key Encryption algorithm/scheme (PKE)
gpg --gen-key

# List your secret/private keys
gpg --list-secret-keys

# Export the generated private key in ASCII format
gpg --export-secret-keys --armor [private-key] > prvkey.asc

# (Optional) Import public key of a sender (if you are a recipient)
gpg --import [public-key-file]
```

> Encrypting a file

```bash
gpg --armor --recipient [target-email] --encrypt [target-file]
```

> Backup and Recovery of keys

```bash
scp prvkey.{gpg|asc} [server-username]@[server-ip-address]:[backup-directory-location]
scp [server-username]@[server-ip-address]:[backup-directory-location]/prvkey.{gpg|asc} .
```

## Resources

## References
+ [devdungeon - content - GPG Tutorial](https://www.devdungeon.com/content/gpg-tutorial)
+ [tutorialspoint - UNIX commands - gpg](https://www.tutorialspoint.com/unix_commands/gpg.htm)
+ [grimoire.carcano.ch - blog - A quick and easy yet comprehensive GPG tutorial](https://grimoire.carcano.ch/blog/a-quick-easy-yet-comprehensive-gpg-tutorial/)

## Remarks

