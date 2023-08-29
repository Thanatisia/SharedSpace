# QEMU/KVM - Multi-architecture Virtual Machine Management

## Information
### Basics
- QEMU provides multiple binaries that can emulate different CPU architectures using either custom or prebuilt images for the guest OS
    - Essentially, this is also used with Docker to allow Multi-architecture Cross-Compilation of container images

## Setup
### Dependencies
+ qemu : Emulates processors and peripherals
+ kvm  : Accelerates the emulation if the CPU has VT enabled
+ (optional) libvirt : provides a daemon and client to manipulate VMs for convenience

### Steps
#### To create and setup a virtual machine from another architecture
1. you need to first figure out what architecture the host device is running on
2. figure out what architecture you want the Virtual Machine to run. Generally x86_64 is what Windows, *NIX-based distributions are using for the most part unless you are installing a customized build for other architectures
3. Figure Virtual Machine system requirements
    - Operating System
    - Memory
    - Storage space
    - CPU pass-through
    - GPU pass-through
    + etc
#### Normal post-virtual machine setup
4. Creating the Virtual Machine
    - If creating headless
        + Ensure that you enable the '-display' or '-vnc' flags accordingly to be able to access them from a Remote method

## Documentation

### Synopsis/Syntax
- Using qemu-system-[architecture]
    ```console
    qemu-system-[architecture] {options} <arguments>
    ```

### Parameters
- Positionals
- Optionals
    - With Arguments
        + -cpu [cpu-model] : To emulate the specific CPU; Reference using '--cpu help'
        + --cpu help : Display all CPU architectures that QEMU supports on the host system
    - Flags
        + -daemonize : Run Virtual Machine in the background as a daemon

### Usage
- To look at what CPU architectures QEMU supports on the host system
    + Pass the flag '--cpu help'
    ```console
    qemu-system-[architecture] --cpu help
    ```

### Snippets
- Recommended Defaults
    - General
        ```console
        qemu-system-[architecture] -name [name-of-virtual-machine] -cpu [your-cpu-codename] -m [memory (default: 1024)] -daemonize
        ```
    - Headless
        ```console
        qemu-system-[architecture] -name [name-of-virtual-machine] -vnc [vnc-static-ip-adress]:[display-output-number] -cpu [your-cpu-codename] -m [memory (default: 1024)] -drive format=raw,index=[mount-position-index],file=[virtual-image-file] -daemonize
        ```
    - Attach a Virtual Hard Drive
        ```console
        qemu-system-[architecture] [recommended ...] -hda [vdi|vhd|qcow2 virtual drive file] 
        ```
    - Attach a Disk Image (.iso)
        ```console
        qemu-system-[architecture] [recommended ...] -drive format=raw,index=[mount-position-index],file=[virtual-image-file (.iso)] 
        ```

- Start a new Virtual Machine using another architecture
    - x86_64 VM on an ARM processor machine
        - Assumptions
            + Target CPU: x86_64
            + Host CPU: ARM
            - Virtual Machine
                + Name: debian
                + Memory: 1024
                - Virtual Drive: 
                    + Index Position 2 
                    + format as raw, 
                    + Image File: debian.img
            - Enabled VNC display output
                 + VNC Static IP Address: 192.168.1.X
                 + Display Output Monitor: 1
            - Flags
                 + -daemonize : Start in background
        ```console
        qemu-system-x86_64 -name [name-of-virtual-machine] -vnc [vnc-static-ip-adress]:[display-output-number] -cpu [your-cpu-codename] -m [memory (default: 1024)] -drive format=raw,index=[mount-position-index],file=[virtual-image-file] -daemonize
        ```

- Start a new Virtual Machine with a qcow2 image attached
    - Assumptions
        + Target CPU: x86_64
        + Host CPU: ARM
        - Virtual Machine
            + Name: debian
            + Memory: 1024
            - Mounted Virtual Drive
                + Slot: /dev/sda
                + Drive: file.qcow2
        - Enabled VNC display output
            + VNC Static IP Address: 192.168.1.X
            + Display Output Monitor: 1
        - Flags
            + -daemonize : Start in background
    ```console
    qemu-system-[architecture] -name [virtual-machine-name] -vnc [vnc-static-ip-address]:[display-output-number] -m [memory (RAM)] -hda [vdi|vhd|qcow2 virtual drive file] -daemonize
    ```

- Check if the VM instance is running
    ```console
    pgrep -lfa qemu
    ```

## Wiki
### Architectures
+ aarch64 : 64-bit CPU
+ arm     : Generic ARM CPU Processors
+ i386    : Generic x86_64 CPU processor
+ x86_64  : 32/64-bit CPU

### Filesystem Structure
- /usr/bin/ : PREFIX, typical location of where the qemu binaries are stored
    - Binaries
        + qemu-system-[architecture] : This is the main multi-architecture CPU emulation binary that allows the user to create VM running OS from the specified architecture

## Resources

## References
+ [Serverfault - Difference between KVM and QEMU](https://serverfault.com/q/208693/293440)
+ [UNIX StackExchange - Whats the difference between KVM, QEMU and Libvirt](https://unix.stackexchange.com/questions/486301/whats-the-difference-between-kvm-qemu-and-libvirt)

## Remarks