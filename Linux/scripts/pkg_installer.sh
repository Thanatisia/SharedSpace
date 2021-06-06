#
# Command Line / Terminal Package Installer
# Author: Asura
# Created: 2021-06-06 2110H, Asura 
# Modified: 
#	- 2021-06-06 2110H, Asura
# Features: 
#	- Allows user to 
#		> add packages of their choice into the list
#		> Select and install selected packages
# Background Information: 
#	A cli/terminal package installer where user can add packages of their choice and distribute to other users.
#	Users can select packages of their choice and install
# Changelog:
#	2021-06-06 2110H, Asura
#		- Created script file
#

# --- Variables

# [Program]
PROGRAM_NAME="Command-Terminal Interface (CTI) Package Installer"
PROGRAM_TYPE="Main"

# [Global]
PKGMGR="pacman"
selected_Packages=""

# [Arrays]
pkgs=(
	"xterm"
	"select-end"
	"select-show"
)

# [Associative Array]
#declare -A pkgs=(
#	# [package-type]="package-name"
#	[terminal-1]="xterm"
#	[show]="select-show"
#	[exit]="select-end"
#)

case "$PKGMGR" in
	"pacman")
		declare -A pkg_controls=(
			[install]="sudo pacman -S $selected_pkg_Name"
			[remove]="sudo pacman -R $selected_pkg_Name"
			[uninstall]="sudo pacman -Rsu $selected_pkg_Name"
			[exit]="exit"
		)
		;;
	"aptitude")
		declare -A pkg_controls=(
			[install]="sudo apt-get install $selected_pkg_Name"
			[remove]="sudo apt-get"
			[uninstall]="sudo apt-get uninstall "
			[exit]="exit"
		)
		;;
	*)
		;;
esac

# [Derivative Variables]
number_of_Packages="${#pkgs[@]}"
number_of_Controls="${#pkg_controls[@]}"

# --- Functions

# Menu Functions
menu_Select()
{
	# menu syntax: select
	PS3="Please enter your option: "
	# Manage Package
	select pkg_opt in "${!pkg_controls[@]}"; do
		selected_Command="${pkg_controls[$pkg_opt]}"

		case "$selected_Command" in
			"exit")
				break
				;;
			*)
				select opt in "${pkgs[@]}"; do
					selected_pkg_Name="$opt"

					case "$selected_pkg_Name" in
						"select-end" )
							# End Select
							# Data Validation: Empty/Null Value
							if [[ ! "$selected_Packages" == "" ]]; then
								selected_Command+="$selected_Packages"
								echo "Command: $selected_Command"
								$selected_Command
							else
								echo "No Packages selected"
							fi
							break
							;;
						"select-show")
							# Show packages
							echo "Packages: $selected_Packages"
							;;
						*)
							# Not Exit / Quit
							# Check if string contains substring
							if [[ ! "$selected_Packages" == *"$selected_pkg_Name"* ]]; then
								# selected_Command+="$selected_pkg_Name "
								selected_Packages+="$selected_pkg_Name "
							else
								echo "Package is already selected."
							fi
							;;
					esac
				done

				# Clear all packages
				selected_Packages=""
				selected_Command=""
				;;
		esac
	done
}

menu_Test1()
{
	# Manage Package
	PS3="Please enter your option: "
	while true; do			
		# Command
		#j=0
		echo "[ Select Command ]"
		for cmd in "${!pkg_controls[@]}"; do
			#j=$((j+1))
			#echo "[$j] : $cmd"
			echo "> $cmd"
		done
		read -p "$PS3" cmd
		echo ""

		if [[ ! "$cmd" == "" ]]; then
			# Data Validation: If command input is NOT empty
			selected_Command=${pkg_controls[$cmd]}
			# echo "Selected Command: $selected_Command"

			if [[ "$selected_Command" == "exit" ]]; then
				break
			elif [[ ! "$selected_Command" == "" ]]; then
				while true; do
					echo "[ Select Package(s) ]"
					PS3="Please enter your option [Enter the option number]: "
					for(( i=1; i <= $number_of_Packages; i++ )); do
						echo "[$i] : ${pkgs[$((i-1))]}"
					done
					read -p "$PS3" opt
					
					if [[ ! "$opt" == "" ]]; then
						# Data Validation: Entered option is NOT empty
						selected_pkg_Name="${pkgs[$((opt-1))]}"
						if [[ "$selected_pkg_Name" == "select-end" ]]; then
							# End Selection
							# Data Validation: Empty/Null Value
							if [[ ! "$selected_Packages" == "" ]]; then
								selected_Command+="$selected_Packages"
								echo "Command: $selected_Command"
								$selected_Command
							else
								echo "No Packages selected"
							fi
							break
						elif [[ "$selected_pkg_Name" == "select-show" ]]; then
							echo "Packages: $selected_Packages"
						elif [[ ! "$selected_pkg_Name" == "" ]]; then
							# Not Exit / Quit && Data Validation: Not Empty
							# Check if string contains substring
							if [[ ! "$selected_Packages" == *"$selected_pkg_Name"* ]]; then
								# selected_Command+="$selected_pkg_Name "
								selected_Packages+="$selected_pkg_Name "
							else
								echo "Package is already selected."
							fi
						else
							echo "Invalid Value"
						fi
						echo ""
					else
						echo ""
						echo "No Input"
						echo ""
					fi
				done
			else
				# Validation : Null/Empty Value checker
				echo "Invalid Option"
			fi
			
			selected_Command=""
			selected_Packages=""
		else
			echo "No Input"
			echo ""
		fi
	done
}

# General Functions
init()
{
	#
	# On Runtime initialization
	#
	echo "Program Name: $PROGRAM_NAME"
}

body()
{
	#
	# Main function to run
	#
	argv=("$@")
	argc="${#argv[@]}"

	# Generate Menu using the package array
	menu_Test1
}

function END()
{
    line=""
    read -p "Pause" line
}

function main()
{	
	body "$@"
}

if [[ "${BASH_SOURCE[@]}" == "${0}" ]]; then
    # START
    init
	main "$@"
    END
fi

