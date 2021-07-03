#
# Distro Installer - Example
# Author: Asura
# Created: 2021-06-22 1607H, Asura
# Modified: 
#	- 2021-06-22 1607H, Asura
#	- 2021-06-22 2112H, Asura
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
	argv=("$@")
	argc="${#argv[@]}"


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

	echo "# ========================== #"
	echo "# Stage 3 : Set System Clock #"
	echo "# ========================== #"
	timedatectl set-ntp true
	timedatectl status

	echo "# ====================== #"
	echo "# Stage 4 : Partitioning #"
	echo "# ====================== #"
	parted /dev/sdb mklabel msdos
	parted /dev/sdb mkpart primary ext4 0% 1024MiB
	mkfs.ext4 /dev/sdb1
	parted /dev/sdb set 1 boot on
	parted /dev/sdb mkpart primary ext4 1024MiB 32768MiB
	mkfs.ext4 /dev/sdb2
	parted /dev/sdb mkpart primary ext4 32768MiB 100%
	mkfs.ext4 /dev/sdb3

	echo "# ===================== #"
	echo "# Stage 5 : Mount Disks #"
	echo "# ===================== #"
	mount /dev/sdb2 /mnt
	mkdir -p /mnt/home
	mkdir -p /mnt/boot/grub
	mount /dev/sdb1 /mnt/home
	mount /dev/sdb3 /mnt/boot

	echo "# ================== #"
	echo "# Stage 6 : pacstrap #"
	echo "# ================== #"
	pacstrap /mnt base linux linux-firmware nano vim base-devel networkmanager linux-lts linux-lts-headers

	echo "# ======================== #"
	echo "# Stage 7 : Generate Fstab #"
	echo "# ======================== #"
	genfstab -U /mnt >> /mnt/etc/fstab

	echo "# ================ #"
	echo "# Stage 8 : Chroot #"
	echo "# ================ #"
	arch-chroot /mnt /bin/bash -c "ln -sf /usr/share/zoneinfo/Asia/Singapore /etc/localtime"
	arch-chroot /mnt /bin/bash -c "hwclock --systohc"
	arch-chroot /mnt /bin/bash -c "vim /etc/locale.gen"
	arch-chroot /mnt /bin/bash -c "locale-gen"
	arch-chroot /mnt /bin/bash -c "echo \"LANG=en_SG.UTF-8\" | tee -a /etc/locale.conf"
	arch-chroot /mnt /bin/bash -c "echo \"ArchLinux\" | tee -a /etc/hostname"
	arch-chroot /mnt /bin/bash -c "echo \"127.0.0.1 localhost\" | tee -a /etc/hosts"
	arch-chroot /mnt /bin/bash -c "echo \"::1       localhost\" | tee -a /etc/hosts"
	arch-chroot /mnt /bin/bash -c "echo \"127.0.1.1 ArchLinux.localdomain ArchLinux\" | tee -a /etc/hosts"
	arch-chroot /mnt /bin/bash -c "mkinitcpio -P"
	arch-chroot /mnt /bin/bash -c "passwd"
	arch-chroot /mnt /bin/bash -c "sudo pacman -S grub"
	arch-chroot /mnt /bin/bash -c "grub-install --target=i386-pc --debug /dev/sdb"
	arch-chroot /mnt /bin/bash -c "grub-mkconfig -o /boot/grub/grub.cfg"

	echo "# =========================== #"
	echo "# Stage 9 : Post-Installation #"
	echo "# =========================== #"
	# TBC
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

