# Documentation - Programming - Python - Virtual Environments - Setup

Setup of Virtual Environments in Python

## Table of Contents:
- [Information](#information)
- [Steps](#steps)
	- Installing Packages
- [Resources](#resources)

## Information

- Background Info:
	- Package: 
		+ Python 2 : virtualenv
		+ Python 3 : venv

## Steps
- (OPTIONAL) Installing Python Packages
	+ If you are not using python 3
	+ virtualenv is standard library since python3
	- Syntax: 
		+ As Python module : python -m pip install [packages]
		+ Using pip : pip install [packages]
	```console
	pip install virtualenv
	```

- Make a new working directory
	```console
	mkdir python-virtual-environments
	cd python-virtual-environments
	```

- Create new virtual environment
	+ New virtual environment that will isolate all installation like a virtual machine for python
	- Syntax: 
		+ python2 : virtualenv [virtual-environment-workspace-name]
		+ python3 : python3 -m venv [virtual-environment-workspace-name]
	- Note:
		+ By default, this will not include any of your existing site packages
	```console
	python3 -m venv env
	```

- Activate scripts
	- To use this environment's packages/resources in isolation
		+ you need to "activate" it
	- Linux
		+ Syntax: source [virtual-environment-directory]/bin/activate
		```console
		source env/bin/activate
		```

	- Windows
		+ On Windows: virtualenv (venv) creates a batch file called [Scripts\activate.bat]
		+ Syntax: \path\to\env\Scripts\activate.bat
		```console
		env\Scripts\activate.bat
		```

- Deactivate scripts
	+ To go back to the "system" context
	+ Syntax: deactivate
	```console
	deactivate
	```

## Resources:
+ [RealPython - Python Virtual Environments](https://realpython.com/python-virtual-environments-a-primer/)
