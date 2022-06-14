@echo off
SETLOCAL EnableDelayedExpansion

SET RootDir=%~d0
SET cwd=%cd%

rem example: source.vdi
if "%~1"=="" (
	SET /p source_file="Source File (please put your extension behind - i.e. source.vdi): "
	SET /p target_file="Target File (please put your extension behind - i.e. target.img): "
) ELSE (
	SET "source_file=%~1"

	if "%~2"=="" (
		SET /p target_file="Target File (please put your extension behind - i.e. target.img): "
	) ELSE (
		SET "target_file=%~2"
	)
)

rem Get Source file extension
for %%A in ("%source_file%") do (
	SET source_extension=%%~xA
)

for %%A in ("%target_file%") do (
	SET target_extension=%%~xA
)

if "%source_extension%"=="" (
	echo No extension found in Source file
	SET /p source_extension="Source Extension (i.e. .vdi, .vhd; note: please put a dot '.'): "
	SET source_file=%source_file%!source_extension!
) ELSE (
	echo Source Extension: %source_extension%
)
if "%target_extension%"=="" (
	echo No extension found in target file, appending default extension [.img]
	SET target_file=%target_file%.img
) ELSE (
	echo Target Extension: %target_extension%
)

echo Source File: %source_file% 
echo Target File: %target_file%

SET default_vm_folder=%cwd%\VirtualBox\data\VMs\
SET VBOX_USER_HOME=%cwd%\VirtualBox\data\.VirtualBox\
SET VBox_Path=%cwd%\VirtualBox\
SET VBox_Data_Path=%RootDir%\Virtualization\Harddrives\
SET Program_Title=VirtualBox Manage
SET file_type=.exe

rem vboxmanage - cmd program that lets you manage the program's path etc.
%VBox_Path%vboxmanage setproperty machinefolder %default_vm_folder% && (
	echo Default VM Folder Path changed to [%default_vm_folder%]
) || (
	echo Default VM Folder Path remains
)

rem convert vbox hdd file to image
rem VBoxManage clonehd <vdi-file>.vdi <output-file>.img --format RAW

rem %VBox_Path%vboxmanage clonemedium --format RAW %source_file% %target_file% && (
%VBox_Path%vboxmanage clonehd %source_file% %target_file% --format RAW && (
	echo Successfully converted %source_file% to %target_file%
) || (
	echo Error converting %source_file% to %target_file%
)

pause