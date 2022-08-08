# (E)mail/SMTP Server - Postfix

## Information

+ Package Name : postfix
- Mail Formats
	+ Mbox (Default)
	+ Maildir

### DESCRIPTION
```
postfix is a SMTP server implementation such as Samba is for NAS Network File Sharing Server/Network Shared Drives
```

## Setup

### Pre-Requisites

### Dependencies

### Installation
- Using package manager
	- Ubuntu-based (apt)
		+ postfix is available in the default Ubuntu repositories
			```console
			sudo apt install postfix
			```
	- Arch-based
		```console
		sudo pacman -S postfix
		```

### Setting up

#### Folder Structure
> Create the folder structure according to your choice 
- Maildir
	- Maildir directory structure
		+ $HOME/Maildir/cur : Current Mails
		+ $HOME/Maildir/new : New Mails
 		+ $HOME/Maildir/tmp : Temporary Mails/Drafts

#### Configure Postfix usage
- Configure Postfix to use Maildir
	- Set Mailbox Command
		```console
		sudo postconf -e mailbox_command=
		```
	
	- Set Mailbox Home Directory
		```console
		sudo postconf -e home_mailbox=Maildir/
		```

- Reload Postfix config
	```console
	sudo postfix reload
	```

#### Testing initial Installation
> Check that it can start and is running ok

- Check Postfix processes
	```console
	ps aux | grep postfix
	```

- Check Postfix Service
	- Using service
		```console
		sudo service postfix status
		```
	- Using systemctl
		```console
		sudo systemctl status postfix
		```

- Check that server is listening on port 25 (SMTP)
	```console
	netstat -aln | grep 25
	```

- Check that our SMTP server is up and listening to the world
	- Use a free web-based tool
		- Test Email Server
			+ [mxtoolbox SuperTool](https://mxtoolbox.com/SuperTool.aspx#)

- If the above are OK
	+ The basic Postfix email server is up, listening and can send mail

## Post-Setup

### Security

### Finishing Touches
- How to configure a DNS Server for the email and port-forwarding the DNS Server
	+ Refer to : DNS Setup for Mail Server

## Documentation

### Commands
+ postfix : Main postfix application
+ postconf : for Postfix Configurations

### Synopsis/Syntax

- Running postfix
	```console
	sudo postfix {action} [arguments]
	```

- Postfix Configurations
	```
	sudo postconf {options} [arguments]
	```

### Parameters

#### postfix
+ start : Start Postfix
+ stop : Stop Postfix
+ restart : Restart Postfix
+ reload : Reload postfix config
+ status : Check postfix status

#### postconf
+ -e [settings]=[value]
	- Settings
		+ mailbox_command=[command-to-run] : Command to run in mailbox
		+ home_mailbox=[mailbox-home-path] : Set Mailbox Home directory

### Usage

- Modify Postfix config programatically
	```console
	sudo postconf
	```

- Check postfix status
	```console
	sudo postfix status
	```

## Customization and Configuration

### Config Files
+ /etc/aliases
+ /etc/postfix/main.cf
+ /etc/postfix/master.cf

## Resources
+ [mxtoolbox](https://mxtoolbox.com/SuperTool.aspx#)

## References
+ [gmass - Linux SMTP Server](https://www.gmass.co/blog/smtp-server-linux/)

## Tools
### Email Clients
+ Mutt : Command-line Email Client

### DDNS Server/Service Providers
+ DuckDNS

## Remarks
