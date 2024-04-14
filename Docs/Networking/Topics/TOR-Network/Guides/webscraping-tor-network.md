# Webscraping the TOR Network

*DISCLAIMER*
------------
+ The following content is for educational and for learning purposes only, please do not use this for any malicious/illegal use

## Information

### Basics
- TOR stands for The Onion Router, it is a protocol that uses proxychains - effectively chains and networks of proxy servers - to string together 'nodes'
    + TOR nodes are effectively proxy servers that changes your location and information whenever you pass through them which is what anonymizes you the more nodes you pass through

## Setup

### Summary
+ Please refer to [setting-up-tor.md](setting-up-tor.md) for a full setup documentation
+ Please refer to [accessing-the-tor-network.md](accessing-the-tor-network.md) for a simple starters walkthrough on how to use the TOR network as a proxy
- Steps
    + Install TOR
    + Configure TOR
    + Verify TOR is setup properly

## Documentations
### Webscraping onion sites

> Using Python

- Send a GET HTTP REST-API request with TOR to obtain the website's HTML code
    - Setup
        - Dependencies
            + python
            + python-pip
            + python-venv
            - Python packages
                + requests_tor : Library to allow you to make requests to the TOR network
    - Explanation
        - Python package submodule
            - `requests_tor.RequestsTor`
                - Parameters/Argument Signature
                    - tor_ports: Specify a tuple of all the tor socks5 proxy server port numbers that TOR might be listening on you want to passthrough
                        + Type: Tuple
                        + Default Value: 9050
                    - tor_cport: Specify the TOR control ports (like those you specified in '/etc/tor/torrc')
                        + Type: Integer
                        + Default Value: 9051
    ```python
    #!/usr/bin/env python3

    from requests_tor import RequestsTor

    # Initialize Variables
    url = "http://your-onion-router-site.onion/"

    # Create a new TOR requests object
    requests = RequestsTor(tor_ports=(9050,), tor_cport=9051)

    # Send a HTTP GET request to the onion site and return the response stream
    response = requests.get(url)

    # Obtain the response text
    response_text = response.text

    # Print/output
    print(response_text)
    ```

- Parse the onion website HTML into an HTML parser
    - Using html.parser.HTMLParser
        ```python
        #!/usr/bin/env python3

        from html.parser import HTMLParser

        # Parse the HTML response text
        ```
    - Using beautifulsoup4
        ```python
        #!/usr/bin/env python3

        from bs4 import beautifulsoup

        # Parse the HTML response text
        ```

## Wiki

### Terminologies
+ TLD: Top-level domains in the domain hierarchy is called the Top-level domains because its right at the top immediately before the root authority

## Resources

## References
+ [YouTube - John Hammond - Scraping Dark Web Sites with Python](https://www.youtube.com/watch?v=r8JzWoU2_lU)

## Remarks

