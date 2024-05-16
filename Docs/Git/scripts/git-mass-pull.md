# git: mass pulling

## Explanations

### Steps
- Get all directories in the current working directory with the '.git' directory
- Iterate through all the received directories and enter the directories
    - Obtain the current git branch
    - Pull the latest changes made to the current git branch
    - Change 1 directory back up to the parent

> Host Network Check

```bash
# Check if host system's internet is working
ping -c 5 8.8.8.8 > /dev/null 2> /dev/null
if [[ $? -eq 0 ]]; then
    # Success
    printf "%s\n" "[+] Host system's internet is working properly."

    # ... Statements here ...
else
    printf "%s\n" "[X] Host system's internet is not working."
fi
```

> Full Snippet

```bash
: "
Enter all git repositories in the current working directory and pull the latest changes
"

# Get all directories with the ".git" directory within
all_dirs=($(find . -type d -name ".git" | rev | cut -d '/' -f2 | rev))

# Enter all directories and pull latest changes
for i in "${!all_dirs[@]}"; do
    # Get current directory
    curr_dir="${all_dirs[$i]}"

    echo -e "[i] Pulling: $curr_dir"

    # Change directory into git directory
    cd $curr_dir && \
        # Get current branch
        curr_git_branch="$(git branch | grep '*' | cut -d ' ' -f2)" && \
        # Pull latest change
        git pull origin $curr_git_branch && \
            echo -e "[+] Updated $curr_dir to the latest version" || \
            echo -e "[-] Error updating $curr_dir to the latest version"

    # Move back 1 directory
    cd ..

    echo -e ""
done
```
