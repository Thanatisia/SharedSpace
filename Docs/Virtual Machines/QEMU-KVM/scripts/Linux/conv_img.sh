:" 
Start QEMU KVM Automatically
"

# Command Line Variables
input_format=$1
output_format=$2
input_file=$3
output_file=$4
other_args=${@:5}

: " 
Processing - Command Line Variables
" 

# Data Validation
if [[ "%input_format%" == "" ]]; then
	read -p "Input Format (vdi etc): " input_format
fi

if [[ "%output_format%" == "" ]]; then
	read -p "Output Format (qcow2 etc): " output_format
fi

if [[ "%input_file%" == "" ]]; then
	read -p "Input File (img.vdi etc): " input_file
fi

if [[ "%output_file%" == "" ]]; then
	read -p "Output File (vhd.qcow2 etc): " output_file
fi

# Global Variables

# Program Variables
PROGRAM_PATH="qemu-w64-v6.2.0-20211215\qemu"
PROGRAM_EXE="qemu-img"
PROGRAM_PARAMS="convert -f %input_format% -O %output_format% \"%input_file%\" \"%output_file%\""

# Enviroment Variables

# Main
main()
{
	if [[ "%input_format%" == "" ]]; then
		echo "No Input Format Provided"
	elif [[ "%output_format%" == "" ]]; then 
		echo "No Output Format Specified"
	elif [[ "%input_file%" == "" ]]; then
		echo "No Input File Provided."
	elif [[ "%output_file%" == "" ]]; then
		echo "No Output File Specified."	
	else
		echo.
		echo "[C] Converting Formats: [$input_format] => [$output_format]"
		echo "[C] Converting Files  : [$input_file] => [$output_file]"
		echo.

		%PROGRAM_PATH%\\%PROGRAM_EXE% %PROGRAM_PARAMS% && (
			echo/
			echo [D] QEMU KVM Disk Conversion ran successfully
		) || (
			echo/
			echo [E] Error encountered converting Virtual Disks
		)

		echo.
	fi
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	main "$@"
fi
