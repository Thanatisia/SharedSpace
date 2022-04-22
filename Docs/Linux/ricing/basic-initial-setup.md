# Documentation - Linux - Basic Initial Setup

Essential steps/todos after installing

## Table of Contents:
- [Steps](#steps)
- [Resources](#resoruces)

## Steps
- [Setup sudo](#setup-sudo)
- [Create user account](#create-user-account)
- [Setup Swapfile](#setup-swapfile)
- [Update & Upgrade Packages](#update-upgrade-packages)
- [Download essential packages](#download-essential-packages)
- [Setup Dotfiles](#setup-dotfiles)

## Explanation

### Setup sudo

### Create user account

- Create user and add to group
	```
	useradd -m -g wheel -G [other-groups-here] -d "/path/to/home/directory" [username]
	```
- Create Password for user
	```
	passwd [username]
	```

- Verify User
	```
	su - [username]

	sudo whoami

	> Enter Password

	-Result should be root-
	```

### Setup Swapfile

- Create new swapfile
	```
	fallocate -l [size] /swapfile
	```

- Change Permissions to [600] 
	```
	chmod 600 /swapfile
	```

- Format Swapfile
	```
	mkswap /swapfile
	```

- Enable swapfile
	```
	swapon /swapfile
	```

- Write to swapfile
	```
	echo "/swapfile" | sudo tee -a /etc/fstab
	echo "/swapfile swap defaults 0 0" | sudo tee -a /etc/fstab
	```

### Update & Upgrade Packages

### Download essential packages

- List of essential (in my opinion) packages to start
	```
	This is assuming you have not installed these during initial installation and/or is not included

	- You may refer to the list of packages to download [here](https://github.com/Thanatisia/SharedSpace/Docs/Linux/Files/packages-masterlist.md)
	```
	System Monitor | htop 
	Text Editor | vim
	Version Control | git

### Setup Dotfiles

- .bash_profile
- .bashrc
- .xinitrc


## Resources

- Read more about PostInstallation Setup guides in my [Linux PostInstallation Guides Repository](https://github.com/Thanatisia/linux-postinstallations)

