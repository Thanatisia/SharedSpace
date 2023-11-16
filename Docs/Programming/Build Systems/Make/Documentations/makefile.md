# Make - Makefile

```
Documentation and Write-up of the Makefile's basics, Syntax, Structure of the makefile config
```

## Basics
### Operators
+ @ : Execute the command without the shell interface
+ $(var) : To use/invoke a variable

## Components

### Variables
> the following are typical variables found in most Makefiles
#### Compiled Languages 
+ CC : Your primary Cross Compiler to Compile the source codes
+ CFLAG : Your Compiler flags to Parse/pass into the compiler
+ SRC : Your source files
+ OBJ : Your object files
+ EXE : Your executable/output file
#### Interpreted Languages 
+ INT : Your primary interpreter
+ IFLAG : Your interpreter flags to Parse/pass into the interpreter

### Targets
> the following are typical targets found in most Makefiles
- setup : Preparation of all Dependencies and requirement checking prior to running
- build : Build the source code and compiles the source codes into an executable
- clean : Deletes all temporary files as well as created files - returning it back to pre-compilation state for rebuilding 
- install : The main installation process after building the source
    + To distribute the executables and other files (such as the config files) to their respective directories
    + Distribute to user-local if used without sudo
    + Distribute to system-wide if used with sudo
- uninstall : Remove/Delete all files distributed by *(sudo) make install*

## Structure

```console
target: [your-dependencies]
    # rules...
```

## Syntaxes
- Target
    + The rules when called, will call all Dependencies in order before executing the rules/statements
- Dependencies 
    + All targets, variables, rules required to build/perform the target

## Pseudocode
```console
CC = 
CFLAG = 

setup: 
    ## The Setup and Preparation processes
    ## - Checking of Dependencies and 
    ## - Checking of Requirements

build: 
    ## Build the source code and 
    ## compiles the source codes into an executable
    @make -s setup
    $(CC) $(CFLAGS) $(SRC)

install: 
    ## The main installation process after building the source
    ## - To distribute the executables and other files (such as the config files) to their respective directories
    ## - Distribute to user-local if used without sudo
    ## - Distribute to system-wide if used with sudo 
    @make -s setup
```

## Wiki
### Usage
- Typical Makefile used in projects
    - Components
        - Variables
            ```makefile
            PREFIX = /usr/local # Installation path
            bin_dir = $(PREFIX)/bin # Binary directory
            data_root_dir = $(PREFIX)/share # The root data directory for your project; i.e. /usr/local/share
            man_dir = $(data_root_dir)/man # The user manual directory
            man_1_dir = $(mandir)/man1 # The user man1 file directory
            ```
        - Rules/Targets
            - Installation
                ```makefile
                install:
                    ## Installation steps
                    ### Create Directories
                    mkdir -p -- $(DESTDIR)$(bin_dir) $(DESTDIR)$(man_1_dir)

                    ### Copy binary/application into system
                    cp -f -- [your-application] $(DESTDIR)$(bin_dir)/[your-application]

                    ### Change modifier/permission of executables
                    chmod -- +x $(DESTDIR)$(bin_dir)/[your-application]

                    ### Copy man1 user manual files into system
                    cp -f -- [your-application].1 $(DESTDIR)$(man_1_dir)/[your-application].1
                ```
            - Uninstallation
                ```makefile
                uninstall:
                    ## Uninstallation/Removal

                    ### Delete directory created
                    rm -r $(DESTDIR)
                ```

## Resources

## References
+ [GNU - Makefile Standards - DESTDIR](https://www.gnu.org/prep/standards/html_node/DESTDIR.html)

## Remarks
