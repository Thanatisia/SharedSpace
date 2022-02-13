# CONTRIBUTING
- Basic steps to contribute

## Setup : First commits
1. Clone the remote repository 
    git clone [url]

2. Switch directory to the cloned workspace
    cd [repository-name]

3. Setup config details
    git config user.name    [username]
    git config user.email   [email]

## Setup : Subsequent Contributions
1. Fetch the latest updates
    git fetch


## Commit & Pushing

4. Create and switch to a new branch
    # Note : For your branch name, please keep it specific to your change
    git checkout -b [branch-name] 

5. Make changes to your files

6. Add files to your local repository
    git add { . : Current Directory | * : All Files in current directory and subdirectories | specific filename }

7. Commit changes
    git commit -m [changes]

8. Push to remote repository
    git push -u [remote-repository-url] [branch-name]

9. Go to Github.com -> Remote Repository URL

10. Switch branch to your branch name

11. Press 'Confirm' Merge and Type in your change description in the textbox

12. Press 'Submit Merge' button

13. After confirmation, repeat [Setup : Subsequent Contributions] Step 1.
