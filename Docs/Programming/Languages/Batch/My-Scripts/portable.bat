:: Start in portable mode
@echo off
SETLOCAL EnableDelayedExpansion

:: [User Environment Space]
:: User Variables
SET user=%USERNAME%
SET datafldr=data/%user%
SET datapath=%CD%/%datafldr%

:: Prepare Workspace
:: Create userspace portable data folder if folder doesnt exists
IF NOT EXIST "%datapath%" (
	:: If folder does not exist
	mkdir "%datapath%"
)

:: [Set Environment Variables]
:: For Portability

:: Change Roaming APPDATA folder to another directory of your choice
SET APPDATA=%datafldr%

:: Store all Vieb data in this folder
SET VIEB_DATAFOLDER=%datafldr%

:: [Get Environment Variables]

:: [Program Variables]
SET PROG_FLDR=Vieb-7.2.0-win
SET PROG_FILE=Vieb.exe
SET PROG_RUN="%CD%/%PROG_FLDR%/%PROG_FILE%"

:: Main (Processing)
echo User : %user%
echo APPDATA (Roaming) : %APPDATA%
echo Vieb Data Folder : %VIEB_DATAFOLDER%
echo Running : %PROG_RUN%

echo/

%PROG_RUN% && (
	echo %PROG_RUN% ran successfully.
) || (
	echo error running %PROG_RUN%. 
)

echo/

:: Output
pause