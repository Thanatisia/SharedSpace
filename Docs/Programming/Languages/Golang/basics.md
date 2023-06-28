# Golang

## Compiler
### Synopsis/Syntax

### Parameters

### Usage

## Setup

### Dependencies
+ golang

### Pre-Requisites

### Installing

## Documentation

### Compilation
- Build/compile go project into an executable/binary
    ```console
    go build
    ```

### Running
- Running go project without building
    ```console
    go run [main-source-file]
    ```

## Project workspace/syntax
### Structure
```
projects/
|
|-- [project-name]/
    |
    |-- main.go
    |-- modules/
        |
        |-- [module-name]/
            |
            |-- 
```

### Files
- main.go : This is the runner file that the compiler will look for when starting to build
    - In Golang, when you run 'go build', 
        + by default: go will build the executable with the name of the folder it is in, basically the package

## Basics
### Syntax
- To define data objects 
    - variable
        - Notes
            + Use the 'var' keyword to define that it is a variable, followed by defining the variable name and the type
        ```golang
        var [variable-name] [data-type] = "Value"
        ```
    - Multiple variables in a block
        - Notes
            + Golang can define multiple variables at the same time through a 'key-value'-like syntax
        ```golang
        var (
            // [variable-name] = value
        )
        ```
    - constants
        - Notes
            + Use the 'const' keyword to create a constant/immutable object that cannot be changed during runtime after compile time
        ```golang
        const [variable-name] [data-type] = "Value"
        ```
    - Dynamically-typed
        - Notes
            + Defining a variable with a literal; Data typing will be inferred based on the value provided
            + Use ':=' syntax
        ```golang
        [variable-name] := "Value"
        ```

- To create a function block
    - Notes
        + The opening brace/bracket has to be strictly by the side of the function definition
    ```go
    func [function_name](argument/parameter-signatures) {

    }
    ```


### Libraries
+ fmt : Format library; similar to C's stdio library, and Java's Scanner/IO etc

### Important functions
- fmt
    + fmt.Print("message") : To print out standard output
    + fmt.Scanf("%[formatting]", &input_variable) : To get user input and put the result into the input variable via reference


