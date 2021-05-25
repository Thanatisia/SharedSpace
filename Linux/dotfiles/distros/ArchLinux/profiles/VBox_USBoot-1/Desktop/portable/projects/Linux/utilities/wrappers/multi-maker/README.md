```
#
# Project Name: Makefile shellscript
# Code Name: N/A
# Author: Asura
# Created: 2021-04-25 00:11H
# Modified: 
#   2021-04-25 0011H : Asura
#   2021-04-25 0724H : Asura
# Features: 
# Background Information: 
#   A Shellscript version of a makefile / cmakefile
# Changelog:
#   2021-04-25 0011H : Create script file
#   2021-04-25 0724H : 
#       - Added variable "LANGUAGE" which is the target programming/scripting language
#           - Added a switch case for LANGUAGE 
#               - System will set the command depending on language which can be changed in the variable
#
```

+ Background/Features: 
>

+ Usage:
1. Edit [make.sh]
2. ./make.sh

+ Examples:

* 1. Editing
```
LANGUAGE="C++"
SOURCEFILE="wxGUI.cpp"
OUTPUTFILE="wxGUI.exe"
LINKERS="`wx-config --cppflags --cxxflags --libs`" # Place your linkers here
```
* 2. [./make.sh] to compile


