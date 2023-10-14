# Virtual Machine Headless - QEMU

## Setup
- Dependencies
    - General
         + python3
         + python3-pip
         + python3-venv
    - Virtual Machine
         + qemu-system-[architecture]
         + qemu-kvm
         + qemu-utils
         + bridge-utils
         + libvirt-clients
         + libvirt-daemon-system
         + virtinst
    - Web/Browser-based VNC Client
         + novnc
         + python3-websockify

- Add user to groups
    + kvm
    + libvirt

## Documentations
### Virtual Machine Setup and Installation
- Create QCOW2 drive
    ```console
    qemu-img create -f qcow2 [qcow-drive-file-name].qcow [size]
    ```
    
- Install Operating System to the drive
    + Start a Virtual Machine as a daemon (Background) using VNC as display output with the ISO
    ```console
    qemu-system-x86_64 -name debian -hda [qcow-drive-file-name].qcow -cdrom [installer-ISO] -vnc 192.168.1.25:0 -m 1024 -daemonize
    ```

- Startup Browser/Web-based VNC client linking to the QEMU/KVM Virtual Machine VNC server instance
    ```console
    websockify -D --web=[novnc-path] 6080 127.0.0.1:5900
    ```

### Post-Virtual Machine Installation
- Start a Virtual Machine as a daemon (Background) using VNC as display output
    - Where
        + -hdX refers to the drive position/index you wish to mount the qcow file; i.e. -hda = /dev/sda (For SATA); /dev/nvme0np1 (For NVME)
        + -vnc specifies the VNC server specifications such as the IP address and the Display Output monitor number
        + -m specifies the Memory (RAM) to parse into it
        + -daemonize : Run/start the process in the background as a daemon
    - Recommended Options
        + -cpu host : Pass-through the host's CPU to the Virtual Machine/Share and run the Virtual Machine with the host's CPU
        + -enable-kvm : Run the Virtual Machine with KVM support; Required if using '-cpu'
    ```console
    qemu-system-x86_64 -name [virtual-machine-name] -hdX [qcow-drive-file-name].qcow -vnc [vnc-server-ip-address]:[vnc-server-display-output-monitor] -m [memory (RAM)] -daemonize
    ```

- Startup Browser/Web-based VNC client linking to the QEMU/KVM Virtual Machine VNC server instance
    + NoVNC Path: Path to the Browser/Web-based VNC Client project source folder
    + Web/Browser-based VNC client port number: 6080
    + VNC Server Display Output instance: [vnc-server-ip-address:"59 + display-output-monitor"]
    ```console
    websockify -D --web=[novnc-path] [web/browser-based vnc client port number] [VNC server display output port]
    ```

### System Administration and Debugging
- To find all Virtual Machines created
    + Find process 'qemu-system-x86_64'
    ```console
    ps -ef | grep qemu-system-x86_64
    ```
- To kill the Virtual Machine
    + Locate the machine you wish to kill
    + Identify the Process ID (PID)
    + Kill the process
    ```console
    kill [PID]
    ```

## Wiki

### Snippets, Usage and Examples
- Example 1
    - Specifications
        + Virtual Drive Disk Path: ~/Desktop/drive
        + Virtual Drive Disk File: test.qcow
        + Virtual Drive Disk Type: qcow2
        + Virtual Drive Disk Size: 51200M
        + Virtual Drive Disk Mount Index: hda
        + ISO Disk Image Path: ~/Desktop/iso
        + ISO Disk Image Name: debian.iso
        + Virtual Machine Name: debian
        + Virtual Machine Memory (RAM): 1024
        + Virtual Machine Display Output Method: VNC
        + VNC Server Display Output IP Address: 192.168.1.1
        + VNC Server Display Output Monitor Port: 0
        + VNC Server Port Number: 5900 + 0 = 5900
        + Web/Browser-based VNC Client: NoVNC
        + Web/Browser-based VNC Client Path: /usr/lib/novnc
        + Web/Browser-based VNC Client Port: 6080
        - Other Options
            + Daemonize (Run as Background process)
    - Installing Operating System and Setup
        - Create QCOW2 Virtual Drive
            ```console
            qemu-img create -f qcow2 ~/Desktop/drive/test.qcow 51200M
            ```
        - Create Installer Virtual Machine
            ```console
            qemu-system-x86_64 -name debian -hda ~/Desktop/drive/test.qcow -cdrom ~/Desktop/iso/debian.iso -vnc 192.168.1.1:0 -m 1024 -daemonize
            ```
        - Startup Web/Browser-based VNC Client linking to the QEMU/KVM Virtual Machine VNC server instance
            ```console
            websockify -D --web=/usr/lib/novnc 6080 192.168.1.1:5900
            ```
    - Post-Installation
        - Start a Virtual Machine as a daemon (Background) using VNC as display output
            ```console
            qemu-system-x86_64 -name debian -hda ~/Desktop/drive/test.qcow -vnc 192.168.1.1:0 -m 1024 -daemonize
            ```
        - (Optional) Startup Web/Browser-based VNC Client linking to the QEMU/KVM Virtual Machine VNC server instance
            - Notes
                + If you have not killed this WebSocket server instance, you do not need to start it again
            ```console
            websockify -D --web=/usr/lib/novnc 6080 192.168.1.1:5900
            ```

## Resources

## References
+ [Debian Wiki - QEMU](https://wiki.debian.org/QEMU)

## Remarks
