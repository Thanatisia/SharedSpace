# Linux commands - Getopts

A Minimal POSIX Linux/UNIX library/command used to handle Command Line Options and Arguments 

On Unix-like operating systems, getopts is a builtin command of the Bash shell. 

It parses command options and arguments, such as those passed to a shell script.

## Table of Contents
- [Setup](#setup)
- [Documentation](#documentation)
- [References](#references)
- [Resources](#resources)
- [Remarks](#remarks)

## Setup

### Pre-Requisites

## Documentation

### Syntax

getopts [options] [variable-storage]

### Options

+ ":[option]" | To 
+ "[option]:" | To get an optional parameter with additional argument required
    - The argument provided will be stored in the default "OPTARG" variable

### Usage

- General Skeleton/Template
```console
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
```

## References

## Resources

+ [Computerhope- Getopts](https://www.computerhope.com/unix/bash/getopts.htm)

## Remarks