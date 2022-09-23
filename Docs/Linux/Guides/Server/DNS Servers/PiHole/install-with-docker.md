# Install Pi-hole with Docker

## Information

### DESCRIPTION
```
The base guide is on installing pi-hole on uncontainerized bare-metal

Currently, this guide is specifically on installing pi-hole using docker, and docker-compose.
```

### Architecture
```
Internet
    |
    |-- Base OS
        |
        |-- Docker
        |-- Pi-Hole
            |
            |-- Router/Firewall/DNS Server/DNS Sinkhole
                |
                |-- Device 1
                |-- Device 2
                |-- Device 3
                |-- Device 4
                |-- Device 5
                ...
```

## Setup

### Pre-Requisites
- Setup Container Environment
    > Since we are using Docker
    - Install docker
        - Using Debian-based (apt)
            ```console
            sudo apt(-get) install docker docker-compose
            ```
        - Using Arch-based (apt)
            ```console
            sudo pacman -S docker docker-compose
            ```
    - Add user to 'docker' group
        ```console
        sudo useradd -aG docker [username]
        ```
    - Ensure docker service is started
        ```console
        sudo service docker start
        ```

### Dependencies

## Documentation

### Using docker
- Pull base image 'pihole/pihole' from Dockerhub
    ```console
    sudo docker pull pihole/pihole
    ```

- If you are using a Raspberry Pi Zero/1 (ARMv6)
    - Pull custom base image 'lewixlabs/pihole-pizero' from Dockerhub
        + This is a custom ARMv6-compatible image created by lewixlabs 
        + The base official pihole/pihole (at least as i tested as of 2022-09-21 2200H), doesnt seem to work on ARMv6 and only supports ARMv7 and any other generics such as AMD64 outside of ARMv6
        ```console
        sudo docker pull lewixlabs/pihole-pizero
        ```

- Create docker run script
    - NOTES
        - Please change the following variables
            + TZ : This is the Pi-hole Timezone, please change this to your 'Region/City'
            + FTLCONF_LOCAL_IPV4 : This is your Pi-hole FTL DNS Local IPv4 Address, please set this to your server's local IPv4 address
        - This can be found in the [run script](https://github.com/pi-hole/docker-pi-hole/blob/master/examples/docker_run.sh)
    ```console
!/bin/bash

# https://github.com/pi-hole/docker-pi-hole/blob/master/README.md

PIHOLE_BASE="${PIHOLE_BASE:-$(pwd)}"
[[ -d "$PIHOLE_BASE" ]] || mkdir -p "$PIHOLE_BASE" || { echo "Couldn't create storage directory: $PIHOLE_BASE"; exit 1; }

# Note: FTLCONF_LOCAL_IPV4 should be replaced with your external ip.
docker run -d \
    --name pihole \
    -p 53:53/tcp \
    -p 53:53/udp \
    -p 80:80 \
    -e TZ="Region/City" \
    -e VIRTUAL_HOST="pi.hole" \
    -e PROXY_LOCATION="pi.hole" \
    -e FTLCONF_LOCAL_IPV4="[your-server-ip-address]" \
    -v "${PIHOLE_BASE}/etc-pihole:/etc/pihole" \
    -v "${PIHOLE_BASE}/etc-dnsmasq.d:/etc/dnsmasq.d" \
    --dns=127.0.0.1 \
    --dns=1.1.1.1 \
    --restart=unless-stopped \
    --hostname pi.hole \
    pihole/pihole:latest

printf 'Starting up pihole container '
for i in $(seq 1 20); do
    if [ "$(docker inspect -f "{{.State.Health.Status}}" pihole)" == "healthy" ] ; then
        printf ' OK'
        echo -e "\n$(docker logs pihole 2> /dev/null | grep 'password:') for your pi-hole: http://${IP}/admin/"
        exit 0
    else
        sleep 3
        printf '.'
    fi

    if [ $i -eq 20 ] ; then
        echo -e "\nTimed out waiting for Pi-hole start, consult your container logs for more info (\`docker logs pihole\`)"
        exit 1
    fi
done;
    ```

- Run the run script
    + Assuming it is named 'pihole_run.sh'
    ```console
    chmod u+x pihole_run.sh
    ./pihole_run.sh
    ```

- Verify the container
    ```
    Ensure that the status is 'Up' and not 'Exited' or 'Restarting'
    ```
    - Using docker
        ```console
        sudo docker container ps
        ```

### Using docker-compose
```
Note:
- For this, you will require a 'docker-compose.yaml' file
```
- Generate a docker-compose yaml file
    + please refer to [docker-compose file Syntax](#docker-compose-file-syntax) for more information on the Syntax Structure of the docker-compose file

- Startup the docker-compose container environment
    - Notes
        - Parameters
            + -d : Run the container as a Daemon/background process
    ```console
    sudo docker-compose up -d
    ```

- Verify the container
    ```
    Ensure that the status is 'Up' and not 'Exited' or 'Restarting'
    ```
    - Using docker
        ```console
        sudo docker container ps
        ```

    - Using docker-compose
        ```console
        sudo docker-compose ps
        ```

### Security

- Chroot and jump into the container
    ```console
    sudo docker exec -it pihole /bin/bash
    ```

- Change Pi-hole password
    - Explanation
        + -a : Change Web UI Administrator account
        + -p : Change Password
    ```console
    pihole -a -p
    ```

### Usage
```
From this point forth, is similar to the bare-metal way of installing

the only difference is the update and upgrading methodology.

Instead of updating from within the container, you update from the image level
```
- Open your browser
    - Go to the following IP address/URL
        - IP
            ```console
            http://[your-server-ip]/admin
            ```
        - Domain
            ```console
            http://pi.hole/admin
            ```

## Wiki

### Dockerfile
> This is applicable for if you are using the lewixlabs/pihole-pizero variant as you might want to update the image
```yaml
FROM lewixlabs/pihole-pizero

RUN "apt update && apt upgrade"
```

### docker-compose 

#### File Syntax
```yaml
version: "3"

services:
  pihole:
    container_name: pihole
    image: pihole/pihole:latest
    ports:
      - "53:53/tcp"
      - "53:53/udp"
      - "67:67/udp"
      - "80:80/tcp"
      - "443:443/tcp"
    environment:
      TZ: 'Region/City' #this is the time zone
    volumes:
       - './etc-pihole/:/etc/pihole/'
       - './etc-dnsmasq.d/:/etc/dnsmasq.d/'
    dns:
      # your dns routing here
      - 127.0.0.1
      - 1.1.1.1
    cap_add:
      - NET_ADMIN
    restart: unless-stopped
```

#### Environment Variables
+ WEBPASSWORD : set a secure password here; if empty - a random password will be generated

## Resources
- GitHub
    + [pi-hole - docker-pi-hole](https://github.com/pi-hole/docker-pi-hole)

## References
+ [GeeksforGeeks - Create your own secure home network using Pihole and docker](https://www.geeksforgeeks.org/create-your-own-secure-home-network-using-pi-hole-and-docker/)
- Pi-Hole for Raspberry Pi Zero (ARMv6 compatible devices)
    + [DockerHub - lewixlabs/pihole-pizero](https://hub.docker.com/r/lewixlabs/pihole-pizero)
    + [Balena Forums - Pihole container on Raspberry Pi Zero W (ARMv6) keeps restarting](https://forums.balena.io/t/pihole-container-on-raspberry-pi-zero-w-armv6-keeps-restarting/31782/16)
- [Pi-Hole - Run script to install via docker](https://github.com/pi-hole/docker-pi-hole/blob/master/examples/docker_run.sh)

## Remarks