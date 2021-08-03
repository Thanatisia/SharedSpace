"""
SimpleGUI

A simple GUI made in python with tkinter

Author: Asura
Created By: 2021-07-21 2338H, Asura
Modified By: 
    - 2021-07-21 2338H, Asura
    - 2021-07-31 1857H, Asura
    - 2021-08-03 1130H, Asura
Changelogs: 
    - 2021-07-21 2338H, Asura
        - Created Script File
    - 2021-07-31 1857H, Asura
        - Fixed 'read' function and functions in modules - to update changelogs
    - 2021-08-03 1130H, Asura
        - Created this seperate script file to test seperated module implementation
        - 'main.sh' has been renamed to main-single.py
        - Seperated modules into individual scripts [general.py, paths.py, gui/tkwrap.py and db/sqlite_util.py]

:: Google Searches
Python how to check if module is installed
    https://www.google.com/search?q=Python+how+to+check+if+module+is+installed&ei=yUb5YO7gAcLorQGLyIeABA&oq=Python+how+to+check+if+module+is+installed&gs_lcp=Cgdnd3Mtd2l6EAMyBggAEAcQHjIICAAQCBAHEB4yCAgAEAgQBxAeOgcIABBHELADSgQIQRgAUNobWPMgYMshaAJwAngAgAFfiAGaA5IBATaYAQCgAQGqAQdnd3Mtd2l6yAEIwAEB&sclient=gws-wiz&ved=0ahUKEwiu6ePCuvbxAhVCdCsKHQvkAUAQ4dUDCA4&uact=5

python how to package an app
    https://www.google.com/search?q=python+how+to+package+an+app&oq=python+how+to+package+an+app&aqs=chrome..69i57.6312j0j1&sourceid=chrome&ie=UTF-8

How to package a python app
    https://www.google.com/search?q=How+to+package+a+python+app&oq=How+to+package+a+python+app&aqs=chrome..69i57.5640j0j1&sourceid=chrome&ie=UTF-8

:: References
How to install Tkinter in Python?
    https://www.tutorialspoint.com/how-to-install-tkinter-in-python

How to check if a module is installed in Python and, if not, install it within the code?
    https://stackoverflow.com/questions/44210656/how-to-check-if-a-module-is-installed-in-python-and-if-not-install-it-within-t

:: Tutorials
How To Package And Distribute Python Applications
    https://www.digitalocean.com/community/tutorials/how-to-package-and-distribute-python-applications
"""

### In-built Modules ###
import os
import sys
import subprocess
import math

### External Modules ###
import modules.general as general
import modules.paths as paths
import modules.db.sqlite_util as db_sqlite
import modules.gui.tkwrap as tkwrap
import modules.program.classroom as program_main

# Imports
from modules.general import *
from modules.paths import *
from modules.db.sqlite_util import *
from modules.gui.tkwrap import *
from modules.program.classroom import *


def init_classes():
    global classroom, \
    gen_utils, \
    path_utils, \
    gui_utils, \
    tk_util, \
    tk_pos_util, \
    tk_widget_util, \
    tk_widget_entry_util, \
    tk_widget_text_util, \
    tk_widget_windows_util, \
    ttk_util,\
    tv_util, \
    tk_customs_GUI

    # Initialize Classes
    classroom = program_main.ClassRoom()
    gen_utils = general.GeneralUtils()
    path_utils = paths.PathUtils()
    gui_utils = tkwrap.GUIUtils()
    tk_util = gui_utils.TKGUI()
    tk_pos_util = tk_util.Positions()
    tk_widget_util = tk_util.Widgets()
    tk_widget_entry_util = tk_widget_util.Entry()
    tk_widget_text_util = tk_widget_util.Text()
    tk_widget_windows_util = tk_widget_util.Window()
    ttk_util = tk_util.TTKUtil()
    tv_util = ttk_util.Tree()
    tk_customs_GUI = tk_util.Custom()

def init():
    """ Initialization Function Here """
    print("Initializing...")    
    # Initialize all empty variables
    # Initialize all classes
    init_classes()

def settings():
    """ Setup Function """
    global args
    print("Setting up...")
    # Setting / Getting command line arguments
    args = gen_utils.get_argv()

def bootup():
    """ Things to run after booting up
    - initializer
    - setup (set settings)
    """
    init()
    settings()

def main():
    print("Hello World")
    print(args)
    classroom.Designer()

if __name__ == "__main__":
    bootup()
    main()

