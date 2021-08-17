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
# Mount device partitions to mount path
mount $device2	/mnt/debinst
mount $device1	/mnt/debinst/boot
mount $device3	/mnt/debinst/home

# Temporarily copy mounted fstab
cp /etc/mtab	/mnt/debinst/etc/mtab

# Temporarily loan devices from host
mount -o bind /dev 	/mnt/debinst/dev
mount -o bind /proc	/mnt/debinst/proc
mount -o bind /sys	/mnt/debinst/sys

# --- Output