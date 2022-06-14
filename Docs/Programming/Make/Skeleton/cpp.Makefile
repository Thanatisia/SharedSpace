# 
# A modular, portable and customizable Out-of-the-Box (OOTB) makefile template
#
# :: Usage
#	make about 				: Displays the project information
#	make backup				: Backup target system
# 	make build 				: To download all files and run the full customization and configuration process
#	make clean	 			: Clean and removes all temporary files
# 	make configure 			: To configure your currently found files
# 	make download 			: To download the files only
#	make help 				: Prints this help menu
# 	make install			: Runs the script in the correct order and install the program; Please run this in sudo
#	make setup				: Prepare system for script use

#============
# Variables
#============
PROJ_NAME = YOUR-PROJECT 			# Project Name
PROJ_FLDR = $(PWD)/$(PROJ_NAME) 	# Project Folder
BASE  = $(PROJ_FLDR)
SRC_EXT = cpp
SRC = main.cpp
OBJ = main.o
EXECUTABLE = main.exe	# Output

#==========
# Commands
#==========
CC = g++
CFLAGS = 

.PHONY:

.DEFAULT_GOAL := help	# Run ':help' if no target/action is provided

#======================================
# Compile Object Files into Executable
#======================================
$(EXECUTABLE): %.o
	## Place your source files here
	# % : Wildcard - take all files of the provided extension
	$(CC) %.o -o $(EXECUTABLE)

#========================================
# Compile Source Files into Object Files
#========================================
main.o: main.cpp main.h
	## Compiling Dependency into object files
	# Run '-c' to compile the source file with the specified dependencies 
	# without any output executable, just the object files
	$(CC) -c main.cpp	

%.o: %.$(SRC_EXT) %.h
	## For each source file and header files, generate the target object file
	# Reference: https://stackoverflow.com/questions/40155241/how-to-properly-use-or-asterisk-symbols-as-a-placeholder-in-makefile
	$(CC) -c %.$(SRC_EXT)

#=========
# Recipes
#=========
about:
	## Displays the project information
	echo -e "Program Name : [Program Name] \n"
		\ "Author : [Author Name] \n"
		\ "Repository URL : [Repository URL] \n"

backup:
	## Backup target system before install (OPTIONAL)

build: %.o
	## Build current source code to make output object files (Unused)
	$(CC) %.o -o $(EXECUTABLE)

configure:
	## Configures all configurable and customizable files

download:
	## Download the script/files

setup:
	## Prepare System for script use

install:
	## Start the installation process for the scripts

clean:
	## Removes all object files
	rm *.o
	rm $(EXECUTABLE)

help:
	## Prints this help menu
	# Will search for all '##' in each recipe and
	# Write that out in the help menu
	# Reference: Gavin Freeborn | How to manage your dotfiles with make | https://www.youtube.com/watch?v=aP8eggU2CaU
	@grep -E '^[a-ZA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


