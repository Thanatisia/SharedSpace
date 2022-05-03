# Docs - Python Module : argparse

## Table of Contents
- Information
- Submodules
- Resources

## Information

A useful command line argument parsing utility that makes command line management such as 
	+ adding the help menu
	+ optional command line parameters
easier to handle and not have to implement the switch case yourself.

## Setup

### Pre-Requisites

- python
- pip

### Obtaining

python -m pip install argparse

## Documentation

### Module Class

import argparse 

### Functions

#### argparse
+ ArgumentParser() : Initializes the Argument Parser (type <list>) for use

#### ArgumentParser
+ add_argument() : Add Argument
	- Return Type: void
	- Parameters
		- Mandatory
			- "short-option-name",
			- "long-option-name",
		- Optionals
			- action="function_name_here",
			- version="program_version_here"
			- help="Help message here",
			- nargs="none-arguments",
			- type=data_type,
			- default=[default_values_here],

+ parse_args() : Confirm argument parser requirements and proceed to parse the arguments
	- Return Type: dictionary
	- Usage:
		+ Parse Arguments
			```python
			args = parser.parse_args()
			args.[name-of-variable]
			```

### Usage

- General Flow
	```python
	parser = argparse.ArgumentParser()
	args = parser.parse_args()
	if args.[name-of-variable]: # The name of the variable is called like a class variable
		# Statement
	```
	

## Resources
