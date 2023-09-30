# C/C++ Header Guard

## Information
### Basics
- Header files in C/C++ are effectively external libraries that contains their own sets of functions, and are referenced by a caller file to be used
- Header Guards uses **Conditional Compilation Directives** that help to avoid errors that arise when the same function or variable is defined more than once by the mistake of a programmer. 
    + Effectively, these are protection that you can apply which will tell the compiler to not import a library multiple times, causing the C++ compile-time error `redefinition of 'type function()`

### Components
- There are generally 3 files that are created at any one time
    - Header file (denoted by the extension '.h')
        - This is the header file, and where you will define all the header classes and prototype functions
        - Components
            - Header keyword definitions (`#ifndef [HEADER_KEYWORD]`)
            - Prototype functions: A declaration of the function name you wish to implement later in the implementation source file
                + Uses the syntax format `[return-type] [function-name](parameter-signature);`
        - Notes
            - `#ifndef` will define a new macro keyword definition if it isnt found by the compiler
                + The `#endif` keyword will close the macro keyword definition
                + Add all the declarations betweeen the `#ifndef` and `#endif` keywords
        - Convention
            - Naming
                - header-file-name: Use your file name but completely capitalized, and ending with a `_H`
                    - i.e.
                        - file_name.h
                            + HEADER_UNIQUE_NAME = FILE_NAME_H
        - Purpose
            + Header guard
            + Prototype definitions
        - Contains the following lines
            - Implement header guards
                ```cpp
                #ifndef [HEADER_UNIQUE_NAME]
                #define [HEADER_UNIQUE_NAME]
                ```
            - Perform your declarations as necessary
                ```cpp
                ...
                    /* Declarations here */

                    // Variables
                    return_type variable;

                    // Functions
                    void set_func(type parameter);
                    return_type get_func();

                    // Classes
                    class Class_Name
                    {
                    private:
                        // Private attributes here
                        return_type variable;

                    public:
                        // Public attributes here
                        void set_func(type parameter);
                        return_type get_func();
                    }
                ...
                ```
            - Close off the macro keyword definitions
                ```cpp
                #endif
                ```
    - CPP source file (denoted by the extension '.cpp')
        - Purpose
            + Implementing the header file's prototype definitions
        - Contains the following lines
            - Import the corresponding header file
                ```cpp
                // Import corresponding header file
                #include "header_file.h"
                ```
            - Implement the statements into the definitions
                + Use the '::' operator to access the memory of the class object
                ```cpp
                // Functions
                set_func(type parameter)
                {
                    // Implementation Statements here
                    
                }

                get_func()
                {
                    // Implementation Statements here
                    return_type variable;
                    return variable;
                }

                // Classes
                Class_Name::set_func(type parameter)
                {
                    // Implementation Statements here
                }

                Class_Name::get_func()
                {
                    // Implementation Statements here
                    return_type variable;
                    return variable;
                }
                ```
    - Main runner/launcher file (generally your main.{c/cpp} file)
        - To use the above together
            + You need to compile 'main.cpp' with the other cpp files you called and referenced from
            + In other words, if you imported an header file with header guard, you need to compile that together with the main driver file
        ```cpp
        #include <iostream>
        #include <stdio>
        #include <stdlib>
        #include <string>
        using std::cin;
        using std::cout;
        using std::getline;
        using std::string;
        using std::endl;

        // Import external libraries
        #include "header_file.h"

        // Driver code
        int main()
        {
            cout << "Hello World" << endl;
            return 0;
        }
        ```

## Compilation

### Synopsis/Syntax
```cpp
g++ [your] [cpp] [files] [here] -o [output-file]
```

### Parameters
- Positionals
    + source_files : Variable Length; Specify all source files that are to be compiled together for header guard references; Can be object files (.o) as well
- Optionals
    - With Arguments
        + `-o | --output [output-file]` : Specify name of output file
        + `-L[linker/static-libraries]` : Specify linkers to be linked for compilation
        + `-I[libraries]` : To include path to external libraries that contains certain files for referencing
        + `-W[with-additional-options]` : Compile with additional options
    - Flags
        + -c : Just compile it and output an object (.o) file

### Usage
- Let there be 2 C++ files to compile together
    - Files
        + main.cpp
        + lib.cpp
    ```console
    g++ main.cpp lib.cpp -o main.exe
    ```

## Wiki
### Operation Flow
- Header file
    - i.e. file_name.h
        ```cpp
        #ifndef FILE_NAME_H
        #define FILE_NAME_H
            /* Definitions here */

            // Variables
            int number;
            float price;

            // Functions
            void set_func();
            int get_int();
            float get_float();

            // Classes
            class MyClass
            {
            private:
                int number = 0;
                int price = 0.0f;

            public:
                int get_int();
                int get_float();
                int set_func(int number, int price);
            }
        #endif
        ```
- Implementation CPP source file
    - i.e. file_name.cpp
        ```cpp
        #include <iostream>
        #include <stdio>
        #include <stdlib>
        #include <string>
        using std::cin;
        using std::cout;
        using std::getline;
        using std::string;
        using std::endl;

        // Import external libraries
        #include "file_name.h"

        /* Implement your definitions here */

        // Functions
        set_func() {
            cout << "Hello World" << endl;
        }

        get_int() {
            int res = 0;
            return res;
        }

        get_float() {
            float res = 0.0f;
            return res;
        }

        // Classes
        MyClass::get_int() {
            int res = 0;
            return res;
        }

        MyClass::get_float() {
            float res = 0.0f;
            return res;
        }

        MyClass::set_func(int number, float price) {
            this.number = number;
            this.price = price;
        }
        ```
- Main Driver/runner file
    - i.e. main.cpp
        + This file needs to be compiled alongside 'file_name.cpp'
        ```cpp
        #include <iostream>
        #include <stdio>
        #include <stdlib>
        #include <string>
        using std::cin;
        using std::cout;
        using std::getline;
        using std::string;
        using std::endl;

        // Import external libraries
        #include "file_name.h"

        // Driver code
        int main()
        {
            cout << "Hello World" << endl;
            return 0;
        }
        ```
- Compilation
    - Compile using 'g++'
        ```console
        g++ main.cpp file_name.cpp -o main.exe -L[linker/static-libraries] -W[with-additional-options]
        ```

### Sample/Template

#### Usage and Implementation Template

## Resources

## References
+ [GeeksForGeeks - Header Guard in C (applicable to C++)](https://www.geeksforgeeks.org/header-guard-in-c/)

## Remarks

