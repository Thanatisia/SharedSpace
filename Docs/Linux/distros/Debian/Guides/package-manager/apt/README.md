# apt - Aptitude: Debian's package manager

## Information

## Setup
### Dependencies
### Pre-Requisites
- Create apt directory '/etc/apt/keyrings'
    ```bash
    sudo mkdir -pv /etc/apt/keyrings
    ```

## Documentations
### Synopsis/Syntax
```bash
apt [actions] {options} <arguments> {package-list}
```

### Parameters
- Positionals
    - actions : Specify actions to execute to the packages
        - Actions
            + install : Install the specified packages
            + list : List all available packages
            + update : Update the package manager's local repository list
            + upgrade : Upgrade all installed packages; If packages are specified - those packages will be upgraded
    + package-list : Specify a list of all target packages

- Optionals

### Usage
- Update package manager's local repository list
    ```bash
    sudo apt update
    ```

- Upgrade all packages
    ```bash
    sudo apt upgrade
    ```

- Update and Upgrade
    ```bash
    sudo apt update && sudo apt upgrade
    ```

- Install packages
    ```bash
    sudo apt install [packages ...]
    ```

## Configurations
### Snippets
#### To add a remote repository server
1. Download the repository's gpg private key into '/etc/apt/keyrings' and dearmor it
    ```bash
    curl -fsSL [apt-remote-repository-server-URL]/gpg.key | sudo gpg -dearmor -o /etc/apt/keyrings/[repository-server-name].gpg
    ```

2. Write the remote repository server definitions into '/etc/apt/sources.list.d/[repository-server-name].list' file
    - Notes
        + This is equivalent to appending into the 'sources.list' file, so you can place there too
    ```bash
    echo "deb [signed-by=/etc/apt/keyrings/[repository-server-name].gpg] [apt-remote-repository-server-URL] * *" | sudo tee /etc/apt/sources.list.d/[repository-server-name].list
    ```

3. Update local repository list
    ```bash
    sudo apt update 
    ```

4. (Optional) Upgrade your packages
    ```bash
    sudo apt upgrade
    ```

### Templates
- apt repository server source definitions
    + File Naming Structure: [repository-server-name].list
    - Components
        - repository-type : Specify the type of repository this repository server contains
            - Types
                + deb : Contains binary packages
                + deb-src : Contains the source files which will be Built from Source
        - gpg-file-name : The gpg file you downloaded
            + Format: /etc/apt/keyrings/[repository-server-name].gpg
        - apt-remote-repository-server-URL : The apt remote repository server's URL
            + Format: `https://domain/apt/`
    - Contents
        ```
        [repository-type] [signed-by=[gpg-file-name]] [apt-remote-repository-server-URL] * *
        ```

## Wiki
### Filesystem Structure
- Root/
    - /etc/ : System miscelleneous folder (i.e. configuration files etc etc)
        - apt/ : apt package manager configuration and resources folder
            - keyrings/ : apt keyrings directory; Place all the keyrings for external remote repository servers here
                + [repository-server-name].gpg : Keyring private key file
            + sources.list : The apt package manager's main repository sources list file
            - sources.list.d/ : The apt package manager's repository sources list directory; Place all your remote repository server definition files here
                + [repository-server-name].list

### Terminologies
+ pgp : Pretty Good Privacy
+ gpg : GNU Privacy Guard; an Open Source implementation of PGP (the Pretty Good Privacy)
+ keyrings : Keyrings in apt are effectively secure public keys generated to authorize/authenticate you when attempting to connect to a maintainer's public/private remote apt repository server to install their packages. Keyrings comes in the form of a '*.gpg' file

## Resources
## References
## Remarks

