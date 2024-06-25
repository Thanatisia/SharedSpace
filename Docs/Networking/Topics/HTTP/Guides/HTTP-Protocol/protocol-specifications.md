# Computer Networking - Protocols - HTTP - Protocol Specifications

## Table of Contents
+ [HTTP Packet Structure](#http-packet-structure)

## Introduction
- HTTP is the protocol that browsers use to retrieve and push information to servers. 
    + However, HTTP is just text, and HTTPS is text that has been encrypted with a 'padlock' that is the TLS/SSL encryption protocol layer

- HTTP has several components
    - Resources
        + HTTP Method : This is the function/action that the HTTP server will do on receive (i.e. GET, POST, PUSH)
        + URL Path : This specifies the path/route passed by the client to establish the connection (`http(s)://[domain]/path/route`)
        + HTTP version : Specify the version of HTTP to use; i.e. HTTP/1.0 = HTTP v1.0
    - Method-specific information
        - GET request
            + User Agent : The User Agent states the browser/method used to establish the HTTP connection (i.e. Mozilla => Firefox, Chrome => Google Chrome)
        - POST request
            - `Content-Type: <content-type (text/<raw-string> | application/<data-serialization>)>` : Specify the type of data/content you wish to add into the packet to send back to the client
                - Content Types
                    - Raw text
                        - `text/html` : HTML (web page/sites) files
                    - Application-based
                        - `application/json` : JSON contents
                        - `application/x-www-form-urlencoded` : Web form data
            - `Content-Length: <size-of-content>` : Specify the size of (number of characters in) the content data
    - Examples
        - GET request
            ```bash
            GET /<route> HTTP/1.0
            User-Agent: Mozilla/5.0
            ```
        - POST request
            ```bash
            POST /<route> HTTP/1.0
            Content-Type: <content-type (text/<raw-string> | application/<data-serialization>)>
            Content-Length: <size-of-content>


            your-form-data
            ```

- HTTP follows a certain pattern:
    1. Specify which resource you want (HTTP/1.0 etc etc)
    2. HTTP Headers
    3. blank line that separates the headers from the body of the message (if any)
    4. Your message body

## HTTP Packet Structure

- Explanation
    - Structure and Components
        - HTTP packet header information
            + `HTTP/[http-version]` : Specify the HTTP version you wish to send the response with (i.e. 1.0 = HTTP/1.0)
            + `[HTTP Response Status Code] [HTTP Status Message]` : Your HTTP Routing response status code and its corresponding status message ('200 OK', '404 Not Found' etc etc)
        - HTTP response body and texts
            + `[response-text-body]` : Place your response body you wish to send/reply back to the sender
    - Notes
        - Notice the 2 newlines, those are necessary as part of the HTTP Protocol specifications for separation of information
            + First component contains the HTTP packet headers
            + 2nd component contains the response body

```
HTTP/[http-version]
[HTTP Response Status Code] [HTTP Status Message]


[response-text-body]
```

## Resources

## References
+ [Codementor - joaojonesventura - Building a basic HTTP server from scratch in python](https://www.codementor.io/@joaojonesventura/building-a-basic-http-server-from-scratch-in-python-1cedkg0842)

## Remarks

