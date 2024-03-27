Termux: Remote SSH server setup
===============================

*Information*
-------------
+ Purpose: Setting up SSH lets you remotely connect to the phone's termux session for easy management between PC and phone
- Dependencies
    + openssh

*Setup*
-------
- Install dependencies
    ```bash
    pkg {add|install} openssh
    ```

- User Management
    - Create new user
        ```bash
        useradd -m -g wheel -G users -d [custom-home-directory] [username]
        ```
    - Setup password for user
        ```bash
        passwd [username]
        ```

- Find your device's IP address
    ```bash
    ip a s
    ```

- Find your username
    ```bash
    whoami
    ```

- Startup the SSH server on Termux
    - Information
        + The SSH server on Termux is using the custom port number 8022 instead of the default (22)
    ```bash
    sshd
    ```

- Verify that SSH server/daemon is running
    ```bash
    logcat -s 'ssh:*'
    ```

- To remotely connect from a PC to your termux session using SSH
    ```bash
    ssh -p 8022 [username]@[ssh-host-ip|domain]
    ```

## Resources

## References
+ [joeprevite - SSH into Termux from your computer](https://joeprevite.com/ssh-termux-from-computer/)

## Remarks

