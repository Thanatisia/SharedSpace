# C# - Compiling from Command Line

## Components
### Compiler
- Windows
    - Used by Visual Studio
        + msbuild.exe (Previously; Deprecated)
        + [csc.exe](Windows/csc.md)
    - dotnet
        + dotnet
        + roslyn
- Linux
    + mono
    + dotnet sdk

## Setup
### Dependencies

### Pre-Requisites and Preparation
#### Windows
- Ensure that the compiler is recognized by the system path
    - Add the compiler's path into the system path
        - Temporarily
            + Using the '%PATH%' environment variable
                ```batchdos
                PATH=%PATH%;[compiler-path]
                ```
        - Permenantly
            - Using the environment variable setting
                + Open 'System Properties'
                + Click on the 'Advanced' Tab
                + Click on the 'Environment Variables' button
                - Under 'System Variables'
                    + Select the row 'Path'
                    + Append your path into the table
                    + Save
                + Restart command line

- To locate a list of all the available C# compilers in your system
    + There may be more than one installed on your system
    + The compilers will be installed under the 'Microsoft.NET' folder inside the 'WINDOWS' folder (found in the '%WINDIR%' environment variable)
    + Select the compiler of choice
    ```batchdos
    dir /s %WINDIR%\csc.exe
    ```

### Generating project filesystem structure
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

## Compile steps
### Windows
#### Using the csc.exe compiler
- Useful Options
    + '/target:[output-file-type]' : Explicitly specify the targetted output file type to compile into
    + '/out:[output-file-name]' : Explicitly specify the output file name
    + '/nologo' : Remove logo

- Compile source into an executable
    - Information
        + This will compile your specified source files and output the executable binary in the folder
    - Compile
        ```cs
        csc.exe {options} [source-files ...]
        ```

- Compile using Response files (.rsp)
    - Information
        + Response files are used to set compiler options and directives, as well as to specify a set of source files to compile
        + Effectively, it is a build system/build configuration file you create and run directly instead of manually typing the csc options and files
    - Create a response file (.rsp) of any name
        + For example: hello.rsp
        ```
        {options}
        {options}
        ...
        [source-files] ...
        ```
    - Compile
        ```console
        csc @hello.rsp
        ```

### Linux
#### Using mono compiler

## Things to take note of

## Resources

## References
- Windows
    + https://tomasvera.com/programming/compiling-a-c-project-using-command-line-tools-tutorial
    + [MSDN - Command Line Building with csc.exe](http://msdn.microsoft.com/en-us/library/78f4aasd.aspx)
    + [MSDN - C# Compiler Options Listed by Category](http://msdn.microsoft.com/en-us/library/8a1fs1tb%28v=VS.71%29.aspx)
- Linux
    - 

## Remarks