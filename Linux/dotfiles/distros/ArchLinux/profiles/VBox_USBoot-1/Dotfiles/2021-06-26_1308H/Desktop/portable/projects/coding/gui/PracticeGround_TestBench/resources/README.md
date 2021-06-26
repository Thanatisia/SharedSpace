```
#
# Makefile shellscript
# Author: Asura
# Created: 2021-04-25 00:11H
# Modified: 
#   2021-04-25 0011H : Asura
#   2021-04-25 0724H : Asura
#   2021-04-25 1116H : Asura
# Features: 
# Background Information: 
#   A Shellscript version of a makefile / cmakefile
# Changelog:
#   2021-04-25 0011H : Create script file
#   2021-04-25 0724H : 
#       - Added variable "LANGUAGE" which is the target programming/scripting language
#           - Added a switch case for LANGUAGE 
#               - System will set the command depending on language which can be changed in the variable
#   2021-04-25 1116H :
#       - Updated README with project Information and use-case
#
```

+ Background/Features: 
> Create a all-in-one TestBench/PracticeGround program (such as the NYP FYP Project - C++ Source Code Obfuscation)
    * Contains functions in the form of individual buttons
    * Can be used as a function TestBench (hence the name)
    * aka AutoGUI

### [Compilation]
+ Usage:
1. Edit [make.sh] to include your source file of choice
2. Compile your project

+ Examples:
* 1. Edit the make.sh file to include your source file of choice
```
LANGUAGE="C++"
SOURCEFILE="main.cpp"
OUTPUTFILE="main.exe"
LINKERS="" # Place your linkers here
```
* 2. compile the project
```
./make.sh
```

### [Running program/project]
+ Usage:
1. Run program

+ Examples:
* 1. Run program
```
chmod +x main.exe (if running for the first time; change permissions to executable)
./main.exe
```

