# Python - Web Scraping Examples

- Check if URL is valid
    + Use the package 'request' to handle REST API (HTTP) Requests
       ```python
        import requests
        
        domain = "your-subdomain"
        url = "http://" + domain
        
        response = requests.get(url) # Request to $_GET the URL
        if response.status_code == 200:
            print(response)
        else:
            print("Error")
        ```

- Provide possible URLs for a subdomain from a dictionary file
    - Prepare a file 'subdomains.txt' that contains a subdomain in each line
    - Program will open this file and read each line, one-by-one
        - Because there is a newline character after each domain/word
            + Use '.strip()' to remove that newline character
        ```python
        import requests
        
        subdomains = []
        
        # Read each line one-by-one
        with open("subdomains.txt", "r") as read_Subdomains:
            line = read_Subdomains.readline().strip()
            while line:
                subdomains.append(line)
                line = read_Subdomains.readline()
            read_Subdomains.close()
        
        # Loop all subdomains and form full domain
        for subdomain in subdomains:
            url = "http://{}".format(subdomain)
            
            response = requests.get(url)
            
            # Status Code Checking
            if response.status_code == "200":
                # 200 = OK
                print(response)
            else:
                print("ERROR")
                
        ```

- Takes a URL as input and return the response
    - The main body of the program should have an if-statement to check whether this function returns something or nothing
        + In case a requested subdomain does not exist
        ```python
        import requests
        
        # Function that takes a URL as input and return response
        def GET_response(url):
            response = requests.get(url)
            return response
            
        def main():
            url = "http://your-url.domain"
            response = GET_response(url)
            if not (response == None):
                print("No Response")
            else:
                print("Response : {}".format(response))
                
        if __name__ == "__main__":
            main()
        ```
   
- Searching Subdirectories
    - Web Crawler will search for subdirectories in the given website
        + Prepare a file 'dirs.txt' containing subdirectories in each line
        + Read through each word in the file 'dirs.txt', line by line, to form a URL that you can check whether it exists
        ```python
        import requests

        urls = {}

        # Read each line one-by-one
        with open("dirs.txt", "r") as read_dirs:
            line = read_dirs.readline().strip()
            while line:
                urls[line] = {"status" : 0, "exists" : False}
                line = read_dirs.readline()
            read_dirs.close()

        # Loop all URLs and check if URL exists
        for k,v in urls.items():
            curr_url = k
            response = v
            
            response = requests.get(url, timeout=10.0) # Timeout of 10 seconds
            status = response.status_code
            
            # Status Code [Checking](Checking)
            if status == "200":
                # Exists
                url_exists = True
            else:
                url_exists = False
            
            urls[curr_url] = {"status" : status, "exists" : url_exists}
           
            # Check if URL exists
            if url_exists == True:
                print("URL [{}] Exists, status code : {}".format(curr_url, status))
            else:
                print("URL [{}] does not exists, status code : {}".format(curr_url, status))
        ``` 
        
    
