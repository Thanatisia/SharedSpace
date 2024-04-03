# Git Remote Repository Server - GitHub - Backing up and Migration

## Setup
### Dependencies
+ git
+ curl
+ jq

## Backup and Archive
### Steps
+ [Obtaining the repository list](#obtaining-the-repository-list)
+ [Git clone the repositories](#git-clone-the-repositories)

### Obtaining the repository list
- Obtain JSON logs using the GitHub API via curl
    - Obtaining Public Repositories
        ```bash
        curl -H "Authorization: Bearer [GITHUB_API_TOKEN]" "https://api.github.com/user/repos?type=public&per_page=[maximum-page-numbers]&page=[page-number]" > output.json
        ```

    - Obtaining Private Repositories
        ```bash
        curl -H "Authorization: Bearer [GITHUB_API_TOKEN]" "https://api.github.com/user/repos?type=private&per_page=[maximum-page-numbers]&page=[page-number]" > output.json
        ```

- Parse JSON logs into jq and export the file names without string quotes
    ```bash
    cat output.json | jq -r '.[].full_name' > output-filenames.txt
    ```

### Git clone the repositories
- Public Repositories
    ```bash
    git clone https://github.com/author/repo-name
    ```

- Private Repositories
    ```bash
    git clone https://[GITHUB_API_TOKEN]@github.com/author/repo-name
    ```

## Recovery

## Resources

## References

## Remarks
