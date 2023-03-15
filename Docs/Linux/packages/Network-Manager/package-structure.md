# Package Structure

```
NetworkManager Project Structure, skeleton and basic files
```

### Files
- /etc/NetworkManager/system-connections : Folder containing all network connection files
- /etc/NetworkManager/system-connections/[interface-name].nmconnection : NetworkManager connection file containing your nmcli settings and configurations
- /etc/NetworkManager/NetworkManager.conf : The NetworkManager global configuration file
- /etc/NetworkManager/conf.d              : Place all additional configuration files here
- /etc/Networkmanager/conf.d/dhcp-client.conf : The NetworkManager DHCP configuration file

### Package Commands
+ nmcli : The NetworkManager Command Line Interface utility
+ nmtui : The NetworkManager Terminal User interface (TUI) Utility
+ dhclient : The DHCP client
+ dhcpcd : The DHCP Daemon
