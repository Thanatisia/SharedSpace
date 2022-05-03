Linux Full Post-Installation Guide MasterList

A Compiled Write-up/Documentation of everything you should do after your base installation for a everyday working Linux Desktop, and indeed - a working Linux Build.

## Table of Contents
- [Information](#information)
	- [Components](#components)
	- [Planning](#planning)
- [Installation](#installation)
	- [Display Server](#display-server)
	- [(Optional) Display Manager aka Login Managers](#display-manager-aka-login-managers)
	- [Graphical Environment](#graphical-environment)
	- [Daemons](#daemons)
- [Setup](#setup)
	- Essentials
		- User Management
		- Swapfile
	- System
		- Audio
- [Customization](#customization)
	- [Fonts](#fonts)
	- [Cursor](#cursor)
	- [Themes](#themes)
- [Footer](#footer)
	- [Remarks](#remarks)
	- [Resources](#resources)
	- [References](#references)

## Information

This is a compiled write-up/documentation of everything that I think you should do after your base installation, including (common) steps used by other people and by other installation guides.

The aim of this list/documentation is to note down a full structure of what the user (i.e. you, the reader) should/must do after a base installation of any Linux Distro.

This is applicable to not just ArchLinux or Gentoo (which lets you build your own system), it applies to Debian or any other pre-designed Linux Distributions as well!

I hope this helps you as much as I hope this will be useful to me during my reinstallation and/or development lifecycle.

### Components
- Graphical Environment

### Planning
```
Use this template as a planner document that you can edit, and backup to refer back if you are reinstalling, 
or moving to another build
```


## Installation

### Display Server

- Options:
	- XOrg (X11)
		+ xorg
		+ xorg-xinit | for startx and xinit capabilities
	- Wayland

### (Optional) Display Manager aka Login Managers

+ lightdm
+ gddm
+ sdm

### Graphical Environment

- Window Managers
	- Dynamic
		+ awesomeWM
		+ qtile
	- Floating
		+ berry
	- Tiling (Manual)
		+ i3
		+ bspwm
		+ herbstluftwm
		+ ratpoison
		+ openbox

- Desktop Environments
	+ GNOME
	+ KDE
	+ XFCE

### Daemons

- Notification Daemons
	+ dunst

- Media Daemons
	+ mpd

## Setup

### Essentials

#### User Management

```console
# Create a user, with a home directory and add it into groups
useradd -m -g [primary_group] -G [secondary_groups,...] -d [home_directory] {other_parameters} username

# Set a user password
passwd username

# Verify user
su - username	# Switch user to the newly created user
sudo whoami	# Result should be 'root'
```

#### Swapfile

```console
# Generate a swapfile of a certain size (x)KiB|MiB|GiB
# You can use dd as well
fallocate -l {size}GiB /swapfile

# Change Permission to allow execution
chmod +x 600 /swapfile

# Format Swapfile for Use
mkswap /swapfile

# Enable Swapfile
swapon /swapfile

# Add to /etc/fstab for persistency (Load swapfile on startup)
echo "/swapfile" | sudo tee -a /etc/fstab
echo "/swapfile swap default 0 0" | sudo tee -a /etc/fstab
```

### System

#### Audio

#### Bluetooth

## Customization

### Fonts

### Cursor

### Themes
```
Modifying GTK Theme
```

### Ricing Installation

#### Status Bars
+ polybar
+ lemonbar | I recommend the lemonbar-xft fork instead for XFT (Font Icon and Font Support)

#### Compositors
+ picom

#### System Monitor
+ conky

## Footer

### Remarks
- Feel free to contact me if you have any ideas, encountered any issues, any suggestions that you think should be in here, or just would like to talk! I am all ears.

### Resources

### References
- 