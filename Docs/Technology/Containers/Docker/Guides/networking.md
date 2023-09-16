# Docker - Networking

## Information

### Basics
```
Docker shares the Network with the host systems.
In linux, the Dynamic Network Service (DNS) performs network resolution by utilising the file '/etc/resolv.conf'.

By default, when docker is installed and a container is created, 
    Docker will copy the '/etc/resolv.conf' from the linux kernel and place it into the individual container, 
    thus using the same network as the host system by default.

Docker however, allows you to create your own custom network bridges and use them, these will act as "Subnets" within the docker network.
```

### Drivers
- bridge : the default network type
    + will be automatically created and assigned a virtual docker network ethernet interfaces when each docker container is started up
- host : The container is attached to the host network
    + the container will not have its own network
    + there are no isolations, but is easier to use
- user-defined bridge
    + Allows users to effectively assign multiple containers to a network
    + also allows users to isolate networks from each other if not assigned by using a bridge
- macvlan
    + Connect the container's networks directly to the home network with its own MAC address
    - Creates a new MAC address for each container created
        + Sharing ports with the host
        - Issues
            - Some networks may not allow more than one ports
                + requires promiscuous mode enabled on the network device
            - No DHCP
                + If you dont specify a custom IP address, docker will specify for you
    - Has 2 modes
        + Bridge (default)
        + Trunking and VLAN (802.1q etc)
- ipvlan
    - Has 2 modes
        + L2 : Layer 2 connections
        + L3 : Layer 3 connections
    - Same as MACVLAN except
        - Connects to network and gets a real IP address
        - Shares the host MAC address with the container
           + Solves the Promiscuous Mode issue of MACVLAN
- overlay
    + Used with docker swarm
- none
    + Literally no networking

### Port Mapping
+ aka Port Forwarding/Translation
+ The idea is that you are port forwarding/translation/mapping a port (door) from the host system to the container with a layer of isolation

## Setup
### Dependencies
+ docker
+ docker-compose

### Pre-Requisites

### Quickstart flow
- Install docker.io
    + Will provide a Docker default network interface
    - Using Package Manager
        - Debian-based (apt)
            ```console
            sudo apt install docker.io
            ```
        - Arch-based (pacman)
            ```console
            sudo pacman -S docker.io
            ```

- Create a new docker network
    - Bridge
        ```console
        sudo docker network create [new-bridge-name]
        ```

- Start using a specific docker network
    ```console
    sudo docker run -idt --name "HelloWorld" --network [new-bridge-name] 
    ```

- Start container with Port forwarding 
    + By exposing the Internal port on the Docker container to an external port on the host system
    - Port Forwarding port 80 (http)
	+ Generally required when running a docker containing for a web server so that it is accessible
        ```console
        sudo docker run -idt --name "HelloWorld" -p 80:80 --network [new-bridge-name]
        ```

## Documentation
### Usage
- Host system
    - To enable promiscuous mode
        ```console
        ip link set [network-interface] promisc on
        ```
    - To list all network bridges
        ```console
        bridge link
        ```

- docker run
    - Create a custom network 
        - a new user-defined network bridge
            ```console
            docker network create [network-name]
            ```
        - macvlan
            - To make a macvlan, you must specify
                + The network type (driver)
                + home network subnet network address and prefix
                + home network router default gateway IP
                - Tie the MACVLAN to our host network interface
                    - i.e.
                        - if my host is using enp0s3
                            + The parent interface = enp0s3
           ```console
           docker network create \
               -d macvlan \
               --subnet [network-address]/[prefix] \
               --gateway [gateway-ip] \
               -o parent=[host-network-interface] \
               [network-name]
           ```
         - ipvlan
             - L2
                 + Same as MACVLAN
                 - you must specify
                    + The network type (driver)
                    + home network subnet network address and prefix
                    + home network router default gateway IP
                    - Tie the IPVLAN to our host network interface
                        - i.e.
                            - if my host is using enp0s3
                                + The parent interface = enp0s3
                ```console
                docker network create \ 
                    -d ipvlan \
                    --subnet [network-address]/[prefix] \
                    --gateway [gateway-ip] \
                    -o parent=[host-network-interface] \
                    [network-name]
                ```
            - L3
                + Same as MACVLAN
                - you must specify
                    + The network type (driver)
                    + brand new subnet network address and prefix
                    - You do not need to specify the default gateway
                        + In Layer 3, the gateway is the parent interface we tied to
                    - Tie the IPVLAN to our host network interface
                        - i.e.
                            - if my host is using enp0s3
                                + The parent interface = enp0s3
                    - Specify another additional option
                        - Specify IPVLAN Mode "L3"
                    - (Optional) Specify additional subnet network addresses as required
                        - To specify which subnet to use in the network (if you have multiple)
                            + specify a custom IP that matches the range of the subnet of choice
                ```console
                docker network create \ 
                    -d ipvlan \
                    --subnet [new-network-subnet-address]/[prefix] \
                    -o parent=[host-network-interface] \
                    -o ipvlan_mode=l3 \
                    --subnet [second-new-network-subnet-address]/[prefix] \
                    [network-name]
                ```
    - List all docker networks
        ```console
        docker network ls
        ```
    - Specify IP address to assign to the container
        ```console
        docker run -itd --name=[container-name] --ip [custom-ip-address] image-author/image-name
        ```
    - Specify ports to forward/translate/map
        + Use the '`-p | --publish host-system-port:container-port`' argument
        ```console
        docker run -itd --name=container-name {-p | --publish} [port]
        ```
    - Specify custom network to attach the container to
        ```console
        docker run -itd --name=container-name --network=[custom-network-name] image-author/image-name [commands]
        ```

- docker-compose
    - Specify custom IP address to assign to the container on the network
        ```yaml
        version: "3.7"
        service:
            service-name:
                networks:
                    ipv4_address: "192.168.1.X"
        ```
    - Create a custom network 
        - a new user-defined network bridge
            + Assign all networks you wish to set the container in the 'networks' label
            ```yaml
            version: "3.7"
            service:
                service-name:
                    image: author/name:version-tag
                    container_name: container-name
                    networks:
                        - network-name

            networks:
                network-name:
                    name: network-name
                    driver: [network-type]
                    driver_opts:
                        subnet_address: 192.168.1.0/24
                        parent=en0p0s3
            ```
        - To initialize macvlan
            ```yaml
            version: "3.7"
            service:
                service-name:
                    image: 
                    networks:
                        - network-name

            networks:
                network-name:
                    name: network-name
                    driver: macvlan
                    driver_opts:
                        subnet: 192.168.1.0/24
                        gateway: 192.168.1.X
                        parent=en0p0s3
            ```
        - To initialize ipvlan
            + Similar to macvlan but ipvlan shared the same mac address as the host with all the containers
            ```yaml
            version: "3.7"
            service:
                service-name:
                    image: 
                    networks:
                        - network-name

            networks:
                network-name:
                    name: network-name
                    driver: ipvlan
                    driver_opts:
                        subnet: 192.168.1.0/24
                        gateway: 192.168.1.X
                        parent=en0p0s3
            ```

## Wiki
### Terminologies
+ drivers = Network Types

### Network Types
+ bridge

## Resources

## References
+ [YouTube | NetworkChuck | Docker Compose will blow your mind (a tutorial)](https://youtu.be/DM65_JyGxCo?si=cDhTbQqiT55F1CIs)
+ [YouTube | Networkchuck | Docker Networking is crazy!! (You need to learn it)](https://youtu.be/bKFMS5C4CG0)

## Remarks
