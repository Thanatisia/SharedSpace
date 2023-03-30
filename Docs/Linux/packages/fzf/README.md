# Linux package: fzf

## Information
### Repository/Package Information
+ Repository Author: junegunn
+ Repository Name: fzf
- Repositories
	+ Github: https://github.com/junegunn/fzf

### Background
```
fzf is a general-purpose command line/terminal Fuzzy Finder created by junegunn.

It's an interactive Unix filter for command-line that can be used with any list; files, command history, processes, hostnames, bookmarks, git commits, etc.
```

### Components
+ fzf : Executable
+ fzf-tmux : Script for launching fzf in a tmux pane
+ Shell extensions
+ Vim/Neovim plugin

### fzf vs dmenu vs run
- fzf is like dmenu or rofi, a simple standard input processor, however
	* unlike dmenu or rofi which are graphical input textboxes, fzf works on the terminal so it will run in the background as long as the terminal stays up

## Setup
### Pre-Requisites
- (OPTIONAL) If you are building manually
	- If you are building fzf from an environment where its git information is not available
		+ Because Makefile uses git commands to determine the version and the revision information for `fzf --version`
		+ You have to manually set `$FZF_VERSION` and `$FZF_REVISION`
		```console
		FZF_VERSION=0.24.0 FZF_REVISION=tarball make
		```

### Dependencies
+ git : If using git to clone the repository
+ tmux : To open in a terminal
+ Go : minimum 1.17 or above

### Obtaining
- Using git
	- Clone repository
		+ Clone repository into '~/.fzf'
		```console
		git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
		```

### Building
- Using Makefile
	- Methods
		- Build fzf binary for your platform in target
			```console
			make
			```
		- Build fzf binary and copy it to the bin directory
			```console
			make install
			```
		- Build fzf binary and archives for all platforms using goreleaser
			```console
			make build
			```
		- Publish GitHub release
			```console
			make release
			```

### Installation
- Using manual installation
	- Install fzf inside repository
		```console
		~/.fzf/install
		```

- Using package manager
	- apk-based
		```console
		sudo apk add fzf
		```
	- apt-based
		```console
		sudo apt install fzf
		```
	- conda-based
		```console
		conda install -c conda-forge fzf
		```
	- dnf-based
		```console
		sudo dnf install fzf
		```
	- nix-based
		```console
		nix-env -iA nixpkgs.fzf
		```
	- pacman-based
		```console
		sudo pacman -S fzf
		```
	- pkg-based
		```console
		pkg install fzf
		```
	- pkgin-based
		```console
		pkgin install fzf
		```
	- pkg_add-based
		```console
		pkg_add fzf
		```
	- portage-based
		```console
		emerge --ask app-shells/fzf
		```
	- xbps-based
		```console
		sudo xbps-install -S fzf
		```
	- Zypper-based
		```console
		sudo zypper install fzf
		```

- On Windows
	- Using Choco
		```console
		choco install fzf
		```
	- Using Scoop
		```console
		scoop install fzf
		```
	- Using winget
		```console
		winget install fzf
		```

- As a Vim plugin
	- Using plugin manager
		- Using vim-plug
			+ fzf#install() makes sure you have the latest binary
			```console
			Plug 'junegunn/fzf', { 'do' : { -> fzf#install() } }
			```

### Upgrading
- As a Package
	- Using git  : `cd ~/.fzf && git pull && ./install`
	- Using brew : `brew update; brew upgrade fzf`
	- Using macports : `sudo port upgrade fzf`
	- Using chocolatey : `choco upgrade fzf`
- As a Vim plugin
	- Using plugin manager
		- Using vim-plug
			```console
			:PlugUpdate fzf
			```

### Uninstallation/Removal


