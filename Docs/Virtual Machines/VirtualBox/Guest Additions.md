# --- VirtualBox Guest Additions

## Table of Contents
- [Services](#services)
- [Install VirtualBox Guest Additions](#install-virtualbox-guest-additions)
    - [Linux](#linux)

## Services

[Operating System: Linux]
1. Install the following packages (the naming may defer)
	virtualbox-guest-utils (For VBox service)
2. Run vboxservice.service
	sudo systemctl start virtualbox-guest-utils (Temporary)
	sudo systemctl enable virtualbox-guest-utils (Automatic startup)


## Install VirtualBox Guest Additions

### Linux
- Update and Upgrade Repository to latest version
	- If Package Manager is Apt
		```console
		sudo apt update && sudo apt upgrade
		```
	- If Package Manager is Pacman
		```console
		sudo pacman -Syu
		```

- Install Dependencies
	+ gcc
	+ make
	+ perl
	- If Package Manager is Apt
		```console
		sudo apt install gcc make perl
		```
	- If Package Manager is Pacman
		```console
		sudo pacman -S gcc make perl
		```

- Run VBox Guest Additions Installer
	```console
	cd /media/[your_username (Default: $USER)]/VBox_GAs_6.1.32
	sudo ./VBoxLinuxAdditions.run
	```

- Add current user to group 'vboxsf' to have permission to traverse shared folder
	```console
	sudo usermod -a -G vboxsf [your_username (Default: $USER)]
	```

- Restart your computer
	```console
	sudo reboot now
	```

