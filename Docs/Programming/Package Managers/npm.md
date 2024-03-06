# NodeJS package manager (npm) Documentations

## Information
- Node Package Manager

## Setup
### Dependencies
+ NodeJS

### Pre-Requisites

## Documentations
### Synopsis/Syntax
```console
npm [action] {options} <arguments>
```

### Parameters
- Actions
    - i | install : Install the specified package(s)
        - Information
            - npm will by default, install the packages to the local current working directory
                + Place the libraries and packages into the 'node_modules' folder
                + Place the binaries into the 'node_modules/bin' folder
            - If installing globally, npm will install to the AppData directory in the same subdirectories
        - Options
            - Flags
                + -D : Install additional dependencies linked to this package
                + -g | --global : Install the package(s) globally
    - ls : List all installed packages
        

### Usage
- List all installed packages
    ```console
    npm ls
    ```

- Install packages (only) locally
    ```console
    npm install [packages ...]
    ```

- Install packages locally including dependencies
    ```console
    npm install -D [packages ...]
    ```

- Install packages (only) globally
    ```console
    npm install -g [packages ...]
    ```

- Install packages globally including dependencies
    ```console
    npm install -D -g [packages ...]
    ```

## Wiki

## Resources

## References

## Resources

