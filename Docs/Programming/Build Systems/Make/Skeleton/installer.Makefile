# Makefile

# Recipe(s)
PKG_NAME = "your-package-name-here"
BIN_NAME = "your-binary-here"
CC =
CXX = 
CFLAGS =

# Rules/Targets
build:
	## Build & Compile source code into binary
        ### Change this according to specification by developer

install:
	## Install source code/script/binary into system path
        ### Change this according to specification by developer
	install src/${BIN_NAME} /usr/local/bin

uninstall:
	## Remove source code/script/binary/files installed into system path
        ### Change this according to specification by developer
	rm -f "$$(which $(BIN_NAME))"

clean:
	## Clean-up all temporary files generated during building process
        ### Change this according to specification by developer
