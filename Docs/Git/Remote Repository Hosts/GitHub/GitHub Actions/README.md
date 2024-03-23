# GitHub Actions

## Information

### Background
```
GitHub Actions is an automation platform developed by the Git version control remote repository hosting site 'GitHub' that integrates DevOps, CI/CD into the project scope by
allowing you to automate your build, test, and deployment pipeline

You can create workflows that build and test every pull request to your repository, or deploy merged pull requests to production
```

### Project Workspace
- Folders
    + GitHub Root: [project-root]/.github
    + GitHub Actions Workflow: [project-root]/.github/workflows
- Files
    + GitHub Actions Workflow configuration file: [project-root]/.github/workflows/master.yml

## Setup
### Pre-Requisites
- Create folder '.github' at the root of your project folder
    - Notes
        + This is the same location as your '.git' folder
    ```console
    mkdir -p [project-root]/.github
    ```
- Create folder 'workflows' in the .github folder
    ```console
    mkdir -p [project-root]/.github/workflows
    ```

### Installing
- Create file 'master.yaml' in the folder '[project-root]/.github/workflows/master.yml'
    - Notes
        - GitHub will check the repository for a '.github' folder
            - If the folder is found, it will check for github-specific folders
                + The folder 'workflows' is used for GitHub Action configurations, what to do with this repository if GitHub Actions is setup to be used

## Documentation

### Key-Values
- 'name: "name/purpose of action"' : This is the name/purpose of the GitHub actions workflow; Type <String>
- 'on:' : This will contain a list of targets and the actions that you want to act to said targets; Type <List>
    - Actions:
        - 'push:' : This will contain a list of target to push the changes to automatically
            - Targets
                - 'branches:' : This is a list that will contain a list of all branches you want to execute the actions on
        - 'pull_request:' : This will contain a list of target to make pull requests for the changes automatically
            - Targets
                - 'branches:' : This is a list that will contain a list of all branches you want to execute the actions on
- 'jobs:' : This will contain a list of various jobs; Type <List>
    - [job-name]          : Similar to the [container-name] in docker-compose, this will specify the name of the job you want to run automatically; Everything under this will be its specifications and options; Type <List>
        - Syntax/Structure
            ```yaml
            jobs:
                # List of various jobs to perform in the workflow
                [job-name]:
                    name: "Description"
                    runs-on: ubuntu-latest
                    defaults:
                        run:
                            working-directory: "out"
                    steps:
                        - name: "Description"
                        id
            ```
        - Job/task options
            - 'name: [job description/full name]' : Description/Full name of the job; Type <String>
            - 'runs-on: [docker-image]'           : Specify the Operating System to run the job in; This will create a virtual machine/docker container in the background as a service to execute the job on; Type <String>
                - Example base images:
                    + ubuntu-latest
            - 'defaults:'                         : List of default actions/options to perform; Type <List>
                - Actions
                    - 'run:'        : Default running configurations
                        - Configuration Options
                            - 'working-directory: [repository-working-directory]' : Specify the default working directory within the repository
            - 'steps:'                            : List of various steps to iterate through and execute; Type <List>
                - Steps configuration
                    - 'uses: [api]' : Specify a GitHub action plugin use
                        + Plugin Syntax: repository-author/plugin-name@[branch-name]
                        - Example Plugins
                            + actions/checkout@v2            : GitHub actions - git checkout; Branch v2
                            + actions/setup-java@v1          : GitHub actions - setup java; Branch 'v1'
                            + actions/upload-artifact@master : GitHub actions - Upload Artifacts; Branch 'master'
                            + dorny/paths-filter@v2          : Dorny - Filter paths; Branch 'v2'
                            + subosito/flutter-action@master : subosito - flutter; Branch 'master'
                    - 'name'        : Specify name/description of the step
                    - 'if: '        : This contains an conditional check that executes the step only if the check meets the requirements
                    - 'id: [id]'    : Specify a unique ID for the step
                    - 'run'         : Specify the command to execute when step is reached; This command will be run according to the other options provided
                    - 'with:'       : List of dependencies/suboptions that the step has to use
                        - Dependency options
                            - 'channel: [channel]'      : Specify a channel to execute on
                            - 'filters:'                : Specify a list of filters to follow to get a more specific requirement
                            - 'java-version: [version]' : If using Java; specify java version to work with
                            - 'name'                    : Specify name/description of this dependency
                            - 'path'                    : Specify the output path for the built executable; Syntax: '[working-directory]/path/to/output/file.extension'
                                - Example output
                                    - Output artifact
                                        ```yaml
                                        steps:
                                            - name:
                                              uses: 'actions/upload-artifact@master'
                                              with:
                                                  name: release
                                                  path: [working-directory]/build/app/outputs/[extension]/release/file-name
                                        ```

### Usage
- Standard Job
    - Contents
        ```yaml
        jobs:
            build:
                name: Build project
                runs-on: debian-latest
                defaults:
                    run:
                        working-directory: steps
                steps:
                    - name: Build the project
                      run: make build
        ```

- Build Docker Image
    - Explanation
        - YAML key-value (Dictionary) mappings
            + name: Specify the name of the action
            - on: Prepare to specify the targets of the action
                - push: Prepare to specify where to push the resulting out of the action
                    - branches: Prepare to specify and list all the branches you want to push the result of the CI/CD pipeline to
                        + [branch-name]
            - jobs: Prepare to specify all of the CI/CD Pipeline automation jobs/tasks
                - [job|task-name] : Specify the name of the job and configure all the options/attributes of the job
                    + runs-on: Specify the base docker image to run the automation job/task on
                    - steps: Specify all steps to be taken by the job/task
                        + name: Specify the name of the step
                        + uses: Specify the github action/rule to execute with the steps
                        + run: Specify the shell command to execute with the steps
    ```yaml
    name: Build Docker Image
    on:
      push:
        branches:
          - main
    jobs:
      setup-docker:
        runs-on: docker-image
        steps:
          - name: Checkout Repository
            uses: actions/checkout@v2
          - name: Build and tag the Docker image
            run: docker build --tag author-name/image-name:[tag|version] -f [dockerfile] [context]
    ```

## Wiki

### Snippets and Examples

### Templates

- Workflow File Structure
   - Information
       + Place this in the project's GitHub Actions workflow configuration '[project-root]/.github/workflows/master.yml'
   ```yaml
   name: "name/purpose-of-action"
   on: 
       # List on various callback actions to execute on the specified target when the event is triggered
       push:
           ## When a push is called
           branches:
               - main
               - branch-1
       pull_request:
           ## When a pull request is called
           branches:
               - main
               - branch-2
   
   jobs:
       # List of various jobs to perform in the workflow
       [job-name]:
   ```

## Resources

## References
+ [GitHub Docs - Actions - Learn GitHub Actions - Understanding GitHub Actions](https://docs.github.com/en/actions/learn-github-actions/understanding-github-actions)
+ [GitHub Docs - Actions - Using Workflows - Creating starter workflows for your organization](https://docs.github.com/en/actions/using-workflows/creating-starter-workflows-for-your-organization)
+ [Medium - Owumi Festus - Configuring Github Actions in a multi-directory repository structure](https://medium.com/@owumifestus/configuring-github-actions-in-a-multi-directory-repository-structure-c4d2b04e6312)

## Remarks

