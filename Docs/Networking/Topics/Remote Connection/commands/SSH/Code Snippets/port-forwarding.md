# Port Forwarding

## Information

## Local Port Forwarding
- Structure
    + The forwarded mapping will be translated and wrapped into the SSH tunnel
    ```
            SSH: Secured Channel (Tunnel)
    -------------------------------------------------------
    | --------- Port Forwarded insecure traffic --------> |
    -------------------------------------------------------
    ```

- Purpose: 
    + In the case where a remote server you have to access is positioned behind a firewall
    + and the firewall is blocking the port number that the remote server is using
    + Local port forwarding will allow you to access the remote server through a "proxy" server which is the SSH local port forwarding server

- Syntax/Synopsis
    ```console
    ssh -L [local-machine-port]:[remote-machine-ip]:[remote-machine-port] -N [username]@[remote-machine-ip]
    ```

- Parameters
    - Positionals
    - Options
        - With Arguments
            + -L [local-port-number]:[local-machine-ip]:[remote-machine-port] : To perform local port forwarding from a remote web server using a remote port (that is blocked from the firewall) through a secured tunnel to a local SSH machine running from a local machine port
            + -N [username@remote-server-ip] : to specify the username to the remote server
        - Flags

- Snippets and Examples
    - Port forward a remote web server (10.0.2.5) using port 80 to local web/HTTP server (127.0.0.1) via SSH tunneling with encryption to port 8015
        - Assuming
            + The local machine will monitor the port 8015
            + The remote machine will be mapped to port 80
            + '-N' is to specify the username to the remote server
        - Port forward
            ```console
            ssh -L 8015:127.0.0.1:80 -N username@10.0.2.5
            ```
        - To access
            + Open Web Browser
            - Access '127.0.0.1:8015'
                + Notice that the port '8015' is able to touch the web server
                - The HTTP traffic is embedded inside the SSH traffic
                    + The SSH traffic is a tunnel, and the HTTP traffic is inside the tunnel which blocks of all reading of the HTTP traffic

## Resources

## References

## Remarks
