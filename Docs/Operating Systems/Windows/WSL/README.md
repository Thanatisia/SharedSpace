# Windows Subsystem for Linux

> A linux subsystem/compatibility layer that allows Linux applications and commands to be ran on Windows

## Table of Contents
+ [Information](#information)
+ [Setup](#setup)
+ [Documentation](#documentation)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Information
+ Name : Windows Subsystem for Linux
+ Feature : Microsoft-Windows-Subsystem-Linux

### Features
- Sharing Windows/Linux Resources
	- WSL can seamlessly share Windows and Linux resources with each other
		> You can share features such as
		+ Filesystems
		+ Environment Variables
		+ Network Resources
		+ Command Line Tools
	+ The Windows 10 Filesystem is mounted a a directory in Linux while
	+ The Linux Filesystem will be mounted as a folder in Windows

## Setup
### Pre-Requisites
+ Windows 10 64-bit Build 18917 or later

### Dependencies

### Enabling the WSL Feature
> WSL does not require downloading as it is a single windows feature
- From Windows
	+ Open *Window Features*
	+ Search for *Windows Subsystem for Linux*
	+ Restart Computer
- Using Powershell
	- Enable feature
		```powershell
		Enable-WindowOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
		```
	+ Restart computer

## Documentation

### Synopsis/Syntax

```batchdos
wsl {options} [arguments...]
```

### Parameters

#### Arguments
+ — 									: Passes anything after this parameter to default shell; Leaving the operator out will also work
+ -d [distribution-name] | distribution [distribution-name]		: Opens a terminal in the specified distribution's shell
+ -e [[command] {arguments}...] | exec [[command] {arguments}...] 	: Run command without using the default shell
+ -u [username] | user [username]					: Runs the WSL command as the specified user as long as user exists on that distro; Like sudo su
+ --set-version [distribution] [version-number] 			: Set a specific version to a specified distribution
#### Helpers
+ -l {options} | --list {options}					: List which versions of Linux you have installed
	- Options
		+ -all	: List all installed WSL distributions
		+ -running : List only currently running WSL distributions
		+ -q | --quiet : Show only WSL distribution names
		+ -v | --verbose 							: Display verbose and detailed standard output
#### Backup and Recovery
+ -export [distribution] [output-file-path]				: Exports the specific distribution filesystem to a tar file on your local system
+ -import {options} [file-name] [wsl-distribution-path] [distribution-tar-file]	: Imports a tar file as a new WSL distribution
	- Options
		+ -version [version-number] : Specify WSL version for the distribution
#### Settings
+ -s [distribution-id] | set-default [distribution-id]			: Sets the specified WSL distribution as the default distribution for all WSL commands
+ -set-default-version [version-number]					: Changs the default WSL version for all new distributions installed to that system to the specified version number
+ -set-version [distribution-id] [version-number]			: Changes the WSL version of the specified distribution to the specific version number
#### Controls
+ -shutdown								: Shutdown and terminates all running WSL distributions
+ -t [distribution-id] | -terminate [distribution-id]			: Terminates the specified WSL distribution
+ -unregister [distribution-id]						: Unregister and deletes the specified WSL distribution
#### Optionals
+ -h | --help								: Displays information about WSL

### Usage

#### Setting WSL Version
- Using Powershell
	- List which versions of Linux you have installed
		```powershell
		wsl {-l | --list}
		```
	- Run a specific distribution with your version of choice
		+ Use version 2
		```powershell
		wsl --set-version [distribution] 2
		```
	- Confirm the change was successful
		```powershell
		wsl {-l|--list} {-v|--verbose}
		```

## Customization/Configuration
- To install a distribution
	+ Open Microsoft Store
	+ Search for *WSL*

### Environment Variables
#### Sharing Filesystems
- WSL Ubuntu Linux
	+ UBUNTU_HOME : Points to the Linux */home/ubuntu* directory in both Windows and WSL Ubuntu

## Resources

## References
+ [Adam the Automator - Windows Subsystem for Linux](https://adamtheautomator.com/windows-subsystem-for-linux/)

## Remarks