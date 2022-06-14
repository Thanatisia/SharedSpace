:: Helper Library/Script to convert Bootable USB to VMDK for use when booting with VBoxManage on the Command Line
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
:: ## Resources
:: - https://www.how2shout.com/how-to/virtualbox-virtual-machine-boot-usb.html
@echo off
SETLOCAL EnableDelayedExpansion

:: --- Environment Variables
:: Append Program paths to System paths
SET PATH=%PATH%;Oracle/VirtualBox

:: --- Command Line Arguments
SET VMDK_out_filepath=%~1
SET drive_number=%~2

:: --- Processing : Data Validation
IF "%VMDK_out_filepath%" == "" (
	SET /p VMDK_out_filepath=VMDK Raw File Output Path: 
)

IF "%drive_number%" == "" (
	SET /p drive_number=Bootable USB Drive Number: 
)

:: --- Program Variables
SET PROG_PATH=VirtualBox
SET PROG_NAME=VBoxManage.exe
SET PROG_PARAMS=internalcommands createrawvmdk -filename %VMDK_out_filepath% -rawdisk \\.\PhysicalDrive%drive_number%
SET PROG_RUN=%PROG_PATH%/%PROG_NAME%

:: --- Body
IF NOT "%drive_number%" == "" (
	IF NOT "%VMDK_out_filepath%" == "" (
		echo System Path : %PATH%
		echo Running Program : "%PROG_RUN%"

		"%PROG_RUN%" %PROG_PARAMS% && (
			echo Program Ran successfully.
		) || (
			echo Error running program.
		)
	) ELSE (
		echo VMDK Raw File Output Path not specified
	)
) ELSE (
	echo Drive Number not specified
)

:: Create USB vmdk (Virtual Machine Disk Raw File)
::	- To map a Virtual Machine to the USB Drive (.vmdk file)
::		- The vmdk raw file will hold the path of the bootable USB drive for VirtualBox
::		- Helps VirtualBox to recognize the USB drive as a normal Virtual Disk Drive
::	Syntax: VBoxManage internalcommands createrawvmdk -filename [path-to-vmdk-file-to-create] -rawdisk \\.\PhysicalDrive[drive_number]
:: VBoxManage internalcommands createrawvmdk -filename [path-to-vmdk-file-to-create] -rawdisk \\.\PhysicalDrive[drive_number]

:: --- Footer
pause