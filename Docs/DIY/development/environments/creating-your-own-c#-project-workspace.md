# DIY - Creating your own C# project workspace/development environment from scratch

## Information

### Project Workspace Structure/Layout
- Typical layout
    - root/
        + README.md : Contains an introduction to your project
        + BUILD.md : Contains your build steps and instructions on how to compile/build from source
        + CHANGELOGS.md : Contains your changelogs
        + CONTRIBUTING.md : Contains your instructions to contributors on the rules and regulations to follow
        - src/ : This is the main source code directory containing all your source files
            - [project-namespace]/ : Replace 'project-namespace' with your Project's root namespace; This is where you will place all the source files that belongs to this name space

## Setup

### Dependencies
+ git

### Pre-Requisites
+ Please follow [dotnet setup guide](/Docs/Programming/Languages/C#/Guides/Compiler/dotnet/setup.md) for more information on how to install dotnet for your system

- Create your project workspace structure/layout
    - Create directories
        ```bash
        mkdir -pv [project-root-directory]/src/[project-namespace]
        ```
    - Create files
        ```bash
        touch [project-root-directory]/{README,BUILD,CHANGELOGS,CONTRIBUTING}.md
        ```

### Initialize a C# project workspace
- Using dotnet
    - Explanation
        - dotnet
            - Synopsis/Syntax
                ```bash
                dotnet new [project-type] {options} <arguments>
                ```
            - Parameters
                - Positionals
                    - project-type : Specify the type of project you want to create
                        + Type: String
                        - Project Types
                            + console : Create a new CLI/console C# application
                - Optionals
                    - With Arguments
                        - `--framework [dotnet-sdk-version]` : Specify the Dotnet framework and version you want to use to generate the project workspace for
                            - Framework Version examples
                                + net6.0 : Dotnet SDK 6.0
                                + net7.0 : Dotnet SDK 7.0
                                + net8.0 : Dotnet SDK 8.0
                    - Flags
                        + --use-program-main : Prevents top-level statements (a feature that lets you omit the 'Program' class and the 'Main' entry point method) from being used
            - Usage
                - Generate a new console project
                    ```bash
                    dotnet new console {options} <arguments>
                    ```
    - Generate a new project workspace usign a default project workspace template
        ```bash
        dotnet new console --framework net8.0 --use-program-main
        ```

### Post-Initialization setup


### Running the application
- Using dotnet
    - Explanation
        + dotnet will attempt to compile the project in your current working directory and then run the compile binary executable
    ```bash
    dotnet run
    ```

## Wiki
### Tutorials
+ [GitHub - dotnet/docs - core installation - tutorials - Create a .NET console application using Visual Studio Code](https://github.com/dotnet/docs/blob/main/docs/core/tutorials/with-visual-studio-code.md)

## Resources

## References 
+ [ArchWiki - .NET](https://wiki.archlinux.org/title/.NET)
+ [GitHub - dotnet/docs - core installation - debian](https://github.com/dotnet/docs/blob/main/docs/core/install/linux-debian.md)
+ [GitHub - dotnet/docs - core installation - debian post installation](https://github.com/dotnet/docs/blob/main/docs/core/install/includes/linux-install-80-apt.md)
+ [GitHub - dotnet/docs - core installation - linux scripted installation](https://github.com/dotnet/docs/blob/main/docs/core/install/linux-scripted-manual.md#scripted-install)
+ [GitHub - dotnet/docs - core installation - tutorials - Create a .NET console application using Visual Studio Code](https://github.com/dotnet/docs/blob/main/docs/core/tutorials/with-visual-studio-code.md)
+ [GitHub - dotnet/source-build - Build dotnet from source](https://github.com/dotnet/source-build)

## Remarks

