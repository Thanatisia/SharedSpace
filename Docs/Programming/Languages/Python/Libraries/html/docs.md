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

## Wiki

### Terminologies
+ Dictionary: A Relational Key-Value Mapping-based data structure; Equivalent other language's Associative Array and HashMap
+ List: Index/Positional-based data structure; Python's equivalent of Array/ArrayLists/Vectors

## References

## Resources
+ [Python Docs - Python3 - Library - html.parser](https://docs.python.org/3/library/html.parser.html)
+ [Pythonista Planet - Python html module](https://pythonistaplanet.com/python-html-module/)

## Remarks

