:: Portable start
:: Background Information:
::	- Add custom paths to program

@echo off

:: --- Input

:: Global Variables
SET CWD=%CD%
SET PROGRAM_PATHS=

:: Environment Variables
SET PATH=%PROGRAM_PATHS%;%PATH%

:: Program Variables
SET PROG_NAME=VSCode
SET PROG_EXE=Code.exe
SET PROG_BINARY=win32-x64
SET PROG_VERS=1.57.1
SET PROG_FLDR=%PROG_NAME%-%PROG_BINARY%-%PROG_VERS%
SET PROG_PATH=%CWD%/%PROG_FLDR%

:: --- Processing
echo Running Program
echo	Name 	: %PROG_NAME%
echo	Exe  	: %PROG_EXE%
echo	Binary 	: %PROG_BINARY%
echo	Version : %PROG_VERS%
echo	Folder	: %PROG_FLDR%
echo	Path	: "%PROG_PATH%"

echo.

echo Recognized Paths:
echo %PATH%

echo.

echo ==== Program Start ====

"%PROG_PATH%\%PROG_EXE%" && (
	echo Success
) || (
	echo Error
)

:: --- Output
pause