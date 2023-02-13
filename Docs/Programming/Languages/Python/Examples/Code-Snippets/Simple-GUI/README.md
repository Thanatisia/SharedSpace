# README

<h3> SimpleGUI </h3>

## Basic Information

* Authors: 

  * Asura

* Date Created: 2021-07-21 2338H, Asura

* Folder background:

  > A simple python project TestBench/PracticeGround/LearningRoom created
  > to put everything I learnt into 1 workspace for reference
    - For Example
      - Intended Output
      - Looks
  > SimpleGUI started off with TKinter as its first test but subsequent ideas will be added in as seperated classes
    > Each representing its topic
      > i.e.
        > GUI:
          > Tkinter --> TK, TTK, Tree etc.
  > This workspace's primary focus is currently on GUI Programming
  > AI, Machine Learning, Deep Learning, Robotic AI etc. will be in its seperate project TestBench/PracticeGround/LearningRoom
  
* Contents:

  > GUI Framework Designs
    - TKInter
      - TK
      - TTK
      - Tree etc.
  
* Last Update/Modified:
  * 2021-07-21 2338H, Asura
  * 2021-07-25 1458H, Asura
  * 2021-07-25 2302H, Asura
  * 2021-07-25 2351H, Asura
  * 2021-07-26 2350H, Asura


## To Note



# Documentation

## Getting Started



### Dependencies

1. TKinter
  > - Ensure that you have tkinter installed

      - TKinter is used as a baseline test in SimpleGUI
      - If you (the user) removed TKinter testing and replaced it with another framework like
        - i.e.
          - PyQt5
          - Kivy
      - Then replace TKinter with whatever framework you are using

  > - Replace/Remove this if you are using the Template variant of this LearningRoom/TestBench/PracticeGround project

  > - It appears that Python 3.8 and above removed tkinter from its in-built library

  > Setup

    - For Windows
      1. Pip install
        - pip install tk
        - python -m pip install tk
    - For Linux
      1. Pip install
        - pip install tk
        - python -m pip install tk
      2. Install python module package
        - For Ubuntu (or distros using apt)
          - sudo apt(-get) install python3-tk
        - ArchLinux:
          - sudo pacman -S tk

### Installing

### Executing



## Usage

> How to use



## Help

> Help Commands



# Authors

> Contributors name, git ID, contact info

* Asura, Thanatisia, <a href="https://www.github.com/Thanatisia">Github</a>


# Version History

>  Changelogs

* 2021-07-21 2338H, Asura
  * Created 
    * README
    * Basic Information (Description)
    * To Note
    * Documentations
      * Getting Started
        * Dependencies
        * Installing
        * Executing
      * Usage
      * Help
    * Authors
    * Version History (Changelogs)
    * License
    * Acknowledgements

* 2021-07-25 1458H, Asura
  * main.py
    * Reorganized and created a 'init_classes' function that will be where you place all the classes
    * Made each line neater & easier to read
    * Created classes [ LearningRoom, TestBench, PracticeGround ] that will act as categories for each debugging phases and/or for topic studies
    * Seperated each test to a function of its own under class TestBench for easier understanding
    * Debugging is made easier due to seperation of classes based on topic & intended test
    * The following Tests are working on both Windows and Linux
      * test_1 : Simple Hello World, 
      * test_2 : Simple TreeView, 
      * test_3 : Simple TreeView with ScrollBar

* 2021-07-25 2302H, Asura
  * main.py
    * Created 'Designer' for DesignCorner/DesignTable section
      * To design & plan test functions to learn and visualize
    * Created 'Widgets' class for all Widgets
    * Created 'Window' class under 'Widgets' for all Windows (Root / TopLevel) based functions and wrappers

* 2021-07-25 2351H, Asura
  * main.py
    * Modified map_func_args()
      * Added arguments checker and set an argument to variable 'x' in lambda function
      * Fixed lambda function by setting x to lambda_args (x=lambda_args)

* 2021-07-26 2350H, Asura
  * setup.py
    * Added new function 'get_all_installed_pkgs_with_description' --> Returns all packages installed with description
      * Every Even index : Package Name       (index % 2 == 0)
      * Every Odd index : Package Description (index % 3 == 0)

# License



# Acknowledgements

