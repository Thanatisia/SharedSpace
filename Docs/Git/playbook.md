# Git - Playbook

## Information

## Table of Contents
1. [Initial Setup](#initial-setup)
    - [Remote Repository](#remote-repository-url)
    - [Host System](#host-system)
2. [During the Development Lifecycle](#development-lifecycle)
    - [Local Repository](#host-local-repository)
    - [Remote Repository](#remote-repository-server)
    - [Post-Pull Request cleanup](#post-pull-request-cleanup)

## Initial Setup
### Remote Repository URL
- GitHub
    - (Optional) Fork into your own account

### Host System
- Clone the repository
    - Using git
        ```console
        git clone https://github.com/author/repository-name.git
        ```

    - Change directory into the repository folder/directory
        ```console
        cd [repository-name]
        ```

- (Optionals) Update your configuration information
    - Change username
        + This username will be shown when you create a Pull Request
        ```console
        git config user.name [username]
        ```
    - Change email
        + This email will be shown when you create a Pull Request
        + You can use any email (preferably the one you used to create the github account)
        ```console
        git config user.email [email]
        ```

- (Optionals) Set remote repository URL 
    - Change remote repository URL to push to
        - Notes
            + Change author to your username (if fork)
        ```console
        git remote add origin https://github.com/author/repository-name
        ```

## Development Lifecycle
### Notes
- Once the [Initial Setup](#initial-setup) are completed
    + You do not need to do those anymore unless you re-cloned the project

### Host Local Repository
- Pull/Fetch and merge the latest changes
    - Notes
        + Pull is basically an alias for 'fetch and merge'
    - Pull all changes
        ```console
        git pull origin main
        ```
    - Fetch and Merge all changes
        ```console
        git fetch && git merge 
        ```

- Change branch
    - Notes
        + This is very important, it is best practice to **never push your changes to the main branch** in any situation to not mess up production/delivery
        + Always change to a new branch at the start of a development cycle/after you create a Pull Request and the Pull Request is accepted by the primary maintainer
    - Using git checkout
        - Notes
            + Git checkout will create a new branch and automatically switch to the new branch
        ```console
        git checkout -b [new-branch-name]
        ```
    - Using git branch and git switch
        ```console
        git branch [new-branch-name] && git switch [new-branch-name]
        ```

+ Make all changes

- Check all changes
    + Ensure that all your changes are available
    - Show status of local repository
        ```console
        git status
        ```
    - List all updates made to added directories
        ```console
        git diff
        ```

- Add changes (as required) 
    - Add all changes in all folders (including hidden files)
        + Do this in the project root folder
        ```console
        git add * .
        ```
    - Add all changes in all folders (available only)
        ```console
        git add * 
        ```
    - Add specific files
        ```console
        git add [files]
        ```

- Commit Changes
    - Notes
        - Please ensure that your commit messages are meaningful, and to follow the above specified requirements
    ```console
    git commit -m "message"
    ```

- Push changes to a branch in either your fork, or the repository branch
    ```console
    git push -u origin [new-branch-name]
    ```

### Remote Repository Server
- Create a Pull Request to merge your changes into the main branch
    - Developer
        - For best practices, please specify the following details so that the development team/approval party knows what has been changed and/or is to be noted
            + Title: [Purpose]
            - Body:
                ```
                Author: [your-name]

                - New
                    - New Files:
                        + File-1
                        + ...
                - Updates
                    - Files Changed
                        - File-1
                            - Changes made:
                                + Change-1
                                + Change-2
                                + Change-3
                                + ...
                        - File-2
                        - ...
                ```
    - Approval Party
        + Process through all changes
        + Check if the changes are valid
        + Press accept and merge if all things are to the organization/team's quality

### Post-Pull Request cleanup
- Switch back to main branch to prepare for a new feature
    ```console
    git switch main
    ```

- Delete unnecessary branches
    - Notes
        - To ensure you reduce the clutter on your project workspace
            + Delete all unnecessary branches from your local repository
    ```console
    git branch -d [branch-name]
    ```

+ Repeat [Host Local Repository - Step 1](#host-local-repository)

## Wiki

## Resources

## References

## Remarks
