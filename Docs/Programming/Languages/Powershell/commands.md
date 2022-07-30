# Powershell Commands

```
Documentations and Guides of Powershell individual commands 
```

## List of Powershell Commands
### Directories
+ Get-ChildItem {options} [directory-path] : Get the contents found in the specified path; Alias for 'dir'
### Packages
+ Install-Package -Name [package-name] : Install the package using Nuget package manager
+ Uninstall-Package -Name [package-name] : Uninstall the package using Nuget package manager
### Services
+ Get-Service [service-name] : Get a specific service from the list of all services; Leave service name empty to list all services
+ Restart-Service [service-name] : Restart the specified service
+ Start-Service [service-name] : Start the service
+ Stop-Service [service-name] : Stop the specified service
### Windows Features
+ Enable-WindowOptionalFeature {options} [arguments] : Enabling a Windows Feature
	- Options
		+ -Online : Find from online repository
		+ -FeatureName [feature-to-enable] : Specify the feature to enable
