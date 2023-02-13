#
# Automatically set cursor
# Author: Asura
# Created: 2021-05-05 00:07H
# Modified: 
#   2021-05-05 0007H : Asura
# Features: 
# Background Information: 
# Changelog:
#   2021-05-05 0007H : Asura
#

# --- Variables
PROGRAM_NAME="setcursor"

function main()
{
    # Variables
    CURSOR_SYMLINK_PATH=~/.icons/default/cursors
    CURSOR_INDEX_THEME_PATH=~/.icons/default/index.theme

    # User Input (To Edit)
    target_cursor_Theme="nier_cursors"
    CURSOR_PATH_ROOT=~/.icons
    CURSOR_PATH=$CURSOR_PATH_ROOT/$target_cursor_Theme/cursors

    # Set Cursor info
    echo "[icon theme]" | tee $CURSOR_INDEX_THEME_PATH
    echo "Inherits=$target_cursor_Theme" | tee -a $CURSOR_INDEX_THEME_PATH

    # Check if symlink folder exists
    if [[ -L $CURSOR_SYMLINK_PATH ]]; then
        # Delete folder
        rm -r $CURSOR_SYMLINK_PATH
    fi
    
    # Set Symlink
    ln -s $CURSOR_PATH $CURSOR_SYMLINK_PATH
}

function START()
{
    echo "Program Name: $PROGRAM_NAME"
}

function END()
{
    line=""
    read -p "Pause" line
}


if [[ "${BASH_SOURCE[@]}" == "${0}" ]]; then
    START
    main "$@"
    END
fi

