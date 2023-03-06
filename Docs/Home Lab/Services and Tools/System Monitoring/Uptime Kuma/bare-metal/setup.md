# Uptime Kuma Setup - Bare-Metal


## Setup
### Pre-Requisites
### Dependencies
+ nodejs : Webserver
+ npm : NodeJS package manager
+ git : Version Control and cloning from repository
+ pm2 : For running Uptime Kuma in the background

### Installation
- Update your npm to the latest version
    + if you want to update it locally, leave out the -g (global)
    ```console
    npm install npm -g
    ```
- Obtain repository
    - Clone
        ```console
        git clone https://github.com/louislam/uptime-kuma.git
        ```
    - Change Directory into folder
        ```console
        cd uptime-kuma
        ```
- Run npm setup
    ```console
    npm run setup
    ```

### Verification and Usage
- Option 1 : Try and startup using Node
    ```console
    node server/server.js
    ```
- (Recommended) Option 2 : Run in background using PM2
    - Install dependencies
        ```console
        npm install pm2 -g && pm2 install pm2-logrotate
        ```
    - Start Server
        ```console
        pm2 start server/server.js --name uptime-kuma
        ```

## Documentations
### Useful PM2 commands
- To see current console output
    ```console
    pm2 monit
    ```

- To add it to startup
    ```console
    pm2 save && pm2 startup
    ```

### Administrative
- Reset Admin password
    - Find Uptime Kuma installation directory
        ```console
        sudo find / -name uptime-kuma
        ```
    - Navigate to it 
        + i.e. /opt/uptime-kuma
        ```console
        cd /opt/uptime-kuma
        ```
    - Reset admin password
        ```console
        sudo npm run reset-password
        ```

## Wiki

## Resources
+ [PM2 Process Manager Daemon](https://pm2.keymetrics.io/)
+ [lindevs - Reset Uptime Kuma admin password](https://lindevs.com/reset-uptime-kuma-admin-password-in-linux/)

## References
+ [GitHub - louislam/uptime-kuma](https://github.com/louislam/uptime-kuma)

## Remarks
