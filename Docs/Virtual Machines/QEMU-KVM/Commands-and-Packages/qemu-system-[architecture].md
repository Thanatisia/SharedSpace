# KVM/QEMU Commands/Subpackages : qemu-system-[architecture]

## Information
- The 'architecture' of the command is representative of the system
    - i.e. for x86_64 is "x86_64"

## Documentations
### Synopsis/Syntax
```console
qemu-system-[architecture] {options} <arguments>
```

### Parameters
- Positionals
    - Actions

- Optionals
    - With Arguments
        + `-accel [accelerator]`          : Accelerator
        - `-boot [boot-order|settings]`   : Boot Options/Settings
            - Boot Order : order=[arrangement]
                + c : Hard Drive
                + d : CDROM 
            - Key-Values Boot Settings
                + strict=[off|on]         : Enable/Disable strict boot
        + `-cdrom "iso-to-launch.iso"`    : Specify a target disk ISO to launch
        + `-hda "virtual-disk-file-name"` : Specify a Virtual Disk File Name to mount into hard drive slot A; .qcow2 format
        + `-m "memory-size"`              : Memory Size (RAM)
        - `-net [network-objects]`        : Set network objects
            - Network Objects
                + network-interface
                + network-name
                + `nic,model=[NIC-model]` : Add a Network Interface Card
                    - Models
                        + virtio : (Default) virtio Virtualization NIC
                + user
        + `-vga [interface]`                          : Video Graphics Appliance (Default: std) 
    - Flags

### Usage
- To boot an iso
    ```console
    qemu-system-[architecture] -hda [virtual-disk-name (.qcow2 format)] -m [memory-size] -cdrom [iso-to-launch].iso -boot [boot-options]
    ```
- To boot an existing qcow2 image
    ```console
    qemu-system-[architecture] -hda [virtual-disk-name (.qcow2 format)] -m [memory-size] -boot [boot-options]
    ```

## Wiki
### Snippets and Examples
- To launch an ISO installer and create a new image
    ```console
    qemu-system-[architecture] -accel whpx -hda .\[disk-name].qcow2 -m 512 -net nic,model=virtio -net user -cdrom .\[name].iso -vga std -boot strict=on
    ```

## Resources

## References

## Remarks
