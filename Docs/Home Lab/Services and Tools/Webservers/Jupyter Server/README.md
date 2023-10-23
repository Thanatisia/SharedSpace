 # Python - Jupyter Notebooks

## Information
### Background
```
JupyterLabs is a WebUI frontend for the Jupyter server/service that contains various text editing capabilities within a standalone webpage 
as well as the useful python REPL Jupyter Notebooks.
```

## Containerization
### Images
- Variants
    + base notebook
    + minimal notebook
    + datascience notebook

- Repository URL: 
    + GitHub : https://github.com/jupyter/docker-stacks
    + Quay.io  : https://quay.io/jupyter
    + DockerHub: https://hub.docker.com/jupyter

- Documentation Pages:
    + [Jupyter Notebook Docker Documentations](https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html)

## System Design
### Networking
- Ports
    + 8888 : For the JupyterLab WebUI frontend for Jupyter Server; Can be changed in the '~/.jupyter/jupyter_server_config.py' file by setting `c.ServerApp.port = [port-number]`

## Quickstart Flow and Reference
### Initial Usage
- Get server login token from server list
    ```console
    jupyter server list
    ```

- Create/generate a configuration file for the notebook
    + This will generate a configuration file in the '~/.jupyter' directory
    ```console
    jupyter server --generate-config
    ```

### Executing
- Start the notebook
    ```console
    jupyter server
    ```

### Security
#### Running a public notebook server
+ Create/generate a configuration file for the notebook

- Edit configuration file
    + configuration file '~/.jupyter/jupyter_server_config.py'
    ```console
    $EDITOR '~/.jupyter/jupyter_server_config.py'
    ```
    - To change password
        - Enable password change
            + `c.ServerApp.allow_password_change=True`
        - In WebUI
            + Set new password in the bottom text box
        - In Configuration
            - Preparing hashed password for use
                + Using the python function 'jupyter_server.auth.passwd()'
                ```python
                from jupyter_server.auth import passwd

                passwd()
                ```
            - Change password in configuration file
                + `c.ServerApp.password = u'[hashing-algorithm]:<your hashed password here>'` : Set a custom hashed password for your WebUI authentication and authorization
            - Change password from command line
                ```console
                jupyter server --ServerApp.password=u'[hashing-algorithm]:<your-password-hash-here>'
                ```
    - To set a fixed port number (instead of default 8888)
        + `c.ServerApp.port = [port-number]`

## Resources

## References
+ [FreeCodeCamp - How to mount local directories using `docker run -v`](https://www.freecodecamp.org/news/docker-mount-volume-guide-how-to-mount-a-local-directory/#:~:text=You%20bind%20local%20directories%20and,source%3E%3A%20.)
+ [Jupyter Docker Documentations - Main Page and Quick Start](https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html)
+ [Github Repository - jupyter/docker-stacks](https://github.com/jupyter/docker-stacks)

## Remarks

