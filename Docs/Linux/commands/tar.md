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

- Using tar with parallelism/multithreading (Example in Code Snippets)
    - Check contents of the tar archive and list all the files into a log 
        + This command will check archive contents of this folder parrallely via Multithreading
        + '&' will run this in the background; 
        ```console
        tar -tvf [tar-archive-file-name].tar.gz | tee -a log-filename.log & 
        ```
    - Wait for everything before this to complete before proceeding
        ```console
        # ... Background processes here ...

        wait 
        ```
    - Execute these lines ONLY after everything before 'wait' is completed.
        ```console
        echo -e "\nArchive check completed.\n"
        ```

## Wiki

### Code Snippets
- Generate tar log for multiple tar files using parallelism/multithreading
    ```console
    #!/bin/env bash
    : "
    Generate a tar archive file contents log file
    "

    error()
    {
        : "
        Error validation
        "
        retCode=$1
        if [[ "$retCode" == "0" ]]; then
            # No Error
            echo -e "Tar Archiving no error."
        else
            # Error found
            echo -e "Error found."
        fi
    }

    check_archive_contents()
    {
        : "
        Check tar archive and output as a log file
        "
        target_dir="$1"

        # Initialize Variables
        tar_opts="-tf" # add 'v' to enable verbose mode

        # Generating file header
        echo -e "Generating tar archive contents for [$target_dir.tar.gz]..."
        echo -e "Archive: $target_dir.tar.gz" | tee -a $target_dir.log
            
        # Test tar archive and list all contents in it, and log into a file
        tar $tar_opts $target_dir.tar.gz | tee -a $target_dir.log

        error "$?" # Error Validation

        echo -e "\n\t $target_dir Archive check completed.\n"
    }

    main()
    {
        check_archive_contents home-backup-20230602-1310H & # Check archive contents of this folder parallely via Multithreading
        check_archive_contents full-backup-20230602-1120H & # Check archive contents of this folder parallely via Multithreading

        wait # Wait for everything before this to complete before proceeding

        echo -e "\nArchive check completed.\n"
    }

    if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
        main "$@"
    fi
    ```

## Remarks

## References
+ [Cyberciti - How to use tar command through network over SSH session](https://www.cyberciti.biz/faq/howto-use-tar-command-through-network-over-ssh-session/)

## Resources

