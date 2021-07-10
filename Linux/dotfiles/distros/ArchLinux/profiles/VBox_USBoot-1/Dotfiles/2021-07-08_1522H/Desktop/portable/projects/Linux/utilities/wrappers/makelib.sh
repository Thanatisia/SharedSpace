#
# Wrapper & Utilities Library for (C)Make
# Author: Asura
# Created: 2021-04-21 16:32H
# Modified: 
#   2021-04-21 1632H
# Features: 
# Background Information: 
#   A General make/cmake wrapper library for use
# Changelog:
#   2021-04-21 1632H : Created src file
#

# --- Make Functions
# make 
#  make
#  make clean
#  make install
#   sudo make install (Global)
#  make uninstall
#   sudo make uninstall (Global)
# cmake
# -------------------

function maker()
{
    echo "make"
    echo "make clean"
    echo "make install"
    echo "sudo make install"
    echo "make uninstall"
    echo "sudo make uninstall"
}

function main()
{
    echo "Line: $LINENO"
}

if [[ "${BASH_SOURCE[@]}" == "${0}" ]]; then
    main "$@"
fi

line=""
read -p "Pause" line


