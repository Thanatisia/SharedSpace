# LXC - IO Operations Quickstart

## Setup

### Dependencies
+ LXC

### Pre-Requisites
- If you are accessing the server via SSH
    - Export the .Xauthority file path on the host
        ```bash
        export XAUTHORITY=$HOME/.Xauthority
        ```

## Standard Operating Procedure (SOP)

## Operational Workflow

### LXD Virtual Machines
- Notes
    + LXD Virtual Machines (VMs) are based on QEMU/KVM
    + All devices are virtio-based

> Creating a new empty LXD VM

1. Initialize a new LXD Virtual Machine (VM)
    ```bash
    lxc init [lxc-container-id] --empty --vm
    ```

2. Configure LXC to run as root
    ```bash
    lxc config device override [lxc-container-id] root size=[vm-disk-size]
    ```

3. Start the LXC container instance
    - Explanation
        - Parameters
            + --console : Open up the LXC container console/terminal on startup
    ```bash
    lxc start [lxc-container-id] --console
    ```

> Create and launch

- Creating a VM with a default template
    ```bash
    lxc launch [image]:[tag|version] [vm-name] --vm
    ```

## Resources

## References
+ [Ubuntu - Blog - LXC Virtual Machine - An Overview](https://ubuntu.com/blog/lxd-virtual-machines-an-overview)
+ [LXC Discuss - Topic - Install any OS via ISO in a Virtual Machine](https://discuss.linuxcontainers.org/t/install-any-os-via-iso-in-a-virtual-machine-vm/9281)

## Remarks
