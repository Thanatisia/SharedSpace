# x11vnc VNC server Playbook

## Snippets and Examples
- SSH Port Forwarding
    - Assumptions
        + Local Port Forwarding from local server port (i.e. 5900) of local host IP address => Remote Server port (i.e. 5900) of remote server IP address
        + Run the command 'x11vnc -localhost -display :0' executed from the remote server in the local host 
    ```console
    ssh -t -L [local-host-port]:[local-host-ip]:[remote-server-port] [remote-host-ip|name] 'x11vnc -localhost -display :0'
    ```

- Copying and Pasting
    - If copying and pasting does not work as expected, particularly if pasting to the remote side is not working or clipboard behaviour is not as expected, 
        + try adding -xkb (X Keyboardx)
    ```console
    x11vnc -xkb -display :0
    ```
