# Powershell Commands

```
Documentations and Guides of Powershell individual commands 
```

## List of Powershell Commands
### Directories
+ Get-ChildItem {options} [directory-path] : Get the contents found in the specified path; Alias for 'dir'
### Files
- `(Get-FileHash {options} <arguments>).[attributes]` : Get the hash hexdigest of a file using a hashing algorithm
    - Options 
        - `-Algorithm <algorithms>`.Hash.toLower()
            + Type: String
            - Algorithms
                + SHA256
        - `-Path [filename]` : Specify the full file name of the target file
            + Type: String
    - Attributes
        - Hash : Obtain the hash returned from 'Get-FileHash'
            + Type: String
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

## Usage
- Get hash of a file using various hashing algorithms
    - SHA256
        ```powershell
        (Get-FileHash -Algorithm SHA256 -Path [filename]).Hash.toLower()
        ```

