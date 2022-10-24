# Linux Password file

## Information
+ Location of the passwd file: /etc/passwd

### Basics
+ the password file contains the users as well as the password hash, group, user id, group id etc while
- The '/etc/passwd' file typically works alongside the shadow ('/etc/shadow') file as
    + the shadow file contains the original salt of the transformed password

## Components
+ Username : The username of whom the account belongs to
+ passwd : The user's transformed/hash of the password
+ UID : The User ID (aka user identification number) generally chosen by the system
+ GID : The Group ID (aka group identification number) which reflects the native/primary group of membership
+ full_name : The user's full name (optional)
+ home_directory : The user's home directory
+ shell : The user's default shell; modifiable by chsh

### File Format
```
Username:passwd:UID:GID:full_name:home_directory:shell
```

