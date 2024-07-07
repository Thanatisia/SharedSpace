# Linux Snippets - Cybersecurity - Protection - Encryption and Decryption - Using gpg - Decrypt a file using Symmetric Key Encryption

## Information
### Description
+ Linux snippet to decrypt a file using Symmetric Key Encryption (passphrase)

### Basics
+ gpg : The GnuPG system, an open source variant of the PGP encryption and signing tool

## Steps
1. Backup and Recovery of keys
    - Recovery of private key from remote location to device
        ```bash
        scp [server-username]@[server-ip-address]:[backup-directory-location]/prvkey.{gpg|asc} .
        ```

2. Decrypting the encrypted file
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
scp [server-username]@[server-ip-address]:[backup-directory-location]/prvkey.{gpg|asc} .
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
