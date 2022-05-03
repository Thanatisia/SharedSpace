# DLNA Media Server

DLNA is a technology that allows you to play a video stream on one DLNA is a technology that allows you to play a video stream on one device from a file stored on another.
Typically, you can play a movie stored on your Raspberry Pi from your smart TV or PS4.

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Remarks](#remarks)
- [Resources](#resources)
- [References](#references)

## Information

### Debian 

Package: 
	+ minidlna : Official Repository

### ArchLinux

Package:

## Setup

#### minidlna

```
MiniDLNA will then scan your folder and make it available from all your compatible devices
```

- Set the shared folder in the configuration file
	```console
	# File: /etc/minidlna.conf
	# Append the following content into the line that starts with 'media_dir='
	: "
	media_dir=A,[shared_folder]
	"

	$EDITOR /etc/minidlna.conf
	```

- Start the service [minidlna]
	```console
	# Using service
	sudo service minidlna start

	# Using systemctl
	sudo systemctl enable minidlna # Enable
	sudo systemctl start minidlna # Start
	```

## Documentation

## Remarks

## Resources

## References
- Raspberry Tips - How to turn a Raspberry Pi into a file server? | https://raspberrytips.com/raspberry-pi-file-server/
