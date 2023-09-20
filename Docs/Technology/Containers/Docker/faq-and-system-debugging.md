# FAQ and (System) Debugging

## Information

## Networking
### Issues
- Containers are not communicating
    - Recommended Actions
        - System Check:
            - Check if containers are in the same subnet
                - Inspect the Network Addresses of both containers
                    + Obtain the IPv4 addresses
                    ```console
                    docker inspect [container-name]
                    ```
                - Enter shell of both containers 
                    - ping each other
                        - Pre-Requisites
                            + Update and upgrade packages
                            + (Optional) If unable to ping, install the package 'iputils-ping'
                        ```console
                        ping [other-container's IP address]
                        ```

    - Possible Solutions:
        - Create a simple custom network bridge to join both containers together, and assign them to the containers
            - Network Configuration and Structure Design
                - docker-compose
                    - Explanation
                        - VLAN group properties
                            + name: The name of the VLAN network group you wish to assign/attach to your containers
                            + driver: The network type of the VLAN group you wish to create; Default = bridge
                            - ipam: Network IP Address Management of the VLAN network group
                                - config: Set the configurations of the IPAM
                                    - subnet: Set the subnet address of the VLAN group (i.e. 172.28.0.0/16)
                                        - 172.28.0.0 = Subnet Network Address
                                        - /16 = The Prefix; i.e. 8.8.8.8

                    - Goal
                        - The purpose of the VLAN subnet group via bridge is to join 2 containers that are, by default, isolated from each other together so that they are able to communicate 
                            + If you were to install pihole and unbound on bare metal, or even communicating on 2 different machines, you will be able to communicate on the same machine relatively easily
                            + However, due to the containerization property of running the 2 containers separately, you need some bridging to ensure that - in this case - the DNS server (pihole) and the DNS resolver (unbound) are able to communicate and send data to each other
                    - Container Definition
                        ```yaml
                        version: "3.7"
                        services:
                            [service-name]:
                                image: [author/image-name:version-tag]
                                container_name: [container-name]
                                ...
                                networks:
                                    ## Specify VLAN group name to attach
                                    dns_net:
                                        ## Specify VLAN group properties
                                        ipv4_address: 172.28.0.2 # Set static IP address
                        ```
                    - Network Definition
                        ```yaml
                        ## Specify VLAN group name
                        networks:
                            [vlan-network-name]:
                                ## Specify VLAN group properties
                                name: [vlan-network-group-name]
                                driver: bridge
                                ipam:
                                    config:
                                        - subnet: [subnet-network-address]/[prefix]
                        ```
    - Example Case Studies
        - Pihole DNS Server/Sinkhole + Unbound DNS Resolver
            - Possible Issues: 
                - Pihole is unable to forward the packets to the DNS resolver when set as custom DNS server IP address

## Wiki

## Resources

## References

## Remarks
