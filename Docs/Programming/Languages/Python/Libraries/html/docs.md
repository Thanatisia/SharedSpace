# Python Library/Module - html

## Table of Contents
* [Documentation](#documentation)

## Information
### DESCRIPTION
- html is a built-in python library containing HTML manipulation and handling utilities

## Documentation

### Packages
- html : Built-in HTML management library

### Modules
- html
    - .entities : Contains HTML generic entity definitions
    - .parser : Simple HTML and XHTML Parser

### Classes
- html.parser
    - `.HTMLParser(*, convert_charrefs=True)` : Creates and initializes a HTML Parser instance
        - Parameter/Argument Signature
            - Optionals
                - `convert_charrefs=True|False`: Convert character references

### Functions
- html
    - `.escape(html-string, quote=True|False)` : Encode the HTML script into a string by replacing special characters in the string with ASCII characters
        - Notes
            + This will change the special characters ('<', '>', '&' etc) to HTML-safe sequences ('&lt;', '&gt;' etc)
        - Parameter/Argument Signature
            - html-string: The target HTML5 code string that you want to sanitize/clean
                + Type: String
            - quote: (Optional) Additionally translate the quotation mark characters, as well as double quotes (") and single quotes (')
                + Type: Boolean
                + Default: True
        - Return
            - html-ascii-string: The converted string of ASCII characters from the original HTML code string
                + Type: String
    - `.unescape(html-ascii-string)` : Decode the converted HTML ASCII script string that was encoded by '.escape()' back into an HTML script by substituting the ASCII characters with special characters
        - Notes
            - This will 
                + change the HTML-safe ASCII sequences ('&lt;', '&gt;' etc) to special characters ('<', '>', '&' etc)
                + Convert all named and numeric character references in strings to the corresponding Unicode characters
        - Parameter/Argument Signature
            - html-ascii-string: The encoded/converted string of ASCII characters that you want to decode back into an HTML script
                + Type: String
        - Return
            - html-string: The decoded HTML code string from the encoded HTML ASCII string
                + Type: String

- html.parser.HTMLParser()
    - Parsing
        - `.feed(html_code)` : Feed the target HTML markup string to the HTML Parser object
            - Parameter/Argument Signature
                - html_code : Specify the HTML code/markup string you wish to scrape
                    + Type: String
    - HTML Parser Buffer
        + `.close()` : Close the HTML Parser after usage
        + `.reset()` : Reset the HTML Parser instance; This will cause the parser to lose all unprocessed data. This is called implicitly at instantiation (class init) time
    - Getter
        - `.getpos()` : Get the current line number (position) and offset (delta/change from the original)
            - Return
                - position: The current line number (positional) and offset
                    + Type: tuple
                    - Values
                        + position[0] = The line number
                        + position[1] = The offset
        - `.get_starttag_text()` : Returns the text of the most recently opened start tag
            - Return
                - text: The returned most recently-opened starting tag's text
                    + Type: String
    - Event Callback Functions
        - `.handle_data(data)` : Used to handle the data contained between HTML tags (i.e. <title>Title</title>)
            - Parameter/Argument Signature
                - data: The data contained between HTML tags
                    + Type: String
        - `.handle_comment(data)` : Used to handle HTML comments
            - Parameter/Argument Signature
                - data: The comments found in HTML code
                    + Type: String
        - `.handle_starttag(tag, attrs)` : Used to handle HTML start tags.
            - Parameter/Argument Signature
                - tag: Specify the opening tag
                    + Type: String
                - attrs: Specify the attribute of that tag
                    + Type: String
        - `.handle_endtag(tag, attrs)` : Used to handle HTML end/closing tags.
            - Parameter/Argument Signature
                - tag: Specify the closing tag
                    + Type: String
                - attrs: Specify the attribute of that tag
                    + Type: String
        - `.handle_startendtag(tag, attrs)` : Similar to `.handle_starttag()` but is called when the parser encounters an XHTML-style empty tag (i.e. <img />)
            - Parameter/Argument Signature
                - tag: Specify the tag
                    + Type: String
                - attrs: Specify the attribute of that tag
                    + Type: String
        - `.handle_entityref(name)` : Used to handle HTML named character reference of the form `&<name>;` where '<name>' is a general entity reference (i.e. &gt; => 'gt')
            - Parameter/Argument Signature
                - name: Handle the callback named character reference
                    + Type: String
        - `.handle_charref(name)` : Used to handle HTML decimal and hexadecimal numeric character reference of the form `&#<decimal-code>;` and `&#x<hexadecimal-code>` 
            - Notes
                - where 
                    + '<decimal>' is the decimal equivalent of the general entity reference (i.e. &gt; => '&#62;' => '62') and
                    + '<hexadecimal>' is the hexadecimal equivalent of the general entity referencve (i.e. &gt; => '&#x3E;' => 'x3E')
            - Parameter/Argument Signature
                - name: Handle the callback decimal/hexadecimal equivalent of the general character reference
                    + Type: String
        - `.handle_decl(decl)` : Used to handle HTML doctype declaration (i.e. <!DOCTYPE html>)
            - Parameter/Argument Signature
                - decl: Handle the callback doctype declaration
                    + Type: String
        - `.handle_unknown_decl(data)` : Used to handle unknown/unrecognized declaration
            - Parameter/Argument Signature
                - data: Handle the callback unknown/unrecognized declaration contents
                    - Notes
                        + This will be the entire contents of the declaration inside the `<![...]>` markup
                        + It is sometimes useful to be overriden by a derived class. The base class implementation does nothing
                    + Type: String
        - `.handle_pi(data)` : Used to handle processing instructions returned (`<?proc color='red'>` => `handle_pi("proc color='red'")`)
            - Notes
                + This is intended to be overriden by a derived class; The base class implementation does nothing
            - Parameter/Argument Signature
                - data: Handle the callback processing instruction
                    + Type: String

### Data Types and Objects

### Attributes/Variables
- html.entities
    - `.html5` : A Dictionary that converts HTML5 named character references 1 to the corresponding Unicode character(s)
        + Type: Dictionary
        - Examples
            + `html5['lt;'] == '<'`
    - `.entitydefs` : A Dictionary that maps XHTML 1.0 entity definitions to ISO Latin-1 replacement text
        + Type: Dictionary
    - `.name2codepoint` : A Dictionary that converts HTML entity names to Unicode code points
        + Type: Dictionary
    - `.codepoint2name` : A Dictionary that associates Unicode code points with HTML entity names
        + Type: Dictionary

### Usage

### Operational Workflow
- Import package and modules
    - HTML Manipulation
        ```python
        import html
        ```
    - HTML Parser
        ```python
        from html.parser import HTMLParser
        ```

#### HTML Manipulation
- Encode an HTML string into ASCII
    ```python
    html_code = "<html><head><title>Hello World</title></head><body><p>Hello World</p></body></html>"
    encoded_code = html.escape(html_code,quote=False)
    print(encoded_code)
    ```

- Decode an HTML ASCII string back into an HTML script
    ```python
    html_code = html.unescape(encoded_code)
    print(html_code)
    ```

#### HTML Parser
- Creating an HTML Parser class
    - Create a class header inheriting the functions and attributes of 'HTMLParser'
        ```python
        class MyHTMLParser(HTMLParser):
        ```
    - Set/Override the inherited/derived callback/event functions
        - Explanation
            + `def handle_starttag(self, tag, attrs)` : Override the HTMLParser's inherited function of the same name with the new statements
            + `def handle_endtag(self, tag)`          : Override the HTMLParser's inherited function of the same name with the new statements
            + `def handle_data(self, data)`           : Override the HTMLParser's inherited function of the same name with the new statements
        ```python
        class MyHTMLParser(HTMLParser):
            def handle_starttag(self, tag, attrs):
                print("Encountered a start tag:", tag)

            def handle_endtag(self, tag):
                print("Encountered an end tag :", tag)

            def handle_data(self, data):
                print("Encountered some data  :", data)
        ```

- Initialize HTML Parser object
    ```python
    parser = MyHTMLParser()
    ```

- Feed a HTML markup code string into the HTML Parser
    ```python
    parser.feed("<html><head><title>Hello World</title></head><body><p>Hello World</p></body></html>")
    ```

### Snippets
- Example HTML Parser
    ```python
    import os
    import sys
    from html.parser import HTMLParser

    class MyHTMLParser(HTMLParser):
        def handle_starttag(self, tag, attrs):
            print("Encountered a start tag:", tag)

        def handle_endtag(self, tag):
            print("Encountered an end tag :", tag)

        def handle_data(self, data):
            print("Encountered some data  :", data)

    # Initialize HTML Parser object
    parser = MyHTMLParser()

    # Feed HTML code into the HTML Parser
    parser.feed("<html><head><title>Hello World</title></head><body><p>Hello World</p></body></html>")
    ```

- HTML Parser - Store all callback results into a reference dictionary
    ```python
    import os
    import sys
    import requests
    from html.parser import HTMLParser

    class HTML(HTMLParser):
        """
        Inherit the functions and attributes from 'html.parser.HTMLParser' to override
        """
        objects = [] # List of all objects
        tmp_obj_map = {"start-tag" : "", "end-tag" : "", "attrs" : [], "data" : "", "comment" : "", "named-entity" : "", "numerical-entity" : ""} # Temporary dictionary for mapping the starting tag to the ending tag, data etc

        def handle_starttag(self, tag, attrs):
            # Set start/opening tag to temporary object map
            self.tmp_obj_map["start-tag"] = tag 
            self.tmp_obj_map["attrs"] = attrs

        def handle_endtag(self, tag):
            # Set end tag to temporary object map
            self.tmp_obj_map["end-tag"] = tag

            # Append the current temporary object map
            self.objects.append(self.tmp_obj_map)

            # Reset temporary object map
            self.tmp_obj_map = {"start-tag" : "", "end-tag" : "", "attrs" : [], "data" : "", "comment" : "", "named-entity" : "", "numerical-entity" : ""}

        def handle_data(self, data):
            # Set the data to the temporary object map
            self.tmp_obj_map["data"] = data

        def handle_comment(self, data):
            # Set the comment to the temporary object map
            self.tmp_obj_map["comment"] = data

        def handle_entityref(self, name):
            c = chr(name2codepoint[name])

            # Set the named entity to the temporary object map
            self.tmp_obj_map["named-entity"] = c

        def handle_charref(self, name):
            if name.startswith('x'):
                c = chr(int(name[1:], 16))
            else:
                c = chr(int(name))

            # Set the numerical entity to the temporary object map
            self.tmp_obj_map["numerical-entity"] = c

    def search_title(html_objects):
        """
        Search for the title of a particular url

        :: Params
        - html_objects : List containing dictionaries with the mapping of each line's components (data, starting tag, closing tag, comments etc)
            + Type: List
            - Values
                - object-dictionaries : Key-Value mappings of each line's components returned from the overriden HTML parser
                    + Type: Dictionary
                    - Key-Value Mappings
                        + start-tag : The Opening/Starting Tag; String
                        + end-tag"  : The Closing/Ending Tag; String
                        + attrs     : The Attributes; List
                        + data      : The content string wrapped between the tags; String
                        + comment   : Comments written in the tag; String
                        + named-entity : The Named entities; String
                        + numerical-entity : The Numerical entities
        """
        # Initialize Variables
        title = ""

        # Iterate through the object dictionaries and search for the title
        for i in range(len(html_objects)):
            # Get current object
            obj = html_objects[i]

            # List out the 'title'
            start_tag = obj["start-tag"]
            data = obj["data"]
            closing_tag = obj["end-tag"]

            # If start tag is 'title'
            if start_tag == "title":
                # print("Title: {}".format(data))
                title = data
                break

        # Output
        return title

    # Initialize Variables
    url = "https://video-streaming-server-ip|domain"

    # Initialize HTML Parser object
    parser = HTML()

    # Send a HTTP REST API GET request and return a response
    response = requests.get(url)

    # Obtain HTML code of the send URL from the response text
    response_text = response.text

    # Feed the HTML code into the parser
    parser.feed(response_text)

    # Parse the URL's HTML code into the HTML Parser and return the parser object
    parser = parse_html(url)

    # Obtain all stored html tags and data
    objs = parser.objects

    # Search for a data in a particular tag
    title = search_title(objs)
    print("URL: {}".format(url))
    print("Title: {}".format(title))
    ```

## Wiki

### Terminologies
+ Dictionary: A Relational Key-Value Mapping-based data structure; Equivalent other language's Associative Array and HashMap
+ List: Index/Positional-based data structure; Python's equivalent of Array/ArrayLists/Vectors

## References

## Resources
+ [Python Docs - Python3 - Library - html.parser](https://docs.python.org/3/library/html.parser.html)
+ [Pythonista Planet - Python html module](https://pythonistaplanet.com/python-html-module/)

## Remarks

