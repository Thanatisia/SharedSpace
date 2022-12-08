# Nginx - Load Balancer

## Components
> These are the base requirements for load balancing using Nginx
- upstream{}
    + For defining a cluster containing all the addresses of the webservers running a service and their routing definitions
    + This is the heart of the Load Balancing in Nginx, this defines all the webservers you want to use/are using for a service
+ server{} : For webserver routing definition and configuration
+ listen : Setting listening port number for the webserver connection
- location : For defining the webserver's routing definition and options
    + proxy_set_header : To set the proxy HTTP Headers 
    - proxy_pass : 
        + This is the heart of the reverse proxy functionality, this redirects the connection from a client to another webserver. 
        + Specify the cluster name as the url to loop the connection through all the servers in the cluster (Load Balancing)

## Configuration
- Upstream
    - Description
        ```
        Define a cluster of servers URLs pointing to the servers running the same service but in different ports for redundancy. 

        The strongest server should have higher priority (higher weightage)
        ```
    - Format
        ```
        upstream [name-of-cluster] {
            server [server-domain:port] {options};
        }
        ```
    - Options
        - weight=n : Assign "weightage" or priority of the routing to the assigned server
            + Type: Integer
        - down : Dont route the request to the assigned server
    - Usage
        ```
        server {
            ...
            location [url-path] {
                proxy_pass "http://[name-of-cluster]/paths"
            }
            ...
        }
        ```

## References
+ [Cameron McKenzie - Nginx Load Balancer Example Setup and Config](https://youtu.be/QE26N9cHE2M)
