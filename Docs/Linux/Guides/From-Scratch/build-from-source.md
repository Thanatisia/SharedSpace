# Linux - Manually Building Packages from Source

## Components
> The following are typical components found in any manual compilation script
+ Build : Building and Compilation of source codes to generate the local binary files used to run the program
+ Clean : Remove all temporary files generated during the compilation process
+ Installer : Install the pre-compiled/built local binary into the host system
+ Uninstaller : Remove the installed pre-compiled/built binary from the host system

## Setup
### Pre-Requisites
- Build Tools
	- Makefile : A Build utility; used to automate and make building, compilation and installation of source code easier for the user.
		- Rules/Targets
			+ build : Build the source code(s) locally into binary
			+ install : Install the pre-compiled/built binary into the host system
			+ clean : Remove all temporary files generated during the compilation process
			+ uninstall : Uninstallation rule to remove the installed pre-compiled/built binary from the host system

### Dependencies
+ curl : To download/read scripts from a repository
+ wget : To download files required from a repository
+ git : For cloning to and from a remote repository server/url and performing version control using the git version control system
+ base-devel : Contains Base development packages required to perform manual compilation such as make, gcc etc

## Documentations
### Building

### Uninstalling
- Basics
	- Unlike using a Package manager to uninstall, uninstalling from a manually built from source package is alittle more tricky as it is not generally universally located in the same location, 
		+ even though the X exists, package maintainers and developers may not enforce the same location depending on requirements for their projects.
	+ Thus, you can use the command 'which' to locate all files that identifies and links with your target package's binary.
	- In the GNU/Linux shell environment, every command will return a 'return code' or 'exit status'. 
		+ These status codes represents their executation status and how successful the command was.
		+ You can check the status code using the Environment Variable '$?'
		- Status Codes
			+ 0   = Successful
			+ > 0 = Error detected; Failed.
		+ Using the status codes, you can determine if the package binary is installed as shown below.

- Using 'which' command to check if a binary is installed
	- Synopsis/Syntax
		```shellscript
		which [your-package-binary]
		```
	- Examples
		```shellscript
		which [binary]

		# Get Status Code
		ret_Code="$?"
		if [[ "$ret_Code" -gt 0 ]]; then
			# > 0 = Error
			echo -e "Package is not installed."
		else
			# 0 = Success
			echo -e "Package is installed."
		fi
		```

- Steps
	1. Check package availability
		```console
		which [binary-name]
		```
	2. Check exit/return/status code of the command
		```console
		# Get Status Code
		ret_Code="$?"
		```
		- If status code is more than 0
			+ Error, package is not installed
			```console
			if [[ "$ret_Code" -gt 0 ]]; then
				# > 0 = Error
				echo -e "Package is not installed."
			fi
			```
		- If status code is equals to 0
			+ Success, there are files corresponding to the package's binary = installed
			```console
			if [[ "$ret_Code" == 0 ]]; then
				# 0 = Success
				echo -e "Package is installed."
			fi
			```
	3. If it is successful, you can delete all packages found in the 'which' command
		+ After deletion, application has been uninstalled.
		```console
		rm -f $(which [binary-name])
		```

## Wiki

## Resources

## References
+ [Reddit r/neovim - Uninstall neovim from source](https://www.reddit.com/r/neovim/comments/v87ml3/uninstall_neovim_from_source/)

## Remarks
