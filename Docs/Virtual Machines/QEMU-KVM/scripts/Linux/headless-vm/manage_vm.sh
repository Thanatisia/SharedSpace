: "
Virtual Machine Manager
"
display_Help()
{
    : "
    Disply help menu
    "
    msg=$(cat <<EOF
[Synopsis/Syntax]
$0 {optionals} <arguments> [positionals]

[Parameters]
    - Optionals
        - With Arguments
            + -k | --kill-port <port-number> : Specify ports to kill; Repeatable - Append this option for every port you want to kill/close
        - Flags
            + -h | --help : Display help menu
            + -v | --version : Display system version

[Usage]
- Display Help Menu
    $0 -h

- Display System Version Information
    $0 -v

- Kill ports
    - Single
        $0 -k port-number
    - Multiple
        $0 -k port-1 -k port-2 ...
EOF
)
    echo -e "$msg"
}

display_Version()
{
    : "
    Display System Version Information
    "
    vers=$(cat <<EOF
System Version: v0.1.0
Last Updated: 2023-09-09 2323H
Author: https://github.com/Thanatisia
EOF
)
    echo -e "$vers"
}

check_Port()
{
    : "
    Check if port number is in use
    "
    port_number="$1"
    found="$(sudo ss -tupln | grep :${port_number})"
    echo "$found"
}

port_close()
{
    : "
    Kill/Close multiple ports
    "
    ports=("$@")
    kill "${ports[@]}"
}

check_key_in_Optional()
{
    : "
    Check if key is in the optional array
    "
    key="$1"
    ret_Code="false"

    # Check if key is in optionals
    if [[ "${optionals[$key]}" != "" ]]; then
        # Key is found
        ret_Code="true"
    fi
    echo -e "$ret_Code"
}

display_Optionals()
{
    : "
    Display Optional Flags/Parameters
    "
    # Check if there are optional flags
    if [[ "${#optionals[@]}" -gt 0 ]]; then
        for k in "${!optionals[@]}"; do
            # Get current value
            v="${optionals[$k]}"

            echo -e "$k => $v"
        done
    else
        echo -e "No optional arguents provided."
    fi
}

display_Positionals()
{
    : "
    Display Positional Values
    "
    # Check if there are positionals
    if [[ "${#positionals[@]}" -gt 0 ]]; then
        for i in "${!positionals[@]}"; do
            # Get current value
            value="${positionals[$i]}"

            echo -e "$i => $value"
        done
    else
        echo -e "No positionals provided."
    fi
}

get_cli_arguments()
{
    : "
    Get CLI arguments
    "
    argv=("$@")
    argc="${#argv[@]}"

    declare -gA optionals=(
        ["help"]=false
        ["version"]=false
    )
    declare -g positionals=()
    declare -g port_kill_list=() # List of ports to kill

    # Check if there are arguments
    if [[ "$argc" -gt 0 ]]; then
        # Arguments provided
        ## While there are still arguments
        while [[ "$1" != "" ]]; do
            ## Loop through all arguments
            case "$1" in
                "-k" | "-kill-port")
                    ## Kill/Close ports
                    ### Repeatable - Please append this for every port you wish to close
                    ## Check if argument is provided
                    if [[ "$2" != "" ]]; then
                        ## Port is provided
                        port_number="$2"
                        ## Append port into optionals
                        optionals["kill-port"]=true 
                        port_kill_list+=("$port_number")
                        ## Shift 1 more time to go to the next argument
                        shift 1
                    else
                        echo -e "Port number is not provided."
                        exit 1
                    fi
                    shift 1
                    ;;
                "-h" | "--help")
                    ## Display help menu
                    optionals["help"]=true
                    shift 1
                    ;;
                "-v" | "--version")
                    ## Display system version
                    optionals["version"]=true
                    shift 1
                    ;;
                *)
                    ## Invalid argument/positionals
                    # echo -e "Invalid argument provided [$1]"

                    ## Positionals
                    positionals+=("$1")

                    ## Shift 1 position to the left after usage to go to the next argument
                    shift 1
                    ;;
            esac
        done
    else
        echo -e "No arguments provided."

        # Exit
        exit 1
    fi
}

setup()
{
    : "
    Perform pre-initialization and setup processes
    "
    get_cli_arguments "$@"
}

process_cli_arguments()
{
    : "
    Process Optional and Positional CLI arguments
    "
    ## Begin Processing
    for k in "${!optionals[@]}"; do
        # Get current value
        v="${optionals[$k]}"

        # Switch-case through 
        case "$k" in
            "help")
                ## Display help menu
                if [[ "$v" == "true" ]]; then
                    display_Help
                fi
                ;;
            "version")
                ## Display help menu
                if [[ "$v" == "true" ]]; then
                    display_Version
                fi
                ;;
            "kill-port")
                ### Check if kill port is specified
                is_in_Optionals=`check_key_in_Optional "$k"`
                if [[ "$is_in_Optionals" == "true" ]]; then
                    echo -e "Kill port(s) is/are specified: ${port_kill_list[@]}"

                    # Loop through all ports 
                    for i in "${!port_kill_list[@]}"; do
                        # Get port number
                        target_Port="${port_kill_list[$i]}"

                        # Check if port exists before proceeding
                        found=`check_Port $target_Port`
                        if [[ "$found" != "" ]]; then
                            # Port is in use
                            echo -e "Port [$target_Port] is in use"
                            # begin killing the port
                            kill $target_Port && \
                                echo -e "Target Port [$target_Port] killed successfully." || \
                                    echo -e "Error killing target Port [$target_Port]."
                        else
                            # Port is not in use
                            echo -e "Port [$target_Port] is not in use"
                        fi
                    done
                fi
                ;;
        esac

        # New line
        echo -e ""
    done
}

main()
{
    echo -e "Optionals:"
    display_Optionals

    echo -e ""

    echo -e "Positionals:"
    display_Positionals

    echo -e ""

    process_cli_arguments
}

if [[ "${BASH_SOURCE[@]}" == "${0}" ]]; then
    setup "$@"
    main
fi
