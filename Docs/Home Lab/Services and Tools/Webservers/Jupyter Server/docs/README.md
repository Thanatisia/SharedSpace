# Jupyter

## Table of Contents
- Documentations
    + [Jupyter Support](#jupyter-support)
- Usage Contents
    + [Operational Flow](#operational-flow)
    + [Security](#security)

## Documentations
### Jupyter Support
+ [server](manuals/jupyter-server.md)       : Handle the Jupyter Server instance
+ [nbconvert](manuals/jupyter-nbconvert.md) : Jupyter Notebooks - Converter CLI utility

## Quickstart Reference
### Operational Flow
- Start the notebook
    ```console
    jupyter server
    ```

- Actions you can make
    + Create a new Jupyter Notebook (.ipynb)

- Convert IPython Jupyter Notebook into the type you require
    - Python
        ```console
        jupyter nbconvert --to=python --output=main.py file.ipynb
        ```

### Security
#### Authentication and Authorization
- Get server login token from server list
    ```console
    jupyter server list
    ```

- Create/generate a configuration file for the notebook
    + This will generate a configuration file in the '~/.jupyter' directory
    ```console
    jupyter server --generate-config
    ```

- Edit configuration file
    + configuration file '~/.jupyter/jupyter_server_config.py'
    ```console
    $EDITOR '~/.jupyter/jupyter_server_config.py'
    ```
    - To change password
        - Enable password change
            + `c.ServerApp.allow_password_change=True`
        - 
    - To set a fixed port number (instead of default 8888)
        + `c.ServerApp.port = [port-number]`

#### Running a public notebook server
- Create/generate a configuration file for the notebook
    ```console
    jupyter server --generate-config
    ```

- Preparing hashed password for use
    + Using the python function 'jupyter_server.auth.passwd()'
    ```python
    from jupyter_server.auth import passwd

    passwd()
    ```

## Wiki

## Resources

## References
+ [Jupyter Server Documentations](https://jupyter-server.readthedocs.io/en/latest/)
+ [Jupyter Server Documentations - Operators - Running a public Jupyter Server](https://jupyter-server.readthedocs.io/en/latest/operators/public-server.html)

## Remarks
