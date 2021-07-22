"""
SimpleGUI

A simple GUI made in python with tkinter

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
# Database Modules
import sqlite3 as sqlite

### External Modules ###
import setup
setup.install_pip()
setup.install_if_not_exist("tk")
if not (setup.linux_distro == "N/A"):
    # ArchLinux
    setup = setup.Setup()
    try:
        pkg_name = "tk"
        install_check = setup.pkg_installed(pkg_name)
        if not (install_check):
            # True = Installed
            # False = Not Installed
            setup.install_pkg(pkg_name)
    except:
        print("You need to install these packages to proceed, exitting.")
        exit()

# GUI Modules
import tkinter as tk
from tkinter import filedialog, ttk

class ClassRoom():
    """ 
    This is a education-focused class which contains all the functions to test, learn and practice various topics im trying to read on
    """
    def __init__(self):
        # Initializer here
        self.TestBench()

    def LearningRoom(self):
        print("Learning Room")

    def PracticeGround(self):
        print("Practice Ground")

    def TestBench(self):
        print("Test Bench")

def init():
    """ Initialization Function Here """
    print("Initializing...")

def settings():
    """ Setup Function """
    print("Setting up...")

def bootup():
    """ Things to run after booting up
    - initializer
    - setup (set settings)
    """
    init()
    settings()

def main():
    print("Hello World")

if __name__ == "__main__":
    main()

