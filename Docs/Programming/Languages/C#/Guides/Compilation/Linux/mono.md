# C# Linux Compiler: Mono

## Information
### Background
```
Sponsored by Microsoft, Mono is a cross-platform, open source implementation of Microsoft's .NET Framework as part of the .NET Foundation and based on the ECMA standards for C# and the Common Language Runtime.
```

## Setup
### Dependencies

### Pre-Requisites
### Generate project filesystem structure
- Simple C# source code
    - Explanations
        + 'using [Library]' : Import the libraries/modules
        - `namespace Your_Project_NameSpace`       : Specify your project's namespace; Each namespace may contain multiple applications
            - `public class Your_Application_Name` : Specify your application's name in the namespace
                - `public static void Main(string[] args)` : This is your main function (aka runner/launcher function); This is where the compiler will look at first on compile-time to begin figuring out where, what and how to compile
                    + string[] args : This contains a string array of undefined size containing your Command Line Arguments for CLI argument parsing
    ```cs
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;

    namespace Your_Project_NameSpace
    {
        public class Your_Application_Name
        {
            public static void Main(string[] args)
            {
                Console.WriteLine("{0} args specified", args.Length);
            }
        }
    }
    ```

### Installation
- Using Package Managers
    - apt (Debian-based)
        + mono-complete
    - pacman (Arch-based)
        + mono

## Documentations
### Synopsis/Syntax
- To compile the source files
    ```console
    msc {options} [source-files ...]
    ```

- To execute the program
    ```console
    mono [executable-file]
    ```

### Parameters
- Positionals
    + source-files : Specify all the source files and libraries you wish to compile with; You can list as many as necessary
- Optionals
     - With Arguments
     - Flags

### Usage


### Operational Flow
- Compile the source files
    + Output: main.exe
    ```console
    msc {options} main.cs
    ```

- Execute the output program
    ```console
    mono main.exe
    ```

## Wiki

## Resources

## References
+ [codesdope - course - csharp introduction](https://www.codesdope.com/course/c-sharp-introduction/#:~:text=For%20Linux%2C%20you%20can%20write,NET%20framework.)
+ [mono project Docs - C#](https://www.mono-project.com/docs/about-mono/languages/csharp/)

## Remarks
