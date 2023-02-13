#
# Lemonbar general functions library/module file
# Author: 
# Created: 
# Modified: 
# Features: 
# Background Information: 
# Changelog:
#

# Import external libraries
. lemonbar_Desc.sh

function Format()
{
    echo "%{+u}%{B$BAR_BACKGROUND} $1 %{B}%{-u}"
}

function main()
{
    ret="Hello"
    echo $ret
}

if [[ "${BASH_SOURCE[@]}" == "${0}" ]]; then
    main "$@"
fi

