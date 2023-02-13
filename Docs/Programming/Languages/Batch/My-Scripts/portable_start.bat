:: Portable start - Program Runner
:: Background Information:
::	- Add custom paths to program before running program

@echo off

:: --- Input

:: Global Variables
SET CWD=%CD%
SET PROGRAM_PATHS=
SET last_opened_Log=last_Opened.txt

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

echo/

echo Recognized Paths:
echo %PATH%

echo/

goto :main


:: Functions
:check_Empty
    ::
    :: Check if variable are empty
    :: ret_code
    ::  0 : Empty
    ::  1 : Not Empty
    ::

    :: --- Input    
    SET var_1=%~1
    SET res=1
    
    :: --- Variables
    :: Local Variables
    SET res=

    :: --- Processing
    IF "%var_1" == "" (
        res="0"
    )

    :: --- Output
    SET res=%~2

    EXIT /B 0
 
:write_prog_Details
    ::
    :: Get Program details from user and
    :: Write to text file list
    ::
    SET last_opened_Log=last_Opened.txt
    SET /p PROG_NAME=Program Name: 
    SET /p PROG_EXE=Program Executable Name: 
    SET /p PROG_BINARY=Program Binary Type [x86 | x64 | x86-64]: 
    SET /p PROG_VERS=Program Version: 
    SET /p PROG_FLDR=Program Folder: 
    SET PROG_PATH=%CWD%/%PROG_FLDR%
    SET PROG_DETAILS=%PROG_NAME% %PROG_EXE% %PROG_BINARY% %PROG_VERS% %PROG_FLDR% %PROG_PATH%

    rem Write to 'Last Read' file 
    :: echo "PROGRAM NAME: %PROG_NAME%" >> %last_opened_Log%
    :: echo "PROGRAM EXECUTABLE: %PROG_EXE%" >> %last_opened_Log%
    :: echo "PROGRAM BINARY: %PROG_BINARY%" >> %last_opened_Log%
    :: echo "PROGRAM VERSION: %PROG_VERS%" >> %last_opened_Log%
    :: echo "PROGRAM FOLDER: %PROG_FLDR%" >> %ast_opened_Log%

    (for %%a in (%PROG_DETAILS%) do (
        echo %%a
    )) >> %last_opened_Log%

    :: --- Output
    EXIT /B 0

   
:validate_last_Ran
    ::
    :: Check if program has been ran before
    :: by reading list of registered/written programs and details
    ::

    :: --- Input
    SET res="0"

    :: --- Processing
    IF EXIST "%last_opened_Log%" (
        :: If Folder/file exists
        echo "Last Opened Log exists."
        >nul find "%PROG_NAME%" %last_opened_Log% && (
            :: Found string in fie
            SET res="1"
        )
    )

    :: --- Output
    SET "%~1 = %res%"
    EXIT /B 0

:prog_start
    ::
    :: Start Program
    ::

    :: --- Input
    SET ret_code="0"

    :: --- Processing
    echo ==== Program Start ====
    "%PROG_PATH%\%PROG_EXE%" && (
	    echo Success
        SET ret_code="1"
    ) || (
        echo Error
    )

    :: --- Output
    SET "%~1 = %ret_code%"
    EXIT /B 0

:check_prog_Empty
    ::
    :: Check if program variables were empty
    ::
    call :check_Empty "%PROG_NAME%" ret_progName
    call :check_Empty "%PROG_EXE%" ret_progExe
    call :check_Empty "%PROG_BINARY%" ret_progBin
    call :check_Empty "%PROG_VERS%" ret_progVersion
    call :check_Empty "%PROG_FLDR%" ret_progFolder

    if "%ret_progName%" == "0"  (
        call :write_prog_Details 
    )

    EXIT /B 0

:postcompletion
    ::
    :: Execute after program is completed.
    ::

    SET ret_code=%~d1

    if "%ret_code%" == "1" (
        :: Success
        :: Write last ran to log
        echo "Success"

        call :validate_last_Ran res
        echo Result: %res%

        :: Process Results
        IF "%res%" == "0" (
            :: Not Found
            call :write_prog_Details
        ) ELSE (
            echo Program already registered.
        )
    )

    :: --- Output
    EXIT /B 0

:main
    ::
    :: Main Function
    ::

    :: Open Program
    call :check_prog_Empty 
    call :prog_start ret_code
    call :postcompletion %ret_code%

    goto :end

:end
    SET /p end=Ending...
    exit

:: --- Output
pause