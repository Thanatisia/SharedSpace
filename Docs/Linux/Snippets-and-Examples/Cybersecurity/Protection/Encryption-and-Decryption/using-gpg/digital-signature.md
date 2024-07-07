# Linux Snippets - Cybersecurity - Protection - Encryption and Decryption - Using gpg - Digitally Sign a file

## Information
### Description
+ Linux snippet to Digitally sign (and/or encrypt) a file
- You can use the sign feature without any encryption.
    + Digital Signature signing will basically "authenticate" that this file was digitally signed and confirmed by you on its authenticity
    - This is used for cases like - If you want to share something in plain-text or make a public post that everyone can read, but you want to include a signature to prove you were the original author.
        - The resulting output file is the unencrypted original document with a signature at the end.
            + It is not used to encrypt and secure the information and guarantees no confidentiality.
            + It only proves *integity* and *authenticity* of the message.
            + You can create a binary signature or a plain-text signature.

### Basics
+ gpg : The GnuPG system, an open source variant of the PGP encryption and signing tool

## Steps

### Digital Signature only
1. Digitally sign a file 
    - with an ASCII formatted output
        - Explanation
            + This will digitally sign the file with a signature and output a '.asc' file in plain text
            + Suitable for posting in an email or posting online
        ```bash
        gpg --clearsign [target-file]
        ```
    - As a '.gpg' binary file
        ```bash
        gpg --sign [target-file]
        ```

### Encrypting a file

> Symmetric Key Encryption with Digital Signature

- Encryption with Digital Signature signing all in the single output file
    - Explanation
        + `--symmetric` will prompt you to enter a passphrase to encrypt the file with, and encrypt the file
        + `--sign` will digitally sign the file with the symmetric key passphrase 
    ```bash
    gpg --sign --symmetric [target-file]
    ```

> Asymmetric/Public-Private Key Encryption with Digital Signature

- Encryption with Digital Signature signing all in the single output file
    - Explanation
        - `--encrypt` will prompt you to enter the target recipient's email address and an ID or an email for authentication
            + GPG will generate the recipient's public key file in a '.asc' ASCII format file, you can encrypt messages that only they (the recipients) can decrypt
        + `--sign` will digitally sign the file with the symmetric key passphrase 
    ```bash
    gpg --sign --encrypt --recipient [target-email] [target-file]
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

### Verify Digital Signatures and Decrypting encrypted files
- Decrypt and print message to screen
    - Explanation
        + gpg will automatically verify signature if there was one
        + gpg will automatically detect if symmetric or asymmetric
        + gpg will automatically use the appropriate private key if available
        + gpg will automatically prompt for passphrase if symmetric
    - Notes
        - gpg will check the public key within the local database (available using `--list-keys`)
            + Please ensure that your sender's public key is imported
        + If the files are signed only, The files can be verified using `--decrypt`, but they are not encrypted
    ```bash
    gpg {-d|--decrypt} [encrypted-file]
    ```

- Decrypt and place output into a custom file
    - Explanation
        + gpg will automatically verify signature if there was one
        + gpg will automatically detect if symmetric or asymmetric
        + gpg will automatically use the appropriate private key if available
        + gpg will automatically prompt for passphrase if symmetric
    - Notes
        - gpg will check the public key within the local database (available using `--list-keys`)
            + Please ensure that your sender's public key is imported
        + If the files are signed only, The files can be verified using `--decrypt`, but they are not encrypted
    ```bash
    gpg {-d|--decrypt} [encrypted-file] > [decrypted-file]
    ```

- Manually verify a signature (i.e. a clear signed file)
    ```bash
    gpg --verify [signed-file]
    ```

- Verify and extract the original document
    ```bash
    gpg --output [output-file] --verify [signed-file]
    ```

- Detach signatures from a signed file
    - Explanation
        - `--detach-sign` will remove the signature embedded into the file and save it to a separate signature file
            + This will output a '*.sig' file
    ```bash
    gpg --detach-sign [signed-file]
    ```

- Verify signature file
    ```bash
    gpg --verify [signature-file]
    ```

- Verify the signature file against a signed file
    ```bash
    gpg --verify [signature-file] [signed-file]
    ```

## Snippets

> Digitally Sign a file

- with an ASCII formatted output
    ```bash
    gpg --clearsign [target-file]
    ```

- As a '.gpg' binary file
    ```bash
    gpg --sign [target-file]
    ```

> Encrypting a file

- Symmetric Key Encryption
    ```bash
    gpg --sign --symmetric [target-file]
    ```

- Public Key Encryption
    ```bash
    gpg --armor --recipient [target-email] --encrypt [target-file]
    ```

> Backup and Recovery of keys

```bash
scp prvkey.{gpg|asc} [server-username]@[server-ip-address]:[backup-directory-location]
scp [server-username]@[server-ip-address]:[backup-directory-location]/prvkey.{gpg|asc} .
```

> Decrypting the encrypted file

```bash
gpg {-d|--decrypt} [encrypted-file] > [decrypted-file]
```

> Manually verifying a signed file

```bash
gpg --verify [signed-file]
```

> Detach signatures and verify signature file against the signed file

```bash
gpg --detach-sign [signed-file]
gpg --verify [signature-file] [signed-file]
```

## Resources

## References
+ [devdungeon - content - GPG Tutorial](https://www.devdungeon.com/content/gpg-tutorial)
+ [tutorialspoint - UNIX commands - gpg](https://www.tutorialspoint.com/unix_commands/gpg.htm)
+ [grimoire.carcano.ch - blog - A quick and easy yet comprehensive GPG tutorial](https://grimoire.carcano.ch/blog/a-quick-easy-yet-comprehensive-gpg-tutorial/)

## Remarks

