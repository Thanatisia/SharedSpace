# Python Library: BeautifulSoup4 - Web scraping

## Information
### Description
- BeautifulSoup is a Python framework/library that performs allows data scraping on the web (aka web scraping)
    + Using this along with the functionality to 'crawl' the web, and you will have a webcrawler

## Setup
### Dependencies
+ python
+ python-pip
+ python-venv
- Python Packages
    + beautifulsoup4
    + requests : For HTTP REST API (GET requests etc)

### Pre-Requisites
- Create Python Virtual Environments
    - Generate Virtual Environment Shell
        ```bash
        python3 -m venv [virtual-environment-name]
        ```
    - Chroot into Virtual Environment
        - Linux
            ```bash
            . [virtual-environment-name]/bin/activate
            ```
        - Windows
            ```bash
            .\[virtual-environment-name]\Scripts\activate
            ```

- Install python dependencies
    ```bash
    python3 -m pip install -Ur requirements.txt
    ```

## Documentation

### Packages
- bs4 : The BeautifulSoup4 Web scraper project

### Library/Modules
- bs4.BeautifulSoup : The core BeautifulSoup4 
- bs4.element : Contains HTML elements

### Data Types/Objects
- bs4.element
    - `.ResultSet` : dataclass container/object (that works similar to lists) containing all occurences of the specified search tag/query which are individually stored as 'bs4.element.Tag' objects
    - `.Tag` : Contains HTML tags objects

### Classes
- bs4.BeautifulSoup
    - `.BeautifulSoup(text, features="parser")`: Initialize the BeautifulSoup core Web scraper functionality class
        - Parameter/Argument Signatures
            - text : Specify the HTML5 text string to scrape through and parse; 
                + Type: String
                - Notes:
                    + Generally obtained via GET request using an HTTP REST API library (i.e requests)
            - features : Specify other features to enable
                - Example features
                    + html.parser : Run webcrawler class as a HTML parser (Recommended)
        - Return
            - soup: The BeautifulSoup HTML5 Parser class object
                + Type: bs4.BeautifulSoup

### Functions
- bs4.BeautifulSoup.BeautifulSoup
    - `.find_all(name="tag-name")` : Find all occurences of the specified tag/name and return in a list object
        - Parameter/Argument Signatures
            - `name="tag-name"` : Specify the target tag (i.e. 'title (for <title></title>)') you wish to parse and search for
                + Type: String
        - Return
            - result: Resulting bs4 dataclass container/object containing all occurences of the specified search tag/query which are individually stored as 'bs4.element.Tag' objects
                + Type: bs4.element.ResultSet
                - Notes
                    + Effectively, this dataclass works similar to a list
                    + Every element stored in a 'bs4.element.ResultSet' container are 'bs4.element.Tag' objects
                    + In the case where the tag/name is 'title', there is only one result due to the search query being '<title></title>' and there is only 1 title tag in any HTML5 markup

### Attributes/Variables
- bs4.element.Tag
    - `.text` : Contains the resulting text from finding all occurences of a tag as a search query (i.e. from .find_all())
        + Type: String

### Operational Workflow
- Import modules
    - BeautifulSoup
        ```python
        from bs4 import BeautifulSoup
        ```
    - Requests : For HTTP REST API request sending
        ```python
        import requests
        ```

- Send a HTTP REST API GET request to the youtube URL and return the response stream
    + Type: requests.models.Response
    ```bash
    response = requests.get(url)
    ```

- Obtain the HTML file contents from the response
    + Type: String
    ```bash
    response_text = response.text
    ```

- Initialize BeautifulSoup to crawl the response text HTML5 code
    + Type: bs4.BeautifulSoup
    ```bash
    soup = BeautifulSoup(response_text, features="html.parser")
    ```

- Find all occurences/existences of the tag (aka parameter 'name') and return in a list object
    + Type: bs4.element.ResultSet
    ```bash
    result = soup.find_all(name="tag")
    ```

- Obtain the result(s)
    + In the case where the tag/name is 'title', there is only one result due to the search query being '<title></title>' and there is only 1 title tag in any HTML5 markup
    + Type: bs4.element.Tag
    ```bash
    tag = result[0]
    ```

- Obtain the text returned from the search
    ```bash
    tag_text = tag.text
    ```

- Sanitize title (remove the opening and closing tags)
    - Opening tag
        ```bash
        tag_text = tag_text.replace("<tag>", "")
        ```
    - Closing tag
        ```bash
        tag_text = tag_text.replace("</tag>", "")
        ```

- Output
    ```bash
    print("Result: {}".format(tag))
    ```

## Wiki

## Resources

## References

## Remarks

