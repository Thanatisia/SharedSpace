# gdb - GNU Debugger

## Information

### Description
+ gdb - The GNU Debugger - is a general debugger used to debug compiled programming languages

## Setup
+ Please refer to [gdb/Guides/debugging-basics.md](Docs/Programming/Debugging/Debuggers/gdb/Guides/debugging-basics.md) for a full rundown on the setup and operational workflow

## Documentations

### Synopsis/Syntax
- gdb CLI
    ```bash
    gdb {optionals} <arguments> [compiled-executable]
    ```

- gdb Terminal REPL
    ```bash
    (gdb) [action] {arguments}
    ```

### Parameters
#### gdb CLI
- Positionals
    - compiled-executable : Specify the compiled executable you wish to debug
        + Type: String

- Optionals
    - With Arguments
    - Flags

#### gdb Terminal REPL
- Positionals
    - With Arguments
        - action : Specify an action you wish to take in the GDB debugger server instance
            - Actions
                - target : Attach GDB to a target booted guest
                    - Arguments
                        + `remote :[gdb-server]` : Attach GDB to the target booted remote guest that is listening
        - `break [function_name]` : Sets a regular break point at the function.
            - Notes
                - The break point - when triggered - will give you debug details such as
                    + Function Name
                    + Line Number within the source code
        - `hbreak [function_name]` : Sets a Hardware Break Point at the function. This is used when kernel debugging
            - Notes
                - The break point - when triggered - will give you debug details such as
                    + Function Name
                    + Line Number within the source code
    - Flags
        - `c` : Continue the initialization
        - `n` : Proceed to the next line
        - `s` : Dive/Step into the function on the current line

### Usage

> In GDB

- Attach GDB to a target booted remote guest
    - Explanation
        - gdb-server : Replace this with the port to the GDB server you started up remotely
            + The default port is '1234'
    - Notes
        + While connected, the results shown on the GDB terminal will correspond to the QEMU virtual machine
    ```bash
    (gdb) target remote :[gdb-server]
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

## Wiki

## Resources

## References
+ [Linux Kernel Documentations - Dev Tools - GDB Kernel Debugging](https://docs.kernel.org/dev-tools/gdb-kernel-debugging.html)
+ [YouTube - Low Level Learning - GDB is REALLY easy! Find Bugs in Your Code with Only A Few Commands](https://www.youtube.com/watch?v=Dq8l1_-QgAc&pp=ygUNZ2RiIGRlYnVnZ2luZw%3D%3D)
+ [YouTube - Nir Lichtman - How to Debug Linux Kernel with GDB](https://www.youtube.com/watch?v=D4k1Q3aHpT8&pp=ygUgaG93IHRvIGRlYnVnIGxpbnV4IGtlcm5lbCBpbiBnZGI%3D)

## Remarks

