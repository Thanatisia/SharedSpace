# Jupyter Server 

## Table of Contents
- Documentations
    + [Synopsis/Syntax](#synopsis/syntax)
    + [Parameters](#parameters)
- Usage Contents
    + [General](#general)
    + [Security](#security)

## Documentations
### Synopsis/Syntax
```console
jupyter server {options} <arguments> [actions]
```

### Parameters
- Positionals
    - actions
        + default (leave empty) : Start Jupyter server
        + list : List all server logins
        + password : Prompt for a password from you and record the hashed password digest in your 'jupyter_server_config.json'
- Optionals
    - With Arguments
        - `--gateway-url=[gateway-server]` : Explicitly specify the gateway server URL you wish to redirect to
        - `--ServerApp.{options}=<value>` : Change the 'ServerApp' option key-values
            - ServerApp Options
                + `base_url = "/{prefix/subdirectory}"` : Explicitly specify the URL prefix (subdirectory) for the notebook dashboard; i.e. "/ipython/" => "http://localhost:[port]/[prefix]/"
                + `certfile = u'/absolute/path/to/your/certificate/mycert.pem'` : Explicitly set certification file
                + `keyfile = u'/absolute/path/to/your/certificate/mykey.key'`   : Explicitly set key file
                + `ip = '*'` : Set ip to '*' to bind on all interfaces (ips) for the public server
                + `password = u'sha1:bcd259ccf...<your hashed password here>'` : Set a custom hashed password for your WebUI authentication and authorization
                + `allow_password_change=[True|False]` : Allow 'jupyter server password' to change the WebUI password
                + `open_browser = [True|False]` : Enable/Disable auto-opening of browser on startup
                + `port = [port-number]` : To set a fixed port number (instead of default 8888)
    - Flags
        + --generate-config : Generates a configuration file for the notebook in the '~/.jupyter' directory


## Usage Contents
### General
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

### Executing
- Start the notebook
    ```console
    jupyter server
    ```

### Security
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

### Configurations
- Configuration Directory: 
    + Windows : '%HOMEDIR%\.jupyter'
    + MacOS X : '/Users/[USERNAME]/.jupyter'
    + Linux   : '~/.jupyter'
- Configuration Files:
    + jupyter_server_config.py   : Contains the Jupyter server configuration file
    + jupyter_server_config.json : Contains the Jupyter server authentication configuration

- jupyter_server_config.py
    - Options
        + `c.ServerApp.base_url = "/{prefix/subdirectory}"` : Explicitly specify the URL prefix (subdirectory) for the notebook dashboard; i.e. "/ipython/" => "http://localhost:[port]/[prefix]/"
        + `c.ServerApp.certfile = u'/absolute/path/to/your/certificate/mycert.pem'` : Explicitly set certification file
        + `c.ServerApp.keyfile = u'/absolute/path/to/your/certificate/mykey.key'`   : Explicitly set key file
        + `c.ServerApp.ip = '*'` : Set ip to '*' to bind on all interfaces (ips) for the public server
        + `c.ServerApp.password = u'sha1:bcd259ccf...<your hashed password here>'` : Set a custom hashed password for your WebUI authentication and authorization
        + `c.ServerApp.allow_password_change=[True|False]` : Allow 'jupyter server password' to change the WebUI password
        + `c.ServerApp.open_browser = [True|False]` : Enable/Disable auto-opening of browser on startup
        + `c.ServerApp.port = [port-number]` : To set a fixed port number (instead of default 8888)
        - `c.ServerApp.tornado_settings = { json-settings }` : To set the settings of the notebook in case you may want to embed the notebook somewhere on your website (i.e. in an iframe)
            - JSON settings
                - headers : Edit the Website content headers settings
                    + Content-Security-Policy : Set the content security policy of the website
        - `c.GatewayClient.url = "http://gateway-server:8888` : Set the gateway server client URL to redirect to

- Environment Variables
    + `JUPYTER_GATEWAY_URL=[url]` : Explicitly specify the gateway server URL you wish to redirect to

## Resources

## References
+ [Jupyter Server Documentations](https://jupyter-server.readthedocs.io/en/latest/)
+ [Jupyter Server Documentations - Operators - Running a public Jupyter Server](https://jupyter-server.readthedocs.io/en/latest/operators/public-server.html)

## Remarks
