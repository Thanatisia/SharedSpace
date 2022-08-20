# GitHub CLI Utility

## Information
+ Package name: gh
- Repository URL : 
	+ GitHub Source Code : [cli/cli](https://github.com/cli/cli)
	+ AUR : [github-cli-git](https://aur.archlinux.org/packages/github-cli-git)

### DESCRIPTION
```
gh is a Cross-Platform command line utility for GitHub - a Remote Repository Host for the git version control system.

gh provides functionality that makes changes to your remote repository on GitHub directly from your command line, allowing extensibility and scriptability (I think thats a valid word)
```

### Availability
- gh can be found for various Operating Systems such as
	+ Windows
	+ MacOS
	+ GNU/Linux


## Setup

### Pre-Requisites

### Dependencies

### Obtaining
- Installing from Package Manager
	- Debian-based (apt)
		+ Download github-cli keyring
			```console
			curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
			```
		+ Remove read permission
			```console
			sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
			```
		+ Add github-cli keyring archive to Debian apt repositories (/etc/apt/sources.list.d/github-cli.list)
			```console
			echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
			```
		+ Update official repository
			```console
			sudo apt update
			```
		+ Install package
			sudo apt install gh
			```
	- Arch-based (pacman)
		```console
		sudo pacman -S github-cli
		```

- Installing from WinGet
	```powershell
	winget {install|upgrade} --id GitHub.cli
	```

- Downloading the Release
	- GNU/Linux
		- Architectures
			+ i386 (x86)
				```console
				wget https://github.com/cli/cli/releases/latest/gh_*_linux_386.tar.gz
				```
			+ amd64 (x64)
				```console
				wget https://github.com/cli/cli/releases/latest/gh_*_linux_amd64.tar.gz
				```
			+ arm64
				```console
				wget https://github.com/cli/cli/releases/latest/gh_*_linux_arm64.tar.gz
				```
			+ armv6
				```console
				wget https://github.com/cli/cli/releases/latest/gh_*_linux_armv6.tar.gz
				```
	- Windows
		- Architectures
			+ i386 (x86)
				```console
				wget https://github.com/cli/cli/releases/latest/gh_*_windows_386.zip
				```
			+ amd64 (x64)
				```console
				wget https://github.com/cli/cli/releases/latest/gh_*_windows_amd64.zip
				```

- Manual Installation
	- Clone the repository
		```console
		git clone https://github.com/cli/cli
		```

## Documentation

### Synopsis/Syntax
```console
gh {arguments} {options} [actions [arguments...]]
```

### Parameters
#### Arguments
+ alias {action} : Similar to alias in bash, this handles 'renaming' and 'aliasing' of certain commands into shorter strings
	- Actions
		+ set [alias] [full-gh-command] [flags] : Set an alias to expand to a specified full gh command when invoked
			- Flags
				+ -s | --shell : Declare an alias to be passed through a shell interpreter 
					- NOTES
						+ works the same if expansion/full-gh-command starts with '!'
						+ the expansion is a shell expression that will be evaluated through the "sh" interpreter when the alias is invoked. 
						+ This allows for chaining multiple commands via piping and redirection
+ auth {action} : Handles authentication with your GitHub account
	- Actions
		+ login {options} : Login and authenticate with your GitHub account
			- Options
				+ --hostname [hostname] : Login with a GitHub server Instance
+ config {action} : Handles the command line application's configuration
	- Actions
		+ set {option} : Set a configuration
			- Options
				+ editor [editor] : Set a preferred editor
+ release {action} : Handle the releases in your GitHub account
	- Actions
		+ create [tag] {options [arguments] | [files...]} : Create a new release with a tag and all files to include in the release
			- Options
				+ --discussion-category [category] : Start a discussion in the specified category
				+ --generate-notes : Automatically generate title and notes for the release
				- --target [branch] : Specify the target branch to release or full commit SHA
					+ Default : Main Branch
				+ -d | --draft : Save the release as a draft instead of publishing it
				+ -F [file] | --notes-file [file] : Read release notes from a file; Use '-' delimiter to read from standard input
				+ -n [notes string...] | --notes [notes string...] : Specify release notes (in string; Multiline)
				+ -p | --prerelease : Mark the release as a pre-release
				+ -t | --title [release-title] : Specify the title of the release
			- Options inherited from Parent Commands
				+ -R | --repo [[host/]owner/repo] : Select another repository using the [HOST/]OWNER/REPO format

### Usage
- Setting an alias
	- General
		```console
		gh alias set bugs 'issue list --label=bugs'
		```

- Creating a release
	- Interactively create a release
		```console
		gh release create 
		```
	- Non-Interactively create a release
		```console
		gh release create v0.1.0 --notes "Bugfix release"
		```

## Wiki

### Environment Variables

#### GitHub
+ GITHUB_TOKEN : To specify your github token for logging in

#### GitHub Enterprise Server
+ GH_HOST : Define the hostname of the GitHub Enterprise Server Instance
+ GH_ENTERPRISE_TOKEN : Specify the GitHub Enterprise Server Instake Token to authenticate commands in scripting mode/automation

## References
+ [GitHub CLI Documentations - gh release create](https://cli.github.com/manual/gh_release_create)

## Resources

## Remarks
