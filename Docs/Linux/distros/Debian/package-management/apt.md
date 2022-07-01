# Gentoo portage Docs - apt

Documentation, Guides, Tips n Tricks for one of Debian's package manager apt

[Basics]

## Table of Contents
- [Information](#information)
- [Documentation](#documentation)

## Information

apt is one of Debian's package managers, as well as apt-get and dpkg

## Documentation

### Synopsis (Syntax)

sudo apt [{options} [arguments]...]

### Parameters

+ install [package] : To install a package
+ remove [package] : To uninstall a package
+ update : To get package updates
+ upgrade : To start the package upgrades

### Usage

+ System Update and Upgrade
	```console
	sudo apt update && sudo apt upgrade
	```

+ To Install a package
	```console
	sudo apt install [package-name]
	```

+ To Uninstall a package
	```console
	sudo apt remove [package-name]
	```

