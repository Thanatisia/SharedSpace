# Docker - Setup

## Setup
### Pre-Requisites
- Update your package manager
	- Debian-based (apt)
		```console
		sudo apt update && sudo apt upgrade
		```
	- Arch-based (pacman)
		```console
		sudo pacman -Syu
		```

- If you are using Debian-based (apt)
	- Download the GPG key
		```console
		curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
		```
	- Add the following repository into the apt list
		+ deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable
			```console
			sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
			```

### Dependencies

### Installing
- If you are using a Package Manager
	- Debian-based (apt)
		```console
		sudo apt install docker-ce docker-ce-cli containerd.io
		```
	- Arch-based (pacman)
		```console
		sudo pacman -S docker
		```

### Post Installation

#### To run Docker as a regular user
+ By default, you can run Docker only as root
- Create docker group
	```console
	groupadd docker
	```
- Add yourself to the docker group
	```console
	# Add user to a supplementary group 'docker'
	usermod -aG docker [your-username]

	# or
	gpasswd -a [your-username] docker
	```

#### To change location of Docker images
- If you are using SystemD
	- Stop the Docker Daemon
		```console
		systemctl stop docker.service
		```

	- (OPTIONAL) Move images to the target destination (if any)
		```console
		sudo mv /var/lib/docker/* [target-destination]
		```

	- Add the following parameters to the ExecStart in */etc/systemd/system/docker.service.d/docker-storage.conf*
		```console
		ExecStart=/usr/bin/dockerd --data-root=/path/to/new/location/docker -Hfd://
		```

	- Start the Docker Daemon
		```console
		systemctl start docker.service
		```