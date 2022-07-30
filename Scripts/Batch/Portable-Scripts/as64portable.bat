:: Android Studio Portable Runner
::
:: Please change the following variables
:: - PROG_VERS
:: 
:: Optional Changes
:: - JAVA_HOME
:: - PROG_DATA{_,ROAMING,LOCAL} directories
@echo off
SETLOCAL EnableDelayedExpansion

:: [Variables]
:: Program Information
SET PROG_NAME=Android Studio
SET PROG_VERS=2021.2.1.15
SET PROG_EXE=studio64.exe
SET PROG_ROOT=%CD%\Android-%PROG_VERS%
SET PROG_FILES=%PROG_ROOT%\Android\Android Studio
SET PROG_DATA=%CD%\data
SET PROG_DATA_ROAMING=%PROG_DATA%\Roaming
SET PROG_DATA_LOCAL=%PROG_DATA%\Local
SET PROG_BIN=%PROG_FILES%\bin

:: Environment Variables
SET HOMEPATH=%PROG_DATA%\home
SET APPDATA=%PROG_DATA_ROAMING%
SET LOCALAPPDATA=%PROG_DATA_LOCAL%

:: Program Variables
SET JAVA_HOME=%PROG_DATA%\Android\JDK

echo/
:: [Setup]
IF NOT EXIST %HOMEPATH% (
	rem folder does not exist
	rem - Create
	mkdir %HOMEPATH%
)
IF NOT EXIST %PROG_DATA% (
	rem folder does not exist
	rem - Create
	mkdir %PROG_DATA%
)
IF NOT EXIST %JAVA_HOME% (
	rem folder does not exist
	rem - Create
	mkdir %JAVA_HOME%
)
echo/

:: [Entry Point]
:: Startup
echo Home Directory : %HOMEPATH%
echo AppData Roaming : %APPDATA%
echo AppData Local : %LOCALAPPDATA%

echo/

:: Run
SET PROG_ARGS=%*
SET PROG_CMD="%PROG_BIN%\%PROG_EXE%" %PROG_ARGS%

echo Running %PROG_CMD%...
%PROG_CMD% && (
	echo %PROG_NAME% successfully ran.
) || (
	echo %PROG_NAME% error detected.
)

pause