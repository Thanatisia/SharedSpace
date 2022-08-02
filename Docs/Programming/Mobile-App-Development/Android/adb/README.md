# Android Debug Bridge

```
The ADB - also known as the Android Debug Bridge - is a command line utility that allows you to communicate with your android device.

The adb allows a variety of device actions such as
	+ Installing applications
	+ Debugging applications
	
The adb also provides access to a UNIX shell that allows you to run various commands on the device.
```

## Information

- Components
	> The adb is a client-server application that has 3 components
	+ Client : Sends commands to the server
	+ Daemon : The adbd (Android Debug Bridge Daemon); Runs commands on the connected device; The daemon runs as a background process
	+ Server : Manages the communication betwee the client and the daemon; The server runs as a background process on your development machine

+ Package : Android SDK Platform-Tools

## Files
+ [Basics](basics.md)

