#!/bin/env bash
: "
A Minimal Shellscript skeleton/template with command line options/arguments

NOTE:
- Due to limitations by the built-in POSIX command 'getopts',  getopts only has support for short-named optional arguments
    - Examples
        [O]: -v
        [O]: -ifv
        [O]: -i -f -v
        [X]: --verbose
        [X]: --verbose --input filename
    - You need to manually process long-named optional arguments manually...
"

declare -A flags=(
    # [your-flag]="value"
    [flag]="value (recommended default: false)"
)

<<EOF
## Documentation
### Syntax
getopts [options] [variable-storage]
### Options
+ ":[option]" | To 
+ "[option]:" | To get an optional parameter with additional argument required
    - The argument provided will be stored in the default "OPTARG" variable
EOF
while [[ getopts ":options:" opt ]]; do
    # Common Command Line Optional Arguments 
    case "${opt}" in
        "a")
            # Show all information or operate on all arguments (aka --all)
            ;;
        "f")
            # Input filename (aka --file)
        "h")
            # Display this help menu (aka --help)
            ;;
        "i")
            # Input (aka --in)
            ;;
        "l")
            # List all files/folders without any input or other actions (aka --list)
            ;;
        "o")
            # Output filename (aka --out)
            ;;
        "q")
            # Quiet aka Suppress stdout (aka --quiet)
            ;;
        "r")
            # Recursive (aka --recursive)
            ;;
        "v")
            # Verbose (aka --verbose)
            ;;
        *)
            # Default/invalid option
            ;;
    esac
done

main()
{
    argv=($@)
    argc="${#argv[@]}"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main $@
fi
