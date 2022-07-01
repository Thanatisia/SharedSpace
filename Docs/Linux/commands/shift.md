# Documentation - shift

## Table of Contents
* [Background](#background)
* [Setup](#setup)
* [Documentation](#documentation)
* [Resources](#resources)
* [References](#references)
* [Remarks](#remarks)

## Information

### Background

<p>
    The shift command is one of the Bourne shell built-ins that comes with Bash. <br/>
    The command will shift/move the command line arguments to (n) position left. <br/>
    - The first argument is lost after using shift
    This command is useful when you want to get rid of the command line arguments which are not needed after parsing them <br/>
</p>

This command takes one argument, a number. (i.e. $0, $1... $n)
    - The positional parameters are shifted to the left by a number N
    - The positional parameters from N+1 to $# are renamed to variable names from $1 to $# - N+1.

+ This command is generally used to manually self-handle Command Line Arguments (positional and optional) without the use of getopt(s).

### Related to

+ unshift
+ pop (i.e. popd)
+ push (i.e. pushd)

### Simplified Explanation

- Script will look at arguments starting from $1
    + Take actions to $1
    + Execute shift
        - script will move argument in position [$2] -> [$1]
        - script will move argument in position [$3] -> [$2]
        - script will move argument in position [$4] -> [$3]
        - tldr script will move argument in position [$X] -> [$(X-n)]

### Examples

- If n = 1 or empty
    + Script will look at arguments starting from $1
        + Take actions to $1
        + Execute shift
            - script will move argument in position [$2] -> [$1]
            - script will move argument in position [$3] -> [$2]
            - script will move argument in position [$4] -> [$3]

- If n = 2
    + Script will look at arguments starting from $1
        + Take actions to $1
        + Execute shift
            - script will move argument in position [$3] -> [$1]
                + script will skip $2
            - script will move argument in position [$4] -> [$2]
                + script will skip $3
            - script will move argument in position [$5] -> [$3]
                + script will skip $4

- Given the following specifications
    + n = number of positions you want to shift the command-line arguments to the left (default = 1)
    - Arguments
        + $1: "Val1"
        + $2: "Val2"
        + $3: "Val3"
        + $4: "Val4"
    + Total Argument Count : $#
    + All Arguments : $@
    ```console
    # All Arguments = "Val1" "Val2" "Val3" "Val4"
    # First argument = "Val1"
    shift 2
    # First argument after (shift 2) = Val3; Shifted by 2 positions (n = 2)
    shift # Equivalent to shift 1
    # First argument after (shift 1) = Val4; Shifted by 1 position (n=1)
    ```

## Setup

### Pre-Requisites

### Dependencies

### Installing

## Documentation

### Synopsis/Syntax

```console
shift [n]
```

### Parameters

+ n : Number of positions you want to shift/move the command-line arguments to the left (default = 1)

### Usage

#### Optional Arguments with no additional input

```console
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        # your flags) 
        #   action
        #   ;;
        -h | --help)
            flag=value-set
            ;;
        *)
            # Default / Incorrect value
            break
            ;;
    esac
    shift
done
```

#### Optional Arguments with additional user input

```console
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        # your flags) 
        #   action
        #   ;;
        -h | --help)
            flag=value-set
            shift
            ;;
        -f | --file-name)
            flag="value"
            # Skip $1 and $2 because $1 = your current flag and $2 = input argument
            file_name="$2" 
            shift 2
            ;;
        *)
            # Default / Incorrect value
            break
            ;;
    esac
done
```

## Resources

## References

## Remarks


