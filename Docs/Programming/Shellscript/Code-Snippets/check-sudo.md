# Linux Shellscript - verify if running as sudo

## Basics
- There are various ways of checking for sudo run
    1. Using whoami
    2. Using the environment variable '$EUID'

1. Using whoami
    - In the Linux shell, how you check for the current logged-in user is through the 'whoami' command.
        + When you use whoami, it will return your username
        ```console
        whoami
        ```
    - However, when you use 'sudo' with whoami, it will run whoami as a superuser, aka root
        + This means that when you use sudo whoami, it will return the username 'root'
        + As you can already guess, this is one way to automatically/programatically check if currently-running user is root.
        ```console
        sudo whoami
        ```

2. Using the environment variable '$EUID'
    - There exists environment variables - essentially key-value (Associative Array) contains that maps an Environment Varibale (Key) to a Value
    - The environment variable '$UID' (User ID) is the ID of the user that executed the program, and the EUID (Effective UID) is the User ID the process is executing.
        + Usually both are equal, a common case where UID and EUID are different - would be when executing sudo.
        + The $EUID variable will hold the value of 0 if it is being ran as root (sudo)

## Snippets
1. Using whoami
    ```shellscript
    is_sudo="$(sudo whoami)"
    if [[ "$is_sudo" == "root" ]]; then
        main "$@"
    else
        echo -e "Please run $0 with sudo"
    fi
    ```

2. Using $EUID
    ```shellscript
    curr_user="$(echo $EUID)"

    if [[ "$curr_user" == "0" ]]; then
        main "$@"
    else
        echo -e "Please run $0 with sudo"
    fi
    ```
