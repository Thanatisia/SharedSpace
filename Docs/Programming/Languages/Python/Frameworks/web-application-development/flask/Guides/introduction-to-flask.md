# Python framework introduction - flask web server, application and page development

## Table of Contents
- [Setup](#setup)
    + [Installing framework](#installing-framework)
    + [Importing framework](#importing-framework)
    + [Initializing framework](#initializing-framework)
- [Documentations](#documentations)
    - [Web Application Development](#web-application-development)
        - [Backend](#backend)
        - [Frontend](#frontend)
        - [Interaction/Interfacing with DOM](#interaction-interfacing-with-dom)
    - [Web Server Development](#web-server-development)

## Information
### Dependencies
- Backend
    + python
    + python-pip
- Python Packages
    + flask

## Setup

### Installing Framework
- Using python-pip
    ```bash
    python3 -m pip install flask
    ```
- Using package managers
    - pacman-based (ArchLinux)
        ```bash
        sudo pacman -S python3-flask
        ```

### Importing Framework
- Flask application
    ```python
    from flask import Flask
    ```
- Webapplication functions
    ```python
    from flask import render_template, url_for, request, redirect
    ```

### Initializing Framework
- Initialize a new Flask instance using the current application as the name
    ```python
    app = Flask(__name__)
    ```

## Documentations

### Web Application Development

#### Backend
- Set a new webserver routing returning a result
    ```python
    @app.route('/<your-routes-here', methods=["HTTP", "methods", "here"])
    def function_name(param_signature_header):
        # Routing Statements
        # Return the result back to the frontend DOM for rendering
        return res
    ```
- Set a new webserver routing returning a webpage and variables
    ```python
    @app.route('/<your-routes-here', methods=["HTTP", "methods", "here"])
    def function_name(param_signature_header):
        # Routing Statements
        # Return the result back to the frontend DOM for rendering
        return render_template(page_name, variable_name=values, ...)
    ```
- Set webserver routing for root/index page
    ```python
    @app.route('/')
    def index():
        return render_template('index.html')
    ```
- Set a new webserver route to a web form with HTTP methods
    ```python
    @app.route('/form', methods = ['GET', 'POST'])
    def form():
        if request.method == 'POST':
            # Obtain the value set in the webpage form name "variable-to-get-and-print-here"
            variable = request.form['form_variable']
            # Display the web page and pass all the variables back to the web page as key-value mappings (key = variable name, value = variable value)
            return render_template('page.html', form_variable=variable)
    ```
- Set a new webserver route to passthrough and return the values to another webpage
    ```python
    @app.route('/return_form/<form-variable>', methods = ['GET', 'POST'])
    def return_form(form_variable):
        return render_template('new_page.html', form_variable)
    ```

#### Frontend

> Syntax

- Wrap a block statement with `{{ statement }}` to declare a new python script block to send/get variables and IDs to/from python flask here
    ```html
    <html>
        <head>
            <title>Hello World!</title>
        </head>

        <body>
            <!-- 
            Web form to send a POST request 
            to the webserver API route containing the form name "form_variable" 
            -->
            <p>{{ # statements here }}</p>
        </body>
    </html>
    ```

- Web page/site example printing a variable in the DOM from the flask backend
    ```html
    <html>
        <head>
            <title>Hello World!</title>
        </head>

        <body>
            <!-- 
            Web form to send a POST request 
            to the webserver API route containing the form name "form_variable" 
            -->
            <p>{{ form_variable }}</p>
        </body>
    </html>
    ```

- Web form to send a POST request to the webserver API route containing the form name "form_variable"
    ```html
    <html>
        <head>
            <title>Hello World!</title>
        </head>

        <body>
            <form action ="{{ url_for('<target-route>') }}" method="post">
                Text: <input type="text" name="form_variable">
                <button type="submit">Submit</button>
            </form>
        </body>
    </html>
    ```

#### Interaction/Interfacing with DOM

> Using python functions within a webpage

- Python backend
    ```python
    from flask import Flask
    from flask import render_template, url_for, request, redirect

    # Initialize a new Flask instance using the current application as the name
    app = Flask(__name__)

    # Set new route redirecting to the root/index page
    @app.route('/')
    def index():
        return render_template('index.html')

    # Set new route for URL 'server.domain/form' that is a webpage with a form that sent a HTTP POST request containing the form's name and action
    @app.route('/form', methods = ['GET', 'POST'])
    def form():
        if request.method == 'POST':
            # Obtain the value set in the webpage form name "variable-to-get-and-print-here"
            variable = request.form['form_variable']
            # Display the web page and pass all the variables back to the web page as key-value mappings (key = variable name, value = variable value)
            return render_template('index.html', form_variable=variable)

    # Set new route for URL 'server.domain/return_form/<form-variable>' which will take the provided form variable and redirect the connection to the new page with the variable
    @app.route('/return_form/<form-variable>', methods = ['GET', 'POST'])
    def return_form(form_variable):
        return render_template('return_form.html', form_variable)

    def main():
        # Begin running the webserver
        app.run()

    if __name__ == "__main__":
        main()
    ```
- HTML Webpage
    - Explanation
        + Wrap a block statement with `{{ statement }}` to declare a new python script block to send/get variables and IDs to/from python flask here
    ```html
    <html>
        <head>
            <title>Hello World!</title>
        </head>

        <body>
            <!-- 
            Web form to send a POST request 
            to the webserver API route containing the form name "form_variable" 
            -->
            <form action ="{{ url_for('<target-route>') }}" method="post">
                Text: <input type="text" name="form_variable">
                <button type="submit">Submit</button>
            </form>

            <p>{{ form_variable }}</p>
        </body>
    </html>
    ```

### Web Server Development
- Start the flask web application server
    ```python
    app.run()
    ```

## Resources

## References

## Remarks




