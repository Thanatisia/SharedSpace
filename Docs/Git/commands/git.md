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
        - clone : Clone a git repository from a remote repository server
            - Synopsis/Syntax
                ```console
                git clone {options} [repository-url]
                ```
            - Options
                - Flags
                    + --no-checkout : Clone the repository but not download/clone the files
                - With Arguments
                    + -b | --branch [branch-name] : Clone a specific branch into your local git repository
                    + --depth=[depth] : Clone the repository starting from a specific depth
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
        - config : Manage configurations for the current system's git local repositor(ies)
            - Synopsis/Syntx
                ```console
                git config {options} {setting-key}.{setting-values} [values]
                ```
            - Options
                - Flags
                    + --global : Apply the settings globally into the system git directory
                - With Arguments
                    - setting key-values:
                        - user
                            - setting values
                                + email : Set/Get the repository's linked user email
                                + name : Set/Get the repository's linked user name
        - diff : List all changes made to committed files; Similar to the command 'diff' but for git files
            - Synopsis/Syntax
                ```console
                git diff {options} [file-pathname-source] [file-pathname-target]
                ```
        - lfs : Stands for "Large File System", LFS is a file storage solution that prevents large binary files in the repository history to prevent bottlenecks and bulk
            - Pre-Requisites
                + [Git LFS](https://git-lfs.com/)
            - Synopsis/Syntax
                ```console
                git lfs [action] {options}
                ```
            - Options
                + fetch : Find any new/missing blob files which have been replaced with smaller files
                + merge : Merges all found blob files
                + pull  : Fetch and merges any new/missing blob files; alias for 'git lfs fetch && git lfs merge'
        - log : List a log of all git commits made in the repository
        - remote : Manage git remote repository server settings
            - Synopsis/Syntax
                ```console
                git remote [action] {options}
                ```
            - Options
                + add [origin-alias-name] [remote-repository-url] : Add and map the specified origin/URL to the origin alias
                + set-url [remote-repository-server]              : Set and add the remote repository server URL only
                + show [origin-alias]                             : Show entries for that origin/URL
                + remove [origin-alias]                           : Remove the specific origin/URL
        - sparse-checkout : Use sparse-checkout to manage the target directory you want to work with, instead of checking out the entire repository
            - Synopsis/Syntax
                ```console
                git sparse-checkout {options} <argument> [actions] <target>
                ```
            - Notes
                - After setting the sparse-checkout directory/file, checking out to a new branch will clone only the specified directory/file
                    ```console
                    git checkout -b [new-branch-name]
                    ```
            - Options
            - Actions
                - `add [target-directory|file-path]` : Set and append a target directory/file you want to checkout and clone
                    - Notes
                        + This will not overwrite any existing contents within that same parent
                - disable : Disables the current sparse-checkout session and checkout the entire repository; Opposite of `sparse-checkout init`
                - help : Display help message; List all commands
                - init : Enable the ongoing sparse-checkout session and checkout the existing sparse-checkout target contents; Opposite of `sparse-checkout disable`
                - `set [target-directory|file-path]` : Set a target directory/file you want to to checkout with
                    - Notes
                        + You can call this multiple times in order to checkout multiple distinct paths
                        + Using this in paths that already exists will overwrite all child contents with the newly-specified directory/file
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

- Cloning repository
    - Clone full repository
        ```console
        git clone [repository-url]
        ```
    - Clone a specific branch
        ```console
        git clone [repository-url] -b [branch-name]
        ```
    - Clone a specific depth
        ```console
        git clone [repository-url] --depth=1
        ```
    - Clone the repository without 'checking out' (aka cloning the files as well) the repository
        ```console
        git clone --no-checkout [remote-repository-url]
        ```
    - Clone a specific directory/file
        - Using 'sparse-checkout'
            1. Clone the repository without 'checking out' (aka cloning the files as well) the repository
                - Explanation
                    + --depth N : Clone N branches down the repository tree instead of the entire history
                    + --branch [custom-branch-name] : Specify the branch you want to clone the repository from
                    + --no-checkout : Clone the repository but not download/clone the files
                ```console
                git clone --depth [number-of-branches] --branch [custom-branch-name] --no-checkout [git-remote-repository-url]
                ```

            2. Change directory into local repository
                ```console
                cd [local-repository-directory]
                ```

            3. Set the sparse checkout directory in the git repository folder
                - Explanation
                    - `git sparse-checkout` : Use sparse-checkout to manage the target directory you want to work with, instead of checking out the entire repository
                        - `set [target-directory-path]` : Set a target directory you want to to checkout with; You can call this multiple times in order to checkout multiple distinct paths
                ```console
                git sparse-checkout set [target-directory-path]
                ```

            4. Checkout the target directory/file you have set to a custom branch
                ```console
                git checkout -b [new-branch-name]
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
