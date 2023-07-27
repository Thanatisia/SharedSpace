# Systemd Service File

## Information
### Systemd filesystem structure basics
- Folders
    + /etc/systemd/system/ : The systemd init system service configuration file folder
- Files
    - /etc/systemd
        - system/
            + [service-name]@.service : Systemd Active Service Configuration File

## Documentations
### Entities/Components
+ [Unit]: A "Unit" in the systemd init system effectively defines the information and description about the individual services themselves
+ [Service]: This component defines the permissions/ownership, execution definitions and anything to do with executing the service when started/enabled
+ [Install]: This component defines the dependencies and description of the target system

### Special Variables
+ %i: Get the name of the service

### Format/Key-Values
- [Unit]
    - Description="Your Description of the service": This contains the description/summary of your Service when running 'systemctl status service-name'
    - Requires=[dependencies].service: This specifies other dependency services (if any) that are required to exists
    - After=[action].service: This specifies any other services to startup after your service has been started
- [Service]
    - User=[username]: Specify the superuser/admin username
    - Group=[group]: Specify the group related to this service
    - ExecStart=/path/to/executable {options} <arguments>: This specifies the executables and options to execute when starting service with 'systemctl start service-name'
    - ExecStop=/path/to/executable {options} <arguments>: This specifies the executables and options to execute when stopping service with 'systemctl stop service-name'
    - RemainAfterExit=[yes|no]: Option to keep/remove service after exit/stopping
    - KillMode=none: Specify the method of killing the service
    - TimeoutStopSec=[seconds]: Specify the number of seconds to pass before Stop Timeout
- [Install]
    - WantedBy=[target-user].target: This specifies all affected users in your system that are to be targetted by this service
        - Valid Targets:
            + multi-user.target: Basically all users

### Template 
```
[Unit]
Description=Your Description Here
Requires=systemd-modules-load.service
After=systemd-modules-load.service

[Service]
User=username
Group=group
ExecStart=/usr/bin/executable --options arguments
ExecStop=/usr/bin/executable --options arguments
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
```

## Wiki
### Snippets
#### VirtualBox
+ File: /etc/systemd/system/vboxvmservice@.service
+ Template:
```
[Unit]
Description=VBox Virtual Machine %i Service
Requires=systemd-modules-load.service
After=systemd-modules-load.service

[Service]
User=username
Group=vboxusers
ExecStart=/usr/bin/VBoxManage startvm %i --type startmode
ExecStop=/usr/bin/VBoxManage controlvm %i stopmode
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
```

## Resources

## References

## Remarks