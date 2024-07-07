# Linux Snippets - Cybersecurity - Protection - Encryption and Decryption - Using gpg - Deleting secret keys

## Information
### Description
+ Linux snippet to delete a private key from local storage

### Basics
+ gpg : The GnuPG system, an open source variant of the PGP encryption and signing tool

## Steps
1. List all of your secret keys
    - Explanation
        - In Cryptography, secret keys are more commonly known as private keys, which is a component of the public-private key pairs generated from a Public Key Encryption (PKE) algorithm/scheme
            + The other component being the Public (aka sharing) key
            + Together, the Private key (held by the owner/sender) and the Public key (given to the receiver) will be used together to authenticate and authorize the sender and the receiver to be a valid/legitimate communication/transaction, allowing for a safe transmission of data/files.
        - Private Keys are not to be given to anyone and are to be kept *only* by the owner
            + This is because the private key is like an identifier of the owner - he/she who owns the private key is able to assume the identity of the owner and thereby, perform a middleman attack by imitating as the owner.
            + The Public Key is the key given to the receiver/target for authentication
        + `--list-secret-keys` will show all of the locally-stored secret keys generated which you can then select for usage
    ```bash
    gpg --list-secret-keys
    ```

2. Delete a particular secret/private key from the list
    - Explanation
        + You might want to do this if a key has been compromised/leaked, and you want to re-encrypt
    ```bash
    gpg --delete-secret-keys [your-private-key]
    ```

## Snippets

> List all secret keys

```bash
gpg --list-secret-keys
```

> Delete a particular secret/private key

```bash
gpg --delete-secret-keys [your-private-key]
```

## Resources

## References
+ [devdungeon - content - GPG Tutorial](https://www.devdungeon.com/content/gpg-tutorial)
+ [tutorialspoint - UNIX commands - gpg](https://www.tutorialspoint.com/unix_commands/gpg.htm)
+ [grimoire.carcano.ch - blog - A quick and easy yet comprehensive GPG tutorial](https://grimoire.carcano.ch/blog/a-quick-easy-yet-comprehensive-gpg-tutorial/)

## Remarks
