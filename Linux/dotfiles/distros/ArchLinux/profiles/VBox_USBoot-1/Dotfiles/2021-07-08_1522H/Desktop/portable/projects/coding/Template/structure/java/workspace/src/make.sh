#
# Makefile shellscript
# Author: Asura
# Created: 2021-04-25 00:11H
# Modified: 
#   2021-04-25 0011H : Asura
# Features: 
# Background Information: 
#   A Shellscript version of a makefile / cmakefile
# Changelog:
#   2021-04-25 0011H : Create script file
#

SOURCEFILE=""
OUTPUTFILE=""
LINKERS="" # Place your linkers here (if any)
COMMAND="" # Write your command here

function main()
{
    `$COMMAND` && \
        echo "$COMMAND executed successfully." ||\
        echo "error executing $COMMAND"
}

if [[ "${BASH_SOURCE[@]}" == "${0}" ]]; then
    main "$@"

    # End
    line=""
    read -p "Pause" line
fi

