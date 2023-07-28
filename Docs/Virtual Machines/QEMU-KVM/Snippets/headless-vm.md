# QEMU/KVM - Headless Virtual Machines

## Information
### Background
```
Generally when running Headless, you have several tasks to ensure it setup
    1. Display output Method
        - Running Headless means that you do not have any monitors, so in the case of Bare Metal system setup, this means you need to either
            1. SSH
            2. Temporarily plug in a monitor
        - However, in Virtual Machines
            - most Virtualization Hypervisors such as QEMU/KVM and VirtualBox supports built-in external display output support other than GUI.
            - as such, you can make use of the built-in display (RDP/VNC/SPICE) engines to remotely connect into the Guest Virtual Machine from the Host.
    2. Have a client prepared to remotely connect into the Guest Virtual Machine
```

## Documentations
### Synopsis/Syntax
- qemu
    - qemu-img
        ```console
        qemu-img [action] {options} <arguments>
        ```
    - qemu-system-[architecture]
        ```console
        qemu-system-[architecture] {options} <arguments>
        ```

### Parameters
- qemu-img
    - Parameters
        - Actions
            - create: Create Virtual Disk Image Files
                - Options
                    + -f [raw-name] [file-name] [file-storage-size]: Specify Virtual Disk Image file name, raw name and storage size to create
            - `resize [disk-image] [[+|-][size-change]]`: Resize an image

- qemu-system-[architecture]
    - Positionals
    - Optionals
        - With Arguments
        - Flags
        - -accel [accelerator]: To support an Accelerator
            - Valid Values
                + kvm  : To Enable and start QEMU in KVM mode
                + whpx
        - -hd<x> [qcow2-virtual-disk-file] : Specify the .qcow2 Virtual Disk File you want to mount; The x in '-hdx' refers to the block device name (hdx = /dev/sdX)
        - -drive [drive-options=value,...] : Manage/Handle Drive Options
            - Drive Options
                + file=[disk-image-file]: Specify Disk image to mount
                + index=[position]: Specify position (index) of the drive to mount to
                - media=[file-type]: Specify the type of media
                    - File Types
                        + disk: A Virtual Disk Image
                        + cdrom: A CDROM ISO
                - if=[interface]: Specify Drive Interface
                    - Interfaces
                        + virtio
                        + ide
                        + sata
        - -m [memory-size]: Specify the memory size (RAM)
        - -nic [target,options=values,...]: Manage/handle Network Interface Card settings; Similar to running '-net nic'
            - Targets
                + user: Use current user's NIC
            - Network Options
                - id=[nic-model-number]: Specify the Network Card ID
                - `hostfwd=[protocol]::[host-system-port]-:[vm-port]`: Port forward/translate/map Host system port number to Virtual Machine's port number
                - smb=[shared_dir_path]: Enable QEMU's built-in SMB server; Notes: Samba must be installed on the host
                - model=[NIC-hardware-model]: Specify Network Interface Card's hardware model
                    - Models
                        + virtio-net-pci
        - -net [parameters,settings]: Specify Network Properties/settings
            - Parameters
                - nic: Specify Network Interface Card information
                    - Settings
                        - model=[NIC-hardware-model]: Specify the Network Interface Card (NIC)'s hardware model
                            - Models
                                + virtio: Virtualization Network
                - user: Set Network host as user
        - -cdrom [iso-path]: Specify filepath to the target CDROM ISO that you want to attach to the Virtual Machine
        - -curses: Emulate a standard graphic card text mode; Allows to type text and see text output directly inside a text terminal
        - -vga [vga-output-method]: Specify VGA settings; Similar to '-vnc' for VNC display out settings
            - Display Output Method
                + std: Standard VGA output; Get a resolution of up to 2560x1600 pixels without requiring guest drivers
                + qxl: Paravirtual Graphics Driver with 2D support
                + vmware
                + virtio
                + cirrus
                + none: No VGA card at all
        - -display [display_method=values,options]: Specify Virtual Machine Display Output method on startup
            - Supported Display Methods
                - vnc=[ip-address:display:]: Startup Display Output through a VNC instance
                    - Values
                        + ip-address: (Optional) Specify the IP address of the Hypervisor's VNC server you want to connect with; Default: 0.0.0.0 or Just put the display port number
                        + display: Specify the display port number; This is equivalent/corresponds to TCP port '5900+<display-port-number>'
                - spice-app: Startup Display Output automatically through SPICE
            - Options
                - show-cursor=[on|off]: To enable/disable showing a mouse cursor in the Virtual Machine
        - -vnc [display-port-number,vnc-password]: To have QEMU redirect the VGA display to the VNC session; Specify Hypervisor's VNC server Display Port Number and the VNC password to connect with; This display port number corresponds to the TCP port number '5900+<display-port-number'
        - -spice [options=value,...]: Manage SPICE options
            - Options
                + port=[SPICE-port-number]: Specify the SPICE TCP port number; i.e. 5930; and set that TCP port for SPICE channels listening and allow client to connect without authentication
                + disable-ticketing=[on|off]: Turn on/off Disabling of Ticketing; Aka Disable Authentication
                + unix=[on|off]: Turn on/off Using UNIX sockets instead of TCP ports; Optional
                + addr=/tmp/vm_spice.socket: Specify the SPICE socket path; Optional
                + password=[your-password]: To enable Password Authentication with SPICE; Must remove 'disable-ticketing'
        - -boot [bootloading-settings]: Specify Bootloader/loading settings
            - Bootload Settings
                + order=x: Specify the drive boot order; Where x = the block device letter (i.e. /dev/sdX = x, /dev/sda = a)
                + menu=[on|off]: Enable/Disable using a Boot menu
                + strict=[on|off]: Enable strict boot-up
        - -device [device-to-add|interface,options=value]
            - Devices
                + virtio-serial-pci: Add a virtio-serial device
                + usb-tablet: Mouse Integration; QEMU is able to report the mouse position without having to grab the mouse; Prevents the mouse from being grabbed when clicking on the guest's OS window
            - Interface
                + virtserialport: Open a port for SPICE vdagent in the virtio-serial-device
            - Options
                + chardev=[target-chardev]: Specify a chardev port for the device
                + name=[device-name]: Specify name for the device
        - -cpu [cpu-type]: To manage/handle Virtual Machine's CPU options
            - CPU type
                + host: Use the host CPU
        - -machine {options,value}
            - Machine Options
                + accel=[accelerator]: Specify an accelerator to support; Equivalent to the '-enable-kvm' or the '-accel kvm' option
        + -enable-kvm: Enable KVM mode; Equivalent to using '-accel kvm' to the additional start options
        - -monitor [interface]: Specify an interface to access the monitor
            - Interfaces
                + stdio: To access the monitor automatically from the same terminal QEMU is being run from
        + -nographic: Disable autostarting of Virtual Machine GUI (aka enable Headless Mode); Disables the SDL display
        - -chardev [chardev-type,chardev-options]: Adds a chardev of that chardev-type for that port; Note that the 'chardev=' option of the verialserialport device must match the 'id=' option given to the '-chardev' option
            - Chardev Type
                + spicevmc: For Spice vdagent
            - Chardev Options
                + id=[chardev-id]: Specify ID for the chardev
                + name=[chardev-name]: Specify channel name for the chardev
        - -name [vm-name]: Specify Virtual Machine Name

## Snippets
### Start VM with VNC display output support
- To startup a Virtual Machine automatically through a VNC port for display
    - On QEMU/KVM virtual machine startup/creation
        ```console
        qemu-system-x86_64 -hda [virtual-disk-name (.qcow2  format)] -m [memory-size] -cdrom [iso-to-launch] -boot [boot-options] -display vnc=[ip-address:display-port-number:] -nographic
        ```
    - Connect with a VNC client
        + Enter "[domain-name|ip-address]:[vnc-server-port-number (59<display-port-number>)]"

- DIY: Create/Make your own Proxmox from scratch
    - On QEMU/KVM virtual machine startup/creation
        ```console
        qemu-system-x86_64 -hda [virtual-disk-name (.qcow2  format)] -m [memory-size] -cdrom [iso-to-launch] -boot [boot-options] -display vnc=[ip-address:display-port-number:] -nographic
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

### Start VM with RDP support
- On QEMU/KVM virtual machine startup/creation
    ```console
    qemu-system-x86_64 -hda [virtual-disk-name (.qcow2  format)] -m [memory-size] -cdrom [iso-to-launch] -boot [boot-options] -nographic -nic user,hostfwd=tcp::[custom-host-rdp-port]-:3389
    ```
- Connect with a RDP client
    + Enter "[domain-name|ip-address]:[custom-rdp-port (default: 3389)]"

### Start VM with SPICE display output
- On QEMU/KVM virtual machine startup/creation
    ```console
    qemu-system-x86_64 -hda [virtual-disk-name (.qcow2  format)] -m [memory-size] -cdrom [iso-to-launch] -boot [boot-options] -vga qxl -device virtio-serial-pci -device virtserialport,chardev=spicechannel0,name=com.redhat.spice.0 -chardev spicevmc,id=spacechannel10,name=vdagent -spice port=5930,password=your-password -nographic -display=spice-app
    ```
- Connect with a SPICE client
    + Enter "[domain-name|ip-address]:[custom-spice-port]"

## Wiki

## Resources

## Refereces
+ [ArchWiki - QEMU](wiki.archlinux.org/title/QEMU)
+ [ArchWiki - KVM](wiki.archlinux.org/title/KVM)
+ [SPICE project](https://www.spice-space.org/)

## Remarks
