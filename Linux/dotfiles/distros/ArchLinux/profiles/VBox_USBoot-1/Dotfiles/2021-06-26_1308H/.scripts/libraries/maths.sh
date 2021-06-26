#
# Mathematics Library
# Author: Asura
# Created: 2021-05-19 1755H
# Modified: 
#	- 2021-05-19 1755H
# Features: 
# Background Information: 
#	- A all-in-one Mathematics library
# Changelog:
#	- 2021-05-19 1755H, Asura:
#		- Created script file
#

# --- Variables
PROGRAM_NAME="Mathematics"
PROGRAM_TYPE="Library"


# --- Functions

# General Functions
function func_Name()
{
	# --- Input
	# Command Line Variables
    if [[ "$1" == "" ]]; then
		# Pipe Input
		read -p "Input: " uInput
	else
		uInput="$1"
	fi
	
	# Local Variables

	# --- Processing
    proc=$uInput
    sysOut=$proc

	# --- Outut
    echo "$sysOut"
}

# Mathematics Functions
add()
{
	#
	# Addition
	#
	# Usage:
	#	. maths.sh # Source the library
	#	1. echo <n1> | add <n2>
	#	2. echo <n1> | add
	#		2.1. Enter 2nd number in prompt
	#	3. add <n1> <n2>
	#	4. add <n1>
	#		4.1. Enter 2nd number in prompt
	#

	# --- Input

	# Command Line Variables
	if [[ "$1" == "" ]]; then
		read -p "First Number: " num_1 # Pipe input

		# Data Validation: Null entry
		if [[ "$num_1" == "" ]]; then
			# Validation: Empty value
			num_1=0
		fi
	else
		num_1=$1
	fi

	if [[ "$2" == "" ]]; then	
		read -p "Second Number: " num_2 # Pipe input
		
		# Data Validation: Null entry
		if [[ "$num_2" == "" ]]; then
			# Validation: Empty value
			num_2=0
		fi
	else
		num_2=$2
	fi

	# Local Variabes
	res=0

	# --- Processing

	# echo "Number 1: $num_1"
	# echo "Number 2: $num_2"

	# Body
	res=$((num_1+num_2))

	# --- Output
	echo "$res"
}

subt()
{
	#
	# Subtract
	#
	# Usage:
	#	. maths.sh # Source the library
	#	1. echo <n1> | subt <n2>
	#	2. echo <n1> | subt
	#		2.1. Enter 2nd number in prompt
	#	3. subt <n1> <n2>
	#	4. subt <n1>
	#		4.1. Enter 2nd number in prompt
	#

	# --- Input

	# Command Line Variables
	if [[ "$1" == "" ]]; then
		read -p "First Number: " num_1 # Pipe input

		# Data Validation: Null entry
		if [[ "$num_1" == "" ]]; then
			# Validation: Empty value
			num_1=0
		fi
	else
		num_1=$1
	fi

	if [[ "$2" == "" ]]; then	
		read -p "Second Number: " num_2 # Pipe input
		
		# Data Validation: Null entry
		if [[ "$num_2" == "" ]]; then
			# Validation: Empty value
			num_2=0
		fi
	else
		num_2=$2
	fi

	# Local Variabes
	res=0

	# --- Processing

	# echo "Number 1: $num_1"
	# echo "Number 2: $num_2"

	# Body
	res=$((num_1-num_2))

	# --- Output
	echo "$res"
}

mul()
{
	#
	# Multiply
	#
	# Usage:
	#	. maths.sh # Source the library
	#	1. echo <n1> | mul <n2>
	#	2. echo <n1> | mul
	#		2.1. Enter 2nd number in prompt
	#	3. mul <n1> <n2>
	#	4. mul <n1>
	#		4.1. Enter 2nd number in prompt
	#

	# --- Input

	# Command Line Variables
	if [[ "$1" == "" ]]; then
		read -p "First Number: " num_1 # Pipe input

		# Data Validation: Null entry
		if [[ "$num_1" == "" ]]; then
			# Validation: Empty value
			num_1=0
		fi
	else
		num_1=$1
	fi

	if [[ "$2" == "" ]]; then	
		read -p "Second Number: " num_2 # Pipe input
		
		# Data Validation: Null entry
		if [[ "$num_2" == "" ]]; then
			# Validation: Empty value
			num_2=0
		fi
	else
		num_2=$2
	fi

	# Local Variabes
	res=0

	# --- Processing

	# echo "Number 1: $num_1"
	# echo "Number 2: $num_2"

	# Body
	res=$((num_1*num_2))

	# --- Output
	echo "$res"

}

div()
{
	#
	# Divide
	#
	# Usage:
	#	. maths.sh # Source the library
	#	1. echo <n1> | div <n2>
	#	2. echo <n1> | div
	#		2.1. Enter 2nd number in prompt
	#	3. div <n1> <n2>
	#	4. div <n1>
	#		4.1. Enter 2nd number in prompt
	#

	# --- Input

	# Command Line Variables
	if [[ "$1" == "" ]]; then
		read -p "First Number: " num_1 # Pipe input

		# Data Validation: Null entry
		if [[ "$num_1" == "" ]]; then
			# Validation: Empty value
			num_1=0
		fi
	else
		num_1=$1
	fi

	if [[ "$2" == "" ]]; then	
		read -p "Second Number: " num_2 # Pipe input
		
		# Data Validation: Null entry
		if [[ "$num_2" == "" ]]; then
			# Validation: Empty value
			num_2=0
		fi
	else
		num_2=$2
	fi

	# Local Variabes
	res=0

	# --- Processing

	# echo "Number 1: $num_1"
	# echo "Number 2: $num_2"

	# Body
	res=$((num_1/num_2))

	# --- Output
	echo "$res"
}

rem()
{
	#
	# Divide
	#
	# Usage:
	#	. maths.sh # Source the library
	#	1. echo <n1> | div <n2>
	#	2. echo <n1> | div
	#		2.1. Enter 2nd number in prompt
	#	3. div <n1> <n2>
	#	4. div <n1>
	#		4.1. Enter 2nd number in prompt
	#

	# --- Input

	# Command Line Variables
	if [[ "$1" == "" ]]; then
		read -p "First Number: " num_1 # Pipe input

		# Data Validation: Null entry
		if [[ "$num_1" == "" ]]; then
			# Validation: Empty value
			num_1=0
		fi
	else
		num_1=$1
	fi

	if [[ "$2" == "" ]]; then	
		read -p "Second Number: " num_2 # Pipe input
		
		# Data Validation: Null entry
		if [[ "$num_2" == "" ]]; then
			# Validation: Empty value
			num_2=0
		fi
	else
		num_2=$2
	fi

	# Local Variabes
	res=0

	# --- Processing

	# echo "Number 1: $num_1"
	# echo "Number 2: $num_2"

	# Body
	res=$((num_1%num_2))

	# --- Output
	echo "$res"
}

square()
{
	#
	# Square
	#
	# Usage:
	#	. maths.sh # Source the library
	#	1. echo <n1> | div <n2>
	#	2. echo <n1> | div
	#		2.1. Enter 2nd number in prompt
	#	3. div <n1> <n2>
	#	4. div <n1>
	#		4.1. Enter 2nd number in prompt
	#

	# --- Input

	# Command Line Variables
	if [[ "$1" == "" ]]; then
		read -p "Base Number: " num_1 # Pipe input

		# Data Validation: Null entry
		if [[ "$num_1" == "" ]]; then
			# Validation: Empty value
			num_1=0
		fi
	else
		num_1=$1
	fi

	#if [[ "$2" == "" ]]; then	
	#	read -p "Second Number: " num_2 # Pipe input
	#	
	#	# Data Validation: Null entry
	#	if [[ "$num_2" == "" ]]; then
	#		# Validation: Empty value
	#		num_2=0
	#	fi
	#else
	#	num_2=$2
	#fi

	# Local Variabes
	res=0

	# --- Processing

	# echo "Base: $num_1"
	
	# Body
	res=$((num_1*num_1))

	# --- Output
	echo "$res"
}

sqrt()
{
	#
	# Square Root
	#
	# Usage:
	#	. maths.sh # Source the library
	#	1. echo <n1> | div <n2>
	#	2. echo <n1> | div
	#		2.1. Enter 2nd number in prompt
	#	3. div <n1> <n2>
	#	4. div <n1>
	#		4.1. Enter 2nd number in prompt
	#

	# --- Input

	# Command Line Variables
	if [[ "$1" == "" ]]; then
		read -p "Square Number: " num_1 # Pipe input

		# Data Validation: Null entry
		if [[ "$num_1" == "" ]]; then
			# Validation: Empty value
			num_1=0
		fi
	else
		num_1=$1
	fi

	#if [[ "$2" == "" ]]; then	
	#	read -p "Second Number: " num_2 # Pipe input
	#	
	#	# Data Validation: Null entry
	#	if [[ "$num_2" == "" ]]; then
	#		# Validation: Empty value
	#		num_2=0
	#	fi
	#else
	#	num_2=$2
	#fi

	# Local Variabes
	res=0

	# --- Processing

	# Body
	res="$(echo $num_1 | awk '{print sqrt($1)}')"

	# --- Output
	echo "$res"
}

bodmas()
{
	#
	# BODMAS operation
	# - Take user input operation string
	# - Seperate character by character
	# - If each and every subsequent characters is numerical: Concatenate and is a new number (i.e. "55" = '5''5' = '5'+'5')
	# - If subsequent character is a operation string (i.e. +, -, *, /): 
	#		Validate and execute the appropriate operation
	#		- Follow BODMAS rules
	#			1. Brackets
	#			2. Multiplication / Division (if is both, left to right)
	#			3. Plus / Minus (if is both, left to right)
	#		- i.e. case "$operation" in
	#				"+")
	#					add
	#					;;
	#				"-")
	#					subt
	#					;;
	#				"*")
	#					mul
	#					;;
	#				"/")
	#					div
	#					;;
	#				*)
	#					echo "Wrong operation"
	#					;;
	#				esac
	#	i.e.
	#		uInput="5+6*5+(6*5)/2"
	#		res="$(bodmas "$uInput")"
	#		echo "$res" 
	#			- output:
	#				1. (6*5)
	#				2. 6*5
	#				3. (6*5)/2
	#				4. 5 + (6*5) + [(6*5)/2]
	#	Tip:
	#		- Search for Brackets
	#			> If have: Complete first
	#			> Else: Continue 
	#			- Search for * or / (multiply or divide) operations
	#				> If have: Complete first
	#				> Else: Left to right
	#

	# --- Input

	# Command Line Variables
	num_1=$1
	num_2=$2
	# Local Variabes
	res=$3

	# --- Processing
	# Validation: Empty value
	if [[ "$num_1" == "" ]]; then
		read -p "First Number: " num_1
	fi

	if [[ "$num_2" == "" ]]; then
		read -p "Second Number: " num_2
	fi

	# Body
	res=$(($num_1+$num_2))

	# --- Output
	echo "$res"
}

# Main functions
body()
{
	#
	# Main function to run
	#
	res="$(func_Name "$@")"
	echo "$res"
}

function START()
{
	# --- Input
	ret_code="0"
	
	# --- Processing 

	# --- Output
	echo "$ret_code"
}

function END()
{
    line=""
    read -p "Pause" line
}

function main()
{	
	ret_code="$(START)"
	if [[ "$ret_code" == "1" ]]; then
		# Success
		# Your body here
		res="$(body "$@")"
		# echo "Return Result: $res"
		echo "$res"
	else
		echo -e "Error: \n$ret_code"
	fi
}

if [[ "${BASH_SOURCE[@]}" == "${0}" ]]; then
    # START
    init
	main "$@"
    END
fi

