# Winget Package Manager

```
Winget is Microsoft Windows' Package Management System.

A package manager is an application that streamlines the handling of packages from the command line/terminal
with the capability to
- install packages,
- update installed packages 
- remove installed packages
```

## Table of Contents
+ [Information](#information)
+ [Setup](#setup)
+ [Documentation](#documentation)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Information

## Setup
### Pre-Requisites
### Dependencies
### Installing
- Windows 11
	+ Winget is bundled with Windows 11

- Modern Versions of Window 10
	+ is bundled by default as the App Installer

- If you are running an earlier version of Windows and the App Installer aka Winget
	+ Install the [*App Installer*](https://apps.microsoft.com/store/detail/app-installer/9NBLGGH4NNS1?hl=en-sg&gl=SG) package from the Microsoft Store

## Documentation

### Synopsis/Syntax

```dosbatch
winget {options} {action} {arguments...}
```

### Parameters
#### Important
+ install [package-name] : Install the specified package
+ search [application/package-name] : Search for a specific package; Leave the package-name empty to search for all
+ show [package-name] : Show information about the specified package
+ list [{options} [arguments]...] : List all installed packages
	- Arguments
		+ -q | --query : The query used to search for an application
		+ -? | --help : Get additional help for *winget list*
	- Options
		+ --id 						: Limits the list to the ID of the application
		+ --name 					: Limits the list to the name of the application
		+ --moniker 					: Limits the list to the moniker/alias of the application
		+ -n [limit-size] | --count [limit-size] 	: Limits the number of apps displays in one query
		+ -e [string] | --exact [string] 		: Limits the exact string in the list query, including checking for case-sensitivity. Will not use the default behaviour of a substring
		+ -s [source-name] | --source [source-name] 	: Restricts the list to the source name specified. Must be followed by the source name
		+ --tags [tags...] 				: Filter results by the tags
		+ --command [command] 				: Filter results by the command specified by the application
		+ --accept-source-agreements 			: Used to accept the source license agreement, and avoid the prompt.
		+ --header 					: Optional Windows-Package-Manager REST source HTTP header.
		+ --verbose-logs				: Used to override the logging setting and create a verbose log
+ upgrade [package-name] : Upgrades the specified package
+ uninstall [package-name] : Uninstalls and removes the specified package
+ export {options} [arguments...] : Exports a list of all installed packages for backup and recovery
	- Arguments
		+ -o [output-file-name] | --output [output-file-name] : Specify the output file to write the result
	- Options
		+ -s | --source : Export packages from the specified source
		+ --accept-source-agreements : Used to accept the source license agreement automatically and avoid the prompt
		+ --include-versions : Include package versions in the output file
		+ --verbose-logs : Override the logging settings and force create a verbose log
+ import [file-name] : Imports a list of installed packages list and installs all the packages in the provided file 
#### Helpers
+ settings : Opens settings
+ features : Shows the status of experimental features
+ hash [package-name] : Hash an installer file
+ validate [package-name] : Verify and check that the package name is valid by checking the Manifest file
+ -v | --version : Displays the current system version of winget
+ --info : Displays detailed information on winget; Includes: links to the license, privacy statement and configured group policies
+ -? | --help : Shows additional help for winget

### Usage

- List
	- By Name
		```batchdos
		winget list -name git
		```
	- By ID from a specific source
		```batchdos
		winget cli --id Git.Git --source winget
		```

	- Limits the standard output to 9 applications
		```batchdos
		winget cli -n 9
		```

- Export
	```batchdos
	winget export -o %CD%\myfiles.json
	```

## Customization/Configuration
### JSON Schema
- Keys
	+ Sources : The sources that the application manifests comes from
	+ Packages : The collection of packages to install
	+ PackageIdentifier : The Winget Package Manager package identifier used to specify the package
	+ Version : (OPTIONAL) The specific version of the package to install

## Resources
+ [Microsoft Documentation - Winget](https://docs.microsoft.com/en-us/windows/package-manager/winget/)
+ [Microsoft Documentation - Winget Package Manager JSON Schema Examples](https://raw.githubusercontent.com/microsoft/winget-cli/master/schemas/JSON/packages/packages.schema.1.0.json)
+ [Microsoft Documentation - Winget - List](https://docs.microsoft.com/en-us/windows/package-manager/winget/list)

## References

## Remarks