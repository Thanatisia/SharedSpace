# README

<h6> Linux scripts </h6>

## Basic Information

* Authors: 

  * Asura

* Date Created: 2021-05-24 0057H, Asura

* Folder background:

  > This folder contains all linux scripts and/or other folders containing scripts
  
* Contents:

  > * Linux scripts
  
* Last Update/Modified:
  * 2021-05-24 0057H, Asura
  * 2021-05-24 0127H, Asura
  * 2021-05-24 0154H, Asura
  * 2021-05-24 0233H, Asura
  * 2021-05-25 0824H, Asura
  * 2021-05-29 2228H, Asura
  * 2021-05-30 1038H, Asura
  * 2021-05-30 1218H, Asura
  * 2021-05-30 1228H, Asura
  * 2021-05-30 1815H, Asura
  * 2021-05-30 1848H, Asura
  * 2021-06-05 2315H, Asura

## To Note



# Documentation

## Getting Started

### Pre-Requisites

1. chmod +x setup.sh
2. chmod +x postinstallations-root.sh
3. chmod +x postinstallations.sh
4. chmod +x good-aliases.sh
5. chmod +x customs.sh
6. chmod +x makefile.sh

### Dependencies

### Installing

### Executing



## Files

1. setup.sh

   > A basic setup script that will setup the basic requirements after a complete/minimal installation such as making default directories, 
   >
   > installing basic packages if they were not installed during setup

2. postinstallations-root.sh

   > A simple post installation script that will run basic essential TODO stuff after a complete/minimal installation on a root level
   >
   > such as making new user

3. postinstallations.sh

   > A simple post installation script that will run basic essential TODO stuff after a complete/minimal installation
   >
   > such as installing window managers/desktop environment, terminals, file browsers etc.

4. good-aliases.sh

   > This contains a library of aliases to source into your dotfiles for use

5. customs.sh

   > A script with commands that are what I consider essential custom folders to create, use etc.
   >
   > - Please edit this and adjust it to fit what you would consider essential for you

6. makefile.sh

   > A Linux (shell) Makefile script reminiscent of C/C++'s make;makefile;cmake system
   > Run this if you would like to run all the other files in 1 place 
   > Please edit this file to include/remove the scripts of your choice. (or your own custom multi-script run layout; place the scripts accordingly)
   

## Usage

> How to use

1. ./setup.sh
2. ./postinstallations.sh
3. good-aliases.sh
   * Source alias
     * . good-aliases.sh
     * source good-aliases.sh
4. ./customs.sh
5. ./makefile.sh


## Help

> Help Commands



# Authors

> Contributors name, git ID, contact info



# Version History

>  Changelogs

* 2021-05-24 0057H, Asura
  * Created 
    * README.md
      * Basic Information (Description)
      * To Note
      * Documentations
        * Getting Started
        * Files
        * Usage
        * Help
      * Authors
      * Version History (Changelogs)
      * License
      * Acknowledgements
    * postinstallations.sh
    * setup.sh
* 2021-05-24 0127H, Asura
  * Added
    * Documentations
      * Pre-Requisites
      * Dependencies
      * Installing
      * Execution
* 2021-05-24 0154H, Asura
  * Created
    * Library
      * good-aliases.sh
  * Modified
    * setup.sh
      * Changed 
        * mkdir -p && | tee -a to mkdir -p | tee -a 
    * postinstallations.sh
      * Changed for loop to a C-style loop; 
      * Able to recognize array indexes
* 2021-05-24 0233H, Asura
  * Modified
    * postinstallations.sh
      * Changed 
        * 'urxvt' -> 'rxvt-unicode'
        * seperated "vim nano" to 2 keys:
          * editor-1 : vim
          * editor-2 : nano
      * Added
        * function to check if package exists in repository before proceeding with installation
* 2021-05-25 0825H, Asura
  * Created
    * customs.sh
* 2021-05-25 0903H, Asura
  * Modified
    * customs.sh
      * Line 45 : Changed 'default_Files' to 'custom_Files'
    * postinstallations.sh
      * Added empty spaces after each packages are installed
* 2021-05-29 2228H, Asura
  * Modified
    * postinstallations.sh
	  * Added new part: [M3: Window Manager setup]
* 2021-05-30 1038H, Asura
  * Modified
    * setup.sh
	  * Added new setup checks [Network, Audio, Swapfile, User Account]
	* postinstallations.sh
      * New packages
* 2021-05-30 1217H, Asura
  * Created
    * postinstallations-root.sh 
	  * Moved [user_Management] from postinstallations.sh to postinstallations-root.sh
  * Modified
    * postinstallations.sh
	* customs.sh
* 2021-05-30 1228H, Asura
  * Modified
    * setup.sh
	  * Moved [network_Management] from setup.sh to postinstallations-root.sh
* 2021-05-30 1816H, Asura
  * Modified
    * postinstallations.sh
	  * Updated [user_Management.sh]
	  * Added "X" packages to essential packages
* 2021-05-30 1848H, Asura
  * Modified
    * postinstallations.sh
	  * Added function to copy bspwmrc and sxhkdrc IF bspwm is installed as wm
	  * Added function create create a .xinitrc template if doesnt exist
* 2021-06-05 2318H, Asura
  * Created
  	* makefile.sh
  * modified
  	* postinstallations-root.sh
	  * Added sudo to user management functions

# License



# Acknowledgements

