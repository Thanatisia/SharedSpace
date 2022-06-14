@echo off

::
:: Input/Header
::

:: Environment Variables
SET RootDir=%~d0
SET cwd=%cd%

:: Static Variables
SET Program_Title=VirtualBox
SET file_type=.exe

:: Dynamic Variables
SET default_vm_folder=%cwd%\VirtualBox\data\VMs\
SET VBOX_USER_HOME=%cwd%\VirtualBox\data\.VirtualBox\
SET VBox_Path="%cwd%\VirtualBox"\
SET VBox_Data_Path=%cwd%\personal\Harddrives\

:: Body
rem vboxmanage - cmd program that lets you manage the program's path etc.
echo %VBox_Path%vboxmanage setproperty machinefolder %default_vm_folder% && (
	echo Default VM Folder Path changed to [%default_vm_folder%]
) || (
	echo Default VM Folder Path remains
)

%VBox_Path%\%Program_Title%%file_type% && (
	echo %Program_Title% Executed
) || (
	echo Error executing %Program_Title%
)

:: Output/Footer
pause