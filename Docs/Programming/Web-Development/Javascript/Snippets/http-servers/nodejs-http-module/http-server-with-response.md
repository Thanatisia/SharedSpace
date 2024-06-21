# Javascript Snippet - HTTP Servers - Creating a simple http server in NodeJS using the http module - Request Listener

## Steps
0. This is a continuation from the basic HTTP server (without any statements in the callback event handler) 
    + Please refer to [here](Docs/Programming/Web-Development/Javascript/Snippets/http-servers/nodejs-http-module/simple-http-server.md) for a rundown

1. Update the HTTP Request Listener handler callback event function

> Send back a simple 200 HTTP Status Code and the response text to return to the sender

- Explanation
    - `res.writeHead(HTTP_STATUS_CODE)` : This statement will write the HTTP Status Code to the header of the HTTP transmission packet (in this case, 200 = OK)
        + The header of a HTTP transmission packet contains the identifiers and metadata that defines the packet, this is so that HTTP Servers like ours, Web Servers are able to communicate with each other.
    - `res.end(string)` : This statement will specify the specified response text to send back to the server/sender's end point device
        + In this case, this will return the string "My first server"
```js
const requestListener = function (req, res) {
    // Process response
    res.writeHead(200);

    // Write in the end point
    res.end("My first server!");
};
```

> Returning different types of content

- Notes
    - When responding, we can return data from a variety of formats
        - Text formats
            + Plaintext
            + JSON (Commonly denoted by an API)
            + CSV
            + HTML (DOM Web sites/pages)
            + XML
        - Non-Text Formats
            + PDF
            + Zipped files
            + Audio files
            + Video files

- Explanation
    - `res.setHeader(header-name, header-value);` : Map the specified header's name to the value in the response object container
        + The header of a HTTP transmission packet contains the identifiers and metadata that defines the packet, this is so that HTTP Servers like ours, Web Servers are able to communicate with each other.
        - The `res.setHeader()` method takes 2 arguments
            + The header's name and its value
        - Parameter Signature/Header
            - header-name : Specify the header name to place into the header container
                + Type: String
                - Header Names
                    + Content-Type : Set the type of content you wish to send (Default: application/json)
            - header-value : Specify the value to send
                + Type: String
    - `res.setHeader("Content-Type", "application/<type>");` : This line will set a key-value mapping the "Content-Type" key to the content type you wish to send back
        - Notes
            + This is used by the HTTP POST and PUT methods for the HTTP servers to know how to process the data obtained
            + by default, the 'application/json' content-type is used
            - This is similar to using curl
                - Explanation
                    + `-H|--headers 'header-name: header-value'` : Specify/Set the header name to the header value
                    + `-d 'data'` : Specify the data/response text you wish to POST to the server
                    + `-X|--request method` : Specify the HTTP method to use to send the request
                - JSON
                    - Making a GET request
                        ```bash
                        curl -H 'Content-Type: application/json' \
                             -X GET \
                             [protocol]://[webserver-ip]:[webserver-port]/API/PAGE
                        ```
                    - Making a POST request
                        ```bash
                        curl -H 'Content-Type: application/json' \
                             -d '{ "key" : "value", "key2" : "value2", ... }' \
                             -X POST \
                             [protocol]://[webserver-ip]:[webserver-port]/API/PAGE
                        ```
        - Content Types: 
            - CSV : `res.setHeader("Content-Type", "text/csv");`
            - JSON : `res.setHeader("Content-Type", "application/json");`
            - HTML : `res.setHeader("Content-Type", "text/html");`

- Returning JSON
    + `res.writeHead(HTTP_STATUS_CODE)` : This statement will write the HTTP Status Code to the header of the HTTP transmission packet (in this case, 200 = OK)
    - `res.end(data)` : This statement will specify the specified response text to send back to the server/sender's end point device
        - Note that in this scenario, because the content type is explicitly JSON (i.e. REST API, JSON data)
            + The endpoint message string is a JSON string instead of plaintext

    ```js
    const requestListener = function (req, res) {
        // Specify the content type you wish to send back to the caller
        res.setHeader("Content-Type", "application/json");

        // Process response
        res.writeHead(200);

        // Send data back to the endpoint device
        res.end(`{"message": "This is a JSON response"}`);
    };
    ```

- Returning CSV
    ```js
    const requestListener = function (req, res) {
        // Specify the content type you wish to send back to the caller
        res.setHeader("Content-Type", "text/csv");

        // Specify the Content File you wish to send back to the caller
        res.setHeader("Content-Disposition", "attachment;filename=<your-target-csv-file>.csv");

        // Process response
        res.writeHead(200);

        // Send data back to the endpoint device
        res.end(`header-columns,row-values-1,row-values-2,...`);
    };
    ```

- Returning HTML content
    ```js
    const requestListener = function (req, res) {
        // Specify the content type you wish to send back to the caller
        res.setHeader("Content-Type", "text/html");

        // Process response
        res.writeHead(200);

        // Send data back to the endpoint device
        res.end(`<html><head><title>Hello World</title></head><body><p><h1>Hello World</h1></p></body></html>`);
    };
    ```

## Snippets

- Information
    + Module: server.js

### Send back a simple 200 HTTP Status Code and the response text to return to the sender

```js
// Import library and dependencies
const http = require("http");

// Define constant variables
const host = '192.168.1.67'; // Server Remote IP address
const port = 8000;        // Server Port Number

// Define the prototype function definition for the HTTP Request Listener function
const requestListener = function (req, res) {
    // Process response
    res.writeHead(200);

    // Return the response text to the sender
    res.end("My first server!");
};

// Create the HTTP Server passing the request listener as the callback event handler
const server = http.createServer(requestListener);

// Begin serving and start listening at the specified HTTP Server URL '[protocol]://[server-ip-address]:[server-port-number]'
server.listen(port, host, () => {
    console.log(`Server is running on http://${host}:${port}`);
});   
```

### Returning different types of content

- JSON
    ```js
    // Import library and dependencies
    const http = require("http");

    // Define constant variables
    const host = '192.168.1.67'; // Server Remote IP address
    const port = 8000;        // Server Port Number

    // Define the prototype function definition for the HTTP Request Listener function
    const requestListener = function (req, res) {
        // Specify the content type you wish to send back to the caller
        res.setHeader("Content-Type", "application/json");

        // Process response
        res.writeHead(200);

        // Send data back to the endpoint device
        res.end(`{"message": "This is a JSON response"}`);
    };

    // Create the HTTP Server passing the request listener as the callback event handler
    const server = http.createServer(requestListener);

    // Begin serving and start listening at the specified HTTP Server URL '[protocol]://[server-ip-address]:[server-port-number]'
    server.listen(port, host, () => {
        console.log(`Server is running on http://${host}:${port}`);
    });   
    ```

- CSV
    ```js
    // Import library and dependencies
    const http = require("http");

    // Define constant variables
    const host = '192.168.1.67'; // Server Remote IP address
    const port = 8000;        // Server Port Number

    // Define the prototype function definition for the HTTP Request Listener function
    const requestListener = function (req, res) {
        // Specify the content type you wish to send back to the caller
        res.setHeader("Content-Type", "text/csv");

        // Specify the Content File you wish to send back to the caller
        res.setHeader("Content-Disposition", "attachment;filename=<your-target-csv-file>.csv");

        // Process response
        res.writeHead(200);

        // Send data back to the endpoint device
        res.end(`header-columns,row-values-1,row-values-2,...`);
    };

    // Create the HTTP Server passing the request listener as the callback event handler
    const server = http.createServer(requestListener);

    // Begin serving and start listening at the specified HTTP Server URL '[protocol]://[server-ip-address]:[server-port-number]'
    server.listen(port, host, () => {
        console.log(`Server is running on http://${host}:${port}`);
    });   
    ```

- HTML
    ```js
    // Import library and dependencies
    const http = require("http");

    // Define constant variables
    const host = '192.168.1.67'; // Server Remote IP address
    const port = 8000;        // Server Port Number

    // Define the prototype function definition for the HTTP Request Listener function
    const requestListener = function (req, res) {
        // Specify the content type you wish to send back to the caller
        res.setHeader("Content-Type", "text/html");

        // Process response
        res.writeHead(200);

        // Send data back to the endpoint device
        res.end(`<html><head><title>Hello World</title></head><body><p><h1>Hello World</h1></p></body></html>`);
    };

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

