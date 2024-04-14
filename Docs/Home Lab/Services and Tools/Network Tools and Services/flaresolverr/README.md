# flaresolverr - Cloudflare Challenge Solver

## Information
### Description
+ flaresolverr is a Cloudflare Challenge Solver proxy server to bypass Cloudflare and DDoS-GUARD protection

### Project
+ Project Author: FlareSolverr
+ Project Name: FlareSolverr
- Repositories
     + GitHub Remote Repository: https://github.com/FlareSolverr/FlareSolverr
- Docker images and container repository
     + GitHub Container Repository: ghcr.io/flaresolverr/flaresolverr
     + DockerHub: https://hub.docker.com/r/flaresolverr/flaresolverr
- Support Tags
     + latest
     + linux/386    : For x86 CPU architecture
     + linux/amd64  : For x86-64 CPU architecture
     + linux/arm/v7 : For ARM32 CPU architecture
     + linux/arm/v8 : For ARM64 CPU architecture

### Operational Workflow
- Using it as a Proxy server
    - Pass the HTTP server request through flaresolverr as a proxy server
        + flaresolverr will complete the challenge and pass back the HTTP response

## Setup

### Docker

> Dependencies
+ docker
+ docker-compose

> Pre-Requisites
- Add user to 'dockeruser' group
    ```bash
    usermod -aG dockeruser [username]
    ```

- Startup docker system service
    ```bash
    service docker start
    ```

- Restart the system
    ```bash
    sudo reboot now
    ```

### Using docker-run
- Startup and run docker container
    ```bash
    docker run -itd \
        --name=flaresolverr \
        --restart=unless-stopped
        -p 8191:8191 \
        -e LOG_LEVEL=info \
        ghcr.io/flaresolverr/flaresolverr:latest
    ```

- Remove a stopped container
    ```bash
    docker container rm [container-name]
    ```

- Start a stopped container
    ```bash
    docker start [container-name]
    ```

- Stop a running container
    ```bash
    docker stop [container-name]
    ```

- Restart a running container
    ```bash
    docker restart [container-name]
    ```

- View a container's logs
    ```bash
    docker logs [container-name]
    ```

- Inspect a container/image
    ```bash
    docker inspect [container-name]
    ```

### Using docker-compose
- NOTE: 
    + Please prepare your docker-compose.yaml file before running
    + Refer to [Templates](#templates) for an example of the configuration file

- Startup and run docker container(s)
    ```bash
    docker-compose {-f [docker-compose-file-name]} up -d
    ```

- Stop, Teardown and remove container compose environment
    ```bash
    docker-compose down
    ```

- Start a stopped container
    ```bash
    docker-compose start [container-name]
    ```

- Stop a running container
    ```bash
    docker-compose stop [container-name]
    ```

- Restart a running container
    ```bash
    docker-compose restart [container-name]
    ```

- Execute a command in a container
    ```bash
    docker-compose [run|exec] [container-name] [command]
    ```

## Documentations

### Usage
- Example command line HTTP POST request
    ```bash        
    curl -L -X POST 'http://[server-ip|domain]:[server-port]/v1' \
         -H 'Content-Type: application/json'   \
         --data-raw '{
           "cmd": "request.get",
           "url": "http://www.google.com/",
           "maxTimeout": 60000
         }'
    ```

- Example Python request
    ```python
    import requests

    # Initialize Variables
    url = "{}://{}:{}/{}".format("http", "server-ip|domain", "server-port", "v1")
    headers = {"Content-Type": "application/json"}
    data =  {
        "cmd" : "request.get",
        "url" : "your-target-cloudflare-challenge-url",
        "maxTimeout" : 60000
    }

    # Send a POST request to flaresolverr with the data packets so it knows where to send the response to after completing the challenge
    response = requests.post(url, headers=headers, json=data)

    # Obtain response text
    response_text = response.text

    # Print response text
    print(response_text)
    ```

- Example Powershell request
    ```powershell
    $url = "http://[server-ip|domain]:[server-port]/v1"
    $headers = @{"Content-Type": "application/json"}
    $body = @{
        cmd = "request.get",
        url = "your-target-cloudflare-challenge-url",
        maxTimeout = 60000
    } | ConvertTo-Json

    # Send a POST request to flaresolverr with the data packets so it knows where to send the response to after completing the challenge
    irm -UseBasicParsing -Headers $headers -Method Post -Body $body
    ```

- gallery-dl
    + Pass gallery-dl into flaresolverr as a Proxy Server using the '--proxy [server-host-ip|domain]:[server-port-number]' flag
    ```bash
    gallery-dl --proxy [server-ip|domain]:[server-port]
    ```

## Wiki

### Templates

> docker-compose.yaml

```yaml
---
version: "3.7"
services:
  flaresolverr:
    # DockerHub mirror flaresolverr/flaresolverr:latest
    image: ghcr.io/flaresolverr/flaresolverr:latest
    container_name: flaresolverr
    restart: unless-stopped
    environment:
      - LOG_LEVEL=${LOG_LEVEL:-info}
      - LOG_HTML=${LOG_HTML:-false}
      - CAPTCHA_SOLVER=${CAPTCHA_SOLVER:-none}
      - TZ=<Region>/<City>
    ports:
      ## Port Forward/Translate/Map from host system into container
      - "${PORT:-8191}:8191"
```

## Resources

## References
+ [GitHub - Flaresolverr/Flaresolverr - docker-compose.yaml](https://github.com/FlareSolverr/FlareSolverr/blob/master/docker-compose.yml)
+ [ScrapeOps - Python Webscraping Playbook - Python Flaresolverr](https://scrapeops.io/python-web-scraping-playbook/python-flaresolverr/)

## Remarks
