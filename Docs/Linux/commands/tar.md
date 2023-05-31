# Linux Command Documentation: tar

## Table of Contents:
- [Information](#information)
    + [Background](#background)
- [Documentation](#documentation)
    + [Syntax](#syntax)
    + [Parameters](#parameters)
    + [Usage](#usage)
- [Remarks](#remarks)
- [References](#references)
- [Resources](#resources)
    
## Information

### Background

+ Command Name: tar
+ Abbreviation: 
+ Command Summary: A compression utility - like zip and rar - that compresses a folder or file into a 'tar file' for backup and recovery
+ General Syntax: tar [options] [output-file-name] [targets]

## Documentation

### Syntax
+ Backup (Compress into tar file)
    ```console
    tar -cvzf [output-path] -owner=0 -group=0 [folders]
    ```
+ Recovery (Extract from tar file)
    ```console
    tar -xvzf [tar-file]
    ```
    
### Parameters
+ -c : Compress to tar file
+ -f : Files to add into archive
+ -v : Verbose (with message)
+ -x : Extract from tar file
+ -z : Compress with gzip
+ -owner : Set owner ID (Default: 0 for no owner)
+ -group : Set group ID (Default: 0 for no group)
+ -exclude : Exclude certain file(s)

### Usage

- Using tar command over ssh
    - SSH into a remote machine and tar compress the specified folder/files, and output the backup file in your local machine
        ```console
        ssh [username]@[domain-or-ip] tar -cvzf - [directories-or-files] > destination/file.tar.gz
        ```
    - SSH into a remote machine and tar extract a tar file into the remote machine
        ```console
        cat source/file.tar.gz | ssh [username]@[domain-or-ip] 'tar -xvzf - -C destination/file.tar.gz'
        ```


## Remarks

## References
+ [Cyberciti - How to use tar command through network over SSH session](https://www.cyberciti.biz/faq/howto-use-tar-command-through-network-over-ssh-session/)

## Resources

