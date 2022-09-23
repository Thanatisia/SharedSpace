# Linux IPSec-L2TP VPN Encryption Error Documentation

## Documentation

### Error Description
```
If service 'xl2tpd' has failed and

Error message found in 'journalctl -xe' is: "Unable to read from /var/run/xl2tpd/xl2tpd-control"
```

### Targets 
- Files
    + /var/run/xl2tpd/xl2tpd-control
- Services
    + xl2tpd

### Triage
> Verify the file
- Read the file '/var/run/xl2tpd/xl2tpd-control'
    ```console
    sudo cat /var/run/xl2tpd/xl2tpd-control'
    ```
    + Output should be a never-ending loading scenario on the terminal
    + Ctrl + C and break the command

### Solution
+ Delete the file '/var/run/xl2tpd/xl2tpd-control'
    ```console
    sudo rm /var/run/xl2tpd/xl2tpd-control'
    ```

+ Recreate the file 
    ```console
    sudo rm /var/run/xl2tpd/xl2tpd-control'
    ```

- Unit Test the service
    - Run xl2tpd as a Daemon (Background service)
        ```console
        sudo xl2tpd -D
        ```
        + There should not be any error messages, just standard system logging output messages

+ Restart the system
    ```console
    sudo reboot now
    ```

- Verify service
    - Using systemd
        ```console
        sudo systemctl status xl2tpd
        ```
        + It should now be active

