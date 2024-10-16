# Golang - Introduction and Documentations

## Information

### Description
- This documentation is a structured introductory write-up to the basic must-know synopsis/syntax of keywords, operators and concepts used by Golang (as well as comparison to other programming languages if exists) for beginners to learn from scratch

## Table of Contents
- [Basics](#basics)
    + [Setup](#setup)
    + [Golang Project Workspaces and Development](#golang-projects)
    + [Operators](#operators)
    + [Keywords](#keywords)
    + [Variables](#variables)
    + [Basic Syntax](#Syntax)
    + [Conditional Statements](#conditional-statements)
- [Data Types](#data-types)
    + [Floats](#floats)
    + [Integers](#integers)
    + [String](#string)
    + [null](#null)
- [Standard Streams](#standard-streams)
    + [Standard Output (stdout)](#standard-output)
- [Data Structures](#data-structures)
    + [Arrays](#arrays)
    + [Vectors](#vectors)
    + [Structure](#structure)
- [Iterative](#iterations)
    - [For Loop](#for-loop)
        + [Indexed-based](#indexed-based)
        + [Key-Value Mappings](#key-value-mappings)
    - [While Loop](#while-loop)
+ [Enumeration](#enumeration)
+ [Attributes](#attributes)
+ [Crates](#crates)
- [Functions](#functions)
- [Command Line Arguments](#command-line-arguments)
- [External Files](#external-files)
    + [Importing External Libraries and packages](#importing)
    + [File I/O Processing](#file-io-processing)
- [System Process Calls](#system-process-calls)
    + [System Command Execution](#system-command-execution)
    + [Subprocess and Pipes](#subprocess-and-pipes)
- [Asynchronous Programming](#asynchronous-programming)
- [Concurrency](#concurrency)
    + [Threads](#threads)

## Basics

## Setup

### Dependencies
+ go

### Pre-Requisites
- Set Environment Variables
    - `GOROOT=[go-sdk-directory]` : This environment variable is mapped to a custom directory containing your go (SDK) installation; You can find the go compiler, go tools or standard libraries in this directory; Optional - The Go binary assumes that go will be installed in `/usr/local/go` (in Linux) or `%HOMEDRIVE%\Go` (in Windows), but it is possible to install the Go tools to a different location
        - Windows
            ```dos
            SET GOROOT=%HOMEDRIVE%\go
            ```
        - Linux
            ```bash
            export GOROOT=/usr/local/go
            ```
    - `GOPATH=[your-go-home-directory-here]` : Specify your Go home/project workspace here (similar to the 'PREFIX' environment variable for C); The packages/libraries/modules installed via `go install` will be installed into the package folder here here
        - Windows
            + Default: `%USERPROFILE%\go`
            ```dos
            SET GOPATH=%USERPROFILE%\go
            ```
        - Linux
            + Default: `$HOME/go`
            ```bash
            export GOPATH=$HOME/go
            ```
    - `GOBIN=[your-go-binary-directory-here]` : Specify your Go binaries directory here; This environment variable is mapped to the path where the binaries installed via `go install` will be installed into
        - Windows
            ```dos
            SET GOBIN=%GOROOT%\bin
            ```
        - Linux
            ```bash
            export GOBIN=$GOROOT/bin
            ```

- Install Golang
    - Using Package Manager
        - apt-based (Debian)
            ```bash
            apt install golang
            ```
        - pacman-based (ArchLinux)
            ```bash
            pacman -S golang
            ```

- (Optional) Append the golang directory into the PATH system environment variable
    - Programmatically using the PATH environment variable
        - Bash
            ```bash
            export PATH=/path/to/go/bin:$PATH
            ```
        - Batch
            ```dos
            SET PATH=\path\to\go\bin;%PATH%
            ```
    - Manually
        - Open 'System Properties'
            - Press the button 'Environment Variables'
                - Under 'System Variables', double click 'PATH' to modify the system environment variable path
                    + Press 'New' and type the path to the bin directory (i.e. \path\to\go\bin)
                    + Press 'OK' to confirm
                + Press 'OK' to apply
            + Press 'Apply' and 'OK' to close

### Project workspace structure/layout setup - main.go in root directory

#### Project Layout

```bash
[project-root-directory]/
|
|-- README.md
|-- go.mod
|-- main.go
|
|-- [module-name]/
    |
    |-- go.mod
    |-- *.go
    |
    |-- [submodule-name]/
        |
        |-- go.mod
        |-- *.go
```

#### Quickstart Setup

> Initialize a new working go package (project)

- Create a new go project workspace root directory (aka a new 'go package')
    ```bash
    mkdir -pv /path/to/project-root-directory
    cd /path/to/project-root-directory
    ```

- Initialize git version control system
    ```bash
    git init
    git config user.name [username]
    git config user.email [email]
    git checkout -b main
    git remote add origin [remote-repository-server-url]
    ```

- Initialize a new 'go.mod' (go module definition file) for the package
    - Explanation
        + This file defines the project's module repository and all external dependencies required by the project
    ```bash
    go mod init project-root-directory-name
    go mod tidy
    ```

- (Optional) Generate a template main.go entry point source file
    ```bash
cat <<EOF >> main.go
// Declare the 'main' special package
package main

// Import dependencies (libraries/packages/modules)
import (
    "fmt"
    "os"

    // To import a package with an alias name
    variable_alias "package/module/your-library-here"

    // To import a package from a git remote repository server (i.e. github)
    variable_alias "github.com/repo-author/repo-name"
)

// Define the main entry point function
func main() {
    fmt.Println("Hello World")
}
EOF
    ```

> Adding/Creating new local modules to the package

- Create a new module within the package
    ```bash
    cd /path/to/project-root-directory
    mkdir -pv ./path/to/module/name
    cd ./path/to/module/name
    go mod init project-root-directory-name/module-name
    go mod tidy
    ```

- Map the new module within the package to the local relative path containing the module you created
    ```bash
    cd /path/to/project-root-directory
    echo -e "replace project-root-directory-name/module-name => ./path/to/module/name" >> go.mod
    go mod tidy
    ```

> Adding/"Get"ting new external remote packages

- Get/pull/download the specified package from the remote repository server to the project local scope
    ```bash
    cd /path/to/target/directory/go.mod
    go get remote-repository-server-url
    go mod tidy
    ```

> Adding/Creating new local modules to another module within the package

- Create a new module within the package
    ```bash
    cd /path/to/project-root-directory
    mkdir -pv ./path/to/module/name
    cd ./path/to/module/name
    go mod init project-root-directory-name/module-name
    go mod tidy
    ```

- Create an indirect Map/Link of the module `[package-name]/[module-name]` into your project root directory's go.mod file
    ```bash
    cd /path/to/target/module/go.mod
    echo -e "replace project-root-directory-name/module-name => ./path/to/entry-point-module" >> go.mod
    go mod tidy
    ```

#### Snippets and examples

> Project workspace is named 'package'

- Information and Properties
    + Project workspace directory: package
    + Package Name: package
    + Entry Point: ./main.go
    - Modules
        + New Module: ./modules/new_module

- Steps
    - Setup go package
        ```bash
        mkdir -pv package/
        cd package/
        go mod init package
        go mod tidy
        cat <<EOF >> main.go
        // Declare the 'main' special package
        package main

        // Import dependencies (libraries/packages/modules)
        import (
            "fmt"
            "os"

            // To import a package with an alias name
            variable_alias "package/module/your-library-here"

            // To import a package from a git remote repository server (i.e. github)
            variable_alias "github.com/repo-author/repo-name"
        )

        // Define the main entry point function
        func main() {
            fmt.Println("Hello World")
        }
        EOF
        ```
    - Setup subdirector(ies) for the modules in the package
        ```bash
        mkdir -pv modules/new_module
        cd modules/new_module
        go mod init package/new_module
        go mod tidy
        ```
    - Map the module namespace to the module directory's path in the project workspace
        ```bash
        cd ../..
        echo -e "replace package/new_module => ./modules/new_module" >> go.mod
        go mod tidy
        ```
    - Build/Compile the binary/executable
        ```bash
        go build -o dist/bin/output .
        ```
    - Run the package
        ```bash
        go run .
        ```

### Project workspace structure/layout setup - main.go in module subdirectory

#### Project Layout

```bash
[project-root-directory]/
|
|-- README.md
|-- go.mod
|
|-- [entry-point-module]/
    |-- go.mod
    |-- main.go
|
|-- [module-name]/
    |
    |-- go.mod
    |-- *.go
    |
    |-- [submodule-name]/
        |
        |-- go.mod
        |-- *.go
```

#### Quickstart Setup

> Initialize a new working go project workspace (aka a new 'go package')

- Create a new go project workspace root directory (aka a new 'go package')
    ```bash
    mkdir -pv /path/to/project-root-directory
    cd /path/to/project-root-directory
    ```

- Initialize git version control system
    ```bash
    git init
    git config user.name [username]
    git config user.email [email]
    git checkout -b main
    git remote add origin [remote-repository-server-url]
    ```

- Initialize a new 'go.mod' (go module definition file) for the package
    ```bash
    go mod init project-root-directory-name
    go mod tidy
    ```

- Create a new module directory for the 'main.go' entry point source codes
    ```bash
    mkdir -pv ./path/to/entry-point-module/
    cd ./path/to/entry-point-module/
    go mod init project-root-directory-name/entry-point-module
    go mod tidy
    ```

- (Optional) Generate a template main.go entry point source file
    ```bash
cat <<EOF >> main.go
// Declare the 'main' special package
package main

// Import dependencies (libraries/packages/modules)
import (
    "fmt"
    "os"

    // To import a package with an alias name
    variable_alias "package/module/your-library-here"

    // To import a package from a git remote repository server (i.e. github)
    variable_alias "github.com/repo-author/repo-name"
)

// Define the main entry point function
func main() {
    fmt.Println("Hello World")
}
EOF
    ```

- Map the new (entry point) module within the package to the local relative path containing the module you created
    ```bash
    cd /path/to/project-root-directory
    echo -e "replace project-root-directory-name/entry-point-module => ./path/to/entry-point-module" >> go.mod
    go mod tidy
    ```

> Adding/Creating new local modules to the package

- Create a new module within the package
    ```bash
    cd /path/to/project-root-directory
    mkdir -pv ./path/to/module/name
    cd ./path/to/module/name
    go mod init project-root-directory-name/module-name
    go mod tidy
    ```

- Create an indirect Map/Link of the module `[package-name]/[module-name]` into your project root directory's go.mod file
    ```bash
    cd /path/to/project-root-directory
    go get project-root-directory-name/module-name
    go mod tidy
    ```

> Adding/"Get"ting new external remote packages

- Get/pull/download the specified package from the remote repository server to the project local scope
    ```bash
    cd /path/to/target/directory/go.mod
    go get remote-repository-server-url
    go mod tidy
    ```

> Adding/Creating new local modules to another module within the package

- Create a new module within the package
    ```bash
    cd /path/to/project-root-directory
    mkdir -pv ./path/to/module/name
    cd ./path/to/module/name
    go mod init project-root-directory-name/module-name
    go mod tidy
    ```

- Create an indirect Map/Link of the module `[package-name]/[module-name]` into your project root directory's go.mod file
    ```bash
    cd /path/to/target/module/go.mod
    echo -e "replace project-root-directory-name/module-name => ./path/to/entry-point-module" >> go.mod
    go mod tidy
    ```

#### Snippets and examples

> Project workspace is named 'package'

- Information and Properties
    + Project workspace directory: package
    + Package Name: package
    - Modules
        + Entry Point: modules/main

- Steps
    - Setup go package
        ```bash
        mkdir -pv package/
        cd package/
        go mod init package
        go mod tidy
        ```
    - Setup module subdirectory for the main entry point source codes
        ```bash
        mkdir -pv modules/main
        cd modules/main
        go mod init package/main
        go mod tidy
        cat <<EOF >> main.go
        // Declare the 'main' special package
        package main

        // Import dependencies (libraries/packages/modules)
        import (
            "fmt"
            "os"

            // To import a package with an alias name
            variable_alias "package/module/your-library-here"

            // To import a package from a git remote repository server (i.e. github)
            variable_alias "github.com/repo-author/repo-name"
        )

        // Define the main entry point function
        func main() {
            fmt.Println("Hello World")
        }
        EOF
        ```
    - Map the main module to the module directory's path in the project workspace
        ```bash
        cd ../..
        echo -e "replace package/main => ./modules/main" >> go.mod
        go mod tidy
        ```
    - Build/Compile the binary/executable
        ```bash
        go build -o dist/bin/output modules/main/main.go
        ```
    - Run the package
        ```bash
        go run modules/main/main.go
        ```

### Operational Flow Chart/Diagram

- Initial project workspace setup
    ```
    - . --> Create Project (Package) Workspace Root Directory -- Change directory into package root --> [package root directory]
    - [package-root-directory] --> Initialize package go module definition file 'go.mod' using 'go mod init [package-root-directory-name]' --> Initialize main.go entry point source file
    ```

- Creating a new module
    ```
    - [package-root-directory] --> Create new module directory -- Change directory into new module directory --> [module directory]
    - [module-directory] --> Initialize golang module files (go.mod, *.go) -- Change directory back to package root directory --> [package-root-directory]
    - [package-root-directory] --> Edit 'go.mod' and append a new 'replace package-root-directory/[module-directory-name] => ./path/to/module/directory' --> Reload the go.mod file using 'go mod tidy'
    ```

## Package Management
- Built-in System Libraries
    + fmt
    + log
    + math/rand
    + os
    + os/exec
    + path/filepath
    + strings
    + syscall
    + time

- Defining a new package
    ```go
    package [package-name]
    ```

- Import all libraries/dependencies required
    ```go
    import (
        // To import Packages/modules/libraries
        "package/module"

        // To import a package with an alias name
        variable_alias "package/module/your-library-here"

        // To import a package from a git remote repository server (i.e. github)
        variable_alias "github.com/repo-author/repo-name"
    )
    ```

## Data Types
+ any : Generic dynamic-typed; use this to accept any data type
+ int : Short Integer (32-bit)
+ int64 : Long Integer (64-bit)
+ string : String/Text data; Array of characters
+ bool : Boolean (True/False); aka 'fork' in golang
+ `[]<data-type>` : Array/List of the data type specified
+ struct : Define and initialize a new structure object containing various attributes/properties describing a concept

## Keywords
+ `var` : Declare/define the existence of a new variable in the current scope; Also used to explicitly state the data type of the variable
+ `range` : Used in a for loop to iterate through a slice or a map object

## Operators
+ `:=` : Used to quick initialize a value without explicitly specifying a data type
+ `=`  : used to assign the value on the RHS (Right-hand Side) to the variable/object on the LHS (Left-Hand Side)

## Built-in System Functions
- Obtaining the number/count of elements in an array
    - Explanation
        + Using the 'len()' function, this returns the number of elements within a container object
    ```go
    len(obj)
    ```

## Variables
- Declare a constant
    ```go
    const var_name <data-type> = value
    ```

- To define/declare a variable (without initializing with values)
    ```go
    var var_name <data-type>
    ```

- To initialize a variable
    - Quick initialization (dynamic type definition)
        - Explanation
            + Use the `:=` operator to quick initialize a value without explicitly specifying a data type
        ```go
        var_name := value
        ```
    - Static type definition
        - Explanation
            + Use the `=` operator to initialize the variable with values
            + The `=` operator is used on all subsequent assignment of values post-initialization
        ```go
        var var_name <data-type> = value
        ```

- Declaring and initializing a variable (without data type)
    ```go
    var var_name = value
    ```

- Assign a value to a variable
    - Explanation
         + The `=` operator is used to assign the value on the RHS (Right-hand Side) to the variable/object on the LHS (Left-Hand Side)
    ```go
    var_name = value
    ```

## Syntax
- Switch-case
    ```go
    switch object {
    case "value1", "value2", ..., "valueN":
        // Statements here
    case default:
        // Default case here
    }
    ```

- Conditional Statements
    - If, else if, else
        ```go
        if <expression> {
            // Statement 1
        } else if <alternate-expression> {
            // Alternate Statement
        } else {
            // Default statement
        }
        ```

## Data Structures

### Index-based
- Introduction
    - Indexed-based containers are ordered data structures that are ordered by index number (aka 'row number') and each index represents a memory address which the value will be stored in within the memory
        + Golang is 0-based, this means that the first element in an array starts from index '0'
    - In golang, key-value mappings are known as 'array', 'arraylist' or 'list'
        + Alternative names includes ArrayList, Ordered Lists or Lists

- Initialize an array of a static size
    - Explanation
        + The `n` represents the static number of elements/data this array container can hold
    ```go
    var argv [n]<your-data-type>
    ```

- Initialize an array of a dynamic size (i.e. ArrayList/List)
    ```go
    var argv []<your-data-type>
    ```

- Obtaining the size of an array/arraylist
    - Explanation
        + Use the `len(array-object)` built-in function to obtain the size/length of an array data structure object
    ```go
    var argc int = len(argv)
    ```

- Obtaining an element from an array/list via index
    ```go
    var var_name <datatype> = argv[index]
    ```

- Array Slicing
    - Explanation
        + Similar to python, array/lists can be "sliced" in-line to filter and obtain a new list with elements based on the sliced indices
        - To slice an array, use the `arr[start-index:end-index]` syntax
            + `start-index` refers to the starting position you wish to cut/slice/splice the source array from, if the starting index is not specified - the array will slice starting from 0 (the first element)
            + `end-index` refers to the ending/final position you wish to cut/slice/split to, if the ending index is not specified - the array will slice starting from the starting index all the way to the final element (len(arr)-1)
    ```go
    var new_arr []<datatype> = arr[start-index:end-index]
    ```

- Expanding/Passing an array(list) directly into a function's remaining parameters/arguments
    ```go
    func_name(argv...)
    ```

### Key-Value Mappings
- Introduction
    - Key-Value Mapping containers are unordered data structures that map a "key" of a certain data type to values of another data type
        + Essentially, as the name suggests, its like associating a key "identifier" to a value which can be referred/called/retrieved by its "key" name
    - In golang, key-value mappings are known as 'map'
        + Alternative names for key-value mappings are Dictionary, Associative Array, HashMap

- Initializing a key-value mapping
    ```go
    var new_map map[<key-type>]<value-type> { "key" : "value" };
    ```

- Initializing a key-value mapping with a value of `any` data type
    ```go
    var new_map map[string]any { "key" : value };
    ```

- Quick assigning a new map object
    ```go
    new_map := map[<key-type>]<value-type> { "key" : "value" };
    ```

- Obtaining the size of a key-value mapping
    - Explanation
        + Use the `len(map-object)` built-in function to obtain the size/length of an iterable data structure object
    ```go
    var argc int = len(new_map)
    ```

- Accessing/Retrieving a value corresponding to a key
    ```go
    var key <key-type> = "key"
    var value <value-type> = ""

    var new_map map[<key-type>]<value-type> { "key" : "value" };

    value = new_map[key]
    ```

### Structure (aka 'struct')
- Information
    + structure is essentially a container object mapped with various attributes/properties describing a concept

- Synopsis/Syntax
    - Define/Initialize a new struct object
        ```go
        var struct_name struct {
            // [attribute|property-name] [data-type]
        }
        ```

- Accessing a struct property/attribute (aka variable)
    ```go
    struct_name.[property|attribute|variable]
    ```

## Conditions

### If-else-if-else condition

```go
if ( [expression] ) {
    // Primary action
} else if [expression] {
    // Alternative action
} else {
    // Default
}
```

### In-line if-condition check

- Syntax/General in-line if condition
    - Explanation
        - This is equivalent to
            ```go
            return_value := expression|function
            if [condition] {
                // ...
            }
            ```
    ```go
    if [return_value := expression]; [condition] {
        // Condition is met
    } else {
        // Condition is not met
    }
    ```

- Check if a key exists in a key-value mapping (i.e. Dictionary, HashMap, map, Associative Array)
    - Explanation
        - `if value, is_found := map_object["your-key"]; is_found { ... }` : This line essentially means 'try to retrieve the value corresponding to the key, if it is found, proceed
            - This is equivalent to
                ```go
                value, is_found := map_object["your-key"]
                if is_found {
                    // ...
                }
                ```
    ```go
    var map_object map[<key-type>]<value-type> { "key" : "value" }

    if value, is_found := map_object["your-key"]; is_found {
        // Key exists/is found
        fmt.Println("your-key : ", value)
    }
    ```

### Switch case

```go
switch [variable] {
    case "case-value":
       // Statements
    case "multiple", "value", "case":
       // Statements
    default:
       // Default value here
}
```

### String Formatting

- Printing to standard output
    ```go
    print("your message")
    ```

- Using 'fmt' built-in Standard Library
    - Explanation
        + In golang, there is the 'fmt' (aka "Format") standard library that provided String-formatted functionalities
        + Similar to 'String.format()' or 'printf()'
    - Import the standard library
        ```go
        import "fmt"
        ```
    - Print a message newline to the standard output
        ```go
        fmt.Println("string", var);
        ```
    - Print a formatted string on the same line to the standard output (basically just printf)
        ```go
        fmt.Printf("%s", value);
        ```
    - Format a string with values and return the formatted string
        ```go
        var str_fmt string = fmt.Sprintf("%s", value);
        ```

## Iterations
### For-loop
- Arrays/Indexed-based for loop using 'range'
    ```go
    for i, arg := range [your-list-object] {
        // Statements
    }
    ```

- Iterate through an array/list (Index-based data structure/container) using an index counter
    - Synopsis/Syntax
        - Explanation
            + initializer : This contains the statement/expression to initialize a value for the for loop to start with; Generally `i:=0` is used
            + condition   : This contains the exit/break condition where the loop will iterate until this condition is met
            + increment   : This contains the incrementation expression per loop; i.e. `i++` will increment the index by 1 until the exit condition is met
        ```go
        for [initializer]; [condition]; [increment] {
            // Statement
        }
        ```
    - Examples
        - For loop for 5 counts
            ```go
            for i:=0; i < 5; i++ {
                // Get the current argument
                var curr_arg <data-type> = argv[i];

                // Print out the current argument
                fmt.Println("Current Argument", i, ": ", curr_arg);
            }
            ```

- Iterate an entire iterable container data structure using its size/length
    - Array/List
        ```go
        var arr []<data-type> { ... }

        for i:=0; i < len(arr); i++ {
            // Get current element
            var curr_element <data-type> = arr[i]
        }
        ```

- Key-Value Mappings (i.e. Dictionary, mappings, hashmap, associative array)
    ```go
    for k, v := range [your-key-value-mapping] {
        // Statements
    }
    ```

- Iterate through a map (Key-Value mapping data structure/container)
    - Synopsis/Syntax
        - Explanation
            - Use the `range` keyword to iterate through a slice or a map object
                - When ranging over a slice, 2 values are returned for each iteration
                    1. The index (key)
                    2. A copy of the element at that index (value)
        ```go
        for k,v := range map_object {
            // Statement
            fmt.Println(k, ":", v)
        }
        ```

### While loop

- Explanation
    + In golang, the 'for' loop keyword is also used as the while loop

- Initialize variables
    - index counter for iterating through
        - Quick initialization
            ```go
            i := 0
            ```
        - Static type definition
            ```go
            var i int = 0
            ```
    - Size of the array/list
        - Quick initialization
            ```go
            argc := len(argv)
            ```
        - Static type definition
            ```go
            var argc int = len(argv)
            ```

- Iterate through an array/list (Index-based data structure/container) until there are no elements remaining
    ```go
    for i < argc {
        // Get the current argument
        var curr_arg <data-type> = argv[i];

        // Print out the current argument
        fmt.Println("Current Argument", i, ": ", curr_arg);
    }
    ```

## Functions
- Defining a new function block
    - Explanation
        - Use the 'func' keyword to define and declare a new function block following the syntax: 
             + `func func_name(parameter_signature/header) { }`
    ```go
    func func_name(param_header_signature <data-type>, ...) (<return-types>, ...) {
        // Statements

        // Return/Output
        return val1, val2, ...
    }
    ```

- Defining a function block with void return (no returns)
    ```go
    func func_name(param_header_signature <datatype>) {
        // Statements
    }
    ```

- Defining a function block with only 1 return type/value
    ```go
    func func_name(param_header_signature <datatype>) return-type {
        // Statements

        // Return/Output
        return val1
    }
    ```

- Variadic function: Defining a function block that takes in variable length arguments in the parameter header/signature
    - Explanation
        - Golang will create an elem (element) variable of type `[]<data-type>` (which is a dynamic array/arraylist) and 
            + all the values passed into the parameter arguments will be stored in an elem parameter of type 'slice'
    ```go
    func func_name(param_1 data-type, param_2 data-type, param_n ...data-type) (<return-types>, ...) {
        // Statements

        // Directly pass the variable length argument into the function call and "expand" it
        caller_func_name(param_n...)

        // Return/Output
        return val1, val2, ...
    }
    ```

- Invoking/Calling a function
    - Statically declare and return the return value
        ```go
        var return_objs <return-type> := func_name(arguments, ...)
        ```
    - Dynamically assign the return value
        ```go
        return_objs := func_name(arguments, ...)
        ```

## Command Line Arguments

### Introduction
- Getting all arguments from the system CLI argument parser
    - Explanation
        + Using the 'os' module, 'os.Args' contains all arguments parsed to the application in a list/array container for retrieval during runtime
        - Like `os.args` in rust or `sys.argv` in python,
            + `argv[0]` : will contain the executable/binary filepath
            + `argv[1]` : will contain the first argument value passed onwards
            + `argv[1:]` : will contain all subsequent argument value(s) passed by the user to the command
    ```go
    os.Args
    ```

- Iterating with the CLI Arguments list
    - Explanation
        - `if strings.HasPrefix(arg, "-<short-form>=")` : Check for a short form argument from the current argument
        - `if strings.HasPrefix(arg, "--<long-form>=")` : Check for a long form argument from the current argument
    - Using if condition check
        ```go
        for _, arg := range os.Args[1:] {
            if strings.HasPrefix(arg, "-<short-form>=") {
                container_object = append(container_object, strings.TrimPrefix(arg, "-<short-form>="))
            } else if strings.HasPrefix(arg, "--<long-form>=") {
                container_object = append(container_object, strings.TrimPrefix(arg, "--<long-form>="))
            } else {
                args = append(args, arg)
            }
        }
        ```
    - Using switch case
        ```go
        for _, arg := range os.Args[1:] {
            switch arg {
                case "-<short-form>=", "--<long-form>=":
                    // Statement
                default:
                    // Default case
            }
        }
        ```

### Methodologies
- Simple CLI Argument Parsing
    - Explanation
        + Similar to Python, there is a 'os' built-in to the standard library that provides Operating System functionalities, such as obtaining CLI argument parsing information piped into the executable/binary

    - Steps/Algorithm
        1. Obtain the CLI arguments parsed by the user to the executable/binary (aliased as 'argv')
            - Explanation
                - Like in other languages, the first element (`[0]`) contains the executable/binary name
                    + Python: `os.args[0]`
                    + Bash: `$0`
            ```go
            var exec string = os.Args[0]
            var argv []string = os.Args[1:]
            ```
        2. Obtain the size/length of the number of arguments provided (aliased as 'argc')
            ```go
            var argc int = len(argv)
            ```
        3. Check if there are any CLI arguments provided
            ```go
            if (argc > 0) {
                 // Statements
            }
            ```
            1. If there are arguments, Iterate through all the parsed CLI arguments until there are no arguments remaining and process them; For is golang's 'while loop'
                ```go
                for i < argc {
                    // Statements here
                }
                ```
                2. Obtain the current argument
                    ```go
                    // Get the current argument
                    var curr_arg string = argv[i];
                    ```   
                3. Process the argument
                    - Notes
                        + You can use either an if-else condition block or a switch case
                        + If the CLI argument has a value, Reduce the index by 1
                    ```go
                    switch curr_arg {
                        case "-h", "--help":
                            fmt.Println("Display Help Message")
                        case "-v", "--version":
                            fmt.Println("Display Version Information")
                        case "-V", "--verbose":
                            // Enable verbose output
                            fmt.Println("Enable Verbose Output")
                        case "--set-X": // Setter parameter/argument
                            // Check if arguments are provided
                            if i < argc-1 {
                                // Arguments are provided
                                var next_i int = i+1
                                tmp_val := argv[next_i]

                                // Data Validation: Null Value and Valid Value Check
                                if tmp_val != "" {
                                    // Statement/commands here

                                    // Increment the index counter by 1 to jump to the next argument
                                    i += 1
                                } else {
                                    fmt.Println("Parameter [", curr_arg, "]: Value not provided.")
                                }
                            } else {
                                fmt.Println("Parameter [", curr_arg, "]: Insufficient values provided.")
                            }
                        default:
                            fmt.Println("Invalid optional argument, potentially positional: ", curr_arg)
                    }
                    ```
                4. Increment the index by 1 to go to the next argument
                    ```go
                    i += 1;
                    ```
            2. If there are no arguments
                ```go
                fmt.Println("No arguments provided.")
                ```
    ```go
    func main() {
        var exec string = os.Args[0]
        var argv []string = os.Args[1:]
        var argc int = len(argv)

        // Check if there are CLI arguments provided
        if (argc > 0) {
            var i int = 0
            // Iterate through all the parsed CLI arguments until there are no arguments remaining and process them; For is golang's 'while loop'
            for i < argc {
                // Get the current argument
                var curr_arg string = argv[i];

                // Print out the current argument index and value
                fmt.Println("Current Argument", i, ": ", curr_arg)

                // Process the argument
                switch curr_arg {
                    // If the CLI argument has a value, Reduce the index by 1
                    case "-h", "--help":
                        fmt.Println("Display Help Message")
                    case "-v", "--version":
                        fmt.Println("Display Version Information")
                    case "-V", "--verbose":
                        // Enable verbose output
                        fmt.Println("Enable Verbose Output")
                    case "--set-X": // Setter parameter/argument
                        // Check if arguments are provided
                        if i < argc-1 {
                            // Arguments are provided
                            var next_i int = i+1
                            tmp_val := argv[next_i]

                            // Data Validation: Null Value and Valid Value Check
                            if tmp_val != "" {
                                // Statement/commands here

                                // Increment the index counter by 1 to jump to the next argument
                                i += 1
                            } else {
                                fmt.Println("Parameter [", curr_arg, "]: Value not provided.")
                            }
                        } else {
                            fmt.Println("Parameter [", curr_arg, "]: Insufficient values provided.")
                        }
                    default:
                        fmt.Println("Invalid optional argument, potentially positional: ", curr_arg)
                }

                // Increment the index by 1 to go to the next argument
                i += 1;
            }
        } else {
            fmt.Println("(-) No arguments provided.")
        }
    }
    ```

- CLI argument parsing with '=' delimited
    - Explanation
        - The steps are similar to [CLI Argument Parsing from scratch](#cli-argument-parsing-from-scratch)
            - However, the differences includes
                - Additional steps to split the specified argument/parameter by the delimiter/separator (i.e. '=') such that it will separate into 2 components in a list/array
                    + The Key (Parameter/Argument Name; aka The Left-Hand Side (LHS)) and
                    + the Value (Parameter/Argument Value; aka The Right-Hand Side (RHS))

    - Steps/Algorithm
        - Initialize Variables
            - Explanation
                + `string delimiter` : Delimiter/Separator separating the variable key (LHS) from the variable value (RHS)
                + `string curr_arg_key` : To store the current argument's variable key/name (LHS)
                + `string curr_arg_value` : To store the current argument's variable value (RHS)
            ```go
            var delimiter string = "=" // Delimiter/Separator separating the variable key (LHS) from the variable value (RHS)
            var curr_arg_key string    // To store the current argument's variable key/name (LHS)
            var curr_arg_value string  // To store the current argument's variable value (RHS)
            ```
        1. Obtain the CLI arguments parsed by the user to the executable/binary (aliased as 'argv')
            - Explanation
                - Like in other languages, the first element (`[0]`) contains the executable/binary name
                    + Python: `os.args[0]`
                    + Bash: `$0`
            ```go
            var exec string = os.Args[0]
            var argv []string = os.Args[1:]
            ```
        2. Obtain the size/length of the number of arguments provided (aliased as 'argc')
            ```go
            var argc int = len(argv)
            ```
        3. Check if there are any CLI arguments provided
            ```go
            if (argc > 0) {
                 // Statements
            }
            ```
            1. If there are arguments, Iterate through all the parsed CLI arguments until there are no arguments remaining and process them; For is golang's 'while loop'
                ```go
                for i < argc {
                    // Statements here
                }
                ```
                2. Obtain the current argument
                    ```go
                    // Get the current argument
                    var curr_arg_tmp string = argv[i];
                    ```
                3. Split the obtained argument string into a list by the delimiter/separator, consisting of 2 elements - The argument/parameter key (aka 'name'; Left-Hand Side) and the argument/parameter value (Right-Hand Side)
                    ```go
                    var curr_arg_split []string = strings.Split(curr_arg_tmp, delimiter)
                    ```
                4. Check if there is a '=' delimiter (Split the string to `['variable-key-name', 'variable-value']`)
                    ```go
                    // Check if there is a split (means '=' exists)
                    if len(curr_arg_split) > 1 {
                        // There is a split
                        curr_arg_key = curr_arg_split[0]
                        curr_arg_value = curr_arg_split[1]
                    } else {
                        curr_arg_key = curr_arg_split[0]
                    }
                    ```
                5. Process the argument key
                    - Notes
                        + You can use either an if-else condition block or a switch case
                        + If the CLI argument has a value, Reduce the index by 1
                    ```go
                    switch curr_arg_key {
                        case "-h", "--help":
                            fmt.Println("Display Help Message")
                        case "-v", "--version":
                            fmt.Println("Display Version Information")
                        case "-V", "--verbose":
                            // Enable verbose output
                            fmt.Println("Enable Verbose Output")
                        case "--set-X": // Setter parameter/argument
                            // Check if the split contains a value
                            if curr_arg_value == "" {
                                // The split had no 'LHS=RHS' value
                                // Check if arguments are provided
                                if i < argc-1 {
                                    // Arguments are provided
                                    var next_i int = i+1
                                    tmp_val := argv[next_i]

                                    // Data Validation: Null Value and Valid Value Check
                                    if tmp_val != "" {
                                        // Statement/commands here

                                        // Increment the index counter by 1 to jump to the next argument
                                        i += 1
                                    } else {
                                        fmt.Println("Parameter [", curr_arg_key, "]: Value not provided.")
                                    }
                                } else {
                                    fmt.Println("Parameter [", curr_arg_key, "]: Insufficient values provided.")
                                }
                            } else {
                                // Split had a 'LHS=RHS' value
                                // Statement/commands here
                                fmt.Println(curr_arg_key, ":", curr_arg_value)
                            }
                        default:
                            fmt.Println("Invalid optional argument, potentially positional: ", curr_arg_key)
                    }
                    ```
                6. Increment the index by 1 to go to the next argument
                    ```go
                    i += 1;
                    ```
            2. If there are no arguments
                ```go
                fmt.Println("No arguments provided.")
                ```
    ```go
    func main() {
        var exec string = os.Args[0]
        var argv []string = os.Args[1:]
        var argc int = len(argv)

        // Check if there are CLI arguments provided
        if (argc > 0) {
            var i int = 0
            // Iterate through all the parsed CLI arguments until there are no arguments remaining and process them; For is golang's 'while loop'
            for i < argc {
                // Get the current argument
                var curr_arg_tmp string = argv[i];

                // Initialize Variables
                var delimiter string = "=" // Delimiter/Separator separating the variable key (LHS) from the variable value (RHS)
                var curr_arg_key string    // To store the current argument's variable key/name (LHS)
                var curr_arg_value string  // To store the current argument's variable value (RHS)

                // Split the argument string by the '=' delimiter (Split the string to 'variable-key-name, delimiter, variable-value')
                var curr_arg_split []string = strings.Split(curr_arg_tmp, delimiter)

                // Check if there is a split (means '=' exists)
                if len(curr_arg_split) > 1 {
                    // There is a split
                    curr_arg_key = curr_arg_split[0]
                    curr_arg_value = curr_arg_split[1]
                } else {
                    curr_arg_key = curr_arg_split[0]
                }

                // Process the argument
                switch curr_arg_key {
                    // If the CLI argument has a value, Reduce the index by 1
                    case "-h", "--help":
                        fmt.Println("Display Help Message")
                    case "-v", "--version":
                        fmt.Println("Display Version Information")
                    case "-V", "--verbose":
                        // Enable verbose output
                        fmt.Println("Enable Verbose Output")
                    case "--set-X": // Setter parameter/argument
                        // Check if the split contains a value
                        if curr_arg_value == "" {
                            // The split had no 'LHS=RHS' value
                            // Check if arguments are provided
                            if i < argc-1 {
                                // Arguments are provided
                                var next_i int = i+1
                                tmp_val := argv[next_i]

                                // Data Validation: Null Value and Valid Value Check
                                if tmp_val != "" {
                                    // Statement/commands here

                                    // Increment the index counter by 1 to jump to the next argument
                                    i += 1
                                } else {
                                    fmt.Println("Parameter [", curr_arg_key, "]: Value not provided.")
                                }
                            } else {
                                fmt.Println("Parameter [", curr_arg_key, "]: Insufficient values provided.")
                            }
                        } else {
                            // Split had a 'LHS=RHS' value
                            // Statement/commands here
                            fmt.Println(curr_arg_key, ":", curr_arg_value)
                        }
                    default:
                        fmt.Println("Invalid optional argument, potentially positional: ", curr_arg_key)
                }

                // Increment the index by 1 to go to the next argument
                i += 1;
            }
        } else {
            fmt.Println("(-) No arguments provided.")
        }
    }
    ```

## Logging
- Log and print a fatal error to the stderr
    ```go
    log.Fatal("a command is required")
    ```

## Filesystem
- Creating new directories
    ```go
    os.MkdirAll(dir_path, permission_modifier)
    ```
- Read all file contents of a directory
    ```go
    files, err := os.ReadDir(dir_path)
    ```

## System Process Calls
### System Command Execution
- Using the 'os' module
    - Obtain the executable
        ```go
        path, err := os.Executable()
        ```
    - Create a 'Cmd' struct to execute the given command and arguments
        ```go
        cmd := exec.Command(commandName, commandArgs...)
        ```

### Subprocess and Pipes

> Introduction and Basics

- Packages/Libraries/Modules
    + bufio : Built-in standard library for Buffer (Virtual Memory address container) Input/Output functionality
    + io : Built-in Standard Library for I/O Stream handling functionalities (i.e. for Standard Input, Standard Output, Standard Error Pipes)
    + runtime : Built-in Standard Library for managing/handling Operating System/Platform information during the runtime of the executable/binary
    + os/exec : Module that is part of the Built-in Standard Library package 'os' for executing system command execution (aka syscall/subprocess)

> Standard Streams

- Standard Input

- Standard Output

- Standard Error

> Pipes

> Variables

- runtime
    - `.GOOS` : Use the `runtime.GOOS` variable/attribute/property to obtain the current Operating System/Platform the Go executable/binary is using during runtime
        - Notes
            + `GOOS` stands for 'Go Operating System'
        ```go
        var go_operating_system string = runtime.GOOS
        ```

> Functions

- os/exec
    - `.LookPath(command-string)` : Use the `exec.LookPath(command-string)` function to obtain the path of an executable/binary

        - Parameters
            - command-string : Specify the command/executable to search for
                + Type: string
        - Return
            - path : Return the obtained path of the executable/command
                + Type: String
            - err : Return any error object if an error is identified
                + Type: error
        ```go
        path, err := exec.LookPath(cmd_str)

        if err != nil {
            log.Fatal(err)
        }
        ```

> Usages

- Executing System Command (system call)
    - Initial Setup
        - Initialize Variables
            ```go
            var cmd_str string = "your-executable|command"
            var cmd_argv []string
            ```

    1. Format and generate a Command struct using the command string and the provided argument list
        ```go
        cmd := exec.Command(cmd_str, cmd_argv...)
        ```

    2. Execute the command and Obtain the output of the command at the end of the process (poll() has returned an exit status code)
        ```go
        cmd_out, err := cmd.Output()

        if err != nil {
            log.Fatal(err)
        }
        ```

    3. Convert the bytes list into string for usage
        ```go
        cmd_out_str := string(cmd_out[:])
        ```

    4. Data Sanitization: Trim all newlines from the Left and Right
        ```go
        cmd_out_str_sanitized := strings.Trim(cmd_out_str, "\n")
        ```

    5. Split the command line outputs by newline
        ```go
        cmd_out_split := strings.Split(cmd_out_str_sanitized, "\n")
        ```

    6. Iterate through the command output list and print each line out
        ```go
        for i:=0; i < len(cmd_out_split); i++ {
            // Get current command output byte
            var curr_byte string = cmd_out_split[i]

            fmt.Println(i, ":", curr_byte)
        }
        ```

- Executing System Command (system call) with Standard Stream redirection using pipes and buffers
    1. Initial Setup
        - Initialize Variables
            ```go
            var cmd_str string = "your-executable|command"
            var cmd_argv []string
            ```

        - Format and generate a Command struct using the command string and the provided argument list
            ```go
            cmd := exec.Command(cmd_str, cmd_argv...)
            ```

    2. Pipe and redirect to Standard Output
        1. Create a Standard Output Pipe (aka I/O Reader) object pointing to the standard output (stdout) data stream
            - Explanation
                - This will redirect the datastream to stdout when the command starts and
                    + Line by Line, each line of the standard output/error will be piped/redirected through the "piped" and stored into the buffer virtual memory container
                    + Essentially, this will allow the developer to control what should be done with each value/line obtained
            ```go
            stdout, err := cmd.StdoutPipe()

            if err != nil {
                fmt.Println(err)
            }
            ```
        2. Start the command to create a process handler and begin running the command
            ```go
            cmd.Start()
            ```
        3. Generate new scanner object to scan for Standard Output data stream via the Standard Output Pipe
            - Explanation
                - In golang, the Scanner object is essentially a 'searcher' put in place to 'monitor' the I/O Reader stream (i.e. stdout or stderr) and
                    + If any changes are detected (i.e. new text/lines)
                        + It will take the line, place it into the Scanner via a Split function for usage
            ```go
            // Initialize a new Scanner instance, Create a new Buffer Memory container for storing the standard error data stream piped out from the command, and start scanning for new data and storing into the buffer
            scanner_stdout := bufio.NewScanner(stdout)

            // Scan the buffer (containing the stderr data stream) for words/string values and set the split function using the obtained list of words as a scanner function
            scanner_stdout.Split(bufio.ScanWords)
            ```
        4. Start scanning the scanner and while there are still data within the data stream (the next token is not empty), continue
            ```go
            fmt.Println("Scanning for Standard Output:")
            i := 0
            for scanner_stdout.Scan() {
                // Get the current scanned text
                curr_scanned_Text := scanner_stdout.Text()

                // Print out the message
                fmt.Println("Current Text [", i, "]: ", curr_scanned_Text)
                stdout_str_arr = append(stdout_str_arr, fmt.Sprintf("%s ", curr_scanned_Text))

                // Increment counter
                i += 1
            }
            ```

    3. Pipe and redirect to Standard Error
        1. Create a Standard Error Pipe (aka I/O Reader) object pointing to the standard error (stderr) data stream
            - Explanation
                - This will redirect the datastream to stderr when the command starts and
                    + Line by Line, each line of the standard output/error will be piped/redirected through the "piped" and stored into the buffer virtual memory container
                    + Essentially, this will allow the developer to control what should be done with each value/line obtained
            ```go
            stderr, err := cmd.StderrPipe()

            if err != nil {
                fmt.Println(err)
            }
            ```
        2. Start the command to create a process handler and begin running the command
            ```go
            cmd.Start()
            ```
        3. Generate new scanner object to scan for Standard Error data stream via the Standard Error Pipe
            - Explanation
                - In golang, the Scanner object is essentially a 'searcher' put in place to 'monitor' the I/O Reader stream (i.e. stdout or stderr) and
                    + If any changes are detected (i.e. new text/lines)
                        + It will take the line, place it into the Scanner via a Split function for usage
            ```go
            // Initialize a new Scanner instance, Create a new Buffer Memory container for storing the standard error data stream piped out from the command, and start scanning for new data and storing into the buffer
            scanner_stderr := bufio.NewScanner(stderr)

            // Scan the buffer (containing the stderr data stream) for words/string values and set the split function using the obtained list of words as a scanner function
            scanner_stderr.Split(bufio.ScanWords)
            ```
        4. Start scanning the scanner and while there are still data within the data stream (the next token is not empty), continue
            ```go
            fmt.Println("Scanning for Standard Error:")
            for scanner_stderr.Scan() {
                // Get the current scanned text
                curr_scanned_Text := scanner_stderr.Text()

                // Print out the message
                fmt.Println("Current Text: ", curr_scanned_Text)
                stderr_str_arr = append(stderr_str_arr, fmt.Sprintf("%s ", curr_scanned_Text))
            }
            ```

    4. Wait for the command process, as well as any copying to and from the standard input, output and error data streams to end
        ```go
        cmd.Wait()
        ```

- Executing System Process using 'syscall'
    - Import packages
        ```go
        import (
            "os"
            "os/exec"
            "syscall"
            "log"
        )
        ```
    1. Look for the path to the target system command
        ```go
        binary_path, err := exec.LookPath("<your-command-executable>")
        if err != nil {
            log.Fatal(err)
        }
        ```
    2. Design command string and arguments
        ```go
        args := []string { "<your-command-executable>", "arguments", "here" }
        ```
    3. Obtain the System Environment
        ```go
        env := os.Environ()
        ```
    4. Execute system call
        ```go
        err := syscall.Exec(binary, args, env)
        if err != nil {
            log.Fatal(err)
        }
        ```

## Documentations

### go compiler

> Development Lifecycle

- Check your Go environment variables
    ```bash
    go env {go environment variable}
    ```

- Build/Compile the binary/executable
    ```bash
    go build -o dist/bin/output [path-to-main]
    ```

- Run the package
    ```bash
    go run [path-to-main] {arguments to parse}
    ```

- Install a go binary/executable
    - Local package/project workspace
        ```bash
        go install /path/to/[project|package]/root
        ```
    - Remote repository server package
        - GitHub
            ```bash
            go install github.com/repo-author/repo-name
            ```

## Snippets

### Algorithms

### CLI Argument Parsing from scratch

```go
// Declare the 'main' special package
package main

// Import dependencies (libraries/packages/modules)
import (
    "fmt"
    "os"
)

// Define the main entry point function
func main() {
    var exec string = os.Args[0]
    var argv []string = os.Args[1:]
    var argc int = len(argv)

    // Print out the executable/binary
    fmt.Println("Executable: ", exec)

    // Check if there are CLI arguments provided
    if (argc > 0) {
        var i int = 0
        // Iterate through all the parsed CLI arguments until there are no arguments remaining and process them; For is golang's 'while loop'
        for i < argc {
            // Get the current argument
            var curr_arg string = argv[i];

            // Print out the current argument index and value
            fmt.Println("Current Argument", i, ": ", curr_arg)

            // Process the argument
            switch curr_arg {
                // If the CLI argument has a value, Reduce the index by 1
                case "-h", "--help":
                    fmt.Println("Display Help Message")
                case "-v", "--version":
                    fmt.Println("Display Version Information")
                case "-V", "--verbose":
                    // Enable verbose output
                    fmt.Println("Enable Verbose Output")
                case "--set-X": // Setter parameter/argument
                    // Check if arguments are provided
                    if i < argc-1 {
                        // Arguments are provided
                        var next_i int = i+1
                        tmp_val := argv[next_i]

                        // Data Validation: Null Value and Valid Value Check
                        if tmp_val != "" {
                            // Statement/commands here

                            // Increment the index counter by 1 to jump to the next argument
                            i += 1
                        } else {
                            fmt.Println("Parameter [", curr_arg, "]: Value not provided.")
                        }
                    } else {
                        fmt.Println("Parameter [", curr_arg, "]: Insufficient values provided.")
                    }
                default:
                    fmt.Println("Invalid optional argument, potentially positional: ", curr_arg)
            }

            // Increment the index by 1 to go to the next argument
            i += 1;
        }
    } else {
        fmt.Println("(-) No arguments provided.")
    }
}
```

### CLI Argument Parsing with delimiter

```go
// Declare the 'main' special package
package main

// Import dependencies (libraries/packages/modules)
import (
    "fmt"
    "os"
)

// Define the main entry point function
func main() {
    var exec string = os.Args[0]
    var argv []string = os.Args[1:]
    var argc int = len(argv)

    // Print out the executable/binary
    fmt.Println("Executable: ", exec)

    // Check if there are CLI arguments provided
    if (argc > 0) {
        var i int = 0
        // Iterate through all the parsed CLI arguments until there are no arguments remaining and process them; For is golang's 'while loop'
        for i < argc {
            // Get the current argument
            var curr_arg_tmp string = argv[i];

            // Initialize Variables
            var delimiter string = "=" // Delimiter/Separator separating the variable key (LHS) from the variable value (RHS)
            var curr_arg_key string    // To store the current argument's variable key/name (LHS)
            var curr_arg_value string  // To store the current argument's variable value (RHS)

            // Split the argument string by the '=' delimiter (Split the string to 'variable-key-name, delimiter, variable-value')
            var curr_arg_split []string = strings.Split(curr_arg_tmp, delimiter)

            // Check if there is a split (means '=' exists)
            if len(curr_arg_split) > 1 {
                // There is a split
                curr_arg_key = curr_arg_split[0]
                curr_arg_value = curr_arg_split[1]
            } else {
                curr_arg_key = curr_arg_split[0]
            }

            // Process the argument
            switch curr_arg_key {
                // If the CLI argument has a value, Reduce the index by 1
                case "-h", "--help":
                    fmt.Println("Display Help Message")
                case "-v", "--version":
                    fmt.Println("Display Version Information")
                case "-V", "--verbose":
                    // Enable verbose output
                    fmt.Println("Enable Verbose Output")
                case "--set-X": // Setter parameter/argument
                    // Check if the split contains a value
                    if curr_arg_value == "" {
                        // The split had no 'LHS=RHS' value
                        // Check if arguments are provided
                        if i < argc-1 {
                            // Arguments are provided
                            var next_i int = i+1
                            tmp_val := argv[next_i]

                            // Data Validation: Null Value and Valid Value Check
                            if tmp_val != "" {
                                // Statement/commands here

                                // Increment the index counter by 1 to jump to the next argument
                                i += 1
                            } else {
                                fmt.Println("Parameter [", curr_arg_key, "]: Value not provided.")
                            }
                        } else {
                            fmt.Println("Parameter [", curr_arg_key, "]: Insufficient values provided.")
                        }
                    } else {
                        // Split had a 'LHS=RHS' value
                        // Statement/commands here
                        fmt.Println(curr_arg_key, ":", curr_arg_value)
                    }
                default:
                    fmt.Println("Invalid optional argument, potentially positional: ", curr_arg_key)
            }

            // Increment the index by 1 to go to the next argument
            i += 1;
        }
    } else {
        fmt.Println("(-) No arguments provided.")
    }
}
```

### System Command Execution (Synchronous)
```go
package main

import (
	"bufio" // Built-in standard library for Buffer (Virtual Memory address container) Input/Output functionality
	"fmt"
	"io"
	"log"
	"strings"
	"os/exec"
)

func ExecSysCall(cmd_str string, cmd_argv ...string) {
    /*
     * Execute System Command/Executables
     */

    // Format and generate a Command struct using the command string and the provided argument list
    cmd := exec.Command(cmd_str, cmd_argv...)

    // Execute and Obtain the output of the command at the end of the process (poll() has returned an exit status code)
    cmd_out, err := cmd.Output()

    if err != nil {
        log.Fatal(err)
    }

    fmt.Println("Command Successfully Executed")

    // Polymorphism: Convert the bytes list into string
    cmd_out_str := string(cmd_out[:])

    // Data Sanitization: Trim all newlines from the Left and Right
    cmd_out_str_sanitized := strings.Trim(cmd_out_str, "\n")

    // Split the command line outputs by newline
    cmd_out_split := strings.Split(cmd_out_str_sanitized, "\n")

    // Iterate through the command output list and print each line out
    for i:=0; i < len(cmd_out_split); i++ {
        // Get current command output byte
        var curr_byte string = cmd_out_split[i]

        fmt.Println(i, ":", curr_byte)
    }
}

func main() {
    // Execute System Command Execution
    syscallexec.ExecSysCall("command", "arguments", "here", ...)
}
```

### Generate new scanner instance and buffer container to store the data stream(s) obtained/stored by the scanner

```go
func GenerateNewScanner(std_data_stream_pipe io.Reader) (*bufio.Scanner) {
    /*
     * Generate new scanner instance and buffer container to store the data stream(s) obtained/stored by the scanner
     */
    // Initialize a new Scanner instance, Create a new Buffer Memory container for storing the standard output/error data stream piped out from the command, and start scanning for new data and storing into the buffer
    scanner := bufio.NewScanner(std_data_stream_pipe)

    // Scan the buffer (containing the stdout/stderr data stream) for words/string values and set the split function using the obtained list of words as a scanner function
    scanner.Split(bufio.ScanWords)

    // Return the scanner
    return scanner
}
```

### System Command Execution with Redirection via Pipes and Buffers

> Pipe to standard output

```go
package main

import (
	"bufio" // Built-in standard library for Buffer (Virtual Memory address container) Input/Output functionality
	"fmt"
	"io"
	"log"
	"strings"
	"os/exec"
)

func ExecSysCallRealtime(cmd_str string, cmd_argv ...string) {
    /*
     * Execute System Command/Executables with real time output
     */

    // Initialize Variables
    var stdout_str_arr []string // List of strings containing all standard output lines piped out

    // Format and generate a Command struct using the command string and the provided argument list
    cmd := exec.Command(cmd_str, cmd_argv...)

    // Create a pipe pointing to the standard output (stdout) data stream and
    // Redirect the data stream to stdout when the command starts
    stdout, err := cmd.StdoutPipe()

    if err != nil {
        fmt.Println(err)
    }

    // Start the command to create a process handler and begin running the command
    cmd.Start()

    /*
     * Scan for Standard Output data stream
     */
    // Initialize a new Scanner instance, Create a new Buffer Memory container for storing the standard error data stream piped out from the command, and start scanning for new data and storing into the buffer
    scanner_stdout := bufio.NewScanner(stdout)

    // Scan the buffer (containing the stderr data stream) for words/string values and set the split function using the obtained list of words as a scanner function
    scanner_stdout.Split(bufio.ScanWords)

    // Start scanning the scanner and while there are still data within the data stream (the next token is not empty), continue
    fmt.Println("Scanning for Standard Output:")
    i := 0
    for scanner_stdout.Scan() {
        // Get the current scanned text
        curr_scanned_Text := scanner_stdout.Text()

        // Print out the message
        fmt.Println("Current Text [", i, "]: ", curr_scanned_Text)
        stdout_str_arr = append(stdout_str_arr, fmt.Sprintf("%s ", curr_scanned_Text))

        // Increment counter
        i += 1
    }

    // Wait for the command process, as well as any copying to and from the standard input, output and error data streams to end
    cmd.Wait()

    fmt.Println("Standard Output: ", strings.Join(stdout_str_arr, ""))

    fmt.Println("Command Successfully Executed")
}

func main() {
    // Execute System Command Execution/Call but pipe/redirect the standard datastreams to buffer memory container for printing
    syscallexec.ExecSysCallRealtime("command", "arguments", "here", ...)
}
```

> Pipe to standard error

```go
package main

import (
	"bufio" // Built-in standard library for Buffer (Virtual Memory address container) Input/Output functionality
	"fmt"
	"io"
	"log"
	"strings"
	"os/exec"
)

func ExecSysCallRealtime(cmd_str string, cmd_argv ...string) {
    /*
     * Execute System Command/Executables with real time output
     */

    // Initialize Variables
    var stderr_str_arr []string // List of strings containing all standard error lines piped out

    // Format and generate a Command struct using the command string and the provided argument list
    cmd := exec.Command(cmd_str, cmd_argv...)

    // Create a pipe pointing to the standard error (stderr) data stream and
    // Redirect the data stream to stderr when the command starts
    stderr, err := cmd.StderrPipe()

    if err != nil {
        fmt.Println(err)
    }

    // Start the command to create a process handler and begin running the command
    cmd.Start()

    /*
     * Scan for Standard Error data stream
     */

    // Initialize a new Scanner instance, Create a new Buffer Memory container for storing the standard error data stream piped out from the command, and start scanning for new data and storing into the buffer
    scanner_stderr := bufio.NewScanner(stderr)

    // Scan the buffer (containing the stderr data stream) for words/string values and set the split function using the obtained list of words as a scanner function
    scanner_stderr.Split(bufio.ScanWords)

    // Start scanning the scanner and while there are still data within the data stream (the next token is not empty), continue
    fmt.Println("Scanning for Standard Error:")
    for scanner_stderr.Scan() {
        // Get the current scanned text
        curr_scanned_Text := scanner_stderr.Text()

        // Print out the message
        fmt.Println("Current Text: ", curr_scanned_Text)
        stderr_str_arr = append(stderr_str_arr, fmt.Sprintf("%s ", curr_scanned_Text))
    }

    // Wait for the command process, as well as any copying to and from the standard input, output and error data streams to end
    cmd.Wait()

    fmt.Println("Standard Error: ", strings.Join(stderr_str_arr, ""))

    fmt.Println("Command Successfully Executed")
}

func main() {
    // Execute System Command Execution/Call but pipe/redirect the standard datastreams to buffer memory container for printing
    syscallexec.ExecSysCallRealtime("command", "arguments", "here", ...)
}
```

## Wiki

### Terminologies
+ package: In golang, the package refers to the project workspace's root directory name
+ module: In golang, a module (or submodule) within a package refers to subdirector(ies) containing 1 or more `*.go` source files, all of which will provide functions, attributes/properties, variables and structures to the module namespace.

### Templates

- go.mod
    ```go
    // Declare the module namespace for this module subdirectory within the package
    module package-name/module-name

    // Define the golang version used
    go [version]

    // Map the required local module alias namespace (package-name/module-name) to the module's local subdirectory path
    replace [project-root-directory-name]/[module-name] => ./path/to/new/module

    // Define the external library/module/package required
    require github.com/repo-author/repo-name
    ```

- *.go file
    - Notes
        + All go source files within the same module subdirectory should have the same module name
        + The starting alphabet/character of the function name has to be capitalized for go to export the function to be usable by another file
    ```go
    // Declare the module this *.go source file belongs to within the package
    package module-name

    // Import dependencies (libraries/packages/modules)
    import (
        "fmt"
        "os"

        // To import a package with an alias name
        variable_alias "package/module/your-library-here"

        // To import a package from a git remote repository server (i.e. github)
        variable_alias "github.com/repo-author/repo-name"
    )

    func YourFunctionHere() {
        // Statements
    }
    ```

## Resources
+ [go.dev - Packages - os/exec - example - Cmd.StdoutPipe](https://pkg.go.dev/os/exec#example-Cmd.StdoutPipe)

## References
+ [Algotree - Algorithms - Snippets - Go - Check if a key exists in a map. If it does, print its value](https://www.algotree.org/algorithms/snippets/go_check_if_key_exists_in_a_map/)
+ [GeeksForGeeks - Golang - Program that uses function with variable argument list (variable-length arguments/variadic function](https://www.geeksforgeeks.org/golang-program-that-uses-func-with-variable-argument-list/)
+ [GeeksForGeeks - Golang - Switch with multiple case values](https://www.geeksforgeeks.org/golang-program-that-uses-switch-multiple-value-cases/)
+ [Go By Example - Executing Processes (using syscall)](https://gobyexample.com/execing-processes)
+ [go.dev - Wiki - GOPATH](https://go.dev/wiki/GOPATH)
+ [Stackoverflow - Questions - 8018719 - Iterating through a golang map](https://stackoverflow.com/questions/8018719/iterating-through-a-golang-map)
+ [Stackoverflow - Questions - 37091316 - How to get the realtime output for a shell command in golang](https://stackoverflow.com/questions/37091316/how-to-get-the-realtime-output-for-a-shell-command-in-golang)
+ [tutorialsedge - Golang - Executing system commands with Golang](https://tutorialedge.net/golang/executing-system-commands-with-golang/)

## Remarks

