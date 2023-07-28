# Development Workflow with Virtual Machines - QEMU/KVM

## Information
### Notes
- When working with Virtual Machines, you can work on it either with GUI, or headless (Without a monitor; server-like)
    - When working with Headless VM
        - You may want to startup the Virtual Machine using the Hypervisor's Display Output support
            - Unlike libvirt QEMU/KVM, VirtualBox only (natively) supports RDP display output via the VRDE server
                + To use VNC display output, you need to manually and explicitly change the VRDE server in 'vboxmanage [vm-name] --vrde...'

## Setup
### Dependencies
+ qemu
+ kvm
+ libvirt
### Pre-Requisites

## Documentations
### Steps
- Initial Setup
    1. [Create Virtual Machine Disks](#create-virtual-machine-disks)
    2. [First-Time Operating System Installation](#first-time-operating-system-installation)
- Preparing Development Environment
    3. Startup Headless VM
        + [Headless VM with VNC](#headless-vm-with-vnc)
        + [Headless VM with RDP](#headless-vm-with-rdp)
        + [Headless VM with SPICE](#headless-vm-with-spice)
    4. Perform development of Shellscript, project etc
- If you are doing Systems Programming, or anything requiring external Virtual (i.e. .qcow2, .vdi, .vhd)/Physical Drives
    5. [Mount Virtual Drives](#mount-virtual-drives)
    6. [Unmount Virtual Drives](#unmount-virtual-drives)
    7. [Mount Physical Drives](#mount-physical-drives)
    8. [Unmount Physical Drives](#unmount-physical-drives)

### Headless VM with VNC
- To startup a Virtual Machine automatically through a VNC port for display
    - On QEMU/KVM virtual machine startup/creation
        ```console
        qemu-system-[architecture] -hda [virtual-disk-name (.qcow2  format)] -m [memory-size] -cdrom [iso-to-launch] -boot [boot-options] -display vnc=[ip-address:display-port-number:] -nographic
        ```
    - Connect with a VNC client
        + Enter "[domain-name|ip-address]:[vnc-server-port-number (59<display-port-number>)]"

- DIY: Create/Make your own Proxmox from scratch
    - On QEMU/KVM virtual machine startup/creation
        ```console
        qemu-system-[architecture] -hda [virtual-disk-name (.qcow2  format)] -m [memory-size] -cdrom [iso-to-launch] -boot [boot-options] -display vnc=[ip-address:display-port-number:] -nographic
        ```
    - Setup Web/Browser-based VNC Client
        - With NoVNC+Websockify
            - Pre-Requisites
                + Installed Websockify
                + Installed/Prepared NoVNC (generally in '/usr/share/novnc')
            - Startup Websockify WebSocket Framework using NoVNC VNC Web Client pointing to the QEMU/KVM VNC server port number
                ```console
                websockify -D --web=/usr/share/novnc {options} [novnc-webui-port-number] [domain-name|ip-address:vnc-server-port-number (example: localhost:5901)]
                ```
            - Open Browser
                + Type into your browser: 'http://[server-ip-address]:[novnc-webui-port-number]/vnc.html'
        - With Guacamole
            + Add new VNC client
            + Add QEMU/KVM VNC server port number

### Headless VM with RDP
- On QEMU/KVM virtual machine startup/creation
    ```console
    qemu-system-[architecture] -hda [virtual-disk-name (.qcow2  format)] -m [memory-size] -cdrom [iso-to-launch] -boot [boot-options] -nographic -nic user,hostfwd=tcp::[custom-host-rdp-port]-:3389
    ```
- Connect with a RDP client
    + Enter "[domain-name|ip-address]:[custom-rdp-port (default: 3389)]"

### Headless VM with SPICE
- On QEMU/KVM virtual machine startup/creation
    ```console
    qemu-system-[architecture] -hda [virtual-disk-name (.qcow2  format)] -m [memory-size] -cdrom [iso-to-launch] -boot [boot-options] -vga qxl -device virtio-serial-pci -device virtserialport,chardev=spicechannel0,name=com.redhat.spice.0 -chardev spicevmc,id=spacechannel10,name=vdagent -spice port=5930,password=your-password -nographic -display=spice-app
    ```
- Connect with a SPICE client
    + Enter "[domain-name|ip-address]:[custom-spice-port]"

### Create Virtual Machine Disks
- Create RAW disk
    - Useful for
        + Running entire physical disk in QEMU/KVM (i.e. USB flashdrive)
    - Options
        - your-physical-block-device-disk: Specify the Disk name/label of your target disk
            - For Windows
                - The Windows convention is '\\.\PhysicalDriveX' where X is 0,1,2,3,....,n
                    + \\.\PhysicalDrive1 = /dev/sdb
                - To check for all available drives
                    - Using wmic
                        ```dos
                        wmic diskdrive get name,size,model
                        ```
                    - Using DiskPart (stands for Disk Partitioning)
                        + LIST DISK
                        + SELECT [disk]
                        + LIST PARTITION
    ```console
    qemu-img create -f [raw-name] [image-file-name] [storage-size]
    ```

### Create new virtual disk
```console
qemu-img create -f [raw] [image-file-name] [storage-size]
```

### Convert image
- From RAW to qcow2 Virtual Image Format
    ```console
    qemu-img convert -f raw -O qcow2 [input-image-file] [output-qcow2-image-file]
    ```

### Changing size of VDI disks
- Increasing size
    ```console
    qemu-img resize [disk-image-file] +[storage-change(X{G|M|K})]
    ```
- Decreasing size
    ```console
    qemu-img resize [disk-image-file] -[storage-change(X{G|M|K})]
    ```

### First-Time Operating System Installation
- Startup Virtual Machine with installation ISO
    ```console
    qemu-system-[architecture] -name [virtual-machine-name] -m [memory (RAM) -cdrom [iso-image] -boot order=X -drive file=[virtual-disk-image],format=raw
    ```
- Start Installation into the virtual disk image

### Mount Virtual Drives
- Options
    - -name [virtual-machine-name]: Specify the name of the Virtual Machine
        - virtual-machine-name: Name of the target virtual machine
    - -hdX [virtual-disk-file]: Mount the specified Virtual Disk File in the drive '-hdX'; Where the X corresponds to the target device drive you want to mount (i.e. hda = /dev/sda, hdb = /dev/sdb...)
        - virtual-disk-file: This is the path to the new vdi file you want to attach; Format: file.vdi
    - storage-controller-type: The type of storage controller to hold the disk
        - Valid Values
            + SATA
    - port-number: Specify the port to attach the Storage Controller to the Virtual Machine; typically 0
    - medium-type: Specify the type of storage medium you want to attach
        - Value Values
            + hdd
```console
qemu-system-[architecture] -name [virtual-machine-name] -hdX [virtual-disk-file]
```

### Unmount Virtual Drives
- Options
    - -name [virtual-machine-name]: Specify the name of the Virtual Machine
        - virtual-machine-name: Name of the target virtual machine
```console
qemu-system-[architecture] -name [virtual-machine-name] -hdX none
```

### Mount Physical Drives
- Add the device/disk block ID/label when starting up
    ```console
    qemu-system-[architecture] -name [virtual-machine-name] -drive file=[drive-path (i.e. /dev/sdX),format=raw,media=disk
    ```

- Add the disk into libvirt
    - Edit libvirt XML for the Virtual Machine
        ```console
        virsh edit [virtual-machine-name]
        ```
    - Add the following contents
        ```xml
        ...
            <disk type="block" device="disk">
              <driver name="qemu" type="raw" cache="none" io="native"/>
              <source dev="[device-drive-path (i.e. /dev/sdX)]"/>
              <target dev="[device-drive-letter (i.e. /dev/sdX = sdX)]" bus="sata"/>
              <address type="drive" controller="0" bus="0" target="0" unit="0"/>
            </disk>
        ...
        ```

### Unmount Physical Drives
+ Follow [Unmount Virtual Drives](#unmount-virtual-drives)
- Remove the disk from libvirt
    - Edit libvirt XML for the Virtual Machine
        ```console
        virsh edit [virtual-machine-name]
        ```
    - Remove the following contents
        ```xml
        ...
            <disk type="block" device="disk">
              <driver name="qemu" type="raw" cache="none" io="native"/>
              <source dev="[device-drive-path (i.e. /dev/sdX)]"/>
              <target dev="[device-drive-letter (i.e. /dev/sdX = sdX)]" bus="sata"/>
              <address type="drive" controller="0" bus="0" target="0" unit="0"/>
            </disk>
        ...
        ```

## Wiki

## Resources

## References
+ [ArchWiki - QEMU](https://wiki.archlinux.org/title/QEMU)

## Remarks

