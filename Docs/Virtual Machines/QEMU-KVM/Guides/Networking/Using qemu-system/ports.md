# QEMU/KVM Networking - Port Management using qemu-system-[architecture]

## Use Cases
### Port Forward/Translation/Mapping
#### Server Definitions
- Port Forward/Translation/Mapping via 'qemu-system-[architecture]' networking
    - Explanations
        + -name [vm-name]
        + -daemonize : Run Virtual Machine as a background process (Daemon)
        + -cpu host  : Passthrough host's CPU
        + -enable-kvm : Enable and run Virtual Machine with KVM accelerator
        - Networking
            + -net nic : Passthrough the Host's Network NIC to the guest temporarily
            + -net user,hostfwd=[protocol]::[host-system-port]-:[virtual-machine-port] : Port forward/map/translate from the Host System Port to the Virtual Machine Guest Port (similar to docker's "-p | --publish" option)
    ```console
    qemu-system-[architecture] -name [vm-name] -daemonize -cpu host -enable-kvm -net nic -net user,hostfwd=tcp::[host-system-port]-:[virtual-machine-port]
    ```

#### Host System Usage
- To utilize an application from a certain port
    - SSH (Port 22): `ssh [server-ip] -p [service-port-number]`
        + -p will perform a port forward from port 22 to the specified service port number; In this case, the custom port for the guest vm's SSH instance
    + Web Server: `[protocol]://[server-ip]:[service-port-number]`

## Wiki

## Resources

## References

## Remarks
