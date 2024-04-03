Paramiko: Python re-implementation of SSH
=========================================

## Information

## Setup
### Dependencies
+ python
+ python-pip
+ python-venv
- Python Packages
    + paramiko

### Pre-Requisites
- Generate a Python Virtual Environment to have an isolated/containerized environment to work in
    - Create Python Virtual Environment
        ```bash
        python3 -m venv [virtual-environment-name]
        ```
    - Chroot into Python Virtual Environment
        - Linux
            ```bash
            . [virtual-environment-name]/bin/activate
            ```
        - Windows
            ```bash
            .\[virtual-environment-name]\Scripts\activate
            ```

- Prepare Python Packages/Dependencies
    - Install Python Packages/Dependencies
        ```bash
        pip install -Ur requirements.txt
        ```

    - Verify packages
        ```bash
        pip freeze list
        ```

### Installation
- Using Python PyPI
    ```bash
    python -m pip install paramiko
    ```

## Documentations
### Package
+ paramiko

### Modules/Libraries
- paramiko
    + client : The SSH Client-focused library in paramiko
    + RSAKey : RSA (Rivett-Shamir-Ackermann) Public-Private Key Encryption Cryptographic Key handler library used by SSH to establish connections with client/servers

### Class
- paramiko.client
    + `.SSHClient()` : SSH Client connection class; Returns the SSH client connection container/object

### Functions
- paramiko
    - `.AutoAddPolicy()` : Automatically add policy to whichever policy function this is used on
        - Return
            - policy : Returns an automatically generated policy to be used to add into the policy functions
                + Type: Policy

- paramiko.RSAKey
    - `.from_private_key_file(rsa-key-file)` : Import a specified RSA key file as a 'paramiko.RSAKey' object
        - Parameters/Arguments
            - rsa-key-file : Specify the RSA Private Key you wish to import with to create the private key object
                + Type: String
        - Return
            - pkey: The Private Key object returned from the imported RSA Key file
                + Type: paramiko.RSAKey

- paramiko.client.SSHClient()
    - `.connect(host, username, password, pkey, ...)` : Connect to the provided SSH client
        - Parameters/Arguments
            - host : Specify the target device's IP address or domain to connect to
                + Type: String
            - username : Specify the username in the client to connect with
                + Type: String
            - password : Specify the password mapped to the user you are connecting with
                + Type: String
            - pkey : Specify the Private Key to be used to create/establish the SSH connect with the client
                + Type: paramiko.RSAKey
    + `.close()` : Close the connection after usage
    - `.exec_command(command-string)` : Execute a command through SSH to the connected client; The function will return the standard input, output and error streams on completion
        - Parameters/Arguments
            - command-string : Specify the command string to execute via the SSH connection
                + Type: String
        - Return
            + Type: List
            - Values
                - stdin : The standard input returned by the client object after the command execution
                    + Type: Bytes
                - stdout : The standard output returned by the client object after the command execution
                    + Type: Bytes
                - stderr : The standard error returned by the client object after the command execution
                    + Type: Bytes
    - `.set_missing_host_key_policy(policies)` : Set the policy for a Missing Host Key error
        - Parameters/Arguments
            - policies: Specify the policy to be used
                + Default: paramiko.AutoAddPolicy()

- paramiko.SSHClient().StandardOutputStream()
    - `.read()` : Read the Standard Output Stream after the remote command execution via the connected SSH connection; Returns byte
        - Return
            + Type: Byte

### Data Types
- paramiko
    - `.SSHClient()`
        + `.StandardOutputStream()`
- paramiko
    + .RSAKey : RSA Private Key object

### Attributes/Variables

## Usage

### Operational Flow
- Import modules
    - Paramiko
        ```python
        import paramiko
        ```

- Define and Initialize your server information as variables
    ```python
    host = "YOUR_SSH_SERVER_IP_ADDRESS_OR_DOMAIN"
    username = "YOUR_TARGET_SSH_USER_NAME"
    password = "YOUR_TARGET_SSH_USER_PASSWORD"
    ```

- Initialize SSH client
    ```python
    client = paramiko.client.SSHClient()
    ```

- Set the client missing host key policy
    ```python
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ```

- Connect to the SSH server using the client
    - Explanation
        - If connection is successful
            + the connection state and attributes will be stored in the client class object for usage
    ```python
    client.connect(host, username=username, password=password)
    ```

- Execute a command through SSH
    - Explanation
        + 'client.exec_command("your-command")' will return the standard input, output and error streams on completion
    ```python
    stdin, stdout, stderr = client.exec_command("your-command")
    ```

- Read and decode the standard output and store into a variable
    - Explanation
        - The streams when first returned will be in bytes as the packet transfer process requires encoding the data into byte streams
            + Therefore, to read it on receive, you will need to decode the bytes back to readable string
    ```python
    decoded_stdout = stdout.read().decode()
    ```

- Close SSH connection after usage
    ```python
    client.close()
    ```

## Wiki

## Resources

## References
+ [Linode - Docs - Use Paramiko on python to SSH into a server](https://www.linode.com/docs/guides/use-paramiko-python-to-ssh-into-a-server/)

## Remarks

