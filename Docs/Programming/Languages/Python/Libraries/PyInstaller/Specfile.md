# Python - PyInstaller - Spec File

## Table of Contents
+ [Information](#information)
+ [Documentation](#documentation)
+ [Wiki](#wiki)

## Information
### DESCRIPTION
```
The Spec file is the first file that PyInstaller will build to 
    + encode the Python script as well as
    + all the options you provide at the command prompt
    
PyInstaller will read the contents of the Spec file (.spec) to build/compile the executable
    + Defining all the files needed for the executable to run
    + As well as additional settings, additional data files, additional binary files etc.
```

### Files
+ *.spec : The Specifications (aka PyInstaller Configurations) file

### File Locations
- *.spec file : Stored in the current directory (Default)

## Setup
### Pre-Requisites
+ Bundle data files along with the executable
+ To Include runtime libraries like .dll file or .so files.
+ To bundle multiple programs using common libraries.

## Documentation

### Spec file
#### Compiling using Specfile
```console
{python -m} pyinstaller [spec_filename].spec
```

#### Importing
- Import module
    ```python
    import PyInstaller.[modules].[class]
    ```

- Import class
    ```python
    from PyInstaller.{modules} import [classes,]
    ```
    
#### Modules
+ PyInstaller.utils : PyInstaller Utilities module
    
#### Classes
- PyInstaller.utils.hooks : PyInstaller Hooks submodule/class
    
#### Functions
- PyInstaller.utils.hooks
    - collect_submodules : Handle collection of submodules
    - collect_data_files : Handle collection of data files of the submodules and directories
            
#### Usage 
          

          
### Commands
- pyi-makespec : Used to create the PyInstaller spec file
    - Creates a default spec file containing all the options that you specify at the command prompt

#### pyi-makespec
#### Synopsis/Syntax
- pyi-makespec
    ```console
    pyi-makespec {options} [python-files...]
    ```

#### Options
> pyi-makespec uses the same options as pyinstaller


## Wiki
### Specfile Configurations
- Analysis : To include the details, settings and files to include in the build/compilation process of the executable files
    - Parameters
        - Positionals
            - script_names : List of all scripts to compile into the executable
                + Type : List
        - Optionals
            - pathex : To include paths to search for imports
                + Type : List
            - binaries : To include any additional binary files to compile/build
                + Type : List
            - datas : To include any additional data files to compile/build
                + Type : List
            - hiddenimports : To include any additional modules (aka "hidden imports") that is not recognized by the script
                + Type : List
                + Trigger Option : --hidden-import | --hiddenimport
            - hookspath : To include any additional path to search for hooks
                + Type : List
                + Trigger Option : --additional-hooks-dir
            - runtime_hooks : To include paths to any custom runtime hook file (code that is executed before any other code or module to setup special features of the runtime environment)
                + Type : List
                + Trigger Option : --runtime-hook
            - excludes : To specify any modules to ignore
                + Type : List
                + Trigger Option : --exclude-module
            - win_no_prefer_redirects : 
                ```
                While searching for Shared or Private Assemblies to bundle into the application, 
                    Pyinstaller will prefer not to follow policies that redirects to newer versions and 
                    will try to bundle the exact versions of the assembly 
                ```
                + Type : Boolean
                + Trigger Option : --win-no-prefer-redirects
            - win_private_assemblies : Any Shared Assemblies bundled into the application will be changed into Private Assemblies
                ```
                The exact versions of these Assemblies will always be used, and any newer versions installed on user machines at the system level will be ignored
                ```
                + Type : Boolean
                + Trigger Option : --win-private-assemblies
            - cipher : Specify cipher type (for Encryption)
                + Type : object
                - Options
                    + block_cipher
            - noarchive : Instead of storing all frozen python source files as an archive inside the resulting executable, store them as files in the resulting output directory
                + Type : Boolean
                
- EXE : Defines the Executable specifications
    - Parameters
        - Positional
            + pyz
            + scripts
            + binaries
            + zipfiles
            + datas
            + []
        - Optionals
            - name
                + Type : String
            - debug
                + Type : Boolean
            - bootloader_ignore_signals
                + Type : Boolean
            - strip
                + Type : False
            - upx
                + Type : False
            - upx_exclude
                + Type : List
            - runtime_tmpdir
                + Type : String
            - console
                + Type : Boolean
 

## Resources
+ [Medium - swlh - Easy steps to create an executable in python using PyInstaller](https://medium.com/swlh/easy-steps-to-create-an-executable-in-python-using-pyinstaller-cc48393bcc64)

## References

## Remarks
