#################################################################################
# Setup Debootstrap 								#
#	- Prepare and setup debootstrap to use for installing Debian		#
#										#
# :: Info									#
#	Author: Asura								#
#	Created On: 2021-08-16 13:59H, Asura					#
# :: Modified On								#
#	- 2021-08-16 13:59H, Asura						#
#	- 2021-08-30 00:17H, Asura						#
# :: Changelogs									#
#	- 2021-08-16 13:59H, Asura						#
#		- Created script						#
#	- 2021-08-30 00:17H, Asura						#
#		- Added 'Download archive' section				#
#			- Automatically get all versions to choose and download	#
#################################################################################

# --- Input
original=$PWD

### Debootstrap variables
pkgs=linux-image-amd64,grub-pc,locales
architecture=amd64
release=unstable
mount_point=/mnt/debinst
mirror=http://ftp.us.debian.org/debian

# --- Functions
dl_archive()
{
	# Download archive
	arr=($(wget --no-remove-listing -O /tmp/deboot.html -q http://ftp.us.debian.org/debian/pool/main/d/debootstrap && grep 'all.deb' /tmp/deboot.html | awk -F 'href' '{print $2}' | cut -d '"' -f2))
	
	for row_id in "${!arr[@]}"; do
		echo "[$row_id] : ${arr[$row_id]}"
	done

	read -p "Select version to use (please enter the id): " version_index
	version="${arr[$version_index]}"
	wget -P $PWD/debootstrap http://ftp.us.debian.org/debian/pool/main/d/debootstrap/$version
}


# --- Body
# Download Archive
dl_archive

# Extract .deb archive
ar -vx $version

# Change to root
cd /

# Extract data.tar.gz to folders
sudo zcat $original/data.tar.gz | sudo tar xv

# Append sbin to path
PATH+=:/usr/sbin

# Run debootstrap
sudo debootstrap \
	--include $pkgs \
	--arch $architecture \
	$release \
	$mount_point \
	$mirror

# --- Output