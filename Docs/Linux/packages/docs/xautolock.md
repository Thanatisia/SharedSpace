# Manual: xautolock

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Resources](#resources)

## Information

xautolock - the X AutoLocker utility is used to run the screenlocker after a certain period of time.

## Setup

### Pre-Requisites

### Dependencies

NIL

### Obtaining/Installing

- This is available in your Official Repository
	- Debian-based
		```console
		sudo apt(-get) install xautolock
		```
	- Arch-based
		```console
		sudo pacman -S xautolock
		```

## Documentation

### Synopsis/Syntax

xautolock [{options} [arguments]...]

### Parameters

+ -detectsleep : Detect when system is sleeping
+ -locker [locker-program-path] : Set the locker you want to execute with
+ -notifier "[notification-program_and_arguments]" : Set the notification program as well as its parameters that you want to use to notify (i.e. notify-send)
+ -notify [seconds] : Gives you a N[seconds] notice before it executes the screenlocker; Generally used with '-notifier'
+ -time [minutes] : Execute after a certain amount of time (in Minutes)

```
NOTE:
	- This is not the full variety, this will be updated as I use it more
```

### Usage

+ Execute autolocking if the system is sleeping, every 10 seconds when it is awake using '~/path/to/locker/script" and notify you 30 seconds prior to locking
	```console
	xautolock -detectsleep -time 10 -locker "~/path/to/locker/script" -notify 30 -notifier "notify-send -u critical -t 10000 -- 'LOCKING screen in 30 seconds'" & 
	```

### Notes

## Resources

+ [Documentation](https://linux.die.net/man/1/xautolock)
+ [Automatic Screen Lock and Suspend for Window Managers - Linux Tutorial by msjche](https://www.youtube.com/watch?v=_wcrytoLufA)