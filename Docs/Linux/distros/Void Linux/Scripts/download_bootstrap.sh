#########################################################################
# Download Bootstrap 													#
# - For all distro installations that require an external bootstrapper	#
#########################################################################

HOST_DISTRO="arch"
TARGET_DISTRO="debian"

case "$TARGET_DISTRO" in
	"Arch" | "arch")
		sudo pacman -S arch-install-scripts
		;;
	"Debian" | "debian")
		arr=($(wget --no-remove-listing -O /tmp/deboot.html -q http://ftp.us.debian.org/debian/pool/main/d/debootstrap && \
			grep 'all.deb' /tmp/deboot.html | \
			awk -F 'href' '{print $2}' | \
			cut -d '"' -f2))

		for row_id in "${!arr[@]}"; do
			echo "[$row_id] : ${arr[$row_id]}"
		done

		# Get user input
		read -p "Select version to use (please enter the id): " version_index
		version="${arr[$version_index]}"

		# Download 
		wget -P $PWD/debootstrap http://ftp.us.debian.org/debian/pool/main/d/debootstrap/$version
		;;
	*)
		;;
esac