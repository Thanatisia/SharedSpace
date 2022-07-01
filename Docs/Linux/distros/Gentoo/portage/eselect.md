# Gentoo portage Docs - eselect

Documentation, Guides, Tips n Tricks for Gentoo's package manager portage - Command : eselect

[Basics]

## Table of Contents
- [Information](#information)
- [Documentation](#documentation)

## Information

+ eselect is a config or a selector utility for various information such as locales, update news etc.

## Documentation

### Synopsis (Syntax)

(sudo) eselect [action] [parameters]

### Parameters

#### Actions
- kernel
	+ list : List all avilable kernel symlink targets
	+ set [option] : Set a kerrnel to link
- locale
	+ list  : List all available locale targets
	+ set n : Set and select correct locale
- news
	+ list : List all news

### Usage

+ News
	```console
	# List all news to read
	eselect news list : List all news
	```
