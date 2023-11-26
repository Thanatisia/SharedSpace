# Creating a self-hosted pre-compiled binary repository using a Web Server

## Concept and Idea
- You will download all packages from a web server using 'wget' or 'curl' by accessing/pulling from the webserver

## Setup
### Dependencies
- Web Server
    + Apache
    + Nginx

### Pre-Requisites
- Create a folder to store all binaries
    - Information
        + Generally, the Web server contents are stored in '/var/www'
    ```console
    mkdir -p /var/www/[repository-directory]
    ```

- Create subfolders based on the binary name and binary versions
    ```console
    mkdir -p /var/www/[repository-directory]/[binary-name]/[binary-version]
    ```

- Store/Install all binaries in their respective folders and version
    ```console
    cp [binary-file] /var/www/[repository-directory]/[package-name]/[package-version]
    ```

## Documentation

### Usage
- Download/Pull latest version from a target application/package
    - Using wget
        ```console
        wget http(s)://[server-url|ip|domain]/[repository-directory]/[package-name]/[package-version]/[binary-file]
        ```


## Wiki

## Resources

## References

## Remarks
