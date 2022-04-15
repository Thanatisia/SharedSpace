:: Start QEMU KVM Automatically
@echo off
SETLOCAL EnableDelayedExpansion

:: Command Line Variables
SET input_format=%~1
SET output_format=%~2
SET input_file=%~3
SET output_file=%~4

:: Processing - Command Line Variables

rem Data Validation
IF "%input_format%" == "" (
	SET /p input_format="Input Format (vdi etc): "
)

IF "%output_format%" == "" (
	SET /p output_format="Output Format (qcow2 etc): "
)

IF "%input_file%" == "" (
	SET /p input_file="Input File (img.vdi etc): "
)

IF "%output_file%" == "" (
	SET /p output_file="Output File (vhd.qcow2 etc): "
)

:: Global Variables

:: Program Variables
SET PROGRAM_PATH=qemu-w64-v6.2.0-20211215\qemu
SET PROGRAM_EXE=qemu-img.exe
SET PROGRAM_PARAMS=convert -f %input_format% -O %output_format% "%input_file%" "%output_file%"

:: Enviroment Variables

:: Main
IF "%input_format%" == "" (
	echo No Input Format Provided
) ELSE IF "%output_format%" == "" (
	echo No Output Format Specified
) ELSE IF "%input_file%" == "" (
	echo No Input File Provided.
) ELSE IF "%output_file%" == "" (
	echo No Output File Specified.	
) ELSE (
	echo/
	echo [C] Converting Formats: [%input_format%] =^> [%output_format%]
	echo [C] Converting Files  : [%input_file%] =^> [%output_file%]
	echo/

	%PROGRAM_PATH%\\%PROGRAM_EXE% %PROGRAM_PARAMS% && (
		echo/
		echo [D] QEMU KVM Disk Conversion ran successfully
	) || (
		echo/
		echo [E] Error encountered converting Virtual Disks
	)

	echo/
)

