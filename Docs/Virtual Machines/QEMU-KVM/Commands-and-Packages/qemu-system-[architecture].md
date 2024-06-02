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
        - Standard Options
            + `-accel [accelerator-name]`     : Accelerator
            - `-boot [boot-order|settings]`   : Boot Options/Settings
                - Boot Order : order=[arrangement]
                    + c : Hard Drive
                    + d : CDROM 
                - Key-Values Boot Settings
                    + strict=[off|on]         : Enable/Disable strict boot
            + `-m "memory-size"`              : Memory Size (RAM)
        - Block device options
            + `-cdrom "iso-to-launch.iso"`    : Specify a target disk ISO to launch
            + `-hda "virtual-disk-file-name"` : Specify a Virtual Disk File Name to mount into hard drive slot A; .qcow2 format
        - Display options
            - `-display [type]`               : Specify the type of display to use when starting up the Virtual Machine; Default is 'sdl'; Use '-display help' to list the available display types
                - Valid values for type
                    - Important
                        + spice-app[,gl=on|off]   : To output the Virtual Machine in a SPICE client; i.e. Used by Proxmox to output through the WebUI
                        + vnc=<display>           : To output the Virtual Machine in a VNC port on startup; i.e. Used by Proxmox to output through the WebUI; Connect using the port number '59<specified-display>'
                    - cocoa {options} <args>  : Display video output in a Cocoa window; Mac only. This interface provides a drop-down menu and other UI elements to configure and control the Virtual Machine during runtime
                        - Options
                            + left-command-key=on|off : Disable forwarding left command key to host
                            + show-cursor=on|off : Force showing the mouse cursor
                    - curses[,charset=<encoding>] : To output video output via curses. For graphic device models which supports text mode, QEMU can display this output using a curses/ncurses interface. Nothing is displayed when the graphics device is in graphical mode or if the graphic device does not support a text mode
                    - dbus {options} <args>   : Exports/outputs the display over D-Bus interfaces
                        - Options
                            + addr=<dbusaddr> : Specify the D-Bus bus address to connect to
                            + p2p=yes|no      : Specify if to use Peer-to-Peer connection, accepted via QMP add_client
                            + gl=on|off|core|es : Use OpenGL for rendering (the D-Bus interface will share framebuffers with DMABUF file descriptors)
                    - gtk {options} <args>    : Display video output in a GTK window. This interface provides drop-down menus and other UI elements to configure and control the VM during runtime
                        - Options
                            + full-screen=<on|off> : Start in fullscreen mode
                            + gl=on|off       : Use OpenGL for displaying
                            + grab-on-hover=on|off : Grab keyboard input on mouse hover
                    - sdl {options} <args>    : Display video output via SDL
                        - Options
                            + grab-mod=<mods> : Used to select the modifier keys for toggling the mouse grabbing in conjunction with the "g" key; <mods> can be either `Lshift-Lctrl-Lalt` or `Rctrl`
                            + gl=on|off|core|es : Use OpenGL for displaying
                            + show-cursor=on|off : Force showing the mouse cursor
                            + window-close=on|off : Allow to quit qemu with window close button
            + `-full-screen`                  : Start in full screen
            - `-spice {option[,options[,...]]}` : Enable the SPICE remote desktop protocol
                - Options
                    + addr=[address]            : Set the IP address SPICE is listening on. Default is any address
                    + port=[nr]                 : Set the TCP port that SPICE is listening on for the plaintext channels
            + `-vnc display[,option[,option[,...]]]` : Enable the VNC remote desktop protocol; Set QEMU to listen on `VNC [display-port]` display and redirect the VGA display over the VNC session
                - Options
                    + to=L                      : QEMU will try and look for the next available VNC display, until the specified number 'L'; if the originally defined '-vnc display' is not available (i.e. port 5900+display is already used by another application), by default, to=0
                    + host:d                    : Specify allowed hosts; TCP connections will only be allowed from host on display 'd'. By convention, the TCP port is '5900+d'. Optionally, host can be omitted in which case the server will accept connections from any host
                    + none                      : VNC is initialized but not started; The monitor 'change' command can be used later to start the VNC server
            + `-vga [interface]`                : Video Graphics Appliance (Default: std) 
        - System Options
            - `-append [kernel-command-line-options]` : Appends and passed the specified command line option to the kernel's command line
                - Kernel Command Line Options
                    + nokaslr : Appends the 'nokaslr' option and pass this to the kernel command line. nokaslr will turn off KASLR. This is necessary because KASLR will cause the kernel to be loaded on a different memory address each time its booted up and this is a security measure but it is important when debugging the kernel.
            - `-kernel [kernel-image]` : This will startup the QEMU virtual machine using the specified Kernel Image you compiled using that particular architecture
                - Parameters
                    - Positionals
                        + kernel-image : Specify the path to the kernel image you wish to startup the QEMU Virtual Machine with
                - Kernel Image Examples
                    - Linux Kernel: `linux/arch/[architecture]/boot/bzImage`
                        - Notes
                            + bzImage is the Kernel Image application
        - Network Options
            - `-net [network-objects],{options}`        : Set network objects
                - Network Objects
                    + `[network-interface],{options}` : Set a new network interface with options
                    + `[network-name],{options}` : Set a new network with options
                    + `nic,{options},...` : Set the Network Interface Card and options
                        - Options
                            - `model=[NIC-model]` : Add a Network Interface Card
                                - Models
                                    + virtio : (Default) virtio Virtualization NIC
                    - `user,{options},...` : Set Network Options for the user
                        - Options
                            - `smb=/path/to/folder` : Startup a Samba (SMB) server in the Virtual Machine with the specified folder mounted from the host system into the virtual machine as a network shared drive
    - Flags
        - System
            - `-S` : Tells QEMU to startup the system suspended.
                - Usage Examples
                    + This will help to freeze the system until we connect with the debugger and explicitly tell QEMU to continue running.
        - Debugging
            + `-s` : QEMU will listen on GDB connections and connect to GDB as debugger

### Usage
- To boot an iso
    ```console
    qemu-system-[architecture] -hda [virtual-disk-name (.qcow2 format)] -m [memory-size] -cdrom [iso-to-launch].iso -boot [boot-options]
    ```
- To boot an existing qcow2 image
    ```console
    qemu-system-[architecture] -hda [virtual-disk-name (.qcow2 format)] -m [memory-size] -boot [boot-options]
    ```
- Boot up a custom kernel using qemu-system-[architecture] with GDB remote debugging
    - Explanation
        + `-kernel [path-to-kernel-image]` : This will startup the QEMU virtual machine using the specified Kernel Image you compiled using that particular architecture
        + `-s` : QEMU will listen on GDB connections and connect to GDB as debugger
        + `-S` : Tells QEMU to startup the system suspended. This will help to freeze the system until we connect with the debugger and explicitly tell QEMU to continue running.
        + `-append [kernel-command-line-option]` : Appends and pass the specified command line options to the kernel command line.
    - QEMU will start but the guest will not initialize the display
        + It is in a suspended state and waiting for the debugger to load and continue
    ```bash
    qemu-system-[architecture] -kernel [path-to-kernel-image] -s -S -append [kernel-command-line-option]
    ```

## Wiki
### Snippets and Examples
- To launch an ISO installer and create a new image
    ```console
    qemu-system-[architecture] -accel whpx -hda .\[disk-name].qcow2 -m 512 -net nic,model=virtio -net user -cdrom .\[name].iso -vga std -boot strict=on
    ```

- DIY: Create/Make your own Proxmox from scratch
    - Virtual Machines
        - To startup a Virtual Machine automatically through a VNC port for display
            - On QEMU/KVM virtual machine startup/creation
                ```console
                qemu-system-x86_64 -display vnc=<display>
                ```
            - Connect using noVNC like in Proxmox
                ```console
                http://domain-name:59<display>
                ```

- If you are debugging a Systems Application (i.e. Kernel, Operating System)
    - Linux Kernel
        - Boot up the kernel you compiled using qemu-system-x86_64 (QEMU x86_64 Virtualization)
            - Explanation
                - `-kernel arch/x86_64/boot/bzImage` : This will startup the QEMU virtual machine using the specified Kernel Image you compiled using that particular architecture
                    + Format: `/path/to/linux/arch/[architecture]/boot/bzImage`
                    + bzImage is the Kernel Image application
                + `-s` : QEMU will listen on GDB connections and connect to GDB as debugger
                + `-S` : Tells QEMU to startup the system suspended. This will help to freeze the system until we connect with the debugger and explicitly tell QEMU to continue running.
                - `-append nokaslr` : Appends the 'nokaslr' option and pass this to the kernel command line. nokaslr will turn off KASLR. This is necessary because KASLR will cause the kernel to be loaded on a different memory address each time its booted up and this is a security measure but it is important when debugging the kernel.
            - QEMU will start but the guest will not initialize the display
                + It is in a suspended state and waiting for the debugger to load and continue
            ```bash
            qemu-system-x86_64 -kernel arch/x86_64/boot/bzImage -s -S -append nokaslr
            ```

## Resources

## References
+ [YouTube - Nir Lichtman - How to Debug Linux Kernel with GDB](https://www.youtube.com/watch?v=D4k1Q3aHpT8&pp=ygUgaG93IHRvIGRlYnVnIGxpbnV4IGtlcm5lbCBpbiBnZGI%3D)

## Remarks

