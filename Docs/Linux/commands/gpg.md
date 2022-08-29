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
- General
    + -a | --armor : Create ASCII armoured output
    + --batch : Use batch mode. Never ask, do not allow interactive commands.; Required when using none-interactive (aka automated) options
    + --no-batch : Opposite of '--batch'; Disable Batch mode. This may be of use if '--batch' is enabled from an options file
    + -i | --interactive : Prompt before overwriting any files
    + -v | --verbose : Verbose flag; Give more information during processing. If used twice, the input data is listed in detail
    + -q | --quiet : Quiet flag; Give less information
    + --passphrase [key|string] : Allows you to parse a "key" or a passphrase string directly into gpg without the use of a popup interactive GUI (not recommended unless scripting); Requires the use of "--batch"
    - --passphrase-fd [file-descriptor|int] : Reads the passphrase/secret key from a file descriptor (aka a file object n). 
	+ If you used 0 for n : The passphrase will be read from stdin.
	+ This can only be used if only one passphrase is supplied
	+ Requires the use of "--batch"
    + -o [output-filename] | --output [output-filename] : Outputs the encrypted file with the specified target filename
- Symmetric Encryption/Decryption (AES)
    + -c [target-filename] : Encrypt specified file with AES
    + -d [encrypted-filename] : Decrypt the specified encrypted file using AES
- Asymmetric Public Key Encryption (RSA)
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

- Encrypt a file via the CLI (automatically)
    + Using "--batch" and "--passphrase"
    - Using symmetric key encryption as example
	+ You can use Asymmetric/Public Key Encryption as well
    ```console
    secret_Key="your-key"
    gpg -c --armor --batch --passphrase $secret_Key --output "output-file-name" "target-input-file-name"
    ```
    
- Symmetric Encryption
    + AES is the default Symmetric Key Encryption
    - Encryption
        - Plaintext
            + Default Format of the ciphertext (encrypted text) is binary
           + The ciphertext [file-name].gpg will be created
            ```console
            gpg -c [file-name]
            ```
        - To save your ciphertext in ASCII format
            + To display correctly
            + The ciphertext [file-name].asc will be created
            ```console
            gpg -c --armor [file-name]
            ```
    - Decryption
        ```console
        gpg [gpg-file]
        ```
- Public Key Encryption
    + RSA-2048 is the default Public Key Encryption Algorithm
    - Generate Key
        ```console
        gpg --gen-key
        ```
    - Export a Public Key
        + You can send your Public Key to your friend
        ```console
        gpg --armor --export uid > mypubkey.gpg.asc
        ```
    - List the Public Keys you have in the current system
        ```console
        gpg --list-keys
        ```
    - Import a Public Key
        ```console
        gpg --armor --import pubkey.gpg.asc
        ```
    - Encryption
        ```console
        gpg --encrypt -r [recipient_UID] --armor [filename]
        ```
    - Decryption
        ```console
        gpg [filename]
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

