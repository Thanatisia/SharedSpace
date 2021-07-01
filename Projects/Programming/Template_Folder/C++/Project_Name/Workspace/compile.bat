:: C Compiler 
:: using gcc (Mingw-w64)
@echo off
SETLOCAL EnableDelayedExpansion

:: --- Input

:: Arguments
SET argv=%~d1

:: Environment Variables

:: Global Variables
SET LANGUAGE=c

:: --- Processing
goto :main "%~1" "%~2" "%~3"

:: --- Output
goto :end

:compile
	:: 
	:: Compile Program
	::

	:: --- Input

	:: Arguments
	SET src_file=%~1
	SET exe_file=%~2
	SET options=%~3

	:: Local Variables
	IF "%LANGUAGE%" == "c" (
		SET COMPILER=gcc
	) ELSE IF "%LANGUAGE%" == "cpp" (
		SET COMPILER=g++
	)
	SET compile_proc=%COMPILER% %src_file% -o %exe_file% %options%

	echo Compilation Process: %compile_proc%
	:: --- Processing
	%compile_proc% && (
		echo "Compilation Success"
	) || (
		echo "Compilation Error"
	)

	:: --- Output
	EXIT /B 0

:main
	:: --- Input
	
	:: Arguments
	SET argv_Local=%*
	SET argc=0
	for %%x in (%*) do (
		rem Get Size of Argument
		set /A argc+=1	
	)

	:: Local Variables

	:: --- Processing
	echo All Arguments: %argv_Local%
	for %%a in (%argv_Local%) do (
		echo Argument: [%%a]
	)

	SET src_file=%~1
	SET exe_file=%~2
	SET options=%~3

	echo "Source File: %src_file%"
	echo "Executable : %exe_file%"
	echo "Options    : %options%"
	call :compile "%src_file%" "%exe_file%" "%options%"

	::SET min_Index=0
	::SET max_Index=%argc%
	::SET increment=1
	::for /L %%i in (%min_Index% %increment% %max_Index%) do (
	::	echo Argument [%%i] : "!argv_Local[%%i]!"
	::)

	:: --- Output
	rem EXIT /B 0

:end
	SET /p finish="Cleaning up..."
	rem exit

