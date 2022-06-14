:: Launcher Script to run Bootable USB in VirtualBox
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
:: - https://www.how2shout.com/how-to/virtualbox-virtual-machine-boot-usb.html
@echo off
SETLOCAL EnableDelayedExpansion

:: --- Environment Variables
:: Append Program paths to System paths
SET PATH=%PATH%;Oracle/VirtualBox

:: --- Command Line Arguments
SET VMDK_raw_file_path=%~1
SET drive_number=%~2

:: --- Processing : Data Validation
IF "%VMDK_raw_file_path%" == "" (
	SET /p VMDK_raw_file_path=VMDK Raw File Path: 
)

IF "%drive_number%" == "" (
	SET /p drive_number=Bootable USB Drive Number: 
)

:: --- Program Variables
SET PROG_PATH=VirtualBox
SET PROG_NAME=VBoxManage.exe
SET PROG_PARAMS=startvm 
SET PROG_RUN=%PROG_PATH%/%PROG_NAME%

:: --- Body
IF NOT "%drive_number%" == "" (
	IF NOT "%VMDK_raw_file_path%" == "" (
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

:: --- Footer
pause