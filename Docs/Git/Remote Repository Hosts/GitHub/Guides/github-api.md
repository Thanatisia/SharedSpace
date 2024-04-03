GitHub API
==========

## Documentations

*API Query Parameters*
- Queries
    + access_token=[GITHUB_API_TOKEN] : Set the GitHub API Token for authentication and authorization
    + per_page=[maximum-number-of-repos] : Explicitly set the maximum number of repositories per page to list (default: 100)
    + page=[page-number] : Explicit set the current page to export
    + type=[public|private|archived|...] : Explicitly specify the type of 

*API Pages*
-----------
- Repositories search
    - Search and list all of your repositories
        ```bash
        https://api.github.com/search/repositories?q=user:[GH-USERNAME]&[queries|variables=values]&[other-queries]
        ```

- User search
    - Search and list all of your repositories
        ```bash
        https://api.github.com/users/[GH-USERNAME]/repos?[queries|variables=values]&[other-queries]
        ```

- List all repositories
    - Search and list all repositories in all users according to a specified parameter
        ```bash
        https://api.github.com/user/repos?[queries|variables=values]&[other-queries]
        ```

## Snippets and Examples

> Obtain all Public and Private Repositories 

- using 'https://api.github.com/search/repositories'
    ```bash
    curl -H "Authorization: Bearer [GITHUB_API_TOKEN]" https://api.github.com/search/repositories?q=user:[GH-USERNAME] > output-repos.json
    ```

- using 'https://api.github.com/users/[GH-USERNAME]'
    - Default: Maximum 30 repositories per page
        - Using Authorization Header
            ```bash
            curl -H "Authorization: Bearer [GITHUB_API_TOKEN]" https://api.github.com/users/[GH-USERNAME]/repos?access_token=[GITHUB_API_TOKEN] > output-repos.json
            ```
        - Using API route
            ```bash
            curl "https://api.github.com/users/[GH-USERNAME]/repos?access_token=[GITHUB_API_TOKEN]" > output-repos.json
            ```

    - Specify maximum pages
        ```bash
        curl "https://api.github.com/users/[GH-USERNAME]/repos?per_page=[maximum-page-numbers]" > output-repos.json
        ```

- using 'https://api.github.com/user/repos' and defining the repository type
    - Default: Maximum 30 repositories per page
        ```bash
        curl -H "Authorization: Bearer [GITHUB_API_TOKEN]" "https://api.github.com/user/repos?type=[public|private]" > output-repos.json
        ```

    - Specify maximum pages
        ```bash
        curl -H "Authorization: Bearer [GITHUB_API_TOKEN]" "https://api.github.com/user/repos?type=[public|private]&per_page=[maximum-page-numbers]" > output-repos.json
        ```

- Obtaining Public Repositories
    ```bash
    curl -H "Authorization: Bearer [GITHUB_API_TOKEN]" "https://api.github.com/user/repos?type=public&per_page=[maximum-page-numbers]&page=[page-number]" > output-repos.json
    ```

- Obtaining Private Repositories
    ```bash
    curl -H "Authorization: Bearer [GITHUB_API_TOKEN]" "https://api.github.com/user/repos?type=private&per_page=[maximum-page-numbers]&page=[page-number]" > output-repos.json
    ```


> To format and obtain JSON key-values using 'jq'

- Obtain full name of repositories without string wrap
    ```bash
    cat output-repos.json | jq ".[].full_name" -r
    ```

- Obtain number of repositories in list
    ```bash
    cat output-repos.json | jq ".[].full_name" -r | wc -l
    ```

## Resources

## References
+ [StackOverflow - Questions - 8713596 - How to retrieve the list of all GitHub repositories of a person?](https://stackoverflow.com/questions/8713596/how-to-retrieve-the-list-of-all-github-repositories-of-a-person)

## Remarks
