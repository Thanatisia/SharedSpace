# Gentoo portage Docs

Documentation, Guides, Tips n Tricks for Gentoo's package manager portage

[Basics]

## Table of Contents
- [Information](#information)
- [Documentation](#documentation)

## Information

Portage's commands generally start with the prefix 'e' before every action.
For example
+ emerge : To merge (aka install) packages

### Dependencies

+ /etc/portage/make.conf : The make configuration file, portage will use variables in this (especially USE=) to compile the merged packages

## Documentation

### Synopsis (Syntax)

+ [To Install packages](emerge.md) : (sudo) emerge {parameters} [package-name]
+ [To select](eselect.md) : (sudo) eselect [{action} {options}]
