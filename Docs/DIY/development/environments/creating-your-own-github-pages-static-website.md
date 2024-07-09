# DIY - Web Development - Static site Web Hosting - Creating your own GitHub Page project workspace directory/development environment

## Information
### Description
- GitHub Pages is a static site web hosting service
    + This means that github pages does not support Dynamic Web applications 
    + Dynamic web pages/sites/applications are applications that requires server-side functionalities and databases

## Setup
### Dependencies
+ git
### Pre-Requisites
> Prepare Local Repository
- If you have an existing repository on the remote git server
    - (Optional) Clone repository if the repo exists on github
        ```bash
        git clone https://github.com/[github-username]/[github-username].github.io
        ```
    - Change directory into the repository directory
        ```bash
        cd [github-username].github.io
        ```
- If does not exist
    - Make a new directory for the project repository
        ```bash
        mkdir -pv [github-username].github.io
        ```
    - Change directory into the repository directory
        ```bash
        cd [github-username].github.io
        ```
    - Initialize git repository
        ```bash
        git init
        ```
    - Remote Git repository server
        + Create a new repository on GitHub named "[github-username].github.io"

- Change git configurations
    - Username
        ```bash
        git config user.name [username]
        ```
    - Email
        ```bash
        git config user.email [email]
        ```

- Change/Checkout to main branch
    ```bash
    git checkout -b main
    ```

- Set git remote repository server URL alias
    ```bash
    git remote add origin https://<token>@github.com/[github-username]/[github-username].github.io"
    ```
- Fetch and pull latest changes
    ```bash
    git pull origin main
    ```

> Set default github pages
- Set your default github pages website to the newly created "[github-username].gitbub.io" repository
    - Go to your account settings
        - Enter 

### Making changes
- Add changes to the local repository
    ```bash
    git add [files|*|.]
    ```

- Commit changes to history
    ```bash
    git commit -m [message]
    ```

- Push local changes to remote git repository server
    ```bash
    git push -u origin [branch]
    ```

- Push local changes to production (Not Recommended)
    ```bash
    git push -u origin main
    ```

## Filesystem Structure

### Common Components
+ index.html : The root/index "entry point" page of the application/site that will be sourced on load and defines the application project directory
+ index.css : The default CSS stylesheet file used by the index page
+ index.js : The default Javascript file used by the index page

### Single application site
- Project source directory
    - Explanation
        + This is used if you have a standalone static web site to host and treat the main/root web application as the only project
    ```
    / : Root/Index page
    - index.html
    - about.html
    ```
- Accessing the website
    - Access the GitHub pages domain at `https://[github-username].github.io/page.html`
        - Examples
            + https://[github-username].github.io/index.html (main page)   
            + https://[github-username].github.io/about.html (about page)

### Nested directory structure
- GitHub pages will source for the index.html page within a directory nested in the root directory 
    + This is used if you have a static web site to host which has multiple nested individual web pages/applications to redirect to
    - i.e. given that your account was "example.github.io", 
        + the "index html" will load by default first. 

- Project source directory
    - Explanation
        + If you wanted the link to look like "example.github.io/about"
    ```
    / : Root/Index page
    - index.html
    - about/
        - index.html
    - [app-name]/
        - index.html
    ```
- Accessing the website
    - Access the GitHub pages domain at `https://[github-username].github.io/[app-name]`
        - Examples
            + https://[github-username].github.io
            + https://[github-username].github.io/index.html
            - https://[github-username].github.io/[app-name]
                + This will source the index.html file within "/[app-name]" and load the entry point file on startup
                + Essentially redirecting you to "/[app-name]/index.html"

## Customization
### Custom URLs
- Create a new file in the root directory named 'CNAME'
    - Explanation
        + This will tell the GitHub pages static site web hosting service to have the specified CNAME aliases
        + Place all your CNAME URLs into this file
    ```bash
    touch CNAME
    ```

## Documentations
### Static Site Generators
> Examples
+ Jekyll
+ Hugo

## Resources

## References
+ [GitHub Pages](https://pages.github.com/)
+ [GitHub Pages Documentations - Custom URLs](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site)
+ [Jekyll Static Site Generator made in Ruby - Documentations](https://jekyllrb.com/docs/)

## Remarks

