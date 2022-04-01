# Documentation - Shellscripting Best Practices

## Table of Contents
* Use Systematic and colorful messages in stdout

## Use Systematic and colorful messages in stdout

- excerpt and example from [Nortoin Wimpress's Rolling Rhino](https://github.com/wimpysworld/rolling-rhino/blob/master/rolling-rhino). Thank you for this useful example!
```
function fancy_message() {
    # $1 = type , $2 = message
    # Message types
    # 0 - info
    # 1 - warning
    # 2 - error
    if [ -z "${1}" ] || [ -z "${2}" ]; then
      return
    fi

    local RED="\e[31m"
    local GREEN="\e[32m"
    local YELLOW="\e[33m"
    local RESET="\e[0m"
    local MESSAGE_TYPE=""
    local MESSAGE=""
    MESSAGE_TYPE="${1}"
    MESSAGE="${2}"
    
    case ${MESSAGE_TYPE} in
      info) echo -e "  [${GREEN}+${RESET}] INFO: ${MESSAGE}";; # Previously "0"
      warn) echo -e "  [${YELLOW}*${RESET}] WARNING: ${MESSAGE}";; # Previously "1"
      error) echo -e "  [${RED}!${RESET}] ERROR: ${MESSAGE}";; # Previously "2"
      *) echo -e "  [?] UNKNOWN: ${MESSAGE}";;
    esac
}
```