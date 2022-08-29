# Python Library - PyInstaller

```
Documentation, Guides and general tips n tricks for the Python Library - PyInstaller
```

## Table of Contents
* [Documentation](#documentation)
* [Pre-Requisites](#pre-requisites)
* [Setup](#setup)

## Information
### File Locations
- Folders
    - Working Directory
        - build/ : Contains your build files (like a cache) that you can reuse to re-build the project
            + .spec file can be found here
        + dist/ : Contains your bundled application that you distribute to your users

### Steps
- PyInstaller analyzes myscript.py and:
    + Writes myscript.spec in the same folder as the script.
    - Creates a folder 'build' in the same folder as the script if it does not exist.
        + Writes some log files and working files in the build folder.
    - Creates a folder 'dist' in the same folder as the script if it does not exist.
        + Writes the myscript executable folder in the dist folder. 

## Documentation
### Synopsis (Syntax)

- With Python
    ```console
    python -m pyinstaller {options} [specfile | script_names...]
    ```

- With script
    ```console
    pyinstaller {options} [script_names...]
    ```

- With Specfile
    ```console
    pyinstaller [spec-file]
    ```

### Parameters

#### Important

* -D | --onedir : Create a one-folder bundle containing an executable (default)
* -F | --onefile : Create a one-file bundled executable
* -n <NAME> | --name <NAME> : Name to assign to the bundled app and spec file (default: first script/main script's basename)
* --specpath <directory> : Folder to store the generated spec file (defaut: current directory)


#### Optionals

* -a | --ascii : Do not include unicode encoding support (default: included if available)
* -h | --help : Show help message
* -v | --version : Show program version
* -y | --noconfirm : Replace output directory (default: SPECPATH/dist/SPECNAME) without asking for confirmation
* --clean : Clean the PyInstaller cache and removes temporary files before building
* --distpath <directory> : Directory to put the bundled app (default : ./dist)
* --log-level <LEVEL> : Amount of detail in build-time console messages. (default: INFO)
	```
	- Level may be one of the following
		* TRACE
		* DEBUG
		* INFO
		* WARN
		* ERROR
		* CRITICAL
	```
* --workpath <directory> : Directory to put all temporary work files - i.e.  .log, .pyz etc. (default: ./build)
* --upx-dir <directory>	 : Path to UPX utility (default: search the execution path)

#### Generating
```
Compilation options
```
* -D | --onedir : Create a one-folder bundle containing an executable (default)
* -F | --onefile : Create a one-file bundled executable
    - When the '--onefile' option is specified
        + pyinstaller will unpack all the files to a TEMP directory
        + Executes the file
        + and later discards the TEMP folder
    - When 'add-data' option is added alongside '--onefile'
        - You need to read the data referred to in the TEMP folder
            - The path of the TEMP folder will dynamically change and
                + Creates a "_MEIxxxxxx-folder"
            - In python, to access the TEMP folder
                + sys._MEIPASS
                ```python
                import sys
                print(sys._MEIPASS)
                ```
            - To access the data
                + Access 'data' in the MEIPASS
                    ```python
                    import os
                    import sys
                    os.chdir(sys._MEIPASS)
                    data-Path = 'data\\data-file'
                    ```
* --specpath <directory> : Folder to store the generated spec file (defaut: current directory)
* -n <NAME> | --name <NAME> : Name to assign to the bundled app and spec file (default: first script/main script's basename)

#### Adding Data Files to be used
```
If you need to add some data files or binary files to be used by the executable
```
- --add-binary "source{;|:}destination" : To add binary file(s) to be bundled with the executable;
    + This option can be applied multiple times;
    + Equivalent to supplying the 'datas' argument with a list of tuples (tuple being the source and destination directories)
    - Please seperate each binary files with a
        + ';' delimiter if using Windows
        + ':' delimiter on most UNIX systems
- --add-data "source{;|:}destination" : To add data file(s) to be bundled with the executable; 
    + This option can be applied multiple times; 
    + Equivalent to supplying the 'datas' argument with a list of tuples (tuple being the source and destination directories)
    - Please seperate each data files with a 
        + ';' delimiter if using Windows
        + ':' delimiter on most UNIX systems
- -p [directory] | --paths [directory] : A path to search for imports (similar to PYTHONPATH)
    + Multiple paths are allowed
    + Equivalent to supplying the 'pathex' argument in the specfile
    - Seperate each directory by ':'
        + Or use this option multiple times

#### Hidden Imports
```
The executable needs all the imports required for the python script to work.
Pyinstaller may fail to identify dynamic imports and/or second-level imports in the python script
    - in which case, you will get an error : "ImportError: No module found"

Solution: Include the missing import library to the "hidden-import" list
```
- --hidden-import "module-name" | --hiddenimport "module-name" : To include a module explicitly into the imports list that is not visible in the code of the scripts
    + You can include this multiple times
        

        
### Usage

- Basic Compilation
    ```console
    python -m pyinstaller --onefile main.py
    ```

- Including an hidden import in the compilation
    ```console
    python -m pyinstaller --onefile --hidden-import "your_module" main.py
    ```
    
- Compilation with additional data and hidden imports
    ```console
    python -m pyinstaller --onefile --add-data "/path/to/data;data" --hidden-import "your_module" main.py
    ```

## Wiki

    
## Resources
+ [PyInstaller Docs](https://pyinstaller.org/en/stable/usage.html)

