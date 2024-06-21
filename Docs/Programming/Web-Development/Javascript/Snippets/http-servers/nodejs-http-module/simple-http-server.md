# Javascript Snippet - HTTP Servers - Creating a simple http server in NodeJS using the http module

## Steps
1. Import library and dependencies
    - Explanation
        + http : The HTTP Server utilities module/library. This contains functionalities related to webserver routing, requests and response
    ```js
    const http = require("http");
    ```

2. Define constant variables required for establishing remote connection with the HTTP Server
    - Explanation
        + host : This is the server's remote IP address, commonly denoted as 'HOST'
        + port : This is the server's listening Port number, commonly denoted as 'PORT'
    ```js
    const host = 'localhost|your-server-ip-address'; // Server Remote IP address
    const port = 8000;        // Server Port Number
    ```

3. Define the prototype function definition for the HTTP Request Listener callback event handler function
    - Explanation
        + This function will be executed by the HTTP server (callback) after the server receives a connection from a client (event) and handle the incoming HTTP requests and return an HTTP response
        - Parameter Signature/Header
            - req : The HTTP request object. This captures all the data contained within the TCP/IP transmission packet of the incoming HTTP request
            - res : The HTTP response object. This will contain all of the values to return back to the sender
        - The body of the request listener event handler should be handling the data received from the sender, 
            + process the data and return the appropriate response string/text/API/JSON value
    ```js
    const requestListener = function (req, res) {};
    ```

4. Create the HTTP Server passing the request listener as the callback event handler
    ```js
    const server = http.createServer(requestListener);
    ```

5. Begin serving and start listening at the specified HTTP Server URL `[protocol]://[server-ip-address]:[server-port-number]`
    ```js
    server.listen(port, host, () => {
        console.log(`Server is running on http://${host}:${port}`);
    });
    ```

6. Startup the HTTP Server by running javascript module using nodejs
    ```bash
    node server.js
    ```

## Snippets

> Module: server.js

```js
// Import library and dependencies
const http = require("http");

// Define constant variables
const host = '192.168.1.67'; // Server Remote IP address
const port = 8000;        // Server Port Number

// Define the prototype function definition for the HTTP Request Listener function
const requestListener = function (req, res) {};

// Create the HTTP Server passing the request listener as the callback event handler
const server = http.createServer(requestListener);

// Begin serving and start listening at the specified HTTP Server URL '[protocol]://[server-ip-address]:[server-port-number]'
server.listen(port, host, () => {
    console.log(`Server is running on http://${host}:${port}`);
});   
```

## Resources

## References
+ [DigitalOcean - Community - Tutorials - How to create a webserver in NodeJS with the http module](https://www.digitalocean.com/community/tutorials/how-to-create-a-web-server-in-node-js-with-the-http-module)

## Remarks

