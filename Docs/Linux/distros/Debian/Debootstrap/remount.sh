#################################
# Remounting build in Installer #
#################################

# --- Input

### Command Line Variables ###

: " 1. Your Device
Syntax:
	/dev/sdX

Examples:
	/dev/sda | /dev/sdb
"
device=${1:-""}

: " 2. Your Distro
Options:
	Debian: Debootstrap installer	(debootstrap)
	Arch  : ArchLinux installer	(pacstrap)
"
distro=${2:-""}	


# --- Processing
###################
# Data Validation #
###################
if [[ "$device" == "" ]]; then
	# Empty, set to command line input
	read -p "Device Name [ /dev/sdX ]: " device
fi

#################
# Mount Devices #
#################

: "
- Switch case distro and 
- mount according to distro
"
case "$distro" in
	"Debian")
		# Mount device partitions to mount path
		sudo mount "$device"2		/mnt/debinst
		sudo mount "$device"1		/mnt/debinst/boot
		sudo mount "$device"3		/mnt/debinst/home

		# Temporarily copy mounted fstab
		sudo cp /etc/mtab		/mnt/debinst/etc/mtab

		# Temporarily loan devices from host
		sudo mount -o bind /dev 	/mnt/debinst/dev
		sudo mount -o bind /proc	/mnt/debinst/proc
		sudo mount -o bind /sys		/mnt/debinst/sys
		;;
	"Arch")
		# Mount in Arch ISO
		mount $device2 /mnt
		mount $device1 /mnt/boot
		mount $device3 /mnt/home
		;;
	*)
		# Unknown distros
		echo "Unknown Distro [$distro]"
		;;
esac

# --- Output