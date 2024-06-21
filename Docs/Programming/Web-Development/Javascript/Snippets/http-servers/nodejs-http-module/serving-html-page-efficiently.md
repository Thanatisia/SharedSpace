# Javascript Snippet - HTTP Servers - Creating a simple http server in NodeJS using the http module - Efficiently serving an HTML Page from a file

## Steps

0. This is a rewrite of the HTTP Webserver serving an HTML Page from a file to be more efficient
    + Please refer to [here](Docs/Programming/Web-Development/Javascript/Snippets/http-servers/nodejs-http-module/http-server-serving-html-page.md) for a rundown

1. Initialize a global variable 'indexFile' to hold the contents of the target HTML file
    ```js
    let indexFile;
    ```

2. Refactor the HTTP Request Listener handler callback event function to return the contents of `indexFile`
    - Explanation
        - The file reading logic will be shifted from the job of the HTTP Request Listener callback event function to the server startup
            - This means that the file reading will not be done everytime a connection is made, 
                + instead, it will be read only once (during the server boot-time) and it can be used everytime during the lifetime of the web application
    ```js
    const requestListener = function (req, res) {
        // Specify the content type you wish to send back to the caller
        res.setHeader("Content-Type", "text/html");

        // Set the HTTP status code to 200
        res.writeHead(200);

        // Send the file contents obtained from the file back to the endpoint device
        res.end(contents);
    };
    ```

3. Refactor and merge the server startup logic into the file reading logic
    - Explanation
        - On server startup, the script will read the specified file and if the file was read successfully, it will return its data
            + initialize a local variable named 'contents', 
            + place the file contents into the global variable 'indexFile' and 
            + the server will begin serving and start listening for HTTP Requests
        - The file reading logic will be shifted from the job of the HTTP Request Listener callback event function to the server startup
            - This means that the file reading will not be done everytime a connection is made, 
                + instead, it will be read only once (during the server boot-time) and it can be used everytime during the lifetime of the web application
        - The error handler has been modified to check for the existence of the index page instead of the request
            + This means that if the index page has issues, the server would not even startup, reducing startup costs
        - When a request is received, 
            + the request listener will be triggered and the event handler will just need to obtain the contents found in `indexFile` and return as response to the sender.
    ```js
    // Create the HTTP Server passing the request listener as the callback event handler
    const server = http.createServer(requestListener);

    // Read the index page and then take the contents, 
    // - If the .readFile() promise successfully resolves, it will return its data
    //  - initialize a local variable named 'contents', 
    //  - place the file contents into the global variable 'indexFile' and 
    //  - Startup the server
    fs.readFile(__dirname + "/index.html").then(contents => {
        // Begin serving and start listening at the specified HTTP Server URL '[protocol]://[server-ip-address]:[server-port-number]'
        server.listen(port, host, () => {
            console.log(`Server is running on http://${host}:${port}`);
        });
    })
    // Error Handling
    .catch(err => {
        console.error(`Could not read index.html file: ${err}`);
        process.exit(1);
    });
    ```

## Snippets

```js
// Import library and dependencies
const http = require("http");
const fs = require('fs').promises;

// Define constant variables
const host = 'localhost'; // Server Remote IP address
const port = 8000;        // Server Port Number

// Declare and Initialize global variables
let indexFile;

// Define the prototype function definition for the HTTP Request Listener function
const requestListener = function (req, res) {
    // Specify the content type you wish to send back to the caller
    res.setHeader("Content-Type", "text/html");

    // Set the HTTP status code to 200
    res.writeHead(200);

    // Send the file contents obtained from the file back to the endpoint device
    res.end(indexFile);
};

// Create the HTTP Server passing the request listener as the callback event handler
const server = http.createServer(requestListener);

// Read the index page and then take the contents, 
// - If the .readFile() promise successfully resolves, it will return its data
//  - initialize a local variable named 'contents', 
//  - place the file contents into the global variable 'indexFile' and 
//  - Startup the server
fs.readFile(__dirname + "/index.html").then(contents => {
    // Set the contents
    indexFile = contents;

    // Begin serving and start listening at the specified HTTP Server URL '[protocol]://[server-ip-address]:[server-port-number]'
    server.listen(port, host, () => {
        console.log(`Server is running on http://${host}:${port}`);
    });
})
// Error Handling
.catch(err => {
    console.error(`Could not read index.html file: ${err}`);
    process.exit(1);
});
```

## Resources
+ [DigitalOcean - Community - Tutorials - How to write asynchronous code in NodeJS](https://www.digitalocean.com/community/tutorials/how-to-write-asynchronous-code-in-node-js)

## References
+ [DigitalOcean - Community - Tutorials - How to create a webserver in NodeJS with the http module](https://www.digitalocean.com/community/tutorials/how-to-create-a-web-server-in-node-js-with-the-http-module)

## Remarks

