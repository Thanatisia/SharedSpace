# Ethical Hacking - Remote Connection/Access

## Information

## Methods
### Bind Shell
#### Pre-Requisites
+ IP Address of the victim to access the target

#### DESCRIPTION
```
In a Bind shell, an 'attacker' will launch a service on the victim/target's computer.
	- Through which, the attacker will be able to connect to the victim/target's computer

- A Bind shell is another name for a typical Attacker -> Target remote access/connection setup.
```

#### Characteristics
+ The listener is on the target machine, The attacker connects to the target machine directly


### Reverse Shell
#### Pre-Requisites
+ Target execute a payload that connects to your listener

#### DESCRIPTION
```
The Reverse of a Bind Shell (typical attacker to victim remote access).

- In a bind shell, an attacker connects to the target/victim's computer and executes commands on the target's computer after gaining access
- In a reverse shell however, the attacker will start a listener/server on the computer, waiting for a victim (client) to trigger a payload that will connect to the attacker's listener
	+ afterwhich, the attacker will gain access to the shell of the target computer
```

#### Charcteristics
+ The listener is on the attacker's machine, The victim/target connects to the attacker's machine

#### Flow
- Preparations
	+ The attacker must first start the server on his machine as a listener
	+ The victim/target will act as a client that connects to the attacker's server
	- The attacker will distribute a malware to the attacker/victim via various methods
		- The victim/target will execute the payload within the malware
			+ The payload will connect to the attacker's server that is listening for connections
		- After the successful connection
			+ The attacker will gain access to the shell of the target computer

## Structure
- Bind Shell
	- Firewall is blocking most Inbound/Incoming connections from the outside
		+ May block incoming connections from you
	```
	     ------------------ * [Attacker]
	     |
	     | Incoming connection
	     |  from attacker to target
	     |
	-----|---
	     V  |
	Home	|
	Network	| Firewall
	(Victim)|
		|
	---------
	```

- Reverse Shell
	- Firewall is not blocking connections going out
		+ The internal network is trusted
	- Because the target/victim is leaving the firewall from the internal network to the public network
		+ Similar to the idea that the target/victim is connecting to any www website in the open web
		+ The connection shouldnt be blocked
	```
	     ------------------> * [Attacker] (Listener/Server)
	     |
	     | Outgoing connection
	     |  from target to attacker
	     |
	-----|---
	     |  |
	Home	|
	Network	| Firewall
	(Victim)|
		|
	---------
	```

## References
+ [YouTube | NetworkChuck | how to get remote access to your hacking targets // reverse shells with netcat (Windows and Linux!!)](https://www.youtube.com/watch?v=bXCeFPNWjsM)

## Resources
+ [GeeksforGeeks - Difference between bind shell and reverse shell](https://www.geeksforgeeks.org/difference-between-bind-shell-and-reverse-shell/)

## Remarks
