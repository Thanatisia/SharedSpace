:: Start QEMU KVM Automatically
@echo off
SETLOCAL EnableDelayedExpansion

:: Command Line Variables
SET ARCH=%1
SET VIRTUAL_DISK=%2
SET MEMORY=%3
SET BOOT_PARAM=%4
SET BOOT_ARG=%5
SET OTHER_PARAMS=%6

:: Processing - Command Line Variables

rem Data Validation
IF "%ARCH%" == "" (
	SET /p ARCH=Architecture: 
	IF "%ARCH%" == "" (
		SET ARCH=x86_64
	)
)

IF "%VIRTUAL_DISK%" == "" (
	SET /p VIRTUAL_DISK="Virtual Disk (/path/to/vdi/img.vdi): " 
)

IF "%MEMORY%" == "" (
	SET /p MEMORY="Memory (RAM) {M (MB)|G (GB)}: "
	IF "%MEMORY%" == "" (
		SET MEMORY=4096M
	)
)

IF "%BOOT_PARAM%" == "" (
	SET /p BOOT_PARAM="Boot Param (order|struct|etc): "

	IF "%BOOT_PARAM%" == "" (
		SET BOOT_PARAM=order
	)
) 

IF "%BOOT_ARG%" == "" (
	SET /p BOOT_ARG="Boot Arguments (Boot Parameter Argumets): "
	
	IF "%BOOT_ARG%" == "" (
		SET BOOT_ARG=cd
	)
)

rem Combine Boot Options together with '=' delimiter
SET BOOT_OPTIONS="%BOOT_PARAM%=%BOOT_ARG%"

:: Global Variables

:: Program Variables
SET PROGRAM_PATH=qemu-w64-v6.2.0-20211215\qemu
SET PROGRAM_EXE=qemu-system-%ARCH%.exe
SET PROGRAM_PARAMS=-hda %VIRTUAL_DISK% -m %MEMORY% -boot %BOOT_OPTIONS% %OTHER_PARAMS%

:: Enviroment Variables

:: Main
IF "%VIRTUAL_DISK%" == "" (
	echo No Image Loaded	
) ELSE (
	echo/
	echo Architecture: %ARCH%
	echo Running : %VIRTUAL_DISK%
	echo/

	echo/
	echo Controls:
	echo	* Ctrl + Alt + F : Fullscreen
	echo	* Ctrl + Alt + G : Grab External Window
	echo	* Ctrl + Alt + M : Show Menubar
	echo/

	%PROGRAM_PATH%\\%PROGRAM_EXE% %PROGRAM_PARAMS% && (
		echo QEMU KVM [%VIRTUAL_DISK%] ran successfully
	) || (
		echo Error encountered running QEMU KVM [%VIRTUAL_DISK%]
	)
)

