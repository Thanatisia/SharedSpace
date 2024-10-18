# Home Lab - Self-hosting Local AI Server - Using ollama

## Table of Contents
- [Information](#information)
    + [Introduction](#introduction)
    + [Components](#components)
- Setup
    - [Overview](#setup-overview)
        + [General Operational Workflow](#general-operational-workflow)
    - [Core LLM for the Local AI Server](#setup-core-large-language-model-for-local-ai)
        + [Using docker](#using-docker)
        + [Using bare metal](#using-bare-metal)
    - [WebUI Application for interacting with the Local AI Server](#setup-webui-interface)
        + [Using docker](#using-docker)
        + [Using bare metal](#using-bare-metal)
- [Accessing](#accessing)
    + [Large Language Model Core](#large-language-model-core)
    + [Web Application](#web-application)
- [Documentations](#documentations)
    + [Networking](#networking)
    + [Environment Variables](#environment-variables)
    + [Volumes](#volumes)
- [Snippets](#snippets)
- [Wiki](#wiki)
    - [Templates](#templates)
- [Resources](#resources)
- [References](#references)
- [Remarks](#remarks)

## Information

### Introduction
+ Ollama is an 'Open Source' self-hostable AI Large Language Model (LLM) framework made and maintained by Meta
+ There are other Open Source LLM models - for example, Mistra - which you can pull and use locally

### Components
- CLI utilities
    + ollama : `ollama` is the CLI utility used to manage/handle various open source LLM models (including the llama/mistral variant models) through a single CLI utility. 
- Docker Images
    - AI Large Language Models (LLM)
        + `ollama/ollama`: This docker image contains the 'ollama' CLI utility; The container automatically starts up and hosts the LLM model server in the background to be accessed locally when required
    - Web Interface (WebUI) for LLMs
        + `open-webui/open-webui` : Open-WebUI is a generic WebUI (Web interface) for AI models to use as a chatbot; This concept is similar to OpenAI using ChatGPT as a web interface to interact with the AI Language Model (Recommended)
        + `ollama-webui/ollama-webui` : Docker image using Open-WebUI Web interface but configured specifically for Ollama usage right Out of the Box (OOTB)

## Setup Overview
### General Operational Workflow
1. Setup the core AI Large Language Model (LLM) local server using ollama (for pulling/pushing and serving open source LLM models)
2. Setup an application/Web Interface (WebUI) for interfacing/interacting with the language model
    - Notes
        + Ensure that the WebUI points to the LLM's local server port number

## Setup Core Large Language Model for Local AI

> System Requirements
    + Ensure that your system has `>= 3.5GB` RAM/memory before proceeding as Ollama (and other LLM (Large Language Models)) require more than or exactly 3.5GB to work efficiently

### Using docker
> Dependencies
+ docker
+ docker-compose : Optional; If you are using docker compose

> Pre-Requisites

- Using docker-compose
    - Prepare the `docker-compose.yaml` configuration file for the Large Language Model of choice
        - Create the 'docker-compose.yaml' file(s)
             ```bash
             touch docker-compose.yaml
             ```
        - Edit the configuration file and populate it with the docker-compose key-value settings
             + Please refer to 'ollama/ollama' in [Templates - docker-images](#templates) for a template configuration to the ollama docker-compose file

- If you are using an NVIDIA GPU
    - Install the NVIDIA Container Toolkit
        - Using package manager
            - apt-based (Debian)
                - Configure the repository sources and add the NVIDIA repository keyring and GPG Public-Private Key for Authentication and Authorization
                    ```bash
                    curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey \
                        | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg
                    ```
                - Add the NVIDIA Repository to the apt sources list
                    ```bash
                    curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list \
                        | sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' \
                        | sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
                    ```
                - Update package manager database
                    ```bash
                    sudo apt-get update
                    ```
                - Install the NVIDIA Container Toolkit packages
                    ```bash
                    sudo apt install nvidia-container-toolkit
                    ```
    - Configure docker to use the Nvidia driver
        ```bash
        sudo nvidia-ctk runtime configure --runtime=docker
        ```
    - Restart the docker service
        ```bash
        sudo systemctl restart docker
        ```
    - (Optional) Test GPU integration
        - Explanation
            + This is to make sure that the NVIDIA container toolkit can access the NVIDIA Driver
        ```bash
        docker run --rm {--runtime=nvidia} --gpus all nvidia/cuda:11.5.2-base-ubuntu20.04 nvidia-smi
        ```

> Starting up and managing the language model image server

- Startup docker container using the docker image
    - Using docker-compose
        - Notes
            - To deploy/provide the container access to the GPU, add the following YAML block to your docker container definition in the 'docker-compose.yaml' file
                - Pre-Requisites
                    + Install the NVIDIA Container Toolkit
                ```yaml
                services:
                    your-service:
                        image: image-name
                        container_name: container-name
                        restart: unless-stopped
                        #  ...
                        deploy:
                          ## Explicitly define the hardware configuration/specification to deploy/passthrough from the host system into the container
                          resources:
                            reservations:
                              devices:
                                - driver: nvidia
                                  count: all
                                  capabilities: [gpu]
                ```
        ```bash
        docker-compose up -d
        ```
    - Using docker run
        - Without GPU (CPU only)
            ```bash
            docker run -itd --name ollama --restart=unless-stopped -p 11434:11434 -v "${PWD}/ollama:/root/.ollama" ollama/ollama
            ```
        - With GPU
            - AMD GPU
                ```bash
                docker run -itd --name ollama --device /dev/dri --restart=unless-stopped -p 11434:11434 -v "${PWD}/ollama:/root/.ollama" ollama/ollama
                ```
            - NVIDIA GPU
                - Pre-Requisites
                    + Install the NVIDIA Container Toolkit
                - Notes and Expanation
                    + Pass `--gpus=all` to passthrough and use the host system's GPU in the container
                ```bash
                docker run -itd --name ollama --gpus=all --restart=unless-stopped -p 11434:11434 -v "${PWD}/ollama:/root/.ollama" ollama/ollama
                ```

- Start the stopped container
    - Using docker-compose
        ```bash
        docker-compose start ollama
        ```
    - Using docker run
        ```bash
        docker container start ollama
        ```

- Stop the running container
    - Using docker-compose
        ```bash
        docker-compose stop ollama
        ```
    - Using docker run
        ```bash
        docker container stop ollama
        ```

- Retart the running container
    - Using docker-compose
        ```bash
        docker-compose restart ollama
        ```
    - Using docker run
        ```bash
        docker container restart ollama
        ```

- Shutdown the container
    - Using docker-compose
        ```bash
        docker-compose down
        ```
    - Using docker run
        ```bash
        docker stop ollama && docker rm ollama
        ```

- Execute commands to the ollama CLI utility in the container
    ```bash
    docker exec -it ollama ollama {options} <arguments>
    ```

### Using bare metal
> Dependencies

> Pre-Requisites

> Installation

- Automatic install 'ollama' CLI utility
    - Download the installation script
        ```bash
        curl -L -O https://ollama.com/install.sh
        ```
    - (Optional - Recommended) Read the script
        ```bash
        cat install.sh
        ```
    - Change permission modifier/code to executable
        ```bash
        chmod u+x install.sh
        ```
    - Begin Installation
        ```bash
        ./install.sh
        ```

- Manual install
    - Download package tarball archive
        - Explanation
            + Replace `architecture` with the CPU architecture of your system
            - Architectures
                + amd64 : x86_64
                + arm64 : 64-bit ARM CPU
        ```bash
        curl -L https://ollama.com/download/ollama-linux-[architecture].tgz -o ollama-linux-[architecture].tgz
        ```
    - Extract the tarball to the installation directory (i.e. '$PREFIX' which is usually '/usr/local')
        - Explanation
            + Replace `architecture` with the CPU architecture of your system
            - Architectures
                + amd64 : x86_64
                + arm64 : 64-bit ARM CPU
        ```bash
        sudo tar -C /usr/local -xvzf ollama-linux-[architecture].tgz
        ```

- (Optional) Create a user and group specifically for ollama
    - Create a ollama user using the ollama group
        ```bash
        sudo useradd -m -r -U -G ollama -s /bin/false -d /usr/lib/share/ollama ollama
        ```

> Post-Installation

- Start ollama
    ```bash
    ollama serve
    ```

- Verify that ollama is installed and running
    ```bash
    ollama -v
    ```

## Setup WebUI Interface

### Using docker
> Dependencies
+ docker
+ docker-compose : Optional; If you are using docker compose

> Pre-Requisites

- Using docker-compose
    - Prepare the `docker-compose.yaml` configuration file for the WebUI applications ('open-webui'/'ollama-webui')
        - Create the 'docker-compose.yaml' file(s)
             ```bash
             touch docker-compose.yaml
             ```
        - Edit the configuration file and populate it with the docker-compose key-value settings
             + Please refer to 'open-webui/open-webui' in [Templates - docker-images](#templates) for a template configuration to the open-webui docker-compose file
             + Please refer to 'ollama-webui/ollama-webui' in [Templates - docker-images](#templates) for a template configuration to the ollama-webui docker-compose file

> Starting up and managing the container

- Startup docker container using the docker image
    - Using docker-compose
        ```bash
        docker-compose up -d
        ```
    - Using docker run
        - open-webui
            - Notes and Expanation
                + Pass `--gpus=all` to passthrough and use the host system's GPU in the container
            ```bash
            docker run -itd --name open-webui --restart=unless-stopped --add-host "host.docker.internal:[model-hosting-server-ip-address]" -p 3000:8080 -v "${PWD}/open-webui:/app/backend/data" ghcr.io/open-webui/open-webui:main
            ```
        - ollama-webui
            - Notes and Expanation
                + Pass `--gpus=all` to passthrough and use the host system's GPU in the container
            ```bash
            docker run -itd --name ollama-webui --restart=unless-stopped --add-host "host.docker.internal:[model-hosting-server-ip-address]" -p 3000:8080 -v "${PWD}/ollama-webui:/app/backend/data" ghcr.io/ollama-webui/ollama-webui:main
            ```

- Start the stopped container
    - Using docker-compose
        ```bash
        docker-compose start [container-name]
        ```
    - Using docker run
        ```bash
        docker container start [container-name]
        ```

- Stop the running container
    - Using docker-compose
        ```bash
        docker-compose stop [container-name]
        ```
    - Using docker run
        ```bash
        docker container stop [container-name]
        ```

- Retart the running container
    - Using docker-compose
        ```bash
        docker-compose restart [container-name]
        ```
    - Using docker run
        ```bash
        docker container restart [container-name]
        ```

- Shutdown the container
    - Using docker-compose
        ```bash
        docker-compose down
        ```
    - Using docker run
        ```bash
        docker stop [container-name] && docker rm [container-name]
        ```

### Using bare metal
> Dependencies
+ open-webui
+ nginx

> Pre-Requisites

## Accessing

### Large Language Model Core
- To access the Local AI Server Core LLM
    + Connect your application to `[model-hosting-server-ip-address]:11434`

### Web Application
- Open your browser
    - In the address bar
        + Type `http://[local-ai-webui-server-ip-address]:3000`

## Documentations

### ollama basics
> Synopsis/Syntax

```bash
ollama {optionals} <arguments> [actions|commands] {parameters}
```

> Parameters
- Positionals
    - actions : Explicitly specify the action to execute regarding LLM models
        - Actions
            + `pull [model]:[version]` : Pull the image of the specified model from the remote repository server to the local ollama AI server for local image deployment
            + `run [model]:[version]` : Install (if it doesnt exist) and run a REPL using a specified Large Language Model
            + `serve` : Start ollama
- Optionals
    - With Arguments
    - Flags

> Usage
- Install (if it doesnt exist) and run a REPL using a specified Large Language Model
    ```bash
    ollama run [model]:[version]
    ```
- Pull the image of the specified model from the remote repository server to the local ollama AI server for local image deployment
    ```bash
    ollama pull [model]:[version]
    ```
- Start ollama server
    ```bash
    ollama serve
    ```

### HTTP REST API

#### Usage
> Bash

- Send a HTTP request to the language model and generate a response
    - Using curl
        ```bash
        curl "http://[model-hosting-server-ip-address]:[model-hosting-server-port-number]/api/generate" -d '{
            "model": "your-model-here (i.e. llama3.2|mistral)",
            "prompt": "your prompt message here"
        }'
        ```
- Chat with a model
    - Using curl
        ```bash
        curl "http://[model-hosting-server-ip-address]:[model-hosting-server-port-number]/api/chat" -d '{
            "model": "your-model-here (i.e. llama3.2|mistral)",
            "messages": [
                { "role" : "user", "content": "your message hjere" },
                ...
            ]
        }'
        ```

> Python

```python
from requests import post
from json import loads

def main():
    # Initialize Variables
    response_text = ""
    src_url = "http://[model-hosting-server-ip-address]:[model-hosting-server-port-number]/api/generate"

    # Send a POST request to the ollama local AI server's HTTP REST API to generate a response using the LLM model and return the response to a variable
    response = post(url=src_url, json={
        "model": "your-model-here (i.e. llama3.2|mistral)",
        "prompt": "your prompt message here"
    }).text.splitlines()

    # Load the response chunks to a JSON output
    response_text += loads(chunk)["response"]

    # Print response text string
    print(response_text)

if __name__ == "__main__":
    main()
```

### Networking

> Network Ports

- Ollama
    + 11434 : Port 11434 is the default port exposed/used by Ollama to host the language model server for wrappers to call and reference

- open-webui
    + 8080 : Default port exposed by open-webui for the WebUI interface

- ollama-webui
    + 8080 : Default port exposed for the WebUI interface

### Environment Variables
> ollama
+ `OLLAMA_API_CREDENTIALS=[api-crdentials]` : Explicitly specify the credentials for your Ollama server API
+ `OLLAMA_KEEP_ALIVE=[ttl (time-to-live)]` : Specify the amount of time to keep the model alive; Format: `Nh` (where N = amount of time)

> open-webui
+ `OLLAMA_BASE_URL=[model-hosting-server-ip-address]:[model-hosting-server-port-number]` : Explicitly set the base server URL/hostname and the port number pointing to the Ollama server
+ `ENABLE_SIGNUP=false|true` : Enable/Disable Signup on startup
+ `WEBUI_NAME=name of webui title` : Set the Web application's title/name here
+ `WEBUI_URL=[web-server-ip-address]:[web-server-port-number]` : Explicitly set the server URL/hostname and the port number to the WebUI application server
+ `WEBUI_SECRET_KEY=[secret-key]` : Set the secret key/passphrase/password to the WebUI; NOTE: For security reasons, please do not hardcode this but instead, set this into an environment variable on the host system/terminal and reference it (i.e. docker-compose will be `- WEBUI_SECRET_KEY=${WEBUI_SECRET_KEY}`)

### Volumes

## Snippets

### Windows
- Setting alias to the ollama CLI utility in docker
    ```dosbatch
    doskey ollama='docker exec -it ollama ollama'
    ```

### Linux
- Setting alias to the ollama CLI utility in docker
    ```bash
    alias ollama="docker exec -it ollama ollama"
    ```

## Wiki

### Templates

> docker images

> docker-compose files
- ollama/ollama
    - Without GPU
        ```yaml
        # Docker compose configuration file for ollama/ollama
        version: "3.7"
        services:
          ollama:
            image: ollama/ollama
            container_name: ollama
            restart: unless-stopped
            ports:
              ## Port Forward/Translate/Map from host system port to container port
              ## [host-system-ip-address]:[host-system-port]:[container-port]
              - 11434:11434
            volumes:
              ## Mount volumes from host system into container
              ## [host-system-volume]:[container-volume]:[permissions]
              - "${PWD}/ollama:/root/.ollama"
        ```
    - With GPU
        - AMD GPU
            ```yaml
            # Docker compose configuration file for ollama/ollama
            version: "3.7"
            services:
              ollama:
                image: ollama/ollama
                container_name: ollama
                restart: unless-stopped
                ports:
                  ## Port Forward/Translate/Map from host system port to container port
                  ## [host-system-ip-address]:[host-system-port]:[container-port]
                  - 11434:11434
                volumes:
                  ## Mount volumes from host system into container
                  ## [host-system-volume]:[container-volume]:[permissions]
                  - "${PWD}/ollama:/root/.ollama"
                devices:
                  ## Passthrough the following devices
                  ## [host-system-device-driver-file]:[container-device-driver-file]
                  - "/dev/dri:/dev/dri"
            ```
        - NVIDIA GPU
            ```yaml
            # Docker compose configuration file for ollama/ollama
            version: "3.7"
            services:
              ollama:
                image: ollama/ollama
                container_name: ollama
                restart: unless-stopped
                ports:
                  ## Port Forward/Translate/Map from host system port to container port
                  ## [host-system-ip-address]:[host-system-port]:[container-port]
                  - 11434:11434
                volumes:
                  ## Mount volumes from host system into container
                  ## [host-system-volume]:[container-volume]:[permissions]
                  - "${PWD}/ollama:/root/.ollama"
                devices:
                  ## Passthrough the following devices
                  ## [host-system-device-driver-file]:[container-device-driver-file]
                  - "/dev/dri:/dev/dri"
                deploy:
                  ## Explicitly define the hardware configuration/specification to deploy/passthrough from the host system into the container
                  resources:
                    reservations:
                      devices:
                        - driver: nvidia
                          count: all
                          capabilities: [gpu]
            ```

- open-webui/open-webui
    ```yaml
    # Docker compose configuration file for ghcr.io/open-webui/open-webui:main
    version: "3.7"
    services:
      open-webui:
        image: ghcr.io/open-webui/open-webui:main
        container_name: open-webui
        restart: unless-stopped
        extra_hosts:
          ## Add extra hosts into the docker container
          ## [host-name]:[host-ip-address]
          ## Default: - "host.docker.internal:host-gateway"
          - "host.docker.internal:[model-hosting-server-ip-address]"
        ports:
          ## Port Forward/Translate/Map from host system port to container port
          ## [host-system-ip-address]:[host-system-port]:[container-port]
          - "3000:8080"
        volumes:
          ## Mount volumes from host system into container
          ## [host-system-volume]:[container-volume]:[permissions]
          - "${PWD}/open-webui:/app/backend/data"
    ```

- ollama-webui/ollama-webui
    ```yaml
    # Docker compose configuration file for ghcr.io/ollama-webui/ollama-webui:main
    version: "3.7"
    services:
      ollama-webui:
        image: ghcr.io/ollama-webui/ollama-webui:main
        container_name: ollama-webui
        restart: unless-stopped
        extra_hosts:
          ## Add extra hosts into the docker container
          ## [host-name]:[host-ip-address]
          ## Default: - "host.docker.internal:host-gateway"
          - "host.docker.internal:[model-hosting-server-ip-address]"
        ports:
          ## Port Forward/Translate/Map from host system port to container port
          ## [host-system-ip-address]:[host-system-port]:[container-port]
          - "3000:8080"
        volumes:
          ## Mount volumes from host system into container
          ## [host-system-volume]:[container-volume]:[permissions]
          - "${PWD}/ollama-webui:/app/backend/data"
    ```

- Complete stack
    - Explanation
        - To deploy/provide the container access to a non-NVIDIA (i.e. AMD) GPU, add the following YAML block to your docker container definition in the 'docker-compose.yaml' file
            - Notes
                + this is equivalent to `docker run -itd --name "container-name" --device "/dev/dri" --restart=unless-stopped ... repo-author/repo-name:[tag|version]`
            ```yaml
            services:
                your-service:
                    image: image-name
                    container_name: container-name
                    restart: unless-stopped
                    #  ...
                    devices:
                      ## Passthrough the following devices
                      ## [host-system-device-driver-file]:[container-device-driver-file]
                      - "/dev/dri:/dev/dri"
            ```
        - To deploy/provide the container access to an NVIDIA GPU, add the following YAML block to your docker container definition in the 'docker-compose.yaml' file
            - Pre-Requisites
                + Install the NVIDIA Container Toolkit
            - Notes
                + this is equivalent to `docker run -itd --name "container-name" --gpus=all --restart=unless-stopped ... repo-author/repo-name:[tag|version]`
            ```yaml
            services:
                your-service:
                    image: image-name
                    container_name: container-name
                    restart: unless-stopped
                    #  ...
                    deploy:
                      ## Explicitly define the hardware configuration/specification to deploy/passthrough from the host system into the container
                      resources:
                        reservations:
                          devices:
                            - driver: nvidia
                              count: all
                              capabilities: [gpu]
            ```
        - Explicitly define a common network group for the docker services within the docker compose environment/stack to follow
            - Definition
                ```yaml
                networks:
                    ## Network name here
                    ollama-docker:
                        ## Network setting key-value configurations here
                        external: false
                ```
            - Usage
                ```yaml
                services:
                    service-name-1:
                        image: image-name
                        container_name: container-name
                        restart: unless-stopped
                        #  ...
                        networks:
                            - ollama-docker

                    service-name-2:
                        image: image-name
                        container_name: container-name
                        restart: unless-stopped
                        #  ...
                        networks:
                            - ollama-docker

                    # ...

                    service-name-N:
                        image: image-name
                        container_name: container-name
                        restart: unless-stopped
                        #  ...
                        networks:
                            - ollama-docker
                ```
    ```yaml
    version: "docker-version"
    services:
      # (OPTIONAL) If you have an application stack depending on/requiring ollama to be built first/exist
      app:
        image: [your-app-image-name (use 'docker-compose up -d --build' to build the image)]
        build: .
        container_name: [your-app-container-name]
        restart: unless-stopped
        depends_on:
          ## Specify dependencies/image to startup first
          - ollama
          - open-webui | ollama-webui
        ports:
          ## Port Forward/Translate/Map from host system port to container port
          ## [host-system-ip-address]:[host-system-port]:[container-port]
        volumes:
          ## Mount volumes from host system into container
          ## [host-system-volume]:[container-volume]:[permissions]
        networks:
          - ollama-docker
        command: 
          - /bin/bash 
          - -c |
              startup command here

      # Docker compose configuration file for ollama/ollama - the ollama CLI utility and server
      ollama:
        image: ollama/ollama
        container_name: ollama
        restart: unless-stopped
        ports:
          ## Port Forward/Translate/Map from host system port to container port
          ## [host-system-ip-address]:[host-system-port]:[container-port]
          - 11434:11434
        volumes:
          ## Mount volumes from host system into container
          ## [host-system-volume]:[container-volume]:[permissions]
          - "${PWD}/ollama:/root/.ollama"
        networks:
          - ollama-docker
        ## (OPTIONAL) Specify this if you are using an AMD GPU/non-NVIDIA GPU and want to use a GPU in the rendering
        devices:
          ## Passthrough the following devices
          ## [host-system-device-driver-file]:[container-device-driver-file]
          - "/dev/dri:/dev/dri"
        ## (OPTIONAL) Specify this if you are using a NVIDIA GPU and want to use a GPU in the rendering
        deploy:
          ## Explicitly define the hardware configuration/specification to deploy/passthrough from the host system into the container
          resources:
            reservations:
              devices:
                - driver: nvidia
                  count: all
                  capabilities: [gpu]

      ## IF you are using open-webui for the LLM Web Interface
      open-webui:
        image: ghcr.io/open-webui/open-webui:main
        container_name: open-webui
        restart: unless-stopped
        depends_on:
          - ollama
        extra_hosts:
          ## Add extra hosts into the docker container
          ## [host-name]:[host-ip-address]
          ## Default: - "host.docker.internal:host-gateway"
          - "host.docker.internal:[model-hosting-server-ip-address]"
        ports:
          ## Port Forward/Translate/Map from host system port to container port
          ## [host-system-ip-address]:[host-system-port]:[container-port]
          - "3000:8080"
        volumes:
          ## Mount volumes from host system into container
          ## [host-system-volume]:[container-volume]:[permissions]
          - "${PWD}/open-webui:/app/backend/data"
        networks:
          - ollama-docker

      ## IF you are using ollama-webui for the LLM Web Interface
      ollama-webui:
        image: ghcr.io/ollama-webui/ollama-webui:main
        container_name: ollama-webui
        restart: unless-stopped
        depends_on:
          - ollama
        extra_hosts:
          ## Add extra hosts into the docker container
          ## [host-name]:[host-ip-address]
          ## Default: - "host.docker.internal:host-gateway"
          - "host.docker.internal:[model-hosting-server-ip-address]"
        ports:
          ## Port Forward/Translate/Map from host system port to container port
          ## [host-system-ip-address]:[host-system-port]:[container-port]
          - "3000:8080"
        volumes:
          ## Mount volumes from host system into container
          ## [host-system-volume]:[container-volume]:[permissions]
          - "${PWD}/ollama-webui:/app/backend/data"
        networks:
          - ollama-docker

    ## (Optional) Map the common network configuration for the containers to follow
    networks:
        ollama-docker:
            external: false
    ```

## Resources
+ [apeatling - articles - A simple guide to local LLM fine-tuning on a Mac with MLX - Part 1: Setting up your environment](https://apeatling.com/articles/part-1-setting-up-your-environment/)
+ [apeatling - articles - A simple guide to local LLM fine-tuning on a Mac with MLX - Part 2: Building your training data for fine tuning](https://apeatling.com/articles/part-2-building-your-training-data-for-fine-tuning/)
+ [bitdoze - ollama docker install](https://www.bitdoze.com/ollama-docker-install/)
+ [ollama - blog - ollama is now available as an official docker image](https://ollama.com/blog/ollama-is-now-available-as-an-official-docker-image)

## References
+ [collabnix - How to run Open Source LLMs locally with ollama and docker](https://collabnix.com/how-to-run-open-source-llms-locally-with-ollama-and-docker-llama3-1-phi3-mistral-gemma2/)
+ [Dockerhub - ollama/ollama](https://hub.docker.com/r/ollama/ollama)
+ [GitHub - ollama/ollama](https://github.com/ollama/ollama)
+ [GitHub - ollama/ollama - Docs - Development and Building from Source](https://github.com/ollama/ollama/blob/main/docs/development.md)
+ [GitHub - ollama/ollama - Docs - HTTP REST API](https://github.com/ollama/ollama/blob/main/docs/api.md)
+ [GitHub - ollama/ollama - Docs - Linux](https://github.com/ollama/ollama/blob/main/docs/linux.md)
+ [GitHub - open-webui/open-webui](https://github.com/open-webui/open-webui)
+ [OpenWebUI Documentations - Getting Started](https://docs.openwebui.com/getting-started/)
+ [Medium - khodeprasad - How to run ollama locally using docker](https://khodeprasad.medium.com/how-to-run-ollama-locally-using-docker-2a5bdd90cc20)
+ [Nvidia Documents - nvidia-container-toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#installation)

## Remarks

### Docker syntax used
- Define a common network group for the docker services within the docker compose environment/stack to follow
    - Definition
        ```yaml
        networks:
            ## Network name here
            your-common-network-group-name:
                ## Network setting key-value configurations here
                external: false
        ```
    - Usage
        ```yaml
        services:
            service-name-1:
                image: image-name
                container_name: container-name
                restart: unless-stopped
                #  ...
                networks:
                    - your-common-network-group-name

            service-name-2:
                image: image-name
                container_name: container-name
                restart: unless-stopped
                #  ...
                networks:
                    - your-common-network-group-name

            # ...

            service-name-N:
                image: image-name
                container_name: container-name
                restart: unless-stopped
                #  ...
                networks:
                    - your-common-network-group-name
        ```

