# C programming language Project Filesystem Structure

## Libraries
### System Locations
```
To install a library/module into your system - place the library, object files into any one of the following folders
```
#### Global
+ '/lib'                : Global Libraries
+ '/bin'                : Global Binaries
+ '/usr/include'        : Global header guards and declaration files
- '/usr/lib'            : Global library definition files
- '/usr/share'          : Global shared resources

#### Package Management
+ '/usr/bin'            : User Binaries/Executables installed by package management

#### User
+ '/usr/lib'            : User Libraries 
+ '/usr/local/bin'      : User Binaries/Executables
- '/usr/local/include/' : User header guards and declaration files
    - Install all headers (*.h) you want to install here by default; The include directories are the places where the compiler searches to resolve an #include "a.h" preprocessor directive
        - Summary: A header file contains a header guard that declares the functions, variables/attributes to be imported and used by the main application
            + The header file should be imported/included into the main application source files
        - Placing your header files here allows you to import/include the header file natively
            ```c
            #include <header>
            ```
- '/usr/local/lib'      : User library definition files
    - Install all libraries you want to install here by default; the linker searches for needed libraries that usually provide implementations (definitions) to the declarations in your headers.
        - Summary: A library contains the definitions of the function signature declarations made in the header files
            + The library should be compiled together with the main application source files
- '/usr/local/share'    : User shared resources
    + Install all shared resources to be used by the application here by default

## Resources

## References

## Remarks

