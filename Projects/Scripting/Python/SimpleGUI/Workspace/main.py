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
# setup.install_pip()
# setup.install_if_not_exist("tk")
# if not (setup.linux_distro == "N/A"):
#     # ArchLinux
#     setup = setup.Setup()
#     try:
#         pkg_name = "tk"
#         install_check = setup.pkg_installed(pkg_name)
#         if not (install_check):
#             # True = Installed
#             # False = Not Installed
#             setup.install_pkg(pkg_name)
#     except:
#         print("You need to install these packages to proceed, exitting.")
#         exit()
modules = ["tk"]
setup.full_setup(*modules)

# GUI Modules
import tkinter as tk
from tkinter import filedialog, ttk

class ClassRoom():
    """ 
    This is a education-focused class which contains all the functions to test, learn and practice various topics im trying to read on
    """
    def __init__(self):
        # Initializer here
        print("Activating Class Room")

    def LearningRoom(self):
        print("Learning Room")
        
        """
        TKinter Functions
        """
        def create_root(params=None):
            """
            Create a root / window (Top layer)
            using * will automatically convert variable-length argument to fit each parameter in function
            """
            if not (params == None):
                root = tk.Tk(**params)
            else:
                root = tk.Tk()
            return root

        def create_Label(window, widget_params=None):
            """
            Create a Label Widget
            :: Params
                window : The Root Window, non-optional
                    Type: tk.Tk() type
                    Description: The Root window object
                widget_params : The Widget Parameters
                    Type: Dictionary
                    Description: Please input in the dictionary - all the keys being the arguments of the Label and the value being the value
            """
            lb_Widget = None
            if not (widget_params == None):
                lb_Widget = tk.Label(window, **widget_params)
            else:
                lb_Widget = tk.Label(window)
            return lb_Widget

        def create_Frame(window, widget_params=None):
            """
            Create a Frame Widget
            :: Params
                window : The Root Window, non-optional
                    Type: tk.Tk() type
                    Description: The Root window object
                widget_params : The Widget Parameters
                    Type: Dictionary
                    Description: Please input in the dictionary - all the keys being the arguments of the Frame and the value being the value
            """
            frame_Widget = None
            if not (widget_params == None):
                frame_Widget = tk.Frame(window, **widget_params)
            else:
                frame_Widget = tk.Frame(window)
            return frame_Widget

        def set_Label(window, lb_Widget=None, pack_params=None, widget_params=None):
            """
            Creates a Label Widget (if None) and
            packs it into the window

            :: Params
                window : The Root Window, non-optional
                    Type: tk.Tk() type
                    Description: The Root window object
                lb_Widget : The Label Widget (if any exists)
                    Type: tk.Label() type
                    Description: The Label Widget object if created; If it is None - System will create and pack into the window object
                widget_params : The Widget Parameters
                    Type: Dictionary
                    Description: Please input in the dictionary - all the keys being the arguments of the Label and the value being the value
                pack_params : The root packing parameters
                    Type: Dictionary
                    Description: Please input in the dictionary - all the keys being the arguments of the Pack() and the value being the value
            """            
            # Create Widget if it is None
            if lb_Widget == None:
                if not (widget_params == None):
                    lb_Widget = tk.Label(window, **widget_params)
                else:
                    lb_Widget = tk.Label(window)
            
            # Pack widget into window
            if not (pack_params == None):
                lb_Widget.pack(**pack_params)
            else:
                lb_Widget.pack()

        def set_Frame(widget, pack_params=None):
            """
            Create a Frame Widget
            :: Params
                window : The Root Window, non-optional
                    Type: tk.Tk() type
                    Description: The Root window object
                widget_params : The Widget Parameters
                    Type: Dictionary
                    Description: Please input in the dictionary - all the keys being the arguments of the Frame and the value being the value
            """
            # Pack widget into window
            if not (pack_params == None):
                widget.pack(**pack_params)
            else:
                widget.pack()
        
        def start(window=None, params=None):
            """
            Start Window using mainloop
            """
            if not (window == None):
                if not (params == None):
                    window.mainloop(*params)
                else:
                    window.mainloop()

        """
        TK GUI Customizations
        """
        def tk_1():
            """
            TK GUI Test 1
            """
            # Variables
            lb_HelloWorld_params = {
                "text" : "Hello World 2"
            }
            pack_params = {
                "padx" : 20,
                "pady" : 20
            }

            # Create Root Window
            root = create_root()

            # Create Widgets
            # lb_HelloWorld = tk.Label(root, text="Hello World")  
            lb_HelloWorld = create_Label(root, lb_HelloWorld_params)    # Create a Text Label Widget

            # Pack Widgets into the Window
            # lb_HelloWorld.pack(padx=20, pady=20)          
            set_Label(root, lb_HelloWorld, pack_params)

            # Start Window
            start(root)

        def tk_2():
            """
            TK GUI Test 2 : tk.Frame GUI Class

            - Testing dictionary-initialization system
            """
            # Functions
            def create_widget_info(ROW_ID, id, widget_params=None, pack_params=None):
                """
                Takes Widget Information in **kwargs and returns as dictionary
                """

                # Set Default Value
                if widget_params == None:
                    widget_params = {}
                if pack_params == None:
                    pack_params = {}

                widget_info = {}
                widget_info["ROW_ID"] = ROW_ID
                widget_info["id"] = id
                widget_info["widget_params"] = widget_params
                widget_info["pack_params"] = pack_params
                return widget_info

            root_params = {}
            root = create_root(root_params)
            widget_params = {
                # Syntax:
                # [widget-type] : [
                #   {
                #       "ROW_ID" : n,
                #       "id" : "widget_ID",
                #       "widget_params" : {
                #           
                #       },
                #       "pack_params" : {
                #           
                #       }
                #   }
                # ]
                "label" : [
                    create_widget_info(0, "lb_HelloWorld", {"text" : 720}, {"fill" : "x"}),
                    create_widget_info(1, "lb_Test", {"text" : 480}, {"fill" : "y"})
                ],
                "frame" : [
                    create_widget_info(0, "frame_Main", None, {"fill" : "both", "expand" : True})
                ]
            }
            # Widget Lists
            labels = widget_params["label"]
            number_of_Labels = len(labels)
            frames = widget_params["frame"]
            number_of_Frames = len(frames)

            # Loop and create widgets
            label_obj = []
            frame_obj = []

            for i in range(number_of_Labels):
                # Get Current Widget object (List)
                curr_Label = labels[i]
                
                # Get Params (Dictionary)
                curr_widget_param = curr_Label["widget_params"]
                curr_pack_param = curr_Label["pack_params"]

                # Create Label Object
                curr_obj_Label = create_Label(root, curr_widget_param)

                # Set Label Object
                set_Label(root, curr_obj_Label, curr_pack_param)

                # Append new label to list
                label_obj.append(curr_obj_Label)

            for i in range(number_of_Frames):
                # Get Current Widget object (List)
                curr_Frame = frames[i]
                
                # Get Params (Dictionary)
                curr_widget_param = curr_Frame["widget_params"]
                curr_pack_param = curr_Frame["pack_params"]

                # Create new Object
                curr_obj_Frame = create_Frame(root, curr_widget_param)

                # Set Object
                set_Frame(curr_obj_Frame, curr_pack_param)

                # Append new widget to list
                frame_obj.append(curr_obj_Frame)

            """ Tree """
            # Create Tree(view) widget
            tree = ttk.Treeview(root)
            
            # Set Tree Columns
            tree["columns"] = ["one", "two", "three"]

            # Define Tree Columns
            #   By defining stretch=tk.NO, the user cannot modify the width of the column
            tree.column("#0", width=270, minwidth=270, stretch=tk.NO)
            tree.column("one", width=150, minwidth=150, stretch=tk.NO)
            tree.column("two", width=400, minwidth=200)
            tree.column("three", width=80, minwidth=50, stretch=tk.NO)

            # Define Tree Headings
            tree.heading("#0",text="Name",anchor=tk.W)
            tree.heading("one", text="Date modified",anchor=tk.W)
            tree.heading("two", text="Type",anchor=tk.W)
            tree.heading("three", text="Size",anchor=tk.W)

            # Insert some Rows
            # Level 1
            # Create Folder
            folder1 = tree.insert("", 1, "", text="Folder 1", values=("23-Jun-17 11:05","File folder",""))
            # Next Row in the root folder
            tree.insert("", 2, "", text="text_file.txt", values=("23-Jun-17 11:25","TXT file","1 KB"))
            
            # Level 2
            # Place inside folder [folder_1]
            tree.insert(folder1, "end", "", text="photo1.png", values=("23-Jun-17 11:28","PNG file","2.6 KB"))
            tree.insert(folder1, "end", "", text="photo2.png", values=("23-Jun-17 11:29","PNG file","3.2 KB"))
            tree.insert(folder1, "end", "", text="photo3.png", values=("23-Jun-17 11:30","PNG file","3.1 KB"))

            # Pack 
            tree.pack(side=tk.TOP, fill=tk.X)

            root.mainloop()

        def run(RUN_ID=0):
            """
            Run Learning Room
            """
            if RUN_ID == 1:
                tk_1()
            elif RUN_ID == 2:
                tk_2()
            else:
                print("Invalid Run ID")

        run(2)

    def PracticeGround(self):
        print("Practice Ground")

    def TestBench(self):
        print("Test Bench")

def init():
    """ Initialization Function Here """
    global classroom
    print("Initializing...")
    classroom = None

def settings():
    """ Setup Function """
    global classroom
    print("Setting up...")
    classroom = ClassRoom()

def bootup():
    """ Things to run after booting up
    - initializer
    - setup (set settings)
    """
    init()
    settings()

def main():
    print("Hello World")
    classroom.LearningRoom()

if __name__ == "__main__":
    bootup()
    main()

