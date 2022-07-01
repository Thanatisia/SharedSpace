#!/bin/env bash
: "
A Minimal Shellscript skeleton/template with command line options/arguments using shift
"

declare -A flags=(
    # [your-flag]="value"
    # [flag]="value (recommended default: false)"
    ["file"]=false
    ["input"]=false
    ["output"]=false
)
declare -A args=(
    # [your-flag]="user-argument"
    # [flag]="user-argument"
)

init()
{
    : "
    Initialize variables, command line arguments and options during setup
    "
    while [[ "$#" -gt 0 ]]; do
        # Common Command Line Optional Arguments 
        case "$1" in
            "a" | "--all")
                # Show all information or operate on all arguments (aka --all)
                shift
                ;;
            "f" | "--file")
                # Input filename (aka --file)
                flags["file"]=true
                args["file"]="$2" # Assume you want an input filename
                shift 2
                ;;
            "h" | "--help")
                # Display this help menu (aka --help)
                shift
                ;;
            "i" | "--input")
                # Input (aka --input)
                flags["input"]=true
                args["input"]="$2" # Assume you want an input
                shift 2
                ;;
            "l" | "--list")
                # List all files/folders without any input or other actions (aka --list)
                shift
                ;;
            "o" | "--output")
                # Output filename (aka --output)
                flags["output"]=true
                args["output"]="$2" # Assume you want an input filename
                shift 2
                ;;
            "q" | "--quiet")
                # Quiet aka Suppress stdout (aka --quiet)
                shift
                ;;
            "r" | "--recursive")
                # Recursive (aka --recursive)
                shift
                ;;
            "v" | "--verbose")
                # Verbose (aka --verbose)
                shift
                ;;
            *)
                # Default/invalid option
                break
                ;;
        esac
    done
}

setup()
{
    : "
    Setup processes after script startup
    "
    init
}

main()
{
    argv=($@)
    argc="${#argv[@]}"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    setup
    main $@
fi
