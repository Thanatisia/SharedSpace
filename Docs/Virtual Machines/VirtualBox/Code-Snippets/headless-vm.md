# VirtualBox - Headless Virtual Machines

## Documentations
### Synopsis/Syntax
- VboxManage
    ```console
    vboxmanage [action] [vm-name] {options}
    ```
- VboxHeadless
    ```console
    vboxheadless {actions} [vm-name] {vm-options}
    ```

### Parameters
- VboxManage
    - Positionals
        + modifyvm "vm-name"
    - Optionals
        + --vrde [on|off]: To enable/disable VRDE support
        + --vrdeport [custom-RDP-port-number]: Explicitly specify a custom RDP port number; Default: 3389
        + --vrdeaddress [your-host-ip-address]: Explicitly specify your VRDE server ip address; Default: host IP
        - --vrdeproperty [property-key]=[value]: Modify VRDE options/property key-values
            - Properties
                + TCP/Ports=[port-number]: Equivalent to using '--vrdeport'; Explicitly specify a custom RDP port number
                + TCP/Address=[ip-address]: Equivalent to using '--vrdeaddress'; Explicitly specify your VRDE server IP address; Default: host IP
- VboxHeadless
    - Positionals
    - Optionals
        + --startvm "vm-name"

## Snippets
### Start VM with Hypervisor RDP support
- Modify VBox Virtual Machine 
    - Enable Virtual RDP Engine (VRDE): vboxmanage modifyvm "Gentoo TestBench" --vrde on --vrdeport [custom-RDP-port-number (default: 3389)] --vrdeaddress [your-host-ip-address]

- Start VBox Virtual Machine: 
    - Headless:  vboxheadless --startvm "Gentoo TestBench"

- Access VM RDP instance
    - Open RDP client
        + Enter "[ip-address]:[rdp-port-number]"

## Wiki

## Resources

## Refereces
+ [chrisewland - Solved - VirtualBox Headless VRDE server failed to start - 284](https://www.chrisnewland.com/solved-virtualbox-headless-vrde-server-failed-to-start-284#:~:text=VRDE%20server%20is%20inactive.,same%20as%20the%20virtualbox%20host!)

## Remarks