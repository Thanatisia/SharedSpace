# Debian Package Management - dpkg

## Information

### Background
```
This is the primary package management system used by the Debian project (Linux Distribution). 

The apt (and apt-get) package managers that are commonmly used are effectively wrappers that utilises dpkg as the foundation.
```

### Related 
+ dpkg-build
+ dpkg-deb
+ dpkg-query       : For querying packages in the system installed by the package manager
+ dpkg-reconfigure

## Setup
### Dependencies
+ NIL

### Pre-Requisites
+ NIL

### Installations
+ Pre-Installed in Debian systems

## Documentation

### Synopsis/Syntax
```console
dpkg {options} <arguments> [action]
```

### Parameters
- Positionals
    - Actions
        + -i | --install [package-file] : Install the specified package; if ['--recursive', '-R'] is specified, the package-file must refer to a directory instead
        + --configure {packages ...}    : Configures a package which has been unpacked but not yet configured; If '-a' or '--pending' is given instead of a package name, all unpacked but unconfigured packages are configured
        + --unpack {package-files ...}  : Unpacks the specified package, but dont configure it; If ['--recursive', '-R'] option is specified, the package-file must refer to a directory instead
- Optionals
    - With Arguments
    - Flags
        + -a : All packages/package-files

### Usage
- To fix and continue configuring all packages after it was disturbed
    - Example Use Cases
        + If the system crashes during an update/upgrade/installation
    ```console
    dpkg --configure -a
    ```

## Wiki

## Resources

## References

## Remarks
