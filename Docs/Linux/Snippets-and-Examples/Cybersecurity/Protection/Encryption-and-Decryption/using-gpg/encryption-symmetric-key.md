# Linux Snippets - Cybersecurity - Protection - Encryption and Decryption - Using gpg - Encrypt a file using Symmetric Key Encryption

## Information
### Description
+ Linux snippet to encrypt a file using Symmetric Key Encryption (passphrase)

### Basics
+ gpg : The GnuPG system, an open source variant of the PGP encryption and signing tool

## Steps

1. Encrypting a file
    - Encrypting using Symmetric Key Encryption (Passphrase)
        - Explanation
            - GPG will prompt you to enter a passphrase you wish to encrypt the file with and it will generate a '.gpg' binary file
                + This file is your symmetric key and this is the decryption key to be used for decrypting the file
        ```bash
        gpg --symmetric [target-file]
        ```

    - Encrypting using Symmetric Key Encryption (Passphrase) with an ASCII format output instead of binary
        - Explanation
            - GPG will prompt you to enter a passphrase you wish to encrypt the file with and it will generate a '.asc' ASCII format file
                + This file is your symmetric key and this is the decryption key to be used for decrypting the file
            + Take note that when decrypting, you will need to use the '--armor' flag if you used it for encrypting
        ```bash
        gpg --armor --symmetric [target-file]
        ```

    - Encrypting using Symmetric Key Encryption (Passphrase) with a custom encryption/cipher algorithm (i.e. AES256)
        - Explanation
            + `--cipher-algo AES256` : GPG will encrypt the file with the specific cipher algorithm
            + On encryption, GPG will generate your decryption key in a '.asc' ASCII format file that you will use for decrypting the file
            + Take note that when decrypting, you will need to use the '--armor' flag if you used it for encrypting
        ```bash
        gpg --symmetric --cipher-algo AES256
        ```

    - Encryption with Digital Signature signing all in the single output file
        - Explanation
            + `--symmetric` will prompt you to enter a passphrase to encrypt the file with, and encrypt the file
            + `--sign` will digitally sign the file with the symmetric key passphrase 
        ```bash
        gpg --sign --symmetric [target-file]
        ```

2. Backup and Recovery of keys
    - Moving the Private/Symmetric key to another location
        ```bash
        scp prvkey.{gpg|asc} [server-username]@[server-ip-address]:[backup-directory-location]
        ```

## Snippets

> Encrypting a file

```bash
gpg --armor --symmetric [target-file]
```

> Backup key file

```bash
scp prvkey.{gpg|asc} [server-username]@[server-ip-address]:[backup-directory-location]
```

## Resources

## References
+ [devdungeon - content - GPG Tutorial](https://www.devdungeon.com/content/gpg-tutorial)
+ [tutorialspoint - UNIX commands - gpg](https://www.tutorialspoint.com/unix_commands/gpg.htm)
+ [grimoire.carcano.ch - blog - A quick and easy yet comprehensive GPG tutorial](https://grimoire.carcano.ch/blog/a-quick-easy-yet-comprehensive-gpg-tutorial/)

## Remarks
