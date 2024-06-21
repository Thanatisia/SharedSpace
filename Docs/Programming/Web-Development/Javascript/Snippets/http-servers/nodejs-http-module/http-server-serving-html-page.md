# Javascript Snippet - HTTP Servers - Creating a simple http server in NodeJS using the http module - Serving an HTML Page from a file

## Steps

0. This is a continuation from the basic HTTP server with the Request Listener and the response return logic
    + Please refer to [here](Docs/Programming/Web-Development/Javascript/Snippets/http-servers/nodejs-http-module/http-server-with-response.md) for a rundown

1. Import library and dependencies
    - Explanation
        - fs : The filesystems module/library. This contains functionalities related to the server's filesystem such as pathfinding and file I/O
            - `.promises` is a variant of the filesystem library that keeps with modern javascript best practices
                + It is syntactically easier than callbacks
    ```js
    const fs = require("fs").promises;
    ```

2. Update the HTTP Request Listener handler callback event function to read the HTML file
    - Explanation
        - `fs.readFile()` will read the index page file and then take the contents, 
            - If the .readFile() promise successfully resolves, 
                + it will return its data
                + initialize a local variable named 'contents', 
                + place the file contents into the local variable and 
                + execute the function to the contents
                + Write the HTTP status code 200 to the response object's head
                + The contents will be passed into the response object as the response text to be sent back to the sender
        - Error Handling/Catching
            - If an error is found
                + Write the HTTP status code 500 to the response object's head
                + Write the error message to the response object as the response text to be sent back to the sender
    ```js
    const requestListener = function (req, res) {
        // Read the index page and then take the contents, 
        // - If the .readFile() promise successfully resolves, it will return its data
        //  - initialize a local variable named 'contents', 
        //  - place the file contents into the local variable and 
        //  - execute the function to the contents
        fs.readFile(__dirname + "/index.html").then(contents => {
            // Specify the content type you wish to send back to the caller
            res.setHeader("Content-Type", "text/html");

            // Set the HTTP status code to 200
            res.writeHead(200);

            // Send the file contents obtained from the file back to the endpoint device
            res.end(contents);
        })
        // Error Handling
        .catch(err => {
            // Set the HTTP status code to 200
            res.writeHead(500);

            // Send the file contents obtained from the file back to the endpoint device
            res.end(err);

            return;
        });
    };
    ```

3. Create an HTML file that the webserver will return
    - Information
        + File name: index.html
    ```html
    <!DOCTYPE html>

    <html>
        <head>
            <title>My Website</title>
            <style>
                *,
                html {
                    margin: 0;
                    padding: 0;
                    border: 0;
                }

                html {
                    width: 100%;
                    height: 100%;
                }

                body {
                    width: 100%;
                    height: 100%;
                    position: relative;
                    background-color: rgb(236, 152, 42);
                }

                .center {
                    width: 100%;
                    height: 50%;
                    margin: 0;
                    position: absolute;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    color: white;
                    font-family: "Trebuchet MS", Helvetica, sans-serif;
                    text-align: center;
                }

                h1 {
                    font-size: 144px;
                }

                p {
                    font-size: 64px;
                }
            </style>
        </head>

        <body>
            <div class="center">
                <h1>Hello Again!</h1>
                <p>This is served from a file</p>
            </div>
        </body>

    </html>
    ```

## Snippets

```js
// Import library and dependencies
const http = require("http");
const fs = require('fs').promises;

// Define constant variables
const host = 'localhost'; // Server Remote IP address
const port = 8000;        // Server Port Number

// Define the prototype function definition for the HTTP Request Listener function
const requestListener = function (req, res) {
    // Read the index page and then take the contents, 
    // - If the .readFile() promise successfully resolves, it will return its data
    //  - initialize a local variable named 'contents', 
    //  - place the file contents into the local variable and 
    //  - execute the function to the contents
    fs.readFile(__dirname + "/index.html").then(contents => {
        // Specify the content type you wish to send back to the caller
        res.setHeader("Content-Type", "text/html");

        // Set the HTTP status code to 200
        res.writeHead(200);

        // Send the file contents obtained from the file back to the endpoint device
        res.end(contents);
    })
    // Error Handling
    .catch(err => {
        // Set the HTTP status code to 200
        res.writeHead(500);

        // Send the file contents obtained from the file back to the endpoint device
        res.end(err);

        return;
    });
};

// Create the HTTP Server passing the request listener as the callback event handler
const server = http.createServer(requestListener);

// Begin serving and start listening at the specified HTTP Server URL '[protocol]://[server-ip-address]:[server-port-number]'
server.listen(port, host, () => {
    console.log(`Server is running on http://${host}:${port}`);
});
```

## Resources
+ [DigitalOcean - Community - Tutorials - How to write asynchronous code in NodeJS](https://www.digitalocean.com/community/tutorials/how-to-write-asynchronous-code-in-node-js)

## References
+ [DigitalOcean - Community - Tutorials - How to create a webserver in NodeJS with the http module](https://www.digitalocean.com/community/tutorials/how-to-create-a-web-server-in-node-js-with-the-http-module)

## Remarks

