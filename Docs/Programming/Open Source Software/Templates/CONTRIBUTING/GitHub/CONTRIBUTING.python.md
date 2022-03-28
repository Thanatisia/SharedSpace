# CONTRIBUTING

Instructions for contributing to project

## Table of Contents
* [Remarks](#remarks)
* [Repository and Commits](#repository-and-commits)
	- [Getting Started](#getting-started)
	- [Guidelines](#guidelines)
	- [Issues](#issues)
	- [Pull Requests](#pull-requests)
* [Getting Help](#getting-help)
* [Python Virtual Environments](#python-virtual-environments)

## Remarks

- Thank you [Auth0](https://github.com/auth0/open-source-template/blob/master/GENERAL-CONTRIBUTING.md) for this clean CONTRIBUTING.md template

## Repository and Commits

### Getting Started

contributions to the repository is categorised as any one of the following

- Reporting a bug
- Discussing the current state of the code
- Submitting a fix
- Proposing new features
- Becoming a maintainer

If you are a first-timer, please take a look at 
	- [my Starter's Guide to Open Source Software](https://github.com/Thanatisia/SharedSpace/blob/main/Docs/Git/Starters-Guide.txt)

### Guidelines

Please make contributions to the repo via Issues and Pull Requests (PRs).

- Search for existing Issues and PRs before creating your own
- Please refer to [my Open Source Software guide](https://github.com/Thanatisia/SharedSpace/blob/main/Docs/Git/Open%20Source%20Contributions.txt) for more information and steps
	on the Contributions steps

### Issues

Issues are categorised as any one of the following

- Requesting a new feature
- Discuss Potential Changes before you create/PR is created

### Pull Requests

PRs to our libraries are always welcome and can be a quick way to get your fix or improvement slated for the next release. In general, PRs should:

- Only fix/add the functionality in question **OR** address wide-spread whitespace/style issues, not both.
- Add unit or integration tests for fixed or changed functionality (if a test suite already exists).
- Address a single concern in the least number of changed lines as possible.
- Include documentation in the repo

For changes that address core functionality or would require breaking changes (e.g. a major release), it's best to open an Issue to discuss your proposal first. This is not required but can save time creating and reviewing changes.

To summarise : follow the ["fork-and-pull" Git workflow](https://github.com/susam/gitpr)

1. Fork the repository to your own Github account
2. Clone the project to your machine
3. Create a branch locally with a succinct but descriptive name
4. Commit changes to the branch
5. Following any formatting and testing guidelines specific to this repo
6. Push changes to your fork
7. Open a PR in our repository and follow the PR template so that we can efficiently review the changes.

## Getting Help

- Please refer to my contacts in the [README](README.md) and feel free to message me if you have any questions!


## Python Virtual Environments

To create the Python Virtual Environment for this project:
	- Manually
		- Generate using python venv (Virtual Environment) module
			python -m venv env

		- Activate Virtual Environment
			- If you are using Linux
				env\bin\activate
			- If you are using Windows
				env\Scripts\activate

		- Install requirements
			pip install -r requirements.txt
	- Using the 'start_venv' script
		- (For Linux) Change permission to allow execution
			chmod +x start_venv.sh

		- Run Script
			```
			After running the script, the script will
			- Generate a venv (name is editable in the script) if folder does not exist
			- Change root and jump into the virtual environment directory
				- Anything you do in this python environment is isolated from the host environment
			```
			- If you are using Linux
				./start_venv.sh
			- If you are using Windows
				start_venv.bat

		- Install requirements
			pip install -r requirements.txt

