#
# Python Project Autorunner : Game_Guide
# Author: ME
# Created: 2021-03-31 09:34H
# Modified: 2021-03-31 09:34H
# Features: 
#       - Autoruns Project with Output
# Background Information: 
#

function autorun()
{
        #
        # Autorun the project
        #
        proj_Type="$1"
        proj_Name="$2"
        out_File="$3"

        # Default Empty Variable
        if [ "$proj_Type" == "c" -o "$proj_Type" == "cpp" -a "$out_File" == "" ]; then
                # If project type is C and no out file provided, autoset file name as "main.exe"
                out_File="main.exe"
        fi

        case "$proj_Type" in
                "python" | "py")
                        python $proj_Name
                        ;;
                "c")
                        gcc $proj_Name -o $out_File
                        ;;
                "c++" | "cpp") 
                        g++ $proj_Name -o $out_File
                        ;;
                "c#")
                        mono $proj_Name -o $out_File
                        ;;
                *) break
                        ;;
        esac
}

DATALOG_fileName=out_data.txt
autorun 'python' 'main.py' 'main.exe' | tee -a $DATALOG_fileName
echo "" | tee -a $DATALOG_fileName

line=""
read -p "Paused, please press anything to exit..." line

