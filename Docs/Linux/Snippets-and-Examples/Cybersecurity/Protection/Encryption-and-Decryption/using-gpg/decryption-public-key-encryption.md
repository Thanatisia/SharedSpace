# Linux Snippets - Cybersecurity - Protection - Encryption and Decryption - Using gpg - Decrypting a file using Asymmetric (Public-Private) Key Encryption

## Information
### Description
+ Linux snippet to decrypt a file using Aymmetric Key Encryption (Public-Private Key Encryption)

### Basics
+ gpg : The GnuPG system, an open source variant of the PGP encryption and signing tool

## Steps

### Backup and Recovery of keys
- Moving the Private/Symmetric key to another location
    ```bash
    scp prvkey.{gpg|asc} [server-username]@[server-ip-address]:[backup-directory-location]
    ```

- Recovery of private key from remote location to device
    ```bash
    scp [server-username]@[server-ip-address]:[backup-directory-location]/prvkey.{gpg|asc} .
    ```

### Setup and Preparation
- Importing a public key
    - Explanation
        + If you are decrypting a PKE-encrypted file from a sender, you will need to import the public key to decrypt it
        + Note: This can also be used for private keys (if you are changing server)
    ```bash
    gpg --import [public-key-file]
    ```

### Decrypting the encrypted file
- Decrypt and print message to screen
    - Explanation
        + gpg will automatically verify signature if there was one
        + gpg will automatically detect if symmetric or asymmetric
        + gpg will automatically use the appropriate private key if available
        + gpg will automatically prompt for passphrase if symmetric
    - Notes
        - gpg will check the public key within the local database (available using `--list-keys`)
            + Please ensure that your sender's public key is imported
    ```bash
    gpg -d [encrypted-file]
    ```

- Decrypt and place output into a cusstom file
    - Explanation
        + gpg will automatically verify signature if there was one
        + gpg will automatically detect if symmetric or asymmetric
        + gpg will automatically use the appropriate private key if available
        + gpg will automatically prompt for passphrase if symmetric
    - Notes
        - gpg will check the public key within the local database (available using `--list-keys`)
            + Please ensure that your sender's public key is imported
    ```bash
    gpg -d [encrypted-file] > [decrypted-file]
    ```

## Snippets

> Backup and Recovery of keys

```bash
scp prvkey.{gpg|asc} [server-username]@[server-ip-address]:[backup-directory-location]
scp [server-username]@[server-ip-address]:[backup-directory-location]/prvkey.{gpg|asc} .
```

> Setup and Preparation

```bash
# (Optional) Import public key of a sender (if you are a recipient)
gpg --import [public-key-file]
```

> Decrypting the encrypted file

```bash
gpg -d [encrypted-file] > [decrypted-file]
```

## Resources

## References
+ [devdungeon - content - GPG Tutorial](https://www.devdungeon.com/content/gpg-tutorial)
+ [tutorialspoint - UNIX commands - gpg](https://www.tutorialspoint.com/unix_commands/gpg.htm)
+ [grimoire.carcano.ch - blog - A quick and easy yet comprehensive GPG tutorial](https://grimoire.carcano.ch/blog/a-quick-easy-yet-comprehensive-gpg-tutorial/)

## Remarks

