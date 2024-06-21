# Javascript Snippet - HTTP Servers - Creating a simple http server in NodeJS using the http module - Webserver Routing

## Information
- This is using the basic HTTP server (without any statements in the callback event handler) as a template/reference
    + Please refer to [here](Docs/Programming/Web-Development/Javascript/Snippets/http-servers/nodejs-http-module/simple-http-server.md) for a rundown

- For documentation/reference, please follow the previous snippets in the following sequence
    1. [simple-http-server.md](Docs/Programming/Web-Development/Javascript/Snippets/http-servers/nodejs-http-module/simple-http-server.md)
    2. [http-server-with-response.md](Docs/Programming/Web-Development/Javascript/Snippets/http-servers/nodejs-http-module/http-server-with-response.md)
    3. [http-server-serving-html-page.md](Docs/Programming/Web-Development/Javascript/Snippets/http-servers/nodejs-http-module/http-server-serving-html-page.md)
    4. [serving-html-page-efficiently.md](Docs/Programming/Web-Development/Javascript/Snippets/http-servers/nodejs-http-module/serving-html-page-efficiently.md)

## Steps
1. Define the API JSON data to use in your routes
    - Explanation
        - `JSON.stringify(json_data)`
            + `JSON` is a class in Javascript used to handle JSON data objects
            - `.stringify(json_data)` is used to convert a JSON object into a string object for usage
                + In this scenario, to store our JSON data in variables before the requestListener() Request Listener callback event handler
    ```js
    const json_contents = JSON.stringify([
        { key: "value", ...}
    ]);
    ```

2. Refactor the HTTP Request Listener handler callback event function to return JSON response text
    - Explanation
        - `switch (req.url) {}` : Create a switch statement on the request's URL and return the right JSON depending on the URL page the user visits
            + `req.url` is a property from the HTTP request object that contains the URL accessed by the sender
        - The cases will be your web routing, the pages 
            + The page are essentially routes you specify behind the domain (i.e. `[protocol]://[server-ip-address]:[server-port-number]/<page>`)
            - In a HTTP webserver (or a proxy, reverse proxy server), the routing may determine the security access layer a website has
                + As the more routes you have, the more segregated and controlled the user's clients may be
        - When the user accesses your page in the URL `[protocol]://[server-ip-address]:[server-port-number]/<your-route>`
            - If the route is a valid page as defined in the switch case
                - The server will 
                    + set the head to HTTP Status Code 200 (OK) and
                    + Send the appropriate API JSON content back to the sender as response
                    + break the listener
            - If the route is invalid (i.e. Unauthorized access, file not found, route not found)
                - The server will
                    + set the head to HTTP Status Code 404 (Not Found) and
                    + Respond with an error message in the form of a JSON string
    ```js
    const requestListener = function (req, res) {
        // Specify the content type you wish to send back to the caller
        res.setHeader("Content-Type", "application/json");

        // Create a switch statement on the request's URL and return the right JSON depending on the URL page the user visits
        switch (req.url) {
            case "/<your-route>":
                // Set the HTTP status code to 200 (OK)
                res.writeHead(200);

                // Send the API JSON content back to the endpoint device
                res.end(json_contents);

                // Break the switch case
                break
            default:
                // Error case - user tried to access other unauthorized paths
                res.writeHead(404);
                res.end(JSON.stringify({error: "Resource not found"}));
        }
    };
    ```

3. Startup the HTTP Server by running javascript module using nodejs
    ```bash
    node server.js
    ```

4. Test the HTTP API request
    - Using curl
        ```bash
        curl [protocol]://[server-ip-address]:[server-port-number]/[route]
        ```

## Snippets

```js
// Import library and dependencies
const http = require("http");

// Define constant variables
const host = 'localhost'; // Server Remote IP address
const port = 8000;        // Server Port Number

// Declare and Initialize global variables
const books = JSON.stringify([
    { title: "The Alchemist", author: "Paulo Coelho", year: 1988 },
    { title: "The Prophet", author: "Kahlil Gibran", year: 1923 }
]);

const authors = JSON.stringify([
    { name: "Paulo Coelho", countryOfBirth: "Brazil", yearOfBirth: 1947 },
    { name: "Kahlil Gibran", countryOfBirth: "Lebanon", yearOfBirth: 1883 }
]);

// Define the prototype function definition for the HTTP Request Listener function
const requestListener = function (req, res) {
    // Specify the content type you wish to send back to the caller
    res.setHeader("Content-Type", "application/json");

    // Create a switch statement on the request's URL and return the right JSON depending on the URL page the user visits
    switch (req.url) {
        case "/books":
            // Set the HTTP status code to 200
            res.writeHead(200);

            // Send the API JSON content back to the endpoint device
            res.end(books);

            // Break the switch case
            break
        case "/authors":
            // Set the HTTP status code to 200
            res.writeHead(200);

            // Send the API JSON content back to the endpoint device
            res.end(authors);

            // Break the switch case
            break
        default:
            // Error case - user tried to access other unauthorized paths
            res.writeHead(404);
            res.end(JSON.stringify({error: "Resource not found"}));
    }
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

