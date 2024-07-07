# Termux Backup and Recovery - Using git bare

## Setup
### Dependencies
+ git

### Pre-Requisites

## Remote Repository Server Setup
- Create git repository directories (if doesnt exist)
    ```bash
    mkdir -pv /var/git
    ```

- Change directory to your git repository directory
    ```bash
    cd /var/git
    ```

- Set/Change the permission modifier of the git repository directory to 0700
    ```bash
    chmod -R 0700 /var/git
    ```

- Initialize a new git bare repository for the new project
    ```bash
    git init [custom-repository-name].git --bare
    ```

- Change directory into the repository
    ```bash
    cd [custom-repository-name].git
    ```

- Checkout a new 'main' branch
    ```bash
    git checkout -b main
    ```

- (Optional) To use a git repository on '/var/www/html'
    - Explanation
        + You may want to use a git (bare) repository on '/var/www/html' because you may want to create a web git remote repository server (like GitHub, GitLab or Gitea) using the git CLI from the command line and a webserver
    - Make the git repository directory in '/var/www/git'
        ```bash
        mkdir -pv /var/www/html/git
        ```
    - Change the owner and permission modifier of '/var/www/html/git'
        - Steps
            + Set the owner of /var/www/html/git to '[current-user]:www-data'
            + Set the permission modifier of /var/www/html/git to 'g+sw'
        ```bash
        chown -R [current-user]:www-data /var/www/html/git
        chmod -R g+sw /var/www/html/git
        ```
    - Clone the bare repository into '/var/www/html/git'
        ```bash
        git clone /var/git/[custom-repository-name].git /var/www/[custom-repository-name]
        ```

## Local Termux Setup
### Initialize git bare
1. Change directory to your home path
    ```bash
    cd $HOME
    ```

2. Initialize the home directory as a new git bare repository
    ```bash
    git init --bare
    ```

3. Checkout a new 'main' branch
    ```bash
    git checkout -b main
    ```

### Steps
1. Create a '.gitignore' file to ignore specific file/folders you do not want to keep
    ```bash
    touch .gitignore
    ```

2. Setup git bare configurations
    - Username
        ```bash
        git config user.name [username]
        ```
    - Email
        ```bash
        git config user.email [email-address]
        ```

3. Setup git remote repository server alias (i.e. origin)
    - External git remote repository server (i.e. GitHub/GitLab etc etc)
        ```bash
        git remote add origin [git-remote-repository-server]
        ```
    - Self-Hosted git repository server
        ```bash
        git remote add origin [username]@[git-remote-repository-server]:/var/git/[repository-name].git
        ```

4. Fetch the new remote repository server into your local git repository
    ```bash
    git fetch origin
    ```

## Snippets

