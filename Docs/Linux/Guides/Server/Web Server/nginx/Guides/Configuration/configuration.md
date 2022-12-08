# Nginx - Configuration

## Structure
### Filesystem
+ General Default Configuration File : /etc/nginx/conf.d/default.conf

### default.conf
```
server {
    # Your webserver routing and definitions
}
```

## Configuration
### Keywords
+ include : Allows you to include/import an external configuration file at the specified line
    - Synopsis/Syntax
        ```
        include [path/to/config];
        ```

### Global Variables
+ http_host : The HTTP Host Webserver
+ remote_addr : The connecting remote client's address

### Key-Values
- server
    - Description
        ```
        To hold your webserver routing and definitions
        ```
    - Format
        ```
        server {
            server_name [domains ...];

            location [subdomain-paths] {
                root : 
            }
        }
        ```
    - Variables
        - error_page : Define the error codes to catch, definition of the error page to open and routing if error codes are caught
            - Synopsis/Syntax
                ```
                error_page [error-codes ...] [error_page_path];
                location = [error_page_path] {
                    root [root path];
                }
                ```
            - location definition
                - Keys
                    + root : Define the root path of the error page
        - listen : Set the listening port number for your webserver
            - Synopsis/Syntax
                ```
                listen [port number];
                ```
            - Values
                + port_number : Absolute port number
                + [::] port_number : Relative port number
        - server_name : Set all domain names for your webserver
            - Synopsis/Syntax
                ``` 
                server_name [domains ...];
                ```
        - location : Set the routing definitions for the webserver
            - Synopsis/Syntax
                ```
                location [subdomain-paths] {
                    [option] [values];
                }
                ```
            - Options
                - root : Set the root directory of the webserver route
                    + Type: String
                - index : Set webserver index page(s)
                    + Type: Strings
                    - Synopsis/Syntax
                        ```
                        index [index-page ...];
                        ```
                - proxy_set_header : Set Proxy server HTTP Headers
                    - Synopsis/Syntax
                        ```
                        proxy_set_header [header] [value];
                        ```
                    - Headers
                        - X-Real-IP 
                            + Type: String
                            + Recommend : $remote_addr
                        - X-Forwarded-For : Set target remote server IP Address
                            + Type: String
                            + Recommend : $remote_addr
                        - Host
                            + Type: String
                            + Recommend : $http_host
                        - X-NginX-Proxy
                            + Type: Boolean
                - proxy_pass : Set reverse proxy redirect url
                    - Synopsis/Syntax
                        ```
                        proxy_pass [url-to-redirect];
                        ```
    - Usage
        ```
        server {
            

        }
        ```

## Documentation
### Usage
- Test nginx configuration
    ```console
    nginx -t
    ```

## Wiki

## References
