# Makefile
# ================================================
# Syntax:
#
# To set a variable:
# variable=value
#
# program:	[dependencies - source/object files]
#			[instructions to generate program]
# ================================================


# Compiler type
CCC=g++

# Compiler Standard and Flags
CCFLAGS=-std=c++11

# Compilation Requirements
SRC_MAIN=main.cpp
TARGETS=$(SRC_MAIN)

main.exe:	$(TARGETS)
			$(CCC) $(CCFLAGS) $(TARGETS) -o main.exe

clean:
			rm *.o