# Flask Quickstart reference guide

## Information

### Flask project file structure
- root/
    + README.md
    - Flask/ : Application webserver root directory
        + app.py : This is the Webserver executable application
        - static : This folder is where you keep your static resources such as images and CSS files
            - images/ : Contains your images
        - templates : This folder is where you keep your HTML (web pages) and routing template files
            + index.html : This is the typical index/home page

## Setup
### Dependencies
+ python3
+ python-pip
+ python-venv
- Python Packages
    + flask

### Pre-Requisites
- Generate a Python Virtual Environment to have an isolated/containerized environment to work in
    - Create Python Virtual Environment
        ```bash
        python3 -m venv [virtual-environment-name]
        ```
    - Chroot into Python Virtual Environment
        - Linux
            ```bash
            . [virtual-environment-name]/bin/activate
            ```
        - Windows
            ```bash
            .\[virtual-environment-name]\Scripts\activate
            ```

- Prepare Python Packages/Dependencies
    - Install Python Packages/Dependencies
        ```bash
        pip install -Ur requirements.txt
        ```

    - Verify packages
        ```bash
        pip freeze list
        ```

- Setup basic web development project filesystem structure for flask
    - Create application root source directory
        ```bash
        mkdir -pv Flask
        ```
    - Change directory into the newly created root
        ```bash
        cd Flask
        ```
    - Create project folders
        - Explanation
            - Required folders
                + static : This folder is where you keep your static resources such as images and CSS files
                + templates : This folder is where you keep your HTML (web pages) and routing template files
        ```bash
        mkdir -pv static templates
        ```
    - Create recommended subfolders
        - Static folders
            ```bash
            mkdir -pv static/images
            ```
    - Create your index.html (home page) in your 'templates' folder
        - Create a blank index.html page in 'templates/'
            ```bash
            touch templates/index.html
            ```
        - Write the HTML body into 'index.html'
            ```html
            <!doctype html>
            <html lang="en">
                <head>
                    <!-- Required meta tags -->
                    <meta charset="utf-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1">
                    <title>Website header title</title>
                </head>
                <body>
                    <p>Hello World!</p>
                </body>
            </html>
            ```

- Setup your app.py webserver executable
    - Create your 'app.py' webserver executable in your 'Flask' web application root folder
        - Populate 'app.py' with all the required modules that will be necessary during project runtime
            - Explanation
                - The following packages and modules/libraries except flask are optional and may be used if necessary
                    - email : For handling email-format objects/functionalities
                        - .mime : For handling Email MIME formattings
                            - .text : For handling Email MIME texts
                        - message : For handling Email messages
                    + smtplib : For connecting to email servers via SMTP
            ```python
            from flask import Flask, render_template, request, url_for, redirect 
            from email.mime.text import MIMEText 
            from email.message import EmailMessage 
            import smtplib 
            ```
        - Initialize the webserver application object using the current executable as the root webserver
            ```python
            app = Flask(__name__)
            ```
        - Add the application route '/' (the webserver routing pointing to the home/root page) 
            - This will render the 'index.html' (home) page from the 'templates/' folder when accessed (i.e. http://[server-ip|domain]:[server-port]/)
                + This will be the home page of the website
            ```python
            @app.route("/") 
            def index(): 
               return render_template("index.html")
            ```
        - Add a webserver route with a variable
            - You can define a variable in the route using the `<variable-name>` keyword/identifier
            - When the criteria/expression matches with the route syntax
                + The variable will be passed from the routing URL into the function
            ```python
            @app.route("/[route-name]/<variable_name>")
            def route_function_name(variable_name): 
                # Initialize Variables
                res = ""

                # Process variable

                # Return back to DOM
                return res
            ```
        - Add a webserver route with multiple variables
            - You can obtain multiple variables without defining in the path
                - using the 'request' function
                    - To pass the variables in the URL
                        - Access the URL using the following format: `[protocol]://[server-ip|domain]:[server-port-number]/[route-name]?[query-conditions]
                            + The query conditions are your variable-value mappings: `variable-1=value-1&variable-2=value-2`
                            - Notes
                                + Note the '?' at the end of the route, this essentially tells the webserver that you have query/data to parse into the function that is decorated/attached to the route
                                + Please separate all `variable=value` mappings with a '&' delimiter
            ```python
            @app.route("/[route-name]")
            def route_function_name():
                # Initialize Variables

                # Obtain the variable
                value = request.args.get(variable_name, default_value)

                # Return back to DOM
                return value
            ```
        - Add a POST request application route
            - When the route '[route-name]' is accessed (i.e. http://[server-ip|domain]:[server-port]/[route-name]/) with a POST request
                - i.e.
                    + when a user sends a message to the person
                - The decorated/defined/attached function will be executed
                    - The function will check if the request method is a POST request
                        - and if it is a POST request
                            + The function will retrieve/fetch all the required information from the HTML page (aka DOM) that was sent in the POST request via an attached keyword
            ```python
            @app.route("/[route-name]/", methods=['POST']) 
            def route_function_name(): 
                if request.method == "POST": 
                    # Obtain information from the POST request keyword
                    post_value = request.form['post-keyword']
            ```
        - Add a return at the end of a decorator function after completing the route's functionality
            - Explanation
                + The returned object will be returned to the website's DOM interface, and the function will be executed by the DOM
            ```python
            @app.route("/[route-name]/") 
            def route_function_name(): 
                # Statements...

                # Return back to the loop
                return redirect('/')
            ```
        - Add an `if __name__ == "__main__":` to run the webserver only if you are running it directly and not as a module
            ```python
            if __name__ =="__main__":
                app.run(debug=True)
            ```

- Optionals
    - Setup a simple SMTP server login function
        - Initialize SMTP library and connect to SMTP server
            - Explanation
                - Syntax/Synopsis
                    ```python
                    server = smtplib.SMTP('smtp-server-domain', smtp-server-port-number)
                    ```
                - Parameters/Argument Signature
                    - smtp-server-domain : Specify the domain of the SMTP server to connect to
                        - Commonly used Server Domains
                            + Gmail : smtp.gmail.com
                    - smtp-server-port-number : Specify the port number of the SMTP server to connect to
                        + Default Port Number: 587
            ```python
            server = smtplib.SMTP('smtp.gmail.com', 587)
            ```
        - Send an introductory 'ehlo' request and response to establish a connection
            ```python
            server.ehlo()
            ```
        - Start TLS/SSL Encryption
            ```python
            server.starttls()
            ```
        - Login to the server using your email and password
            - Explanation
                - Synopsis/Syntax
                    ```python
                    server.login(email-address, your-password)
                    ```
                - Parameter/Argument Signatures
                    - email-address : The email address that you want to connect to
                        + Type: String
                        + Format: [email-address]@[email-server-domain]
                    - your-password : The password for your email address
                        - Notes
                            - Please take care in not storing your email address and password in the code itself
                                - Best Practices
                                    - Store your email and password in an Environment Variable within your host system and 
                                        + Use 'os.getenv()' to retrieve your email address and password from the host system on application runtime
            ```python
            server.login(email-address, your-password)
            ```
        - Try sending the message via the SMTP server
            ```python
            try:
                # Sending an email
                server.send_message(msg)
            except:
                print("Failed to send email")
                pass
            ```

    - Working with Email Messages
        - Create a new email object
            ```python
            msg = EmailMessage()
            ```
        - Set contents into your email
            ```python
            msg.set_content(your-content-body-string)
            ```
        - Define your Email Address key-values
            - To subject
                ```python
                msg["To"] = target-email-recipient
                ```
            - From subject
                ```python
                msg["From"] = your-email-address
                ```
            - Email Subject/Topic
                ```python
                msg["Subject"] = your-email-subject
                ```

### Installing
- Install as a module
    - Install locally in development mode
        ```bash
        pip install .
        ```

    - Install locally in editable development mode
        ```bash
        pip install -e .
        ```

    - Install Python package using GitHub repository via setuptools
        ```bash
        pip install git+https://github.com/Thanatisia/bpm
        ```

- Install Python package manually as an executable
    - Install using setuptools
        ```bash
        python setup.py install
        ```

    - (Optional) Append your Virtual Environment's bin directory to system path
        - Notes
            + This is so that you can access the application/module from the system
        ```bash
        export PATH+=[virtual-environment-name]/bin:
        ```

### Accessing
- Startup Webserver
    ```bash
    python app.py
    ```

- To access the webserver
    - Enter the WebApplication URL into the address bar '[protocol (http|https)]://[server-ip|domain]:[webserver-port-number]/[routes]'
        + Press enter

## Documentations

## Wiki

### Templates
- app.py Webserver application
    ```python
    import os
    import sys
    from flask import Flask, render_template, request, url_for, redirect

    # Initialize a flask application object using the current runner executable (main server)
    app = Flask(__name__)

    # Map the webserver route '/' (page root) to the index (home) page
    @app.route("/")
    def index():
        return render_template("index.html")

    if __name__ =="__main__":
        app.run(debug=True)
    ```

## Resources
## References
## Remarks

