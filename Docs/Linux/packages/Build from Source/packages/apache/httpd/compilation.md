# Apache httpd Web Server

## Information
+ Application Title: Apache Webserver HTTP Daemon
+ Package Name: httpd
+ Package Author: Apache
- Package Sources
    + [GitHub - Latest Version](https://github.com/apache/httpd)
    - Mirrors
        + [Apache httpd v2.4.54 gzip tarball](https://dlcdn.apache.org/httpd/httpd-2.4.54.tar.gz)

## Setup
### Pre-Requisites
- Prepare the following
    + Apache Portable Runtime (APR) 
    + Apache Portable Runtime Utility Library (APR Utils)

- Obtain the source code
    - From GitHub (latest version)
        - Clone the repository from GitHub
            ```console
            git clone https://github.com/apache/httpd
            ```

    - From Mirrors
        - Download latest tarball
            ```console
            wget https://dlcdn.apache.org/httpd/httpd-[latest-version].tar.gz
            ```

        - Extract tarball from gzipped tar file
            ```console
            gzip -d httpd-[latest-version].tar.gz
            ```

        - Extract the source code from tarball (gzip)
            ```console
            tar -xvf [tarball file]
            ```

- Change directory into package folder
    ```console
    cd [Package Name]
    ```

### Dependencies
+ libapr1
+ libaprutil1

## Documentation
### Compilation/Build Process
- Configure the source code
    - Prefix
        + The filesystem path under which the server should be installed to
        + Default PREFIX : /usr/local/apache2
    ```console
    ./configure --prefix=[PREFIX]
    ```

- Build/Compile
    ```console
    make {options}
    ```

### Installations
- Install to locations
    ```console
    sudo make {options} install
    ```

## Wiki

### Tips n Tricks
- Use flag '-j'
    + Parse the flag '-jX' to the make options
    - where X = number of cores/processors to use
        + To perform multithreading/multiprocessing, speeding up the compilation process

## Resources
+ [Apache HTTPD documentations - Install Guide](https://httpd.apache.org/docs/current/install.html)
+ [Apache Webserver Download](https://httpd.apache.org/download.cgi)
