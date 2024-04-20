# Font utilities : fc-cache

## Information
### Application
+ Package: fontconfig
+ Name: fc-cache

### Description
- fc-cache will search/scan through every single font directories in the system
    + /usr/local/share/fonts : System fonts installed manually by user (by copying the directory into it)
    + /usr/share/fonts : Fonts installed via Package Manager
    + $HOME/.local/share/fonts : Userspace home directory local fonts installed manually by user
+ and build font information cache files for applications which use fontconfig for their font handling

## Setup
### Dependencies
+ fontconfig

### Pre-Requisites

## Documentations
### Synopsis/Syntax
```bash
fc-cache {optionals} <arguments> [directories ...]
```

### Parameters
- Positionals
    - directories : Specify the target directories containing your target fonts you want to cache
        + Type: String

- Optionals
    - With Arguments
        + -E | –error-on-no-fonts : When used this option an error will be thrown if there are no fonts present in dir or directories in the configuration.
        + -f | –force             : When used this command there will be Force re-generation of apparently up-to-date cache files, overriding the timestamp checking.
        + -r | –really-force      : This option will erase all the existing cache files and rescan.
        + -s | –system-only       : This command will scan only the system-wide directories and omit the places located in /usr/home directory.
        + -v | –verbose           : Will verbose the output while in process.
        + -V | –version           : Will display the version and exit.
    - Flags

### Usage
- Scan all installed fonts from all font directories and caches them
    ```bash
    fc-cache
    ```

## Wiki

## Resources

## References
+ [ArchWiki - Fonts](https://wiki.archlinux.org/title/fonts)
+ [GeeksForGeeks - fc-cache command in linux with examples](https://www.geeksforgeeks.org/fc-cache-command-in-linux-with-examples/)
+ [Linux man - fc-cache](https://linux.die.net/man/1/fc-cache)

## Remarks

