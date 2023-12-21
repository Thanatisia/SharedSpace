# DIY Creating your own git remote repository server

## Information
### Summary
```
Blueprint/Documentation on how to create your own git remote repository server like GitHub

Basically, how GitHub works under the hood
```

## Setup
### Dependencies
+ git

### Pre-Requisites

### User Management
- (Optional) Create user for git usage
    - Notes
        + This user will be created for git-related purposes
    ```console
    useradd -m -g wheel -G users -d /home/git git
    ```
- (Optional) Change user's password
    ```console
    passwd git
    ```

### Security


### Setup git bare repository server
- Create server directories
    - Notes
        - Using '.git' as the directory's extension is not mandatory, but useful to identify the purpose of the folder
            + This is also why GitHub has the '.git' extension behind
    ```console
    mkdir -p /srv/git/path/to/your/projects/repo.git
    ```

- Change directory into repository folder
    ```console
    cd /srv/git/path/to/your/projects/repo.git
    ```

- Initialize git bare repository
    - Notes
        + A bare repository is a Git repository that has no working directory. 
        - Because the repository is only used as a collaboration point, there is no reason to have a snapshot checked out on disk; it’s just the Git data. 
            + In the simplest terms, a bare repository is the contents of your project’s .git directory and nothing else.
    ```console
    git init --bare
    ```

## Documentations

### Client-side
- To clone a local repository
    - Note
       + To clone or communicate with the git server remotely, the syntax is similar to using SSH (Secured Transmission)
    ```console
    git clone {ssh://}[username]@[server-ip-address]:/srv/git/path/to/project/repo.git
    ```

- To add a local repository to an existing Git project
    ```console
    git remote add [alias] {ssh://}[username]@[server-ip-address]:/srv/git/path/to/project/repo.git
    ```

- To show all remote origins tied to the local repository
    ```console
    git remote show [alias]
    ```

## Wiki

### Snippets
- When adding a new repository to remote repository server
    - Server-side
        - Create a new bare repository folder for that project
            ```console
            mkdir -p /srv/git/path/to/project/repo.git
            ```
        - Change directory into newly-created project bare repository folder
            ```console
            cd /srv/git/path/to/project/repo.git
            ```
        - Initialize bare repository
            ```console
            git init --bare
            ```
    - Client-side
        - Create new project
            - Create new project repository as usual
                ```console
                mkdir -p /path/to/project
                ```
            - Change directory into newly-created project bare repository folder
                ```console
                cd /path/to/project
                ```
            - Initialize git
                ```console
                git init
                ```
        - Set user information
            - User Name
                ```console
                git config user.name [Your-Name]
                ```
            - User Email
                ```console
                git config user.name [Your-Email]
                ```
        - Make Changes
            - Create README file       
                ```console
                touch README.md
                ```
        - Add modified files to be committed
            ```console
            git add README.md
            ```
        - Commit added files for confirmation 
            ```console
            git commit -m "Initial Commit and commit messages"
            ```
        - Add local repository to remote server's repository folder path
            ```console
            git remote add origin {ssh://}[username]@[server-ip-address]:/srv/git/path/to/project/repo.git
            ```
        - Push local repository to remote repository server
            ```console
            git push -u [alias] [branch-name]
            ```

- Clone from existing project in remote repository server
    ```
    git clone {ssh://}[username]@[server-ip-address]:/srv/git/path/to/project/repo.git
    ```

- Clone github repositories to remote repository server
    - Create a new bare repository folder for that project
        ```console
        mkdir -p /srv/git/path/to/project/repo.git
        ```
    - Change directory into newly-created project bare repository folder
        ```console
        cd /srv/git/path/to/project/repo.git
        ```
    - Clone the target repository to your remote server as a bare repository
        - From Server-side
            ```console
            git clone --bare [github-project-URL] /srv/git/path/to/project/repo.git
            ```
        - From Client-side
            ```console
            git clone --bare [github-project-URL] {ssh://}[username]@[server-ip-address]:/srv/git/path/to/project/repo.git
            ```

## Resources

## References
+ [StackOverflow - Questions - 72838855 - Does GitHub use bare repositories under the hood?](https://stackoverflow.com/questions/72838855/does-github-use-bare-repositories-under-the-hood)
+ [Git SCM - Book - v2 - Git on the Server : The Protocols](https://git-scm.com/book/en/v2/Git-on-the-Server-The-Protocols#:~:text=A%20remote%20repository%20is%20generally,it's%20just%20the%20Git%20data.)

## Remarks
