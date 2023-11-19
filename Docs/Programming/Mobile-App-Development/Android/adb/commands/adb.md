# Android Debug Bridge (adb) utility

## Table of Contents
+ [Information](#information)
+ [Documentation](#documentation)
+ [References](#references)
+ [Resources](#resources)
+ [Remarks](#remarks)

## Information
- Filepaths
	+ Internal (Public) Storage : /sdcard/

## Documentation

### Synopsis/Syntax

```console
adb {options [arguments...]} { shell [shell_command] | adb_command | [action] [arguments...] }
```

### Parameters

#### Actions
+ connect [device-ip-address]:[port-number] 			: Connect to the specified device by its IP address through the specified port
+ devices {options} 						: List connected devices
	- Options
		+ -l : Specify what the device is
+ forward [protocol:host-port] [protocol:destination-port] 	: To set up port forwarding which forwards requests on a specific host port to a different port on a device
+ install {options} [apk-name] 					: Install an apk file to the connected device
	- Options
		+ -t : When installing a test APK
+ kill-server 							: Terminate and stop your adb host
+ logcat                                                        : To view log messages in real time and monitor your application's log output and debug it
+ pull [remote-filepath] [local-filepath]			: To copy file(s) or folder(s) from the connected device to the local host
+ push [local-filepath] [remote-filepath]			: To copy file(s) or folder(s) from the local host to the connected device
+ start-server 							: Start your adb host
+ tcpip {port-number} 						: Set the target device to listen for a TCP/IP connection on the specified port

#### ADB Commands

#### Shell Commands
+ am [action] {options} {arguments...} : Call Activity Manager (am) to perform various system actions such as [*Start an Activity*, *Start an Intent*, Force-stop a process*, *Broadcast an Intent*, *Modify the device screen properties* etc.]
	- Actions
		+ start {options} [intent]
			- Options
				+ -a [intent] : Start an *Activity* requiring the specified *indent*
				+ -D : Enable Debugging
				+ -P [output-file] : Similar to *--start-profiler* but profiling stops when the app goes idle
				+ -R [count] : Repeat the activity launch *count* times; Prior to each repeat - the top activity will be *finished (closed)*
				+ -S : Force stop the target app before starting the activity
				+ -W : Wait for launch to complete
				+ --opengl-trace : Enable tracing of OpenGL functions
				+ --user [user_id] | current : Specify which user to run as. (DEFAULT) If not specified, run as the current user
				+ --start-profiler [output-file] : Start profiler and send results to *output-file*

```
To Be Continued
```

#### Options
+ -d [hardware-device] 	: Send commands to the hardware device; If there are multiple devices but only one hardware device attached
+ -e [emulator] 	: Specify the emulator you want to send commands to; If there are multiple devices but only one emulator
+ -s [serial-number] 	: Specify the serial number of the target device; Used when multiple targets are running to identify a target device; Find the serial number of the target device using *adb devices*; Overrides environment variable $ANDROID_SERIAL
+ --help 		: Display detailed list of all supported ADB commands

### Usage
- Setup Port Forwarding
	+ Port Forwarding TCP/IP Source Port 6100 to TCP/IP Destination Port 7100
		```console
		adb forward tcp:6100 tcp:7100
		```
	+ Port Forwarding TCP/IP Source Port 6100 to local:logd
		```console
		adb forward tcp:6100 local:logd
		```

- Copying Files to and from a connected device
	- Copy file(s) or folder(s) from the connected device to the local host
		```console
		adb pull /sdcard/file.txt file.txt
		```
	- Copy file(s) or folder(s) from the local host to the connected device
		```console
		adb pull file.txt /sdcard/file.txt
		```

- Start an interactive shell on a device
	```console
	adb [-d | -e | -s serial_number] shell
	```

- To view log messages in real time
    ```console
    adb logcat
    ```

## References
+ [Android Developer Documentations - adb](https://developer.android.com/studio/command-line/adb)

## Resources
+ [Android Developer Documentation - Build and run](https://developer.android.com/studio/run)

## Remarks
