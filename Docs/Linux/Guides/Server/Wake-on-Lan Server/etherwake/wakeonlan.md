# Linux package [Etherwake] command - wakeonlan

## Documentations

### Synopsis/Syntax
```console
sudo wakeonlan {options} <arguments> [target-MAC-address]
```

### Parameters

- Positional Arguments
    - target-MAC-address : The MAC address of the target PC you want to wake up using the server
        + Value : The MAC address hexadecimal
        + Type : String

- Optional Arguments
    - With Arguments
        + -f [file-name] : Specify the file path and name of the Wake-on-LAN configuration file containing all your target machines to wake up
        + -i [ip-address] : Specify the target input IP address belonging to the MAC address to send magic packets
        + -p [PORT] : Specify the target port number to use
    - Flags
        + -D : Send WoL Magic Packets with Increased Debug Level (verbose)

### Usage
- Send WoL Magic Packets
    ```console
    wakeonlan [MAC-address-here]
    ```
- Send WoL Magic Packets with Increased Debug Level (verbose)
    ```console
    wakeonlan -D [MAC-address-here]
    ```

- Set target device's IP address to wake PC up with Magic Packet
    ```console
    sudo wakeonlan -i [ip-address] [target-MAC-address]
    ```

- Set target Port number to use
    ```console
    sudo wakeonlan -i [ip-address] -p [PORT] [target-MAC-address]
    ```

- Use a file as source of target hardware (MAC) and IP addresses
    ```console
    wakeonlan -f [wake-on-lan-config-file] [target-MAC-address]
    ```

## Wiki

### Configurations
- Wake-on-LAN configuration file
    - If you are using the `-f` parameter
        + You can refer to the template configuration file skeleton [here](config/wol.template)
        + You can name the configuration file anything

