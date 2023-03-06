# Pihole with Unbound via Docker

## Documentation


## Setup

### Pre-Installation/Pre-Requisites
- Please edit the unbound configuration file in 'unbound/unbound.conf.d/pihole.conf'
    - Change your port number if required

### Post-Installation
- Please remember to change your upstream dns server in pihole to point to '127.0.0.1#5335' or whichever port number you have set in the unbound pihole configuration file.

## Resources

## References
+ [Thanatisia - SharedSpace - Unbound setup](https://github.com/Thanatisia/SharedSpace/blob/main/Docs/Linux/Guides/Server/DNS%20Servers/PiHole/Unbound/dns-server-setup.md)

## Remarks