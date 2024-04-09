# Docker - using inspect to return image and container information for visualization and manipulation

## Information

### Introduction
- `docker inspect` : Docker inspect is a function in the docker CLI that returns the running configurations of the specified containers as well as built specifications of images
    - Docker inspect will return a JSON object containing a list of dictionaries with each element being a dictionary containing the inspect results of each input target
        - i.e.
            + [0] = Base Image/Container 1
            + [1] = Base Image/Container 2
    - With this JSON object, you can output the result into a JSON file 
        ```bash
        docker inspect [base-images|container-names ...] >> inspect-results.json
        ```
    - The JSON file can be imported for manipulation
        - i.e.
            - Using 'jq'
                - Obtaining all information of the target
                    ```bash
                    cat inspect-results.json | jq -r .[]
                    ```
                - Obtaining the Base Image's size
                    ```bash
                    cat inspect-results.json | jq -r .[].Size
                    ```
                - Obtaining the Base Image's platform Architecture
                    ```bash
                    cat inspect-results.json | jq -r .[].Architecture
                    ```
                - Obtaining the Base Image's operating system
                    ```bash
                    cat inspect-results.json | jq -r .[].Os
                    ```
                - Obtaining the Container configurations
                    ```bash
                    cat inspect-results.json | jq -r .[].Config
                    ```
                - Obtaining the Base Image of the container
                    ```bash
                    cat inspect-results.json | jq -r .[].Config.Image
                    ```
                - Obtaining the Host Configurations tied to the container
                    ```bash
                    cat inspect-results.json | jq -r .[].HostConfig
                    ```
                - Obtaining the Network Settings of the container
                    ```bash
                    cat inspect-results.json | jq -r .[].NetworkSettings
                    ```
                - Obtaining the Currently active Networks running in the container
                    ```bash
                    cat inspect-results.json | jq -r .[].NetworkSettings.Networks
                    ```
                - Obtaining the Mount configurations of the container
                    ```bash
                    cat inspect-results.json | jq -r .[].Mounts
                    ```

## Resources

## References

## Remarks
