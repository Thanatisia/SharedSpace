# systemd - Service Management

## Information
### Init system filesystem structure
- Folders
    + /etc/systemd/system     : This directory contains all service configurations that are deployed; whereby it will be listed when searched using `systemctl status *`
    + /usr/lib/systemd/system : This directory is an all-in-one that contains/holds all service configuration files for reference

- Files
    + /etc/systemd/system/[service-name]@.service     : This service configuration file is read by systemctl for management
    + /usr/lib/systemd/system/[service-name]@.service : This is a service configuration file that can be copied to the '/etc/systemd/system' directory for use

## Setup

### System
- Prepare configuration files
    - Copy the service file from '/usr/lib/systemd/system' => '/etc/systemd/system' for enabling and allowing systemctl to read
        ```console
        sudo cp /usr/lib/systemd/system/[service-name]@.service /etc/systemd/system/[service-name]@.service 
        ```

## Documentation
### Synopsis/Syntax
- systemctl: `sudo systemctl {options} [service-name]@.service`

### Usage
- Enable service
    ```console
    sudo systemctl enable [service-name]@.service
    ```

- Disable service
    ```console
    sudo systemctl disable [service-name]@.service
    ```

- Start service
    ```console
    sudo systemctl start [service-name]@.service
    ```

- Stop service
    ```console
    sudo systemctl stop [service-name]@.service
    ```

- Restart service
    ```console
    sudo systemctl restart [service-name]@.service
    ```

## Wiki
### Configuration
- Layout
    ```
    
    ```

### Snippets and Examples

## Resources

## References
+ [ArchWiki - TigerVNC](https://wiki.archlinux.org/title/TigerVNC)
+ [DigitalOcean - Tutorials - How to use systemctl to manage systemd services and units](https://www.digitalocean.com/community/tutorials/how-to-use-systemctl-to-manage-systemd-services-and-units)
+ [RedHat - Documentation - TigerVNC](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/system_administrators_guide/ch-tigervnc)

## Remarks
