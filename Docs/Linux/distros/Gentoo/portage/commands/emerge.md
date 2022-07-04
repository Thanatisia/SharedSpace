# Gentoo portage Docs - emerge

Documentation, Guides, Tips n Tricks for Gentoo's package manager portage - Command : emerge

[Basics]

## Table of Contents
- [Information](#information)
- [Documentation](#documentation)

## Information

emerge is basically the 'install' command, the name is based on the prefix 'e' that portage generally starts with + 'merge'.
Gentoo portage 'merges' packages to install them.

- Portage reads and depends on the file '/etc/portage/make.conf' for make settings to apply
	- you need to modify /etc/portage/make.conf before install
		+ specifically the 'USE=' variable
	+ portage 'emerge' will apply the default if it doesnt see any modifications to the 'USE=' variable

### Explanation

+ emerge will check /etc/portage/make.conf for make settings

## Documentation

### Synopsis (Syntax)

(sudo) emerge {parameters} [package-name]

### Parameters

+ --ask : Do not autoinstall and asks user for confirmation

### Usage

+  Basic
	```console
	# Install vim
	emerge --ask vim
	```

