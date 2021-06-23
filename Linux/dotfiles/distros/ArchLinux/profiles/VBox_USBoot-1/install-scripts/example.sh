#
# Distro Installer - Example
# Author: Asura
# Created: 2021-06-22 1607H, Asura
# Modified: 
#	- 2021-06-22 1607H, Asura
#	- 2021-06-22 2112H, Asura
#	- 2021-06-22 2136H, Asura
# 	- 2021-06-22 2153H, Asura
#	- 2021-06-23 1403H, Asura
# Features: 
# Background Information: 
#	Example script
# 	all-in-one paragraph install script to test
# 	the functions
# Changelog:
#	- 2021-06-22 1607H, Asura : 
#		- Created script file
#	- 2021-06-22 2112H, Asura :
#		- Added quotation marks in line 127 - 131
#		- Fixed typo : ' timedatct -> timedatectl '
#	- 2021-06-22 2136H, Asura :
#		- Added completion comments
#	- 2021-06-22 2153H, Asura : 
#		- Begin to sanitize and make the program modular
#	- 2021-06-23 1404H, Asura :
#		- Fixed typo in bootloader - grub
# NOTE:
#	- Please do not run this without verifying very carefully, the following details
#		1. Device name (i.e. /dev/sdX)
#

# --- Variables
PROGRAM_SCRIPTNAME="example"
PROGRAM_NAME="Example Install script"
PROGRAM_TYPE="Main"
MODE="DEBUG" # { DEBUG | RELEASE }
DISTRO="ArchLinux" # { ArchLinux | Debian | NixOS | Void Linux | Gentoo }

# --- Functions

# General Functions

# Main functions
init()
{
	#
	# On Runtime initialization
	#	- When program initialized
	#
	echo "Program Name: $PROGRAM_NAME"
	echo "Running on  : $DISTRO"
}

body()
{
	#
	# Main function to run
	#

	# --- Input

	# Command Line Arguments
	argv=("$@")
	argc="${#argv[@]}"

	# Local Variables
	dev_Name=/dev/sdb
	architecture="i386-pc"
	bootloader="grub"

	# --- Processes

	echo "# ======================== #"
	echo "# Stage 1 : Check internet #"
	echo "# ======================== #"
	ping -c 5 8.8.8.8 # Make 5 connections, if successful - return 0
	res="$?"
	case "$res" in
		"0") 
			# Success
			echo "Internet is up"
			;;
		*)
			# Error
			echo "Error with internet, activating dhcpcd..."
			sudo dhcpcd
			;;
	esac

	echo "# ========================== #"
	echo "# Stage 2 : Verify boot mode #"
	echo "# ========================== #"
	efivars="$(ls /sys/firmware/efi/efivars)"
	case "$efivars" in
		"0")
			# Success
			echo "Boot Mode: EFI"
			;;
		*)
			# Error
			echo "Boot Mode: MBR"
			;;
	esac

	echo ""

	echo "# ========================== #"
	echo "# Stage 3 : Set System Clock #"
	echo "# ========================== #"
	timedatectl set-ntp true
	timedatectl status

	echo ""

	echo "# ====================== #"
	echo "# Stage 4 : Partitioning #"
	echo "# ====================== #"
	parted $dev_Name mklabel msdos
	echo "Disk Label: [msdos] Created"
	parted $dev_Name mkpart primary ext4 0% 1024MiB
	echo "Partition 1: Created."
	mkfs.ext4 "$dev_Name"1
	echo "Partition 1: Formatted to ext4"
	parted $dev_Name set 1 boot on
	echo "Partition 1: Bootable Enabled"
	echo "Partition 1 Completed."
	parted $dev_Name mkpart primary ext4 1024MiB 32768MiB
	echo "Partition 2: Created."
	mkfs.ext4 "$dev_Name"2
	echo "Partition 2: Formatted to ext4"
	echo "Partition 2 Completed."
	parted $dev_Name mkpart primary ext4 32768MiB 100%
	echo "Partition 3: Created." 
	mkfs.ext4 "$dev_Name"3
	echo "Partition 3: Formatted to ext4"
	echo "Partition 3 Completed."
	echo "======================="
	echo "Partitioning Completed."
	echo "======================="

	echo ""

	echo "# ===================== #"
	echo "# Stage 5 : Mount Disks #"
	echo "# ===================== #"
	mount "$dev_Name"2 /mnt
	mkdir -p /mnt/home
	mkdir -p /mnt/boot/grub
	mount "$dev_Name"1 /mnt/home
	mount "$dev_Name"3 /mnt/boot
	echo "======================"
	echo "Disk Mounted"
	echo " "$dev_Name"1 : /mnt/boot"
	echo " "$dev_Name"2 : /mnt"
	echo " "$dev_Name"3 : /mnt/home"
	echo "======================"

	echo ""

	echo "# ================== #"
	echo "# Stage 6 : pacstrap #"
	echo "# ================== #"
	pacstrap /mnt base linux linux-firmware nano vim base-devel networkmanager linux-lts linux-lts-headers
	echo "==============================="
	echo "Package strapped to mount point"
	echo "==============================="
	
	echo ""

	echo "# ======================== #"
	echo "# Stage 7 : Generate Fstab #"
	echo "# ======================== #"
	genfstab -U /mnt >> /mnt/etc/fstab
	echo "============================"
	echo "File Systems Table Generate."
	echo "============================"

	echo ""

	echo "# ================ #"
	echo "# Stage 8 : Chroot #"
	echo "# ================ #"

	arch-chroot /mnt /bin/bash -c "echo \"# ================================= #\""
	arch-chroot /mnt /bin/bash -c "echo \"# 8.i. Symlink Regional locale time #\""
	arch-chroot /mnt /bin/bash -c "echo \"# ================================= #\""
	arch-chroot /mnt /bin/bash -c "ln -sf /usr/share/zoneinfo/Asia/Singapore /etc/localtime"
	
	arch-chroot /mnt /bin/bash -c "echo \"# ==================================== #\""
	arch-chroot /mnt /bin/bash -c "echo \"# 8.ii. Set hardware clock (sync time) #\""
	arch-chroot /mnt /bin/bash -c "echo \"# ==================================== #\""
	arch-chroot /mnt /bin/bash -c "hwclock --systohc"
	
	arch-chroot /mnt /bin/bash -c "echo \"# ================= #\""
	arch-chroot /mnt /bin/bash -c "echo \"# 8.iii. Set Locale #\""
	arch-chroot /mnt /bin/bash -c "echo \"# ================= #\""
	arch-chroot /mnt /bin/bash -c "echo \"Locale: en_SG.UTF-8\""
	# arch-chroot /mnt /bin/bash -c "vim /etc/locale.gen" # --- Removed to Test out line 176
	arch-chroot /mnt /bin/bash -c "sed -i '/en_SG.UTF-8/s/^#//g' /etc/locale.gen"
	arch-chroot /mnt /bin/bash -c "locale-gen"
	arch-chroot /mnt /bin/bash -c "echo \"LANG=en_SG.UTF-8\" | tee -a /etc/locale.conf"
	
	arch-chroot /mnt /bin/bash -c "echo \"# =============================== #\""
	arch-chroot /mnt /bin/bash -c "echo \"# 8.iv. Set Network Configuration #\""
	arch-chroot /mnt /bin/bash -c "echo \"# =============================== #\""
	arch-chroot /mnt /bin/bash -c "echo \"ArchLinux\" | tee -a /etc/hostname"
	arch-chroot /mnt /bin/bash -c "echo \"127.0.0.1 localhost\" | tee -a /etc/hosts"
	arch-chroot /mnt /bin/bash -c "echo \"::1       localhost\" | tee -a /etc/hosts"
	arch-chroot /mnt /bin/bash -c "echo \"127.0.1.1 ArchLinux.localdomain ArchLinux\" | tee -a /etc/hosts"
	
	arch-chroot /mnt /bin/bash -c "echo \"# ==================================== #\""
	arch-chroot /mnt /bin/bash -c "echo \"# 8.v. Make Initial Ramisk Environment #\""
	arch-chroot /mnt /bin/bash -c "echo \"# ==================================== #\""
	arch-chroot /mnt /bin/bash -c "mkinitcpio -P"

	arch-chroot /mnt /bin/bash -c "echo \"# ========================== #\""
	arch-chroot /mnt /bin/bash -c "echo \"# 8.vi. Change Root Password #\""
	arch-chroot /mnt /bin/bash -c "echo \"# ========================== #\""
	arch-chroot /mnt /bin/bash -c "passwd"
	
	case "$bootloader" in
		"grub")
			arch-chroot /mnt /bin/bash -c "echo \"# ========================= #\""
			arch-chroot /mnt /bin/bash -c "echo \"# echo \"Bootloader: Grub\" #\""
			arch-chroot /mnt /bin/bash -c "echo \"# ========================= #\""
			arch-chroot /mnt /bin/bash -c "sudo pacman -S grub"
			arch-chroot /mnt /bin/bash -c "grub-install --target=$architecture --debug $dev_Name"
			arch-chroot /mnt /bin/bash -c "grub-mkconfig -o /boot/grub/grub.cfg"
			;;
		*)
			echo "Invalid Bootloader"
			;;
	esac
	echo "==========================="
	echo "Chroot processes completed."
	echo "==========================="

	echo ""

	echo "# =========================== #"
	echo "# Stage 9 : Post-Installation #"
	echo "# =========================== #"
	# TBC

	echo ""

	echo "================================"
	echo "ArchLinux Installation Complete."
	echo "Please Restart your Computer."
	echo "================================"

	# --- Output
}

function END()
{
    line=""
    read -p "Pause" line
}

function main()
{
	#
	# Main Function 
	#  - You may not edit this if you want to leave it as default
	#

	body "$@"
	res="$?"
	echo "$res"
}

if [[ "${BASH_SOURCE[@]}" == "${0}" ]]; then
    # START
    init
	main "$@"
    END
fi

