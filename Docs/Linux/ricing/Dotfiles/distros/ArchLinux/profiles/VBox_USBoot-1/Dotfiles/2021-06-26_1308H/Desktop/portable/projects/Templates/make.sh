#
# Makefile shellscript
# Author: Asura
# Created: 2021-04-25 00:11H
# Modified: 
#   2021-04-25 0011H : Asura
#   2021-04-25 0724H : Asura
#   2021-04-25 1138H : Asura
# Features: 
# Background Information: 
#   A Shellscript version of a makefile / cmakefile
# Changelog:
#   2021-04-25 0011H : Create script file
#   2021-04-25 0724H : 
#       - Added variable "LANGUAGE" which is the target programming/scripting language
#           - Added a switch case for LANGUAGE 
#               - System will set the command depending on language which can be changed in the variable
#   2021-04-25 1138H : 
#       - Added "C Language" and "C#" to the recognized options
#

LANGUAGE=""
SOURCEFILE=""
OUTPUTFILE=""
LINKERS="" # Place your linkers here

# Assign command according language
case "$LANGUAGE" in 
    "C")
        # Compiler
        COMMAND="gcc $SOURCEFILE $LINKERS -o $OUTPUTFILE"
        ;;
    "C++")
        # Compiler
        COMMAND="g++ $SOURCEFILE $LINKERS -o $OUTPUTFILE"
        ;;
    "C#")
        # Compiler
        # WIP
        COMMAND="mono $SOURCEFILE $OUTPUTFILE"
        ;;
    "Python")
        # Runner/Interpreter
        # To compile = using pyinstaller
        # Linkers = Other Options
        COMMAND="python $SOURCEFILE $LINKERS"
        ;;
    *) COMMAND="echo Invalid Command"
        ;;
esac


function START()
{
    echo "[Starting]"
    echo "Source File   : [$SOURCEFILE]"
    echo "Output File   : [$OUTPUTFILE]"
    echo "Any other info: [$LINKERS]"
    echo "Command       : [$COMMAND]"
    echo ""
}

function main()
{
    echo "[Processing]"
    `$COMMAND` &&\
        echo "  $COMMAND executed successfully." ||\
        echo "  error executing $COMMAND";
        echo ""
}

function END()
{
    # End
    line=""
    read -p "Pause" line
}

if [[ "${BASH_SOURCE[@]}" == "${0}" ]]; then
    START
    main "$@"
    END
fi

