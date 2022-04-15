: " 
Start QEMU KVM Automatically
"

# Command Line Variables
ARCH=$~1
VIRTUAL_DISK=$~2
MEMORY=$~3
BOOT_OPTIONS=$~4
OTHER_PARAMS=${@:5}

:: Processing - Command Line Variables

rem Data Validation
if [[ "%ARCH%" == "" ]]; then
	read -p "Architecture: " ARCH
	if [[ "%ARCH%" == "" ]]; then		
		ARCH="x86_64"
	fi
fi

if [[ "%VIRTUAL_DISK%" == "" ]]; then
	read -p "Virtual Disk (/path/to/vdi/img.vdi): " VIRTUAL_DISK
fi

if [[ "%MEMORY%" == "" ]]; then
	read -p "Memory (RAM) {M (MB)|G (GB)}: " MEMORY
	if [[ "%MEMORY%" == "" ]]; then
		MEMORY="4096M"
	fi
fi

if [[ "$BOOT_OPTIONS" == "" ]]; then
	read -p "Boot Param (order|struct|etc): " BOOT_OPTIONS

	if [[ "%BOOT_PARAM%" == "" ]]; then
		BOOT_PARAM="order=cd"
	fi
fi

:: Global Variables

:: Program Variables
PROGRAM_PATH="qemu-w64-v6.2.0-20211215\qemu"
PROGRAM_EXE="qemu-system-%ARCH%.exe"
PROGRAM_PARAMS="-hda $VIRTUAL_DISK -m $MEMORY -boot $BOOT_OPTIONS $OTHER_PARAMS"

:: Enviroment Variables

:: Main
main()
{
	if [[ "%VIRTUAL_DISK%" == "" ]]; then
		echo No Image Loaded	
	else
		echo.
		echo "Architecture: $ARCH"
		echo "Running : $VIRTUAL_DISK"
		echo.

		echo.
		echo "Controls:"
		echo "	* Ctrl + Alt + F : Fullscreen"
		echo "	* Ctrl + Alt + G : Grab External Window"
		echo "	* Ctrl + Alt + M : Show Menubar"
		echo.

		"$PROGRAM_PATH/$PROGRAM_EXE $PROGRAM_PARAMS" &&
			echo "QEMU KVM [%VIRTUAL_DISK%] ran successfully" ||
				echo "Error encountered running QEMU KVM [%VIRTUAL_DISK%]"
	fi
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; thee
	main "$@"
fi