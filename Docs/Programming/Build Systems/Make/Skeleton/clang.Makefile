# Clang Makefile

## Ingredients/Variables
CC = clang
override CFLAGS += -g -Wno-everything -pthread -lm
SRCS = $(shell find . -name '.ccls-cache' -type d -prune -o -type f -name '*.c' -print) # Find all source files and print to standard output (Return to variable)
HEADERS = $(shell find . -name '.ccls-cache' -type d -prune -o -type f -name '*.h' -print) # Find all header files and print to standard output (Return to variable)

## Rules/Targets/Recipes
### Build Objects
main: $(SRCS) $(HEADERS)
    $(CC) $(CFLAGS) $(SRCS) -o "$@"

main-debug: $(SRCS) $(HEADERS)
    $(CC) $(CFLAGS) -O0 $(SRCS) -o "$@"

### Run
all: main

clean:
    rm -f main main-debug

