# Python Library - flask

```
Documentation, Guides and general tips n tricks for the Python Library - flask
```

## Table of Contents
* [Documentation](#documentation)
* [Pre-Requisites](#pre-requisites)
* [Setup](#setup)

## Information
### DESCRIPTION
```
Flask is a very popular Web Application Framework (WAF) - A tool designed to build websites - designed in python entirely from the ground up as opposed to Django.

Essentially, flask - like Django and Pyramid - is a framework designed to allow Server-side (Backend) programming/development using Python in Web Server Programming, like PHP.

Flask is also designed to be very minimal, simple and very lightweight, thus it is also considered to be a "Microframework"
```

### Notes
- Typically, you will be using flask with other libraries to perform communication over the web
    - Packages
        + requests : To communicate with APIs

### Components
- Web Server Launcher
    + Your main web server program
    + Will be used to communicate with/call out to the APIs

- Website
    + index.html : The Website's index page (aka home page) - can be static/dynamic
        
### File Locations
- NOTE: 
    - All concepts used here are general Web Server Programming concepts, 
        - you can use these in other Web Server Programming frameworks such as Django or even in languages like PHP Web Servers
            + Some changes may be expected depending on the requirements, but not too different
        
- General Apache2/PHP Web Servers
    ```
        / : Your Web Server Root directory/path; Typically is your working directory's root folder
        |
        |-- server.py : Your Web Server program, can be server.php (for example)
        |
        |-- site/
            |
            |-- html/ : Your HTML website root directory
                |
                |-- index.html : Your website index page file (aka home page)
                
    ```
    
- Flask
    ```
        / : Your Web Server Root directory/path; Typically is your working directory's root folder
        |
        |-- server.py : Your Web Server program, can be server.php (for example)
        |
        |-- templates/ : Your HTML website's root directory
            |
            |-- index.html : Your website index page file (aka home page)
            
    ```

### Steps

## Documentation
        
### Importing
- Whole Module
    ```python
    import flask
    ```

- Individual Components
    ```python
    from flask import [class-name | functions]
    ```
    
### Modules
    
### Classes

### Objects
- Flask
    - Functions
        + .route(website_root_path) : Route refers to the place to go, the location; Thus - Specify the route you want the application to go to
            - Description
                + When someone navigates to the website, when they go to the root of the website (DNS), run the referenced function to the decorator
            - Parameters
                - website_root_path : The Root of the website when a user navigates to the website's root url
                    - Type : String
                    - Default : "/" (The Web Server Root directory)
        + .run(**kwargs) : Run the main Flask Website Application
            - Parameters
                - Optionals
                    - host="x.x.x.x" : Tells the Flask Website Server Application to run on the specified host; This is your host IP address
                        + Type : String
                        - Examples
                            + 0.0.0.0 : Run on all addresses
                    - port=n : Tells the server to connect through the specified port; This is your host port number
                        + Type : Integer
    - Attributes

### Functions
- flask
    - .Flask(website_file_directory) : Initialize the Flask root application object
        - Parameters
            - website_file_directory : Specify the location filepath of the working directory running this website
                + Type : String
        + Return Type : Flask
    - .render_template(webpage_filename, **kwargs) : Used to reference an external HTML code/script
        - Parameters
            - Positionals
                - webpage_filename : The webpage file to run
                    + Type : String
            - Optionals
                - **kwargs : Takes in any number of keywords you require to query in the path specified in @app.route(filepath); tldr specify all queries required by the API
                    + Type : Dictionary
        + Return Type : 
        
### Usage
- Basic Structure
    + Refer to this to kickstart things off
    - Create Python Web Server
        ```python
        #!/bin/python
        from flask import Flask
        
        """
        Flask(__name__) : Telling the application that everything you need to run this website is in this current directory
        """
        app = Flask(__name__)
        
        @app.route("/") # Initialize decorator 
        def index():
            """
            Define your Website index page (main page)
            """
            html_Body = "Hello World!"
            return html_Body
            
        def main():
            """
            Server main runner/launcher
            """
            app.run(host="0.0.0.0", port=80)
            
        if __name__ == "__main__":
            main()
        ```
                
    - Access the Webserver
        + Grab the Running IP address specified on the server standard output
        + Open your browser
        + Enter the website to open the page
   
- Static Website
    + This will be using 'requests' to interact with API
    + This will be using 'json' to process the JSON results
    - Create Python Web Server
        ```python
        #!/bin/python 
        from flask import Flask, render_template
        import requests
        import json
        
        app = Flask(__name__)
        
        def run_api(url):
            """
            Communicate with an API and decode the JSON string into a dictionary
            """
            response = json.loads(requests.request("GET", url).text)
            return response
        
        @app.route("/")
        def index():
            api_response = run_api()
            return render_template("index.html")
        
        def main():
            app.run(host="0.0.0.0", port=80)
        
        if __name__ == "__main__":
            main()
        ```
        
    - Design your website
        - Note the word "keyword"
            + You can use any keyword/variable names in the Python flask backend in the HTML by wrapping the name in \{\{\}\}
            ```html
            <html>
                <head>
                    <title>Test Flask</title>
                </head>
                
                <body>
                    <p>Hello Flask! {{keyword}}</p>
                </body>
            </html>
            ```

     - Access the Webserver
        + Grab the Running IP address specified on the server standard output
        + Open your browser
        + Enter the website to open the page
        
## Wiki

    
## References
+ [YouTube | NetworkChuck | build a meme Python website (Flask Tutorial for Beginners)](https://www.youtube.com/watch?v=5aYpkLfkgRE)

## Resources

## Remarks
+ Decorators : Essentially, adds more functionality to the function referenced right below it
