# Documentation - AUR Helpers - Yay

Documentations, Guides, Tips n Tricks for the YAY AUR Helper

## Table of Contents
- [Setup](#setup)
- [Documentation](#documentation)
- [References](#references)

## Setup

### Pre-Requisites

- Packages
	```
	- git
	- base-devel
	```
	sudo pacman -S --needed git base-devel

### Installation

- Clone the repository
	```
	git clone https://aur.archlinux.org/yay.git
	```

- Change Directory into the folder
	```
	cd yay
	```

- Make Package
	```
	Syntax: makepkg {options}
	Parameters:
		-s : Sync Dependencies (Install missing dependencies using pacman)
		-i : Install

	makepkg -si
	```

## Documentation

### Synopsis

yay {options, <arguments>} [package_name]

### Parameters

\-G : Download PKGBUILD from Arch Build System (ABS) or Arch User Repository (AUR)
\-S : Install AUR Package
\-y : Download AUR Package updates
\-u : Upgrade AUR Package with downloaded updates

### Usage

## References

- [yay GitHub Repo](https://github.com/Jguer/yay)
- [AUR Repos - yay](https://aur.archlinux.org/packages/yay/)