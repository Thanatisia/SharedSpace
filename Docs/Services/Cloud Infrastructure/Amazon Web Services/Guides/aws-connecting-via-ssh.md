# AWS - Connecting via SSH

## Windows
### Setup
#### Pre-Requisites
- If you want to connect to a windows instance desktop from any computer or via ssh
    + Download the Public Key PEM file for your EC2 instance
- If you are using Windows to connect to a Linux instance or via ssh
    + Download the PPK file for your EC2 instance
- (Optional) If you are connecting to the desktop of a Windows instance via RDP
    - In the EC2 console
        + Choose `Instances` and then choose the instance that you want to connect to
        - From the `Actions` menu
             + Choose `Get Windows Password`
        - Next to `Key Pair Path`
             + Choose `Browse`
             + Browse to and select the Public key PEM file you downloaded
             - Choose `Decrypt Password`
                 - The connection information should display
                     + including the instance's public Domain Name System (DNS), 
                     + administrator username and 
                     + the decrypted password
- Download PuTTY or any SSH connectors
- Using PuTTY
    - Configure PuTTY
        - Enable to keep the PuTTY session open for a longer time/not timeout
            - Choose Connection
                + Set `Seconds between keepalives` to `30`
        - Setup Connection
            - Choose Session
                - Host Name (or IP address) : Copy and paste the IPv4 Public IP address for the instance
                    - Notes
                        - To find the IPv4 Public IP Address for the instance
                            - Go to the Amazon EC2 console
                                + Choose `Instances` 
                                + Select the box next to the instance
                                - In the `Description` tab
                                    + Copy the IPv4 Public IP value
            - Connection List
                - Expand `SSH`
                    - Choose `Auth`
                        - Expand `Credentials`
                            - Under `Private key file for authentication`
                                + Choose `Browse`
                                + Browse to the ppk file for the EC2 instance
                                + Select it and choose `Open`
                                + Choose `Open` again

#### Dependencies

### Documentation
- To access any EC2 instances that you launch
    - Using PuTTY
        - Select the host
            - Choose `Accept`
                + Choose `Yes` to trust the host and conenct to it
            - When prompted to login as
                + enter: [your-username]
            + This step will connect you to the EC2 instance
    - Using RDP
        - Use a Remote Desktop Protocol (RDP) client to connect to the desktop of the EC2 instance by using those connection details

## Linux
### Setup
#### Pre-Requisites
- Download the '.pem' public key file file for your EC2 instance
    - Change the permissions on the key to be *read-only*
        ```console
        chmod 400 [filename].pem
        ```
- Get the IPv4 Public IP address of the EC2 service instance
    + Return to the AWS Management Console
    - In the EC2 service
        - Choose `Instances`
            + Check the box next to the instance you want to connect to
        - In the `Description` tab
            + Copy the `IPv4 Public IP` value

#### Dependencies

### Documentation
- To access any EC2 instances that you launch
    + -i [public-key-filename].pem : To include the key-pair .pem file to authenticate the connection
    ```console
    ssh -i [public-key-filename].pem [ec2-username]@[public-ip-address]
    ```
    - When you are prompted to allow a first connection to this remote SSH server
        + Enter yes
        + Because you are using a key pair for authentication, you will not be prompted for a password

## Wiki

## Resources

## References
+ [Amazon AWS Labs README](https://labs.vocareum.com/web/2471020/1652110.0/ASNLIB/public/docs/lang/en-us/README.html#ssh-after)

## Remarks
