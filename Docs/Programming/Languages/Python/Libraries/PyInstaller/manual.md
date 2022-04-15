# Python Library - PyInstaller

Documentation, Guides and general tips n tricks for Python Library - PyInstaller

## Table of Contents
* [Documentation](#documentation)
* [Pre-Requisites](#pre-requisites)
* [Setup](#setup)

## Documentation
```
[NOTE]

This section is still a Work-in-Progress and targets to hold the more important options first.
Thus, do refer to the pyinstaller docs (located in the README.md) if you do not find the parameter you wish to read up on

Thank you!
```

### Synopsis (Syntax)

With script : pyinstaller {options} [script_names...]

With Specfile : pyinstaller [spec-file]

### Parameters

#### Important

* -D | --onedir : Create a one-folder bundle containing an executable (default)
* -F | --onefile : Create a one-file bundled executable
* -n <NAME> | --name <NAME> : Name to assign to the bundled app and spec file (default: first script/main script's basename)
* --specpath <directory> : Folder to store the generated spec file (defaut: current directory)


#### Optionals

* -a | --ascii : Do not include unicode encoding support (default: included if available)
* -h | --help : Show help message
* -v | --version : Show program version
* -y | --noconfirm : Replace output directory (default: SPECPATH/dist/SPECNAME) without asking for confirmation
* --clean : Clean the PyInstaller cache and removes temporary files before building
* --distpath <directory> : Directory to put the bundled app (default : ./dist)
* --log-level <LEVEL> : Amount of detail in build-time console messages. (default: INFO)
	```
	- Level may be one of the following
		* TRACE
		* DEBUG
		* INFO
		* WARN
		* ERROR
		* CRITICAL
	```
* --workpath <directory> : Directory to put all temporary work files - i.e.  .log, .pyz etc. (default: ./build)
* --upx-dir <directory>	 : Path to UPX utility (default: search the execution path)

#### Generating
	
* -D | --onedir : Create a one-folder bundle containing an executable (default)
* -F | --onefile : Create a one-file bundled executable
* --specpath <directory> : Folder to store the generated spec file (defaut: current directory)
* -n <NAME> | --name <NAME> : Name to assign to the bundled app and spec file (default: first script/main script's basename)

### Usage

## Pre-Requisites

* python
* pip

## Setup

### Installation

- Installation

	{python -m} pip install pyinstaller

