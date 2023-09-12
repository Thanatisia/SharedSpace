# Linux Shellscripting - User/Group Permission Checking

## User Execution
### Check if script is running as sudo
- The $EUID environment variable holds the current user's UID
    + Root's UID is 0
```console
if [[ "$EUID" -ne 0 ]]; then
    echo -e "Please run the script as root (sudo)"
    exit 1
fi
```

## Resources

## References

### Search Queries
#### Google
+ Linux check if script is running as sudo

### StackOverflow
+ [StackOverflow - 18215973 - How to check if running as root in a bash script](https://stackoverflow.com/questions/18215973/how-to-check-if-running-as-root-in-a-bash-script)

## Remarks
