# git cli utility syntax documentation

## Information
- 'git' the technology is part of a system known as a Version Control system
    + A Version Control system is used in Programming and Development, as well as DevOps in general to maintain a copy of changes in the form of "commits", "trees" and "branches" that lets us basically traverse around our codebase's history.
    + A Version Control in the above sense, allows us to modify/edit, redo or fix issues made in the past.
- git is made by Linus Torvalds, the maker of the Linux Kernel - and by extension - the GNU/Linux Operating System environment we all know and love
- git as a technology is used in various manners, but more importantly, it is more widely integrated as a WebApp/cloud repository hosted in a git server in the form of the Git Remote Repository infrastructure.
    - Some examples include
        + GitLab
        + Github
        + Bitbucket
        + Codeberg
        + Linux Kernel repository
    - Taking github as an example, this is effectively git WebUI that lets you manage multiple git repositories in a file server. 
        + This lets you perform actions like editing, merging, adding, committing, all from a web browser
        - This also lets you - and your team - collaborate today in the project repository such as forking, cloning
             + This makes development collaboration alot more cohesive

## Setup
###  Pre-Requisites
### Dependencies
+ git

## Documentation
### Synopsis/Syntax
```console
git {options} [actions]
```

### Parameters
- Positionals
    - Actions
        - add : To add files into the git tree/branch to be prepared for committing
            - Synopsis/Syntax
                ```console
                git add [files]
                ```
            - Positionals
                 - files : The files to add into the tree history; Can be special characters '.', '*'
                     - Special Characters
                         + '.' : To add all files in the current working directory; Including the hidden files
                         + '*' : To add all files listed in the buffer (i.e. git status); Excluding hidden files - use alongside '.'
        - branch : Manage git branches
            + Default: List all branches
        - checkout : Checkout will create the specified type and switch to it; i.e. Branch
            - Synopsis/Syntax
                ```console
                git checkout {options}
                ```
            - Options
                + -b | --branch [branch-name] : Specify to checkout a branch and specify the branch name; Checkout will create the new branch and switch to it automatically
        - commit : To commit and confirm all changes added into the tree buffer; Similar to a database - you need to "confirm" by "committing" all changes made into the git database
            - Synopsis/Syntax
                ```console
                git commit {options}
                ```
            - Options
                - Flags
                     + -a | --ammend : To edit the most recent commit message
                - With Arguments
                     + -m | --message [message] : To specify the commit message
        - diff : List all changes made to committed files; Similar to the command 'diff' but for git files
            - Synopsis/Syntax
                ```console
                git diff {options} [file-pathname-source] [file-pathname-target]
                ```
        - log : List a log of all git commits made in the repository
        - status : Specify current git status
        - switch : Switch to another branch
            - Synopsis/Syntax
                ```console
                git switch [branch-name]
                ```
- Optionals

### Usage
- Check current status
    ```console
    git status
    ```

- List all commits
    ```console
    git logs
    ```

- Create new branch
    - Checkout branch
         ```console
         git checkout -b [branch-name]
         ```
    - Creating and switching
         - Create branch
             ```console
             git branch [branch-name]
             ```
         - Switch branch
             ```console
             git switch [branch-name]
             ```

- Adding files
    - Add specifiy file
        ```console
        git add [file-pathname]
        ```

    - Add all files excluding Hidden directories
        ```console
        git add *
        ```

    - Add all files including Hidden directories
        ```console
        git add * .
        ```

    - Add all files in this current working directory
        ```console
        git add .
        ```

- Commiting files
     - Commit all changes with commit message
         ```console
         git commit -m "Commit Message"
         ```
     - Ammend the latest git commit message
         ```console
         git commit --ammend
         ```

## Wiki


## Resources

## References

## Remarks
