: " 
Program Name: 
Project Name: Project Toolbox
Code Name: Code Wrapper
Background Information: 
	A chroot wrapper that will automatically mount based on the distribution
	- Preferably used for installation purposes
	Targeted to work much like arch-chroot for multiple distros
Features
	- Dynamically change vfs binding methods according to distro
Author: Asura
Created On: 2021-09-09 0755H, Asura
"

### Command Line Arguments ###
root_mount_point="${1:-/mnt}"


### Functions ###
mount_part()
{
	### Mount all partitions ###

	device_Name="$1"
	root_mount_point=${2:-"/mnt"}
	other_mount_points=${@:3}

	# Mount Root Partition
	mount "$device_Name"1 "$root_mount_point"

	# Mount Other Partitions	
}

mount_virtual_file_systems()
{
	### Mount all Virtual File Systems ###

	# Local Variables
	root_mount_point=${1:-"/mnt"}

	# Mount Devices	
	mount --rbind /dev "$root_mount_point"/dev
	mount --make-rslave "$root_mount_point"/dev

	# Mount processes	
	mount --rbind /proc "$root_mount_point"/proc
	mount --make-rslave "$root_mount_point"/proc

	# Mount system
	mount --rbind /sys "$root_mount_point"/sys
	mount --make-rslave "$root_mount_point"/sys
}

copy_dns_configs()
{
	### Copy DNS Configurations from host to root ###

	# Local Variables
	root_mount_point=${2:-"/mnt"}

	cp /etc/resolv.conf "$root_mount_point"/etc
}

change_root()
{
	### Change Root ###
	# Local Variables
	root_mount_point=${1:-"/mnt"}
	shell=${2:-"/bin/bash"}

	chroot "$root_mount_point" $shell
}

main()
{
	args=("$@")

	# Print Arguments
	for row_id in "${!args[@]}"; do
		echo "[$row_id] : [${args[$row_id]}]"
	done
}

if "${BASH_SOURCE[0]}" == "${0}"; then
	main "$@"
fi