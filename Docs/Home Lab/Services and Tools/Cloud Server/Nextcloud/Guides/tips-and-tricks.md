# Nextcloud - Tips and Tricks, Guides

```
A overall write-up or documentation of various tips and tricks and guides
when working with the Nextcloud file structure
```

## Basic Information
### Structure
- Nextcloud has 3 primary folders to take note of
    - apps : This folder contains all apps downloaded and installed by the server administrator; 
        + apps folder has the ownership of 'www-data:www-data' and permission of 'drwxr-xr-x'
        + contents may have different ownership
    + config : This contains all contents, configuration files, data created by users as well as servers
    + www  : This is the webserver data folder containing the webserver configurations such as config/config.php

## Migration
- Notes
    - Before continuing, PLEASE always make a backup of your server
        - Using tar
            ```console
            tar -cvzf apps config www
            ```

- To install Nextcloud with a different apps location
    + Change ownership of data directory and its contents to 'www-data:www-data'
        ```console
        sudo chown -R www-data:www-data apps
        ```
    + Change permission of data directory and its contents to 750
        ```console
        sudo chmod -R 750 apps
        ```

- To install Nextcloud with a different data location
    + Change ownership of data directory and its contents to 'www-data:www-data'
        ```console
        sudo chown -R www-data:www-data config
        ```
    + Change permission of data directory and its contents to 750
        ```console
        sudo chmod -R 750 config
        ```

## Resources

## References
+ [Nextcloud Help - Install Nextcloud with a different data location](https://help.nextcloud.com/t/install-nextcloud-with-a-different-data-location/116882)

## Search Prompts
### Google
+ Install Nextcloud with a different config location
+ Nextcloud where to place database

## Remarks