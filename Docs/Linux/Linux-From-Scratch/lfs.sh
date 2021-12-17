: "
LFS Install script
	- At the moment, it is a all-in-one run through script

[Information]
Created: 2021-11-16 13:34H
Author: Asura
Modify and Updated as of:
	2021-11-16 13:34H, Asura
"

[Table of Contents]
Designs
	- File System
		- Partitions
Flow
Steps

[Designs]
# 1. File System
	# 1. Partitions
	================================================================================================================
	ROW_ID, partition_path, partition_name, partition_type, filesystem_type, start_size, end_size, bootable, others
	================================================================================================================
	1, /boot, Boot, Primary, ext4, 0%, 1024MiB, Bootable
	2, /,	  Root, Primary, ext4, 1024MiB, 50%
	3, /home, Home, Primary, ext4, 50%, 100%

# 2. Mounting
	# 1. Mount Path
	==========================================
	ROW_ID, mount_partition, mount_directory
	==========================================
	1, /dev/sdb1, $LFS/boot
	2, /dev/sdb2, $LFS
	3, /dev/sdb3, $LFS/home

[Flow]
# 1. Prepare Host System
	# Install Required Applications
	# - If your distro is 
		# ArchLinux
		sudo pacman -S
		# Debian
		sudo apt(-get) install  
		
# 2. Create File System
	sudo parted /dev/sdb mklabel msdos
	sudo parted /dev/sdb mkpart primary ext4 0% 1024MiB
	sudo parted /dev/sdb mkpart primary ext4 1024MiB 50%
	sudo parted /dev/sdb mkpart primary ext4 50% 100%
	sudo mkfs.ext4 /dev/sdb1
	sudo mkfs.ext4 /dev/sdb2
	sudo mkfs.ext4 /dev/sdb3
	sudo parted /dev/sdb set 1 boot on

# 3. Set $LFS variable
	export LFS=/mnt/lfs
	echo $LFS

# 4. Mount new partition
	mkdir -pv $LFS $LFS/boot $LFS/home
	mount /dev/sdb2 $LFS
	mount /dev/sdb1 $LFS/boot
	mount /dev/sdb3 $LFS/home

# 5. Update /etc/fstab in $LFS Root
	genfstab -U $LFS >> $LFS/etc/fstab

# 6. Create Working Directory
	mkdir -v $LFS/sources

# 7. Make Directory Writable + Sticky
	chmod -v a+wt $LFS/sources

# 8. Obtain Packages & Patches
	curl -L -O https://linuxfromscratch.org/lfs/view/stable/wget-list
	wget ---input-file=wget-list --continue --directory-prefix=$LFS/sources

# 9. Verify packages
	pushd $LFS/sources
		md5sum -c md5sums
	popd

# 10. Create limited directory layout in LFS Filesystem
	mkdir -pv $LFS{etc,var} $LFS/usr/{bin,lib,sbin}

# 11. Create symlink between usr/$i and $LFS/$i
	for i in bin lib sbin; do
		ln -sv usr/$i $LFS/$i
	done

# 12. Check for Machine Architecture
	case $(uname -m) in
		x86_64) mkdir -pv $LFS/lib64;;
	esac

# 13. Add user
	groupadd lfs
	useradd -s /bin/bash -g lfs -m -k /dev/null lfs

# 14. User Security
	passwd lfs
	chown -v lfs $LFS/{usr{,/},lib,var,etc,bin,sbin,tools}
	case $(uname -m) in 
		x86_64) chown -v lfs $LFS/lib64;;
	esac
	chown -v lfs $LFS/sources
	su - lfs

