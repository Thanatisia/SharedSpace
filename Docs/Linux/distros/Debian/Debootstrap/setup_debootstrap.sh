#####################
# Setup Debootstrap #
#####################

original=$PWD
fldr=$original/debootstrap
version=$fldr/debootstrap_*.*.*_all.deb

### Debootstrap variables
pkgs=linux-image-amd64,grub-pc,locales
architecture=amd64
release=unstable
mount_point=/mnt/debinst
mirror=http://ftp.us.debian.org/debian

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

