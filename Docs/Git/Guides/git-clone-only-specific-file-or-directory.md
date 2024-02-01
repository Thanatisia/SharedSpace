# Git: clone only a specific file or directory

## Steps
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

## Terminologies
- repository (aka repo) : A folder/directory containing your source code version control

## Resources

## References
+ [StackOverflow - How do I clone a subdirectory only of a Git repository?](https://stackoverflow.com/questions/600079/how-do-i-clone-a-subdirectory-only-of-a-git-repository/73587479#73587479)
+ [TechOverflow - 2022-09-28 - How to git clone only a specific file or directory](https://techoverflow.net/2022/09/28/how-to-git-clone-only-a-specific-file-or-directory/)

## Remarks
