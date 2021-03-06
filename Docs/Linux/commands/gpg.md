# Documentation - Command : gpg

## Table of Contents
+ [Information](#information)
+ [Setup](#setup)
+ [Documentation](#documentation)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## gpg
### Documentation
#### Description
+ gpg is the Gnu Privacy Guard
- is widely used as a toolkit to protect the user privacy through
    + Encryption
    + Decryption
    + particularly for PGP protocol
+ is installed in Ubuntu by default
#### Synopsis/Syntax
+ gpg {options} [arguments...]
#### Parameters
- Symmetric Encryption/Decryption (AES)
    + -c [target-filename] : Encrypt specified file with AES
    + -d [encrypted-filename] : Decrypt the specified encrypted file using AES
- Asymmetric Public Key Encryption (RSA)
    + -a | --armor : Create ASCII armoured output
    + -d | --decrypt [encrypted-filename] : To decrypt the specified encrypted file
    + -e | --encrypt {options} [filename] : To encrypt the specified filename with Public Key Encryption
        - Options
            + -r {recipient ID} : Specify the Recipient 
    + --export [uid] > public_key.gpg : To export your Public Key
        - Note:
            + UID : Specified Recipient ID used when encrypted the file
    + --import [public-key] : To import other people's Public Key
    + --gen-key : Generate Public and Private Key Pair
        - NOTE
            + Do not forget the pass-phrase that was requested when generating the key pair
            - You may not have enough entropy in your random source
                + You have to do more tasks such as moving the mouse, opening and closing programs etc.
                + similar to ArchLinux's pacman pgp key activation
                - You can quickly boost the entropy using rng-tools
                    + Package Name : rng-tools
    + --list-keys : Get the list of your keys
#### Usage
- Encrypt file
    ```console
    gpg -c test.txt
    ```
- Decrypt file
    ```console
    gpg -d test.txt.gpg
    ```
#### Hints
- To encrypt a folder
    - Compress the folder to a file
        + via .tar.gz (tar -cvzf) etc
    - Encrypt the compressed file
- To decrypt an encrypted folder-file
    - Decrypt the compressed file
    - Extract the file to a folder
        + via .tar.gz (tar -xvzf) etc

## gpg-zip

### Documentation
#### Description
+ gpg cannot encrypt a folder
+ thus, gpg-zip is a convenient way to encrypt a folder
#### Synopsis/Syntax
+ gpg-zip {options} [directory-name]
#### Parameters
+ -c : Compress the specified directory with AES
+ -d : Decrypt the specified encrypted directory
+ -o [output-encrypted-filename] : Compress the specified directory name and output the encrypted output
#### Usage
- Basic
    ```console
    gpg-zip -c -o file.gpg [directory-name]
    ```


## Resources

## References

## Remarks

