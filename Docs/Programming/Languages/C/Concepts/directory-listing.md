# C Programming - Directory Listing and Path Traversal/Crawling

## Information
### Basics

### Important Components
+ File stat
+ DIR struct type pointer
+ dirent struct type entry pointer

## Documentations
### Table of Contents
#### Libraries
+ stdio.h
+ stdlib.h
+ string.h
+ dirent.h
+ sys/stat.h
+ unistd.h
#### Types
- DIR : Directory pointer
#### Functions
- dirent.h
    + [opendir(path)](#opendir(path))
    + [readdir(target_directory)](#readdir(target_directory))
    + [closedir(opened_directory)](#closedir(opened_directory))
- sys/stat.h
    + stat(file, &buffer) : Get file attributes from the specified file and place them in the buffer (temporary storage in memory)
    + S_ISDIR(mode) : Check if the entry's stat/mode is a directory
#### Attributes
- stat
    + st_mode : Get the mode/type of the entry

### opendir(path)
#### Introduction
- Opens a provided directory/path

- Usage Flow
    1. Initialize pointer variable
    2. Attempt to open the specified directory/path
        - Check if the path is accessible

#### Setup
- Library
    + sys/stat.h : Directory/file statistics library

- Import
    ```c
    #include <sys/stat.h>
    ```

#### Synopsis/Syntax
- Explanation
    - opendir() will attempt to open the specified directory/path and 
        - if successful,
            + Return a pointer pointing to the memory address containing the directory content tied to the DIR struct type
```c
DIR *dir = opendir(<target-path>);
```

#### Usage Flow
- Initialize a DIR type structure pointer variable
    ```c
    DIR *dir;
    ```

- Attempt to open the specified directory/path
    ```c
    dir = opendir(path);
    ```

- Validation
    - Check if the path is accessible
        ```c
        if ((dir = opendir(path)) == NULL) {
            // Directory/Path does not exist/unable to open
            perror("opendir() error");

            // Exit/Return value
            return;
        }
        ```

#### Usage Examples


### readdir(target_directory)
#### Introduction
- Attempt to read the specified directory and 
    + if successful: it will return the entries in the directory

- Usage Flow
    1. Initialize pointer variable
    2. Read the entries/contents in a directory/path

#### Setup
- Library
    + sys/stat.h : Directory/file statistics library

- Import
    ```c
    #include <sys/stat.h>
    ```

#### Synopsis/Syntax
- Explanation
    - readdir() will attempt to read the specified directory/path and 
        - if successful,
            + Return a pointer of type 'struct dirent' containing the entries in the target directory/path
```c
struct dirent *entry = readdir(target_directory);
```

#### Usage Flow
- Initialize pointer variable of type 'struct dirent'
    ```c
    struct dirent *entry;
    ```

- Initialize stat struct variable for storing the file/directory statuses
    ```c
    struct stat fileStat;
    ```

- Attempt to read the entries in the specified directory/path
    ```c
    entry = readdir(dir);
    ```

- Attempt to read the entries in the specified directory/path and subdirectories
    ```c
    // Read the directories (and subdirectories) while there are still files and directories
    while ((entry = readdir(dir)) != NULL) {
        // More file reading statements here...
    }
    ```

- Additional checks you can do
    - Ignore the paths if its just the UNIX '.' and '..' files
        ```c
        if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0) {
            continue;
        }
        ```
    - Check if the file/directory is accessible
        ```c
        // Directory is inaccessible
        if (stat(entry->d_name, &fileStat) < 0 {
            perror("stat() error");
            continue;
        }
        ```
    - Check if the entry is a directory
        ```c
        if (S_ISDIR(fileStat.st_mode)) {
            // Is directory
            // Nest crawl into the new directory 'entry->d_name'
        }
        ```

### closedir(opened_directory)
#### Introduction
- Close the opened directry pointer after usage

- Usage Flow
    1. Close the directory pointer

#### Setup
- Library
    + sys/stat.h : Directory/file statistics library

- Import
    ```c
    #include <sys/stat.h>
    ```

#### Synopsis/Syntax
```c
closedir(DIR *dir);
```

#### Usage Flow
- Close the Directory pointer after usage
    ```c
    closedir(dir);
    ```

#### Usage Examples

## Wiki



## Resources

## References

## Remarks

