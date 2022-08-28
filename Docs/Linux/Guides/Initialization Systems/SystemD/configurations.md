# Linux Init Systems - SystemD - Configurations and Customization

## System Configuration
- Disable Suspend when laptop screen is closed
    - Edit '/etc/systemd/logind.conf'
        - Under [Login]
            - Uncomment the following
                + HandleSuspendKey
                + HandleLidSwitch
                + HandleLidSwitchDocked
            - Change the following values
                + HandleSuspendKey => ignore
                + HandleLidSwitch => ignore
    - Restart systemd
        ```console
        sudo systemctl restart systemd-logind
        ```


## Wiki
### Logind Configurations
- Login
    - HandleSuspendKey : When the Suspend button is pressed
        - Options
            + Default : suspend 
    - HandleLidSwitch : When the laptop lid is closed
        - Options
            + Default : suspend
    - HandleLidSwitchDocked : When the laptop lid is closed and is plugged in to a charger
        - Options
            + Default : ignore


