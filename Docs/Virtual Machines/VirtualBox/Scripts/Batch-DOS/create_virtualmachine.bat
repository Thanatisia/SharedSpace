:: Helper Library/Script to Create a VBox Virtual Machine from Command Line
:: ## Requirements
:: 	please run this script with Administrator
:: ## Setup
:: ### Pre-Requisites
:: - Your Bootable USB's drive letter Drive Letter
::	- Open Run / Search fr 'diskmgmt.msc' or Disk/Partition Management
::	- Scroll down onto your drive/disk
::		- Note down the
::			- Disk Number
::			- Partition Number
:: - Your created Bootable USB's VMDK Raw File
::	- If is not created, system will run 'convert_usb_to_vmdk.bat'
:: ## Resources
:: - https://andreafortuna.org/2019/10/24/how-to-create-a-virtualbox-vm-from-command-line/
@echo off
SETLOCAL EnableDelayedExpansion

:: --- Environment Variables
:: Append Program paths to System paths
SET PATH=%PATH%;Oracle/VirtualBox

:: --- Command Line Arguments
SET vm_name=%~1
SET os_type=%~2
SET base_folder_path=%~3
SET memory_ram=%~4
SET VMDK_raw_file_path=%~5

:: --- Processing : Data Validation
IF "%vm_name%" == "" (
	SET /p vm_name=Virtual Machine Name: 
)

IF "%os_type%" == "" (
	SET /p os_type=Operating System Type (Debian_64|Windows_10 etc): 
)

IF "%base_folder_path%" == "" (
	SET /p base_folder_path="Base Folder Path (Windows: %CD% or Linux: $PWD): "
)

IF "%memory_ram%" == "" (
	SET /p memory_ram=Memory ^(RAM^): 
)

IF "%VMDK_raw_file_path%" == "" (
	SET /p VMDK_raw_file_path=VMDK Raw File Path: 
)

:: --- Program Variables
SET PROG_PATH=VirtualBox
SET PROG_NAME=VBoxManage.exe
SET PROG_PARAMS=
SET PROG_RUN=%PROG_PATH%/%PROG_NAME%

:: --- Body
IF NOT "%vm_name%" == "" (
	IF NOT "%os_type%" == "" (
		IF NOT "%base_folder_path%" == "" (
			echo System Path : %PATH%

			# Create a Virtual Machine		
			VBoxManage createvm --name %vm_name% --ostype %os_type% --register --basefolder %base_folder_path%

			# Modify Virtual Machine
			VBoxManage modifyvm %vm_name% --memory %memory_ram%
		) ELSE (
			echo Base Folder not specified
		)
	) ELSE (
		echo OS Type not specified
	)
) ELSE (
	echo Virtual Machine name not specified
)

:: --- Footer
pause