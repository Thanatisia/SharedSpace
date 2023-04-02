# Linux - etherwake

## Documentations

### Synopsis/Syntax
- Debian-based
    ```console
    sudo etherwake {options} <arguments> [target-MAC-address]
    ```
- Fedora-based
    ```console
    sudo ether-wake {options} <arguments> [target-MAC-address]
    ```

### Parameters

- Positional Arguments
    - target-MAC-address : The MAC address of the target PC you want to wake up using the server
        + Value : The MAC address hexadecimal
        + Type : String

- Optional Arguments
    - With Arguments
        + -i [ethernet-interface] : Specify the ethernet interface to send the magic packets through
    - Flags
        + -D : Send WoL Magic Packets with Increased Debug Level (verbose)

### Usage
- etherwake
        - Send WoL Magic Packets
        ```console
        etherwake [MAC-address-here]
        ```
- Send WoL Magic Packets with Increased Debug Level (verbose)
        ```console
        etherwake -D [MAC-address-here]
        ```

- Set command to wake PC up with Magic Packet
    ```console
    sudo etherwake -i [ethernet-interface] [target-MAC-address]
    ```
