# Manual: xidlehook

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Resources](#resources)

## Information

xidlehook is designed to be a replacement of xautolock with enhanced features such as 
+ communicating with the Init System for system events like suspending

## Setup

### Pre-Requisites

- You will require the following packages to build from the AUR
	+ git : For git cloning
	+ base-devel : For make, build functions

### Dependencies

NIL

### Obtaining/Installing/Build

- Using Nix Package Manager
	```console
	# In Official Repository
	nix-env -iA nixpkgs.xidlehook

	# Get the latest master
	nix-env -if https://gitlab.com/jD91mZMw2/xidlehook/-/archive/master.tar.gz
	```

- Arch User Repository
	- Manual
		```console
		git clone "https://aur.archlinux.org/packages/xidlehook"
	
		cd xidlehook

		# (Optional) : Check the PKGBUILD
		$EDITOR PKGBUILD
	
		# Compile and Install the PKGBUILD
		makepkg -si
		```
	- AUR Helper
		- yay
			```console
			yay -S xidlehook
			```

## Documentation

### Synopsis/Syntax

xidlehook [{options} [arguments]...] [init-system suspend function here] -

### Parameters

+ --not-when-fullscreen : Does not execute if there's a fullscreen object like videos
+ --timer [seconds] : Execute after a specific time

```
NOTE:
	- This is not the full variety, this will be updated as I use it more
```

### Usage

+ Suspend after 20 minutes BUT do not run when there's a fullscreen object
	```console
	xidlehook --not-when-fullscreen --timer 1200 "systemctl suspend" - 
	```

### Notes

- To suspend with systemd
	```console
	"systemctl suspend"
	```

- Place the dash (-) at the end of the xidlehook command
	- Because the program will try to look for extra input at the end

## Resources

+ [Arch User Repository](https://aur.archlinux.org/packages/xidlehook)
+ [xidlehook GitHub Repo](https://github.com/jD91mZM2/xidlehook)
+ [xidlehook Documentations](https://docs.rs/crate/xidlehook/0.4.8)
+ [Automatic Screen Lock and Suspend for Window Managers - Linux Tutorial by msjche](https://www.youtube.com/watch?v=_wcrytoLufA)