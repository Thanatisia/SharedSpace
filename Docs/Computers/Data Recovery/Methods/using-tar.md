# Data Recovery and Data Backup with tar

These are documentations, tips and tricks and some methods of Data Backup and Data Recovery

This document is for data recovery and data backup with tar

<b>
Please ensure that you backup your files periodically and/or if you see any weird artefacts happening on a day-to-day basis, such as
- Blue Screen of Death
- Slowdowns
- Inability to start operating system etc.
</b>

## Informatiin

For more info, please refer to my document [SharedSpace/Docs/Linux/Commands/tar]

## Basics

### To compress your files for backup
```
-c : Compress
-v : Verbose
-f : Force
```

tar -cvzf [target-path] [* | {list-of-folders-to-add}]

### To extract your compressed backup file

tar -xvzf [target-path]

## Ideas and Suggestions

### backup and recovery to an external device
```
When you connect an external device to your target system to backup
- Useful for
	- intermittent backup and recovery and data integrity
```

- Connect the external device you would like to backup to

- Get device name and label of target device to mount
	```console
	lsblk
	```

- Mount external device
	```console
	sudo mount [mount-path] [mount-device]
	```

- Change directory to root drive
	```console
	cd /
	```

- Compress the folders you want to backup into a backup file in the device
	```
	tar -cvzf [mount-path]/backup.bak.tar.gz [folders to compress...]
	```
	- Default: Home and Boot partition
		```console
		tar -cvzf [mount-path]/backup.bak.tar.gz /boot /home	
		```

- Extract the backup file in your new device
	```
	tar -xvzf [moount-path]/backup.bak.tar.gz
	```

### backup and recovery from another system
```
When you connect your target system to backup to another operating system
- Useful for when 
	- you dont want the target to do any read-writing or
	- system has issues and you dont want to do anything that may risk system crash but still operable
```
- Connect the target system device

- Get device name and label of target device to mount
	```console
	lsblk
	```
- Mount target system
	```console
	sudo mount [mount-path] [mount-device]
	```

- Change directory to mount path
	```console
	cd /
	```

- Compress the files in the mounted target system into your current system
	```
	tar -cvzf ~/backup.bak.tar.gz [mount_path]/*
	```
	- Default: Home and Boot partition
		```console
		tar -cvzf ~/backup.bak.tar.gz [mount_path]/home [mount_path]/boot
		```

- Extract the backup file in your new device
	```
	tar -xvzf ~/backup.bak.tar.gz
	```

- Using tar command over ssh
    - SSH into a remote machine and tar compress the specified folder/files, and output the backup file in your local machine
        ```console
        ssh [username]@[domain-or-ip] tar -cvzf - [directories-or-files] > destination/file.tar.gz
        ```
    - SSH into a remote machine and tar extract a tar file into the remote machine
        ```console
        cat source/file.tar.gz | ssh [username]@[domain-or-ip] 'tar -xvzf - -C destination/file.tar.gz'
        ```

## Resources

## References
+ [Cyberciti - How to use tar command through network over SSH session](https://www.cyberciti.biz/faq/howto-use-tar-command-through-network-over-ssh-session/)

## Remarks
