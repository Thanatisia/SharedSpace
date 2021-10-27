:: Start script
:: Run this on startup to open & start your workflow
:: [Notes]
::	start [command] [parameters]: Start will execute the command asynchronously - running the command/script parallel to the other commands.
@echo off
SETLOCAL EnableDelayedExpansion

:: [Header]
rem Environment Variables
SET text_editor=notepad.exe

rem Command Variables
SET return_to_caller=goto :eof

rem Global Variables
rem - Paths
SET fldr_network_git=path\to\folder-n
SET exec_network_utils=path\to\folder-n\script.extension

rem Program Variables
rem - Arrays
SET files="file_path_n"
SET folders="folder_path_n"
SET exec="executable_path_name_n"
SET scripts="script_path_n"
SET cmds="command-n"

:: [Body]
goto :main
goto :end

:: [Footer]
rem Functions
:hello
	echo Hello World
	%return_to_caller%

:open_files
	rem Open file
	for %%a in (%files%) do (
		echo Opening file: %%a
		start %text_editor% %%a
		echo/
	)
	%return_to_caller%

:open_folders
	rem Open Folders
	for %%a in (%folders%) do (
		echo Opening folder: %%a
		start explorer.exe %%a
		echo/
	)
	%return_to_caller%

:exec_applications
	rem Execute Applications
	for %%a in (%exec%) do (
		rem Run application in background
		echo Opening Application: %%a
		start %%a
		echo/
	)
	%return_to_caller%

:exec_scripts
	rem Execute Commands and Scripts
	for %%a in (%scripts%) do (
		rem Run script in background
		echo Running Script: %%a

		rem Get filters
		rem Thanks: https://stackoverflow.com/questions/21860088/extract-drive-letter-from-set-p-p-in-bat-file
		SET parent_dir=%%~dpa
		SET drive_letter=!parent_dir:~0,2!
	
		echo Parent Directory: !parent_dir!
		echo Drive Letter: !drive_letter!

		rem Change Directory to script parent directory, drive letter and Execute
		cd !parent_dir! & !drive_letter! & call %%a

		rem Newline
		echo/
	)
	%return_to_caller%

:exec_commands
	rem Execute Commands and Scripts
	for %%a in (%cmds%) do (
		rem Run command in background
		echo Running Command: %%a
		%%a
		echo/
	)
	%return_to_caller%

:start
	call :open_files
	call :open_folders 
	call :exec_applications
	call :exec_scripts
	call :exec_commands
	%return_to_caller%

:main
	echo Opening Workflow...
	call :start

:end
	echo Ending...
	pause
	EXIT /B 0