#
# All-in-one Compiler Library
# Modified: 2021-04-22 2204H
# Changelogs:
#   
#

function cpp_compiler()
{
    #
    # Wrapper for g++ alias
    #

    # Variables
    src_File=""
    out_File=""
    opts=""
    
    # Validation: Empty value from 1st Parameter
    if [ ! "$1" == "" ]; then
        # First parameter not empty
        src_File="$1"
        
        # Validation: Empty value from 2nd Parameter
        if [ ! "$2" == "" ]; then
            # Second parameter not empty
            out_File="$2"
            
            # Validation: Empty value from 3rd Parameter
            if [ ! "$3" == "" ]; then
                # Third parameter not empty
                opts="$3"
            fi
        else
            # Second Parameter is empty
            # Default to "main.exe"
            out_File="main.exe"
        fi
    else
        # First parameter is empty
        while [ "$src_File" == "" ]; do
            read -p "Source File not provided, please enter a source: " src_File
        done
    fi


    # Create a Dictionary
    declare -A res
    res=(
        [source]="$src_File"
        [out]="$out_File"
        [options]="$opts"
    )

    # Display Choices
    for k in "${!res[@]}"; do
        echo "$k : ${res[$k]}"
    done

    g++ -o $out_File $opts $src_File |& tee -a ~/.logs/compile_Cpp.log &&\
        echo "Successfully compiled $src_File to $out_File" ||\
            echo "Error compiling $src_File to $out_File"
}

function cpp_with_wx_compiler()
{
    #
    # C++ with wx compiler
    #

    # Variables
    src_File=""
    out_File=""
    opts=""
    
    # Validation: Empty value from 1st Parameter
    if [ ! "$1" == "" ]; then
        # First parameter not empty
        src_File="$1"
        
        # Validation: Empty value from 2nd Parameter
        if [ ! "$2" == "" ]; then
            # Second parameter not empty
            out_File="$2"
            
            # Validation: Empty value from 3rd Parameter
            if [ ! "$3" == "" ]; then
                # Third parameter not empty
                opts="$3"
            fi
        else
            # Second Parameter is empty
            # Default to "main.exe"
            out_File="main.exe"
        fi
    else
        # First parameter is empty
        while [ "$src_File" == "" ]; do
            read -p "Source File not provided, please enter a source: " src_File
        done
    fi

   opts="`wx-config --cxxflags --libs` $opts"

   # echo "Options: $opts"

   cpp_compiler "$src_File" "$out_File" "$opts"
}


