# Documentation - Gentoo : Patching

Documentation, Guides and ToDo List for Gentoo's Source Code system - Patching

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Resources](#resources)
- [References](#references)
- [Remarks](#remarks)

## Information
- ebuild directory
    + Using portageq
        ```console
        $(portageq get_repo_path / gentoo)/[repo_group]/[package-name]
        ```
    + General path : /var/db/repos/gentoo/[repo_group]/[package-name]

## Setup
- Create required directories
    + /etc/portage/patches : To store all your patches

- Create package directories (that you want to patch)
    + /etc/portage/patches/[author-name]/[package-name-and-version]
   
- Store/add your .patch/.diff patch files into the package directory
    + /etc/portage/patches/[author-name]/[package-name-and-version]/[patch-file.patch | patch-file.diff]
   
## Documentation

### Guides

- To create patches (Simple)
    ```sh
    diff -u [old_file] [new_file] > patch-file.{patch|dif}
    ```

### Synopsis/Syntax

- Using ebuild : ebuild [package-name].ebuild {options/actions}  

### Parameters

- Options
    + clean : Clean and remove temporary pre-compiled files
    + prepare : Test install the patch and check

### Usage

- For testing the ebuild
    + Change directory into the ebuild folder
        ```console
        cd $(portageq get_repo_path / gentoo)/[repo-group]/[repo-name]
        ```
    + Test build the patch
        ```console
        ebuild [package-name].ebuild clean prepare
        
        # > You should see the message "User patches applied"
        ```
    + Re-emerge the package
        ```console
        emerge --ask [package-name]
        ```
    
### Notes
- After merging the patch to the ebuild repository
    + Please do not forget to remove the patch from the /etc/portage/patches directory
    + Otherwise, the next compilation might fail

## Resources

## References

## Remarks
