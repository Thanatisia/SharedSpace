# The XDG Base Specifications

## Information

### DESCRIPTION
```
A set of default environment variables defined to standardize the locations of specific filepaths for different use cases
```

### Rundown
+ an XDG default variable has the prefix of *XDG_[Environment Variable]*

## XDG Base Directories
### XDG User Directories
- XDG_CONFIG_HOME: 
	+ Default to $HOME/.config
	+ To contain user-specific configuration files
	+ Similar to /etc
- XDG_CACHE_HOME: 
	+ Default to $HOME/.cache
	+ To contain user-specific non-essential (Cached) data
	+ Similar to /var/cache
- XDG_DATA_HOME: 
	+ Default to $HOME/.local/share; 
	+ To contain user-specific data files
	+ Similar to /usr/share
- XDG_STATE_HOME: 
	+ Default to $HOME/.local/state; 
	+ To contain user-specific state files; 
	+ Similar to /var/lib
- XDG_RUNTIME_DIR:
	+ pam_systemd sets this to /run/user/$UID 
	+ To contain user-specific, non-essential data files such as sockets, named pipes etc
	+ Does not require a default value; Warnings should be issued if not set or equivalents provide
	- Rules	
		+ Must be owned by the user with access mode 0700
		+ Must be on the local filesystem
		+ Filesystem fully featured by standards of Operating System
	- Information
		+ May be subjected to periodic cleanup
		+ Modified every 6 hours or set sticky-bit if persistence is desired
		+ Can only exist for the duration of the user's login
		+ Should not store large files - May be mounted as tmpfs

### XDG System Directories
- XDG_DATA_DIRS
	+ Default to /usr/local/share:/usr/share
	+ List of directories seperated by colon-delimited ':'
	+ Similar to $PATH
- XDG_CONFIG_DIRS
	+ Default to /etc/xdg
	+ List of directories seperated by colon-delimited ':'
	+ Similar to $PATH

## Examples
> Example filepaths of programs
- ALSA
	+ Alsa RC : ~/.asoundrc => $XDG_CONFIG_HOME/alsa/asoundrc
- Android Studio
	+ Android Studio Config : ~/.AndroidStudioX.X => $XDG_CONFIG_HOME/Google/AndroidStudioX.X
	+ Android Studio Data : ~/.AndroidStudioX.X => $XDG_DATA_HOME/Google/AndroidStudioX.X
	+ Android Studio Cache : ~/.AndroidStudioX.X => $XDG_CACHE_HOME/Google/AndroidStudioX.X


## Resources

## References
+ [ArchWiki - XDG Base Directory](https://wiki.archlinux.org/title/XDG_Base_Directory)

## Remarks
