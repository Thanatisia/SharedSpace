# Documentation - Declare

## Table of Contents
* [Information](#information)
* [Setup](#setup)
* [Documentation](#documentation)
* [Remarks](#remarks)

## Background

## Setup

### Pre-Requisites

### Installing

## Documentation

### Synopsis/Syntax

declare {options} var_name="values"

### Parameters

-A : To declare an associative array
-g : To declare and global variables from within a function

### Usage

- Creating Array/List
	```sh
	declare arr=(
		values
	)
	```

- Creating Key-Value Array (Associative Array/HashMap/Dictionary) (Local)
	```sh
	declare -A aarr=(
		[key]=value
	)
	```

- Creating a global variable (using Associative Array) in function
	```sh
	func_name()
	{
		declare -gA aarr=(
			[key]="value"
		)
	}

	func_name

	echo -e "${aarr[@]}"
	```

## Remarks

### Design Documents



### Resources
+ [StackOverflow - Associative Arrays are local by default](https://stackoverflow.com/questions/10806357/associative-arrays-are-local-by-default)

