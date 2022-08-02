# Android Debug Bridge (adb) Basics

## Table of Contents
+ [Information](#information)
+ [Setup](#setup)
+ [Variables](#variables)
+ [References](#references)
+ [Resources](#resources)
+ [Remarks](#remarks)

## Information

- Android SDK Commands
	+ [adb](commands/adb.md)
	+ [emulator](commands/emulator.md)

## Setup
### Pre-Requisites
+ Android SDK 
- Enable ADB debugging on your android device
	- (OPTIONAL) Enable Developer Options
		> If Developer Options is hidden
		+ Go to *Settings*
		+ Go to *About Phone*
		+ Tap *Build Number* 7-times
		+ *Developer Options* has been enabled in the previous page

	- Enable USB Debugging
		+ Go to *Developer Options*
		+ Click on *Enable USB Debugging*

	- (OPTIONAL) Enable Wireless Debugging
		> If you are connecting using WiFi
		+ Go to *Developer Options*
		+ Enable *Wireless Debugging*
			- On the "*Allow wireless debugging on this network*" popu
				+ Click Allow

### Dependencies
### Obtaining
- Download *Android SDK Platform-Tools* package with the SDK Manager
	+ [Download the SDK Manager](https://developer.android.com/studio/intro/update#sdk-manager)
	+ Install the *Android SDK Platform-Tools* package to *android_sdk/platform_tools/* directory

- [Download standalone *Android SDK Platform-Tools*](https://developer.android.com/studio/releases/platform-tools)
	
### Final Checks
- Connect your device to the development machine
	+ With USB
	- With WiFi (Hybrid; On Android 10 or lower)
		- Pre-Requisites
			+ Ensure that your workstation and device are connected to the same wireless network
			+ Ensure that your android device is connected via USB : Required for establishing initial TCP/IP Network connection
			- Find your android device's IP address
				- In Settings
					> The following steps are generalised and may be different on your phone
					+ Click on "About Phone"
					+ Click on "Status"
					+ Click on "IP Address"
				- Using Termux (Intermediate to Advanced Users only)
					> The following will require the use of a terminal via the Termux application
					+ (OPTIONAL) Install Termux via GitHub or F-Droid
					- Type *ifconfig* to get your IP Address
						+ Summary : Your IPv4 Address looks like 'W.X.Y.Z'
		- Establishing initial TCP/IP Network Connection
			- (OPTIONAL) If device is not yet connected to the workstation
				+ Connect your android device to the host computer via USB cable
			+ Set the target device to listen for a TCP/IP connection on port 5555
				+ using *tcpip* action
				```console
				adb tcpip 5555
				```
			+ Disconnect the USB cable from the target device
		- Connect to the device by its IP address via the listening port
			```console
			adb connect [device-ip-address]:5555
			```
		- (OPTIONAL) If the adb connection is lost
			+ Ensure that your host is still connected to the same Wi-Fi network as your android device
			+ Reconnect to the android device
				```console
				adb connect [device-ip-address]:5555
				```
			- Alternative
				- Reset your adb host
					- Kill the ADB server
						```console
						adb kill-server
						```
					+ Start over from the beginning
	- With WiFi (On Android 11 or higher)
		- Pre-Requisites
			+ Ensure that your workstation and device are connected to the same wireless network
			+ Ensure that your device is running Android 11 or Higher
			+ Ensure that *Wireless Debugging* is enabled in *Developer Options*
		- Pair your device to your workstation 
			- Connecting via Android Studio
				- Preparation
					+ Click on the *Run configurations* dropdown menu
					+ Select *Pair Devices using Wi-Fi*
				- Connect using QR Code
					- On your android device
						+ Select *Pair device with QR Code*
						+ Scan the QR Code obtained from the *Pair devices over Wi-Fi* popup	
				- Connect using Pairing Code
					- On your Android device
						+ Select *Pair device with Pairing Code*
						+ Take note of the 6-digit PIN code
					- On your development machine
						+ Select *Pair* once your device appears on the *Pair devices over Wi-Fi* popup
						+ Enter the 6-digit PIN code from your android device
		- (OPTIONAL) To Unpair your android device from your workstation
			+ Go to *Wireless Debugging* on your android device
			+ Tap on your workstation's name under *Paired Devices*
			+ Select *Forget*

- Verify the device is connected
	+ If connected : you'll see the device name listed as "device"
	```console
	adb devices
	```

## Variables

### Environment Variables
+ $ANDROID_SERIAL : To contain the serial number

## References
+ [Android Developer Documentations](https://developer.android.com/studio/command-line/adb)

## Resources

## Remarks
