# Security Configuration Hardening: SSH

## Setup

### SSH configuration directory
- Create a SSH configuration directory for securing access into the git remote repository server
    - Now you have an .ssh directory to hold your “authorized_keys” file,
        + which is used to authenticate login requests.
    ```bash
    mkdir -pv .ssh
    ```
- Change permission to the '.ssh' directory so that it is only accessible by the git user
    ```bash
    chmod 700 .ssh
    ```

### Create authorized_keys file
- Create the 'authorized_keys' file in '.ssh' to authenticate and authorize (AA) login requests via SSH
    - Explanation
        - When you hear about “uploading” or “managing” keys, 
            + you are basically appending these keys to the .ssh/authorized_keys file
    ```bash
    touch .ssh/authorized_keys
    ```
- Change the permission modifier of '.ssh/authorized_keys' to make the file accessible only to the git user
    ```bash
    chmod 600 .ssh/authorized_keys
    ```

### Client-Server Security Hardening
- Copy/"Upload" the SSH private key from the client to the server for authorization
    ```bash
    ssh-copy-id -i $HOME/.ssh/key [client-username]@[server-host-name|ip|domain]
    ```

## Resources

## References
+ [inmotionhosting - git server](https://www.inmotionhosting.com/support/website/git/git-server/)

## Remarks

