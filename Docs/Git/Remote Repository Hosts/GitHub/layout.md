# GitHub Repository Page Layout/UI

## Components
> What is generally found in any given repository?

### Page Interface
> The GitHub repository page's UI/page/buttons
- Releases : The Releases page is where you specify updates/changes made in the current/latest versions, as well as include files such as [Pre-built/compiled binaries, Source Codes etc.] for easy access to users without requiring to clone the repository.

### Tabs
> Individual tabs in a repository that provides functionality into various git features such as *branches* and *tags*
- Branches : Branches in a git repository are like pointers to a snapshot containing your changes. 
	- A git repository (version control system) is like a tree, and the tree has multiple branches that spreads out depending on the changes you made. 
		+ All Changes will affect the history of the overall tree
	- You can have multiple branches, each branch do not interact with each other unless you merge the branches into a single branch
		+ You can think of branches with this idea
			```
						----- * [Branch 1] ----- [Change 1] ----- [Change 2] ----
						|							|
			[main-branch] * ---------							------ * [Merge Branch-1 and Branch-2] ----- * [main branch]
						|							|
						----- * [Branch 2] ----- [Change 1] ----- [Change 2] ----
			```
	+ When working with branches, please becareful of conflicts
- Tags : Tags are labels assigned to the repository for the version/release to be identifiable; Generally, version numbers are used as tags

### Files
> Files found in the repository/source code that is recognized by GitHub
+ LICENSE.md : A License assigned by the maintainer to the repository to be recognized that you follow a certain legal rules - depending on the license (i.e. GPL3, MIT). By Default : If a license does not exist, the repository is considered "All Rights Reserved" and nobody should be allowed to touch it
+ README.md : The page's main documentation file, this will be displayed in the GitHub page
