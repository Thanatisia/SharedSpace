# Docker - Dockerfile Image Template - Tips and Tricks

## Snippets
### Using Build Arguments
- Dynamically load base image on built-time using Build Arguments
    - Explanation
        + The ARG instruction can be used at any point within the Dockerfile to initialize variables
        - Since Docker 17, the ARG instruction variables can be used with the FROM keyword to specify the base image and tags to pull on build-time
            + By specifying the Build Arguments via '--build-args BUILD_ARGUMENT=value'
    ```dockerfile
    ARG BASE_IMAGE_NAME="base-image-name"
    ARG BASE_IMAGE_TAG="base-image-tag"
    FROM ${BASE_IMAGE_NAME}:${BASE_IMAGE_TAG} AS [target]
    ```

