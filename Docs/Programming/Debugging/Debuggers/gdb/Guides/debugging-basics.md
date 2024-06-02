# Debugging using GDB - Basics

## Information

### Description
+ gdb - The GNU Debugger - is a general debugger used to debug compiled programming languages

## Setup

### Dependencies
+ gdb
+ qemu : (Optional) If you are debugging a systems application (i.e. kernel, operating system)

### Pre-Requisites
- Create a new entry point source code for GDB to load
    ```bash
    touch ~/.gdbinit
    ```

- Append the path to your source codes you want to debug
    + This will configure it via safe path for GDB so it will successfully load the scripts from the provided source code directory
    - Source Code Directory : Specify the path to the source you want to debug
        - i.e. 
            + Linux Kernel : ~/path/to/linux
    ```bash
    echo -e "add-auto-load-safe-path [source-code-directory]" >> ~/.gdbinit
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

## Operational Workflow
- Boot up GDB inside of the folder containing the source code you want to debug
    - Examples
        - If you are debugging a Systems Application (i.e. Kernel, Operating System)
            - Linux Kernel
                - The 'source-code-directory' will be '~/path/to/linux' which contains your linux source code that you just built
                    ```bash
                    cd ~/path/to/linux
                    ```
                - Start gdb using 'vmlinux'
                    ```bash
                    gdb vmlinux
                    ```
    ```bash
    gdb [source-code-directory]
    ```

> In GDB

- Attach GDB to the target booted remote guest
    - Explanation
        - gdb-qemu-server : Replace this with the port to the QEMU Virtual Machine you started up that is listening to GDB
            + The default port is '1234'
    - Notes
        + While connected, the results shown on the GDB terminal will correspond to the QEMU virtual machine
    ```bash
    (gdb) target remote :[gdb-qemu-server]
    ```

- Placing a breakpoint in your source code
    - Notes
        - The break point - when stopped - will give you debug details such as
            + Function Name
            + Line Number within the source code
    - Regular Break point
        ```bash
        (gdb) break [function_name]
        ```
    - Hardware Breakpoint
        - Explanation
            + `hbreak [function_name]` : Sets a Hardware Break Point at the function. This is used when kernel debugging
        ```bash
        (gdb) hbreak [function_name]
        ```

- Continue the initialization
    + Pass 'c' to GDB
    ```bash
    (gdb) c
    ```

- Proceed to the next line
    + Pass 'n' to GDB
    ```bash
    (gdb) n
    ```

- Dive/Step into the function on the current line
    + Pass 's' to GDB
    ```bash
    (gdb) s
    ```

## Documentations

## Wiki

## Resources

## References
+ [Linux Kernel Documentations - Dev Tools - GDB Kernel Debugging](https://docs.kernel.org/dev-tools/gdb-kernel-debugging.html)
+ [YouTube - Low Level Learning - GDB is REALLY easy! Find Bugs in Your Code with Only A Few Commands](https://www.youtube.com/watch?v=Dq8l1_-QgAc&pp=ygUNZ2RiIGRlYnVnZ2luZw%3D%3D)
+ [YouTube - Nir Lichtman - How to Debug Linux Kernel with GDB](https://www.youtube.com/watch?v=D4k1Q3aHpT8&pp=ygUgaG93IHRvIGRlYnVnIGxpbnV4IGtlcm5lbCBpbiBnZGI%3D)

## Remarks

