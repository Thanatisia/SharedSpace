:: Start Python Virtual Environment (venv)

@echo off

:: [Variables]
:: Local Variables
SET VENV_FLDR_NAME=env
SET VENV_PATH="%CD%\%VENV_FLDR_NAME%"

:: Python Variables
SET PY_VERS=3.10

:: Program Variables
SET VENV_SCRIPTS_PATH=%VENV_PATH%\Scripts

:: Environment Variables
SET OTHER_PATH=%VENV_PATH%;%VENV_SCRIPTS_PATH%
SET PATH=%PATH%;%OTHER_PATH%;

:: Alias
	:: PIP
	SET download_pip=curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py ^&^& python get-pip.py ^&^& rmdir %CD%/get-pip.py
	:: Start venv
	SET activate=%VENV_SCRIPTS_PATH%\activate
	SET deactivate=%VENV_SCRIPTS_PATH%\deactivate
	SET install=pip install
	SET upgrade=pip install --upgrade pip
	SET freeze=pip freeze
	SET backup_pkgs=pip freeze ^> requirements.txt
	SET recover_pkgs=pip install -r requirements.txt

:: [Body]

:: Create Virtual Environment - If doesnt exist

IF NOT EXIST %VENV_PATH% (
	:: if folder does not exist
	echo [C] ^=^> Virtual Environment folder %VENV_FLDR_NAME% does not exist, creating...

	:: Check python version
	IF "%PY_VERS%" == "2.7" (
		:: Python 2.7
		virtualenv %VENV_PATH%
	) ELSE (
		:: Python >= 3.7
		python -m venv %VENV_PATH%
	)
)

:: Start Virtual Environment

echo ============================================================================================================
echo Usage
echo 	- Run 'activate' to enter the Virtual Environment
echo 	- Run 'deactivate' to exit from the Virtual Environment

echo.

echo Nots
echo 	- Please place your 'requirements.txt' if you have a custom requirements file to install into python PIP
echo ============================================================================================================

echo. 

:: Start command prompt
cmd /K "%activate%"



