#
# Command Line / Terminal Package Installer
# Author: Asura
# Created: 2021-06-06 2110H, Asura 
# Modified: 
#	- 2021-06-06 2110H, Asura
#	- 2021-06-06 2313H, Asura
#	- 2021-06-06 2320H, Asura
#	- 2021-06-07 0011H, Asura
#	- 2021-06-10 1026H, Asura
#	- 2021-06-15 0055H, Asura
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
#	2021-06-06 2313H, Asura
#		- Edited structure of code
#		- Made file portable & modular
#	2021-06-06 2320H, Asura
#		- Renamed script from [pkg_installer.sh] -> [clipkger.sh]
#	2021-06-07 0011H, Asura
#		- Added help function
#		- Added Command Line features
#	2021-06-10 1026H, Asura
#		- Added logging feature
#	2021-06-15 0055H, Asura
#		- Added Documentations
#		- Fixed install function
#

# --- Variables

# [Program]
PROGRAM_SCRIPTNAME="clipkger"
PROGRAM_NAME="Command-Terminal Interface (CTI) Package Installer"
PROGRAM_TYPE="Main"

# [Default]
logging_filePath=~/.logs/clipkger

# [Global]
PKGMGR="pacman"
selected_Packages=""

# [Arrays]
pkgs=(
	# Edit this
	# - Place your files here
	"xterm"
	# Key Options
	"select-others" # Other Packages outside of the stated
	"select-end"	# To end the selection
	"select-show"	# To show all selected packages
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
			[update]="sudo pacman -Sy"
			[upgrade]="sudo pacman -Su"
			[update-and-upgrade]="sudo pacman -Syu"
			[exit]="exit"
		)
		;;
	"aptitude")
		declare -A pkg_controls=(
			[install]="sudo apt-get install $selected_pkg_Name"
			[remove]="sudo apt-get"
			[uninstall]="sudo apt-get uninstall "
			[update]="sudo apt-get update"
			[upgrade]="sudo apt-get upgrade"
			[update-and-upgrade]="sudo apt-get update upgrade"
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

					# Handle the selected package
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
						"select-others")
							# Other packages
							read -p "Package Name: " other_Pkgs
							if [[ ! "$selected_Packages" == *"$other_Pkgs"* ]]; then
								selected_Packages+="$other_Pkgs "
							else
								echo "Package is already selected."
							fi
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

menu_package_Control()
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

			# Check selected command
			case "$cmd" in
				"update" | "upgrade" | "update-and-upgrade")
					# If is either Update, Upgrade or Update & Upgrade
					# Just activate
					$selected_Command
					break
					;;
				*)
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
								elif [[ "$selected_pkg_Name" == "select-others" ]]; then
									read -p "Package Name: " other_pkgs
									if [[ ! "$selected_Packages" == *"$other_pkgs"* ]]; then
										selected_Packages+="$other_pkgs "
									else
										echo "Package is already selected."
									fi
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
					;;
			esac
			selected_Command=""
			selected_Packages=""
		else
			echo "No Input"
			echo ""
		fi
	done
}

prog_Help()
{
	#
	# Help function
	#	Edit Accordingly
	#
	echo "[Syntax]"
	echo " > $0 { -i | -r | -u | -Upd | -Upg | -Updg | -h } <package_name>"
	echo " > $0 { --install | --remove | --uninstall | --update | --upgrade | --update-and-upgrade | --help } <package_name>"
	echo "[Parameters]"
	echo "	{ --install           	| -i    } : Install package"
	echo "	{ --remove   	        | -r    } : Remove package"
	echo "	{ --uninstall           | -u    } : Uninstall package"
	echo "	{ --update              | -Upd  } : Update system"
	echo "	{ --upgrade             | -Upg  } : Upgrade system"
	echo "	{ --update-and-upgrade	| -Updg	} : Update and Upgrade system"
	echo "	{ --help                | -h    } : Help"
}

# General Functions
init()
{
	#
	# On Runtime initialization
	#

	# Check If folder exists; 
	# If not: Create
	if [[ ! -d $logging_filePath ]]; then
		mkdir -p $logging_filePath
	fi

	echo "Program Name: $PROGRAM_NAME"
}

body()
{
	#
	# Main function to run
	#
	argv=("$@")
	argc="${#argv[@]}"

	# --- Command Line Interface Feature Implementation
	# Generate Menu using the package array
	option="${argv[0]}"
	package_Name="${argv[1]}"
	package_Controls=""
	if [[ ! "$option" == "" ]]; then # &&
		echo "Option: $option"

		# Switch case option
		case "$option" in
			"--install" | "-i" )
				# Install
				echo "Install [$package_Name]"
				package_Controls="${pkg_controls["install"]}"
				
				if [[ ! "$package_Name" == "" ]]; then
					# Data Validation: (Option AND package name) NOT Null/Empty Value
					package_Controls+="--noconfirm --needed $package_Name"
					echo "Command: $package_Controls"
					$package_Controls | tee -a $logging_filePath/packages_installation.log
					ret_code="$?"
					echo "Return Code: $ret_code"
					echo "$(date +'%y/%m/%d %H_%M_%S')" : $package_Name >> $logging_filePath/packages_installed.log
				else
					echo "	Package name not provided."
				fi
				;;
			"--remove" | "-r" )
				# Remove Package
				echo "Remove [$package_Name]"
				package_Controls="${pkg_controls["remove"]}"
				if [[ ! "$package_Name" == "" ]]; then
					# Data Validation: (Option AND package name) NOT Null/Empty Value
					package_Controls+="$package_Name"
					echo "Command: $package_Controls"
					$package_Controls
					ret_code="$?"
					echo "Return Code: $ret_code"
					echo "$(date +'%y/%m/%d %H_%M_%S')" : $package_Name >> $logging_filePath/packages_removed.log
				else
					echo "	Package name not provided."
				fi
				;;
			"--uninstall" | "-u" )
				# Uninstall Package
				echo "Uninstall [$package_Name]"
				package_Controls="${pkg_controls["uninstall"]}"
				if [[ ! "$package_Name" == "" ]]; then
					# Data Validation: (Option AND package name) NOT Null/Empty Value
					package_Controls+="$package_Name"
					echo "Command: $package_Controls"
					$package_Controls
					ret_code="$?"
					echo "Return Code: $ret_code"
					echo "$(date +'%y/%m/%d %H_%M_%S')" : $package_Name >> $logging_filePath/packages_uninstalled.log
				else
					echo "	Package name not provided."
				fi
				;;
			"--update" | "-Upd" )
				# Update System
				echo "Update System"
				package_Controls="${pkg_controls["update"]}"
				$package_Controls
				echo "Command: $package_Controls"
				ret_code="$?"
				echo "Return Code: $ret_code"
				echo "$(date +'%y/%m/%d %H_%M_%S')" : $(pacman -Qu) >> $logging_filePath/packages_updated.log
				;;
			"--upgrade" | "-Upg" )
				# Upgrade System
				echo "Upgrade System"
				package_Controls="${pkg_controls["upgrade"]}"
				echo "$(date +'%y/%m/%d %H_%M_%S')" : $(pacman -Qu) >> $logging_filePath/packages_upgraded.log
				$package_Controls
				echo "Command: $package_Controls"
				ret_code="$?"
				echo "Return Code: $ret_code"
				;;
			"--update_and_upgrade" | "-Updg" )
				# Upgrade System
				echo "Update and Upgrade System"
				package_Controls="${pkg_controls["update-and-upgrade"]}"
				$package_Controls
				echo "Command: $package_Controls"
				ret_code="$?"
				echo "Return Code: $ret_code"
				echo "$(date +'%y/%m/%d %H_%M_%S')" : $(pacman -Qu) >> $logging_filePath/packages_updated_and_upgraded.log
				;;
			"--help" | "-H")
				# Help
				echo "Help"
				prog_Help
				;;
			*)
				echo "Invalid Option"
				;;
		esac
	else
		menu_package_Control
	fi
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

