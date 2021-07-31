"""
SimpleGUI

A simple GUI made in python with tkinter

Author: Asura
Created By: 2021-07-21 2338H, Asura
Modified By: 
    - 2021-07-21 2338H, Asura
    - 2021-07-31 1857H, Asura
Changelogs: 
    - 2021-07-21 2338H, Asura
        - Created Script File
    - 2021-07-31 1857H, Asura
        - Fixed 'read' function and functions in modules - to update changelogs

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
# Database Modules
import sqlite3 as sqlite
from tkinter.constants import NW, SW, VERTICAL

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
from tkinter import Entry, YView, filedialog, ttk, messagebox

########################
# MODULE / CLASS START #
########################

class GeneralUtils():
    """ General functions and utilities for all use-cases """
    def var(self, var_str):
        """
        Get a variable based off a string name
        """
        return eval(var_str)
    def fstring(self, string="{}"):
        """
        Returns f-string
        Syntax:
            var = "Hello"
            f"{var} world"
        """
        return f"{string}"
    def map_func_arg(self, lambda_func=None, lambda_args=None):
        """
        Generate a lambda function that will map a function with arguments in 1 line
        :: Params
            lambda_func: 
                Description: This is the lambda function you want to use
                Type: function
            lambda_args:
                Description: This is the arguments you want to pass to the function
                Type: List
        """
        if not (lambda_args == None):
            # return lambda lambda_args=lambda_args: lambda_func(*lambda_args)
            return lambda x=lambda_args: lambda_func(*lambda_args)
        else:
            return None
    def get_argv(self):
        """ Get command line arguments 
        - Returns a dictionary containing the key-value mapping of
            "size"        : argc,         --> Total Arguments including the script name (index 0)
            "script_name" : script_name,  --> The Script Name
            "other_args"  : other_args,   --> Remaining Arguments excluding the script name
        """
        global args
        
        argv = sys.argv
        argc = len(argv)
        script_name = argv[0]
        other_args = argv[1:]   # All other args except [0]
        args = {
            "size"          : argc,   # Total Arguments
            "script_name"   : script_name, 
            "other_args"    : other_args,
        }
        return args

class PathUtils():
    """
    Path, Files and Folder Utilities
    """
    def get_pathtype(self, fpath=""):
        """
        Get Type of path

        :: Parameters
            fpath : The Path you want to check
        """
        pathtype = ""
        if not (fpath == ""):
            if os.path.isfile(fpath):
                pathtype = "File"
            elif os.path.isdir(fpath):
                pathtype = "Folder"
            else:
                pathtype = "undef"
        return pathtype
    def get_extension(self, fname=""):
        """
        Get Extension of file

        :: Parameters
            fname : The File you want to retrieve

        :: References

            Extracting extension from filename in Python
                https://stackoverflow.com/questions/541390/extracting-extension-from-filename-in-python
        """
        fext = "" # Extension to return
        fext = os.path.splitext(fname)[1]
        return fext

class GUIUtils():
    """ Python GUI utilities 
    - TKinter
    """
    class TKGUI():
        """ Python TKinter GUI Utilities """
        widget_action_set = {
            # [Syntax]
            # "<action>" : "widget-action-command"    ( Do not put '<>' )
            # References:
            # Events and Binds:
            #   https://www.python-course.eu/tkinter_events_binds.php
            "single-click"          : "<Button>",
            "single-left-click"     : "<Button-1>",
            "single-middle-click"   : "<Button-2>",
            "single-right-click"    : "<Button-3>",
            "single-scroll-up"      : "<Button-4>",
            "single-scroll-down"    : "<Button-5>",
            "double-click"          : "<Double-Button>",
            "double-left-click"     : "<Double-Button-1>",
            "double-middle-click"   : "<Double-Button-2>",
            "double-right-click"    : "<Double-Button-3>",
            "mouse-move"            : "<Motion>",
            "left-mouse-move"       : "<B1-Motion>",
            "middle-mouse-move"     : "<B2-Motion>",
            "right-mouse-move"      : "<B3-Motion>",
            "button-released"       : "<ButtonRelease>",
            "left-button-released"  : "<ButtonRelease-1>",
            "middle-button-released": "<ButtonRelease-2>",
            "right-button-released" : "<ButtonRelease-3>",
            "mouse-enter"           : "<Enter>",
            "mouse-leave"           : "<Leave>",
            "widget-focus-in"       : "<FocusIn>",
            "widget-focus-out"      : "<FocusOut>",
            "enter-key-click"       : "<Return>",
            "press-key"             : "<Key>",
            "hold-shift-press-up"   : "<Shift-Up>",
            "hold-alt-press-up"     : "<Alt-Up>",
            "hold-ctrl-press-up"    : "<Control-Up>",
            "changed-size"          : "<Configure>",
        }
        def create_root(self, root_params=None):
            """
            Create a root / window (Top layer)
            using * will automatically convert variable-length argument to fit each parameter in function
            """
            if not (root_params == None):
                root = tk.Tk(**root_params)
            else:
                root = tk.Tk()
            return root

        def create_Label(self, window, widget_params=None):
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

        def create_Frame(self, window, widget_params=None):
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

        def set_Label(self, window, lb_Widget=None, pack_params=None, widget_params=None):
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

        def set_Frame(self, widget, pack_params=None):
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

        def set_widget(self, window, widget, widget_params=None, placement_type="pack"):
            """
            Create all widgets defined in {widget_params}
            - Currently supported widgets: label, button, treeview etc.
            - Returns object of type Dictionary
                {
                    "widget_id_1" : <widget>,
                    "widget_id_2" : <widget> ...
                }

            :: Params
                window:
                    Description: This is the main 'root' / window object - your GUI
                    Type: tk.Tk() object
                    Default: N/A
                    Syntax: root = tk.Tk(**params)
                widget
                    Description: This is the widget type you want to create
                    Type: String
                    Default: N/A
                    Syntax: {'label' : Label, 'frame' : Frame, 'canvas' : Canvas, 'button' : Button, 'treeview' : TreeView} etc.
                widget_params
                    Description: This is the parameters for all widgets you want to create
                    Type: Dictionary
                    Default: None
                    Syntax:
                        [widget-type] : [
                        {
                            "ROW_ID" : n,
                            "id" : "widget_ID",
                            "widget_params" : {
                                
                            },
                            "pack_params" : {
                                
                            }
                        },
                        {
                            "ROW_ID" : n+1,
                            "id" : "widget_ID",
                            "widget_params" : {
                                
                            },
                            "pack_params" : {
                                
                            }
                        },
                        ]
                placement_type
                    Description: This is the positioning style you want to place your widget - i.e. pack(), grid() and place()
                    Type: string
                    Default: pack
                    Syntax: {"pack" : widget.pack(), "grid" : widget.grid(), "place" : widget.place()}
            """
            # Initialize
            pos_util = self.Positions()
            ret_obj = {}
            
            # Widget Lists
            widgets = widget_params["{}".format(widget)]
            number_of_Widgets = len(widgets)

            # Loop and create widgets
            for i in range(number_of_Widgets):
                # Get Current Widget object (List)
                curr_Widget = widgets[i]
                
                # Get Variables
                curr_widget_ID = curr_Widget["id"]

                # Get Params (Dictionary)
                curr_widget_param = curr_Widget["widget_params"]
                curr_pack_param = curr_Widget["pack_params"]

                # Create Object based on widget
                if widget == "label":       # For Label
                    curr_obj = tk.Label(window, **curr_widget_param)
                elif widget == "entry":     # For single-line textbox input
                    curr_obj = tk.Entry(window, **curr_widget_param)
                elif widget == "text":      # For multi-line textbox input
                    curr_obj = tk.Text(window, **curr_widget_param)
                elif widget == "frame":     # For Frame
                    curr_obj = tk.Frame(window, **curr_widget_param)
                elif widget == "canvas":    # For Canvas
                    curr_obj = tk.Canvas(window, **curr_widget_param)
                elif widget == "button":    # For Button
                    curr_obj = tk.Button(window, **curr_widget_param)
                elif widget == "scrollbar": # For ScrollBar
                    curr_obj = tk.Scrollbar(window, **curr_widget_param)
                elif widget == "treeview":  # For TreeView (displaying grids)
                    curr_obj = ttk.Treeview(window, **curr_widget_param)

                # Set Widget Object
                if placement_type == "pack":
                    pos_util.pack_Widget(curr_obj, curr_pack_param)
                elif placement_type == "grid":
                    pos_util.set_grid(curr_obj, curr_pack_param)
                elif placement_type == "place":
                    pos_util.place_Widget(curr_obj, curr_pack_param)

                # Append new label to list
                # ret_obj.append(curr_obj)
                print("Current Widget ID: {}".format(curr_widget_ID))
                print("Current Widget Obj: {}".format(curr_obj))
                ret_obj[curr_widget_ID] = curr_obj

            # --- Output
            print("All Widgets : {}".format(ret_obj))
            for k,v in ret_obj.items():
                print("Final Widgets [{} : {}]".format(k,v))

            return ret_obj

        def multiset_widget(self, windows=None):
            """
            Wrapper for function 'set_widget' to allow multisetting widgets in various window / widgets

            :: Parameters

                windows
                    Description: Your window to link and its object / parameters (please refer to :: Syntax)
                    Type: Dictionary
                    Syntax:
                        "<window/widget here>" : {
                            "object" : <object>,                # Your window/widget object variable
                            "params" : {                        # Your Parameter dictionary here 
                                "widget-type" : [                   # widget information
                                    {
                                        "ROW_ID" : 0,               # Row ID
                                        "id" : id,                  # Label ID - could be your variable name
                                        "widget_params" : {},       # Your widget parameters
                                        "pack_params" : {}          # Your .pack() / .grid() / .place() parameters here; not specifically .pack()
                                    }
                                ]
                            }
                        },
                    Example:
                        [1] Let widget_type be Label
                        widget-type : "label"
                        id : "lb_test"
                        widget_params : {}
                        pack_params : {}
                        "root" : {
                            "object" : root,                    # (retrieved from tk.Tk())
                            "params" : {                        # Your Parameter dictionary here 
                                "label" : [               # widget information
                                    {
                                        "ROW_ID" : 0,           # Row ID
                                        "id" : "lb_test",              # Label ID - could be your variable name
                                        "widget_params" : {},   # Your widget parameters
                                        "pack_params" : {}      # Your .pack() / .grid() / .place() parameters here; not specifically .pack()
                                    }
                                ]
                            }
                        },

            :: Syntax
            windows = {
                "root" : {
                    "object" : root,                    # (retrieved from tk.Tk())
                    "params" : {                        # Your Parameter dictionary here 
                        "widget-type" : [               # widget information
                            {
                                "ROW_ID" : 0,           # Row ID
                                "id" : id,              # Label ID - could be your variable name
                                "widget_params" : {},   # Your widget parameters
                                "pack_params" : {}      # Your .pack() / .grid() / .place() parameters here; not specifically .pack()
                            }
                        ]
                    }
                },
                "<window/widget here>" : {
                    "object" : <object>,                # Your window/widget object variable
                    "params" : {                        # Your Parameter dictionary here 
                        "widget-type" : [                   # widget information
                            {
                                "ROW_ID" : 0,               # Row ID
                                "id" : id,                  # Label ID - could be your variable name
                                "widget_params" : {},       # Your widget parameters
                                "pack_params" : {}          # Your .pack() / .grid() / .place() parameters here; not specifically .pack()
                            }
                        ]
                    }
                },
            }
            """
            widgets = {}
            if not (windows == None):
                for k_window, v_win_params in windows.items():
                    # Key: widget_type
                    # Value: widget parameter dictionaries
                    curr_window_object = v_win_params["object"]
                    curr_widget_params = v_win_params["params"]

                    # Loop Parameters
                    for k_widget_type, v_widgets in curr_widget_params.items():
                        # Key: <widget-type>
                        # Value: List of Widgets; 
                        # [
                        #   widget_info["ROW_ID"] = ROW_ID
                        #   widget_info["id"] = id
                        #   widget_info["widget_params"] = widget_params
                        #   widget_info["pack_params"] = pack_params
                        # ]
                        widgets[k_widget_type] = tk_util.set_widget(curr_window_object, "{}".format(k_widget_type), curr_widget_params)
            return widgets

        def widget_config(self, widget, config_params):
            """
            Configure Widgets
            - added other parameters not defined on initialization
            - widget.configure(**configure_params)
            ::Params
                widget: 
                    Description: The Widget you want to configure
                    type: Widget object
                config_params:
                    Description: The New configs you want to append
                    type: Dictionary
            """
            widget.configure(**config_params)
        
        def get_configure_keys(self, widget):
            """
            Returns the Keys for all .configure() can use
            """
            return widget.configure().keys()[0]
        
        def start(self, window=None, params=None):
            """
            Start Window using mainloop
            """
            if not (window == None):
                if not (params == None):
                    window.mainloop(*params)
                else:
                    window.mainloop()

        def create_widget_info(self, ROW_ID, id, widget_params=None, pack_params=None):
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

        def generate_stringvar(container_widget=None, stringvar_params=None):
            """
            Create StringVar for use

            :: Params
                container_widget
                    Description: The Widget that the StringVar object is associated with / assigned to
                        - Defaults to root window if you skip it
                    Type: Widget
                    Default: root tk.Tk()
                stringvar_params
                    Description: The StringVar Parameters
                    Type: Dictionary
            """
            if container_widget == None:
                if stringvar_params == None:
                    string_var = tk.StringVar()
                else:
                    string_var = tk.StringVar(None, **stringvar_params)
            else:
                if stringvar_params == None:
                    string_var = tk.StringVar(container_widget)
                else:
                    string_var = tk.StringVar(container_widget, **stringvar_params)
            return string_var

        def msgbox(self, category, title, message, options=None):
            """
            Create a messagebox of your choice
                - Based on category
                info : messagebox.showinfo(<title>, <contents>, <params>)
                warning : messagebox.showwarning(<title>, <contents>, <params>)
                error : messagebox.showerror(<title>, <contents>, <params>)
                question : messagebox.askquestion(<title>, <contents>, <params>)
                okcancel : messagebox.askokcancel(<title>, <contents>, <params>)
                yesno : messagebox.askyesno(<title>, <contents>, <params>)
                yesnocancel : messagebox.askyesnocancel(<title>, <contents>, <params>)
                askretrycancel : messagebox.askretrycancel(<title>, <contents>, <params>)

            :: References:
                Python TKinter MessageBox widget
                    https://www.geeksforgeeks.org/python-tkinter-messagebox-widget/

            :: Params
                category
                    Description: The type of messagebox you want
                    Type: String
                title
                    Description: Header of messagebox
                    Type: String
                message
                    Description: Content to display in messagebox
                    Type: String
                options
                    Description: Other options for messagebox
                    Type: Dictionary
            """
            if category == "info":
                if title == "":
                    title = "showinfo"
                if message == "":
                    message = "Information"
                messagebox.showinfo(title, message, **options)
            elif category == "warning":
                if title == "":
                    title = "showwarning"
                if message == "":
                    message = "Information"
                messagebox.showwarning(title, message, **options)
            elif category == "error":
                if title == "":
                    title = "showerror"
                if message == "":
                    message = "Error"
                messagebox.showerror(title, message, **options)
            elif category == "question":
                if title == "":
                    title = "askquestion"
                if message == "":
                    message = "Are you sure?"
                messagebox.askquestion(title, message, **options)
            elif category == "okcancel":
                if title == "":
                    title = "askquestion"
                if message == "":
                    message = "Want to continue?"
                messagebox.askokcancel(title, message, **options)
            elif category == "yesno":
                if title == "":
                    title = "askyesno"
                if message == "":
                    message = "Find the value?"
                messagebox.askyesno(title, message, **options)
            elif category == "yesnocancel":
                if title == "":
                    title = "askyesnocancel"
                if message == "":
                    message = "Find the value?"
                messagebox.askyesnocancel(title, message, **options)
            elif category == "askretrycancel":
                if title == "":
                    title = "askretrycancel"
                if message == "":
                    message = "Try again?"
                messagebox.askretrycancel(title, message, **options)

        class Widgets():
            """ Python GUI TKinter Widget-focused Utilities - wrappers etc. """
            class Window():
                """ TKInter Window Functions (root, TopLevel etc.) """
                def set_geometry(self, window, width, height, x=0, y=0):
                    window.geometry(f"{width}x{height}+{x}+{y}")
                def set_title(self, window, title="tk"):
                    window.title(title)
                def design_root(self, root, root_design=None):
                    """
                    - Design the Root Window
                    [Syntax]
                    root_design = {
                        "geometry" : {
                            "width" : n,
                            "height" : n,
                            "x" : n,
                            "y" : n
                        },
                        "title" : "tk"
                    }
                    """
                    if not (root_design == None):
                        # If there are designs
                        root_geometry = root_design["geometry"]
                        root_title = root_design["title"]

                        for k,v in root_design.items():
                            # Key: Value
                            # geometry : {
                            #   "width" : n,
                            #   "height" : n,
                            #   "x" : n,
                            #   "y" : n
                            # },
                            # title : <type string> 
                            curr_param = root_design[k]

                            if k == "geometry":
                                tk_widget_windows_util.set_geometry(root, **curr_param) # Geometry takes Dictionary
                            elif k == "title":
                                tk_widget_windows_util.set_title(root, curr_param)      # Title is a string
                                
                def generate_window(self, root_params=None, root_design=None, widget_params=None):
                    """
                    Create Window Object
                    - Design
                    - Populate with Widgets
                    - Return Window object

                    :: Params
                        root_params
                            Description:

                                - The root window parameters for tk.Tk()
                                - Leave empty or type "None" for default

                            Examples: 
                                {
                                    "screen_Name" : "",
                                    "base_Name" : "",
                                    "class_Name" : "",
                                    "useTk" : False,
                                    "sync" : False,
                                    "use" : ""
                                }

                            Type: Dictionary

                            Keys: screen_Name, base_Name, class_Name, useTk, sync, use

                            Values: String, String, String, Bool, Bool, String

                        root_design
                            Description: 

                                - The Design Specific for your root
                                - i.e. title, geometry
                                - Leave empty or type "None" for default

                            Examples:
                                {
                                    "title" : "Hello World",
                                    "geometry" : {
                                        "width" : n1,
                                        "height" : n2,
                                        "x" : n3,
                                        "y" : n4
                                    }
                                }

                            Type: Dictionary

                            Keys: title, geometry

                            Values: String, Dictionary

                        widget_params
                            Description: 

                                - Your widget type (label | button | frame etc) and 
                                    - the widget objects you are putting into the window
                                - Leave empty or type "None" for no widgets

                            Type: Dictionary

                            Keys: <widget_type> (small letters)
                                i.e.
                                    "label" => For Label
                                    "button" => For Button
                                    "frame" => For Frame

                            Values: List of widget objects
                    """

                    # Create Root window object
                    if root_params == None:
                        ws = tk.Tk()
                    else:
                        ws = tk.Tk(**root_params)

                    # Design Root window object (if any)
                    if root_design == None:
                        tk_widget_windows_util.design_root(ws)
                    else:
                        tk_widget_windows_util.design_root(ws, root_design)

                    # Create Widgets and Pack (Dynamically) (if any)
                    """
                    {
                        "widget-type" : [

                        ],
                        "widget-type" : [

                        ]
                    }
                    """
                    widgets = {}
                    if not (widget_params == None):
                        curr_widgets = {}
                        for k,v in widget_params.items():
                            # Key: widget-type
                            # Value: List of widgets
                            curr_widgets = tk_util.set_widget(ws, f"{k}", widget_params)
                            widgets[k] = curr_widgets

                    ret = {
                        "window" : ws,
                        "widgets" : widgets
                    }
                    return ret    # Return the Window and the Widgets created
            class Entry():
                """ TKinter Entry (Single-line TextBox) Functions """
                def add_text(self, entry, insert_point=tk.INSERT, str="Enter a string here"):
                    """
                    Display / add text to Entry (Single-line TextBox)

                    :: Params

                        entry
                            Description: The Entry() variable you want to use
                            Type: tk.Entry()
                        
                        insert_point
                            Description: 
                                - The index you want to add to
                                - Default: tk.INSERT
                                - To insert to the end: tk.END
                            Type: Integer

                        str
                            Description: The message you want to display
                            Type: String
                            
                    """
                    entry.insert(insert_point, str)

                    tk.Entry().insert()
            class Text():
                """ TKinter Text (Multi-line TextBox) Functions """
                def save_file(self, tb, fpath="", save_type="a+", read_start="1.0", read_end="end-1c"):
                    """
                    Test Save File when edited

                    :: Params

                        fpath
                            Description: The File Path and Name
                            Syntax:
                                - os.path.join(file_path, file_name)
                                - /path/to/file.extension
                            Type: String

                        save_type
                            Description: The save permission you want to use
                            Syntax:
                                "w" : "Write to overwrite"
                                "w+" : "Write + Read"
                                "a" : "Append"
                                "a+" : "Append + Read"
                                "r" : "read"
                                "r+" : "Read + Write"
                            Type: String

                        read_start
                            Description: 
                                - Input read's start point
                            Syntax:
                                - String should include 2 parts
                                    - "line_number.character_number"
                                        - line_number : The Line you want to read from (i.e - 1 : line 1)
                                        - character_number : The character index of line_number to start from (i.e. 0 : Character Zero)
                                    - Example:
                                        - "1.0" : Input should be read from line 1, character 0 (i.e. the very first charater)
                            Type: String

                        read_end
                            Description:
                                - Input read's ending point
                            Examples:
                                - To read until end of text box with newline
                                    - 'tk.END' to set the string to "end"
                                        - END means to read until the end of the text box is reached, but it adds a newline to the input
                                - To read until end of text box without newline
                                    - change 'tk.END' to "end-(n)c"
                                        - "-(n)c" : Deletes n characters; Empty lines means to delete n empty lines
                                            - "-1c" : Deletes 1 character
                            Type: String
                    """
                    print("Save File")

                    # Get TextBox value
                    new_val = tb.get(read_start, read_end)

                    with open(fpath, save_type) as f_save:
                        f_save.write(new_val)
                        f_save.close()

                def add_text(self, text, insert_point=tk.INSERT, str="Enter a string here", other_params=None):
                    """
                    Display / add text to Text (Multi-line TextBox)

                    :: Params

                        text
                            Description: The Text() variable you want to use
                            Type: tk.Text()
                        
                        insert_point
                            Description: 
                                - The index you want to add to
                                - Default: tk.INSERT
                                - To insert to the end: tk.END
                            Type: Integer

                        str
                            Description: The message you want to display
                            Type: String

                        other_params
                            Description: Other parameters you want to use
                            Type: Dictionary

                    """
                    if other_params == None:
                        text.insert(insert_point, str)
                    else:
                        text.insert(insert_point, str, **other_params)

                def manage_tag(self, text, action, tag_name, tag_pos, options=None):
                    """
                    Manage tags on the tk.Text() object
                    
                    - Add : Add colours, tags to specific positions in the Text() workspace
                    - Config : Configure tag options (i.e. index, background, foreground etc)

                    :: Params

                        text
                            Description: The Text() variable you want to use
                            Type: tk.Text()

                        action
                            Description: The action you want to take for the tag
                                - i.e.
                                    - Add
                                    - Configure
                            Type: String

                        tag_name
                            Description: Name of the Tag as identifier
                            Type: String

                        tag_pos
                            Description: The Index/Position of the tag
                            Type: Integer

                        options
                            Description: The Parameters you want to use for the tags
                            Type: Dictionary
                    """
                    if action == "Add":
                        # Add a tag to the Text() object
                        text.tag_add(tag_name, tag_pos, **options)
                    elif action == "Configure":
                        # Configure the tag on the Text() object
                        text.tag_config(tag_name, **options)
                    # Append more actions here

        class Positions():
            """ Python GUI TKinter Utilities - Positioning (i.e. pack(), grid())"""
            def pack_Widget(self, widget, pack_params=None):
                """
                Wrapper to pack a Widget
                :: Params
                    window : The Root Window, non-optional
                        Type: tk.Tk() type
                        Description: The Root window object
                    widget_params : The Widget Parameters
                        Type: Dictionary
                        Description: Please input in the dictionary - all the keys being the arguments of the Widget and the value being the value
                """
                # Pack widget into window
                if not (pack_params == None):
                    widget.pack(**pack_params)
                else:
                    widget.pack()

            def set_grid(self, widget, grid_parameters=None):
                """
                Place widget and 'pack' it in a grid format

                :: Params
                    widget:
                        Description: The Widget you want to place as a grid format
                        Type: widget object
                    scrollbar_params:
                        Description: The definitions of the grid() parameters
                            - Please use the same key names as the arguments
                        Type: Dictionary
                """
                widget.grid(**grid_parameters)
                
            def place_Widget(self, widget, place_parameters=None):
                """
                Place widget and 'pack' it in a grid format

                :: Params
                    widget:
                        Description: The Widget you want to place as a grid format
                        Type: widget object
                    scrollbar_params:
                        Description: The definitions of the grid() parameters
                            - Please use the same key names as the arguments
                        Type: Dictionary
                """
                widget.place(**place_parameters)

        class TTKUtil():
            """ Python TKinter TTK Utilities """
            def get_scrollbar(self, window, scrollbar_params=None):
                """
                Set Scrollbar to a Widget

                :: Params
                    master:
                        Description: The Window / Root of the GUI
                        Type: tk.Tk()
                    scrollbar_params:
                        Description: The definitions of the scrollbar's parameters
                            - Please use the same key names as the srollbar arguments
                        Type: Dictionary
                """
                scrollbar = None
                if not (window == None):
                    if not (scrollbar_params == None):
                        scrollbar = ttk.Scrollbar(window, **scrollbar_params)
                    else:
                        scrollbar = ttk.Scrollbar(window)
                return scrollbar

            class Tree():
                """ Python TKinter TTK: Tree(view) Utilities """
                tv_action_set = {
                    # [Syntax]
                    # "<action>" : "TreeView-action-command"    ( Do not put '<<>>' )
                    "select" : "<<TreeviewSelect>>",    # When selected
                    "open" : "<<TreeviewOpen>>",        # Before item opens
                    "close" : "<<TreeviewClose>>"       # Ater item closes
                }
                def get_focus(self, tv):
                    """
                    Get focused item when selected
                    :: Parmas
                        - tv 
                            Description: The TreeView Widget you want to get info from
                            Data Type: TreeView widget
                    """
                    selected = tv.focus()   # Focus on TreeView selected row
                    return selected

                def get_selected(self, tv):
                    """
                    Get selected item when selected
                    :: Parmas
                        - tv 
                            Description: The TreeView Widget you want to get info from
                            Data Type: TreeView widget
                    """
                    items = tv.selection()
                    return items
                    
                def get_item(self, tv):
                    """
                    Get Item and value when selected
                    :: Parmas
                        - tv 
                            Description: The TreeView Widget you want to get info from
                            Data Type: TreeView widget
                    """
                    selected = tv.focus()   # Focus on TreeView selected row
                    item_val = tv.item(selected,'values')  # Get selected item values
                    return item_val
                
                def set_item(self, tv, values=None):
                    """
                    Set new value to item
                    :: Parmas
                        - tv 
                            Description: The TreeView Widget you want to get info from
                            Data Type: TreeView widget
                        - values
                            Description: The items you want to use to update the TreeView item
                            Data Type: List
                    """
                    selected = self.get_focus(tv)
                    tv.item(selected, values=(values))

                def on_tree_select(self, tv):
                    items = self.get_item(tv)
                    number_of_items = len(items)
                    for i in range(number_of_items):
                        print("{} : {}".format(i, items[i]))
                    print("")
                    selected = self.get_selected(tv)
                    for i in range(len(selected)):
                        # Dictionary
                        curr_item = tv.item(selected[i])
                        # List
                        record = curr_item['values']
                        print("Records:")
                        for j in range(len(record)):
                            print("{} : {}".format(j, record[j]))
                    print("")

                def set_action(self, tv, dict_action_func=None):
                    """
                    Bind an action to a TreeView object (tv)
                    :: Params
                        tv :
                            Description: The Treeview Object you want to bind the action
                            Type: TreeView Object
                        dict_action_func :
                            Description: The events you want to bind to the TreeView (key) mapped to a list (value) with index [0] = the function you want to use and index [1] and above = the arugments
                            Type: Dictionary
                            Syntax:
                            {
                                "event" : [<name_of_function>, <arguments>]
                            }
                    """
                    number_of_actions = len(dict_action_func)
                    if not (dict_action_func == None):
                        # Loop and bind tree
                        for k,v in dict_action_func.items():
                            # Key : Event
                            # Value : [ <name_of_function>, <arguments_1>, ... <arguments_n> ]
                            curr_event = k
                            curr_event_map = v
                            curr_func_name = curr_event_map[0]  # Starting from index 0
                            curr_func_args = curr_event_map[1:] # Starting from index 1 onwards
                            tv.bind(curr_event, lambda x : curr_func_name(*curr_func_args))
                def def_col(self, window, tree=None, tree_params=None, columns=None, definitions=None, headings=None):
                    """
                    Define Tree Column Definition and Headers

                    :: Params
                        window:
                            Description: The Main GUI (root, window etc)
                            Type: tk.Tk() object
                        tree (Optional):
                            Description: The TreeView Object you want to define
                            Type: ttk.TreeView() object
                            Default: None
                        columns:
                            Description: The Columns in the Tree
                            Type: List
                            Default: None
                        definitions:
                            Description: The Definition of the Columns
                            Type: List of Dictionaries
                            Default: None
                        headings:
                            Description: The Heading of the Columns
                            Type: List of Dictionarie
                            Default: None
                        tree_params (Optional):
                            Description: TreeView Object Parameters; Not used if 'tree' is not None
                            Type: Dictionary
                            Default: None
                    :: Syntax
                    tree_columns = {
                        "columns" : [],
                        "definitions" : [
                            {
                                "column_id" : "col-name",
                                "width" : n,
                                "minwidth" : n,
                                "others" : {
                                    "stretch" : tk.NO
                                }
                            }
                        ],
                        "headings" : [
                            {
                                "column_id" : "col-name",
                                "text" : "Name",
                                "anchor" : {tk.N|tk.S|tk.E|tk.W,
                                "others" : {

                                }
                            },
                        ]
                    }
                    :: Examples
                    tree_columns = {
                        "columns" : ["one", "two"],
                        "definitions" : [
                            {
                                "column_id" : "one",
                                "width" : 270,
                                "minwidth" : 270,
                                "others" : {
                                    "stretch" : tk.NO
                                }
                            },
                            {
                                "column_id" : "two",
                                "width" : 150,
                                "minwidth" : 150,
                                "others" : {
                                    "stretch" : tk.NO
                                }
                            },
                        ],
                        "headings" : [
                            {
                                "column_id" : "one",
                                "text" : "Name",
                                "anchor" : tk.W,
                                "others" : {

                                }
                            },
                            {
                                "column_id" : "two",
                                "text" : "Path",
                                "anchor" : tk.W,
                                "others" : {

                                }
                            },
                        ]
                    }
                    """
                    
                    if tree == None:
                        # Tree does not exist
                        # ========================== #
                        # Generate Tree(view) widget #
                        # ========================== #
                        # Create Tree Object
                        if not (tree_params == None):
                            # Params specified
                            tree = ttk.Treeview(window, **tree_params)
                        else:
                            # No Params
                            tree = ttk.Treeview(window)

                    # Get Tree Information
                    tree_col = columns
                    tree_definitions = definitions
                    tree_headers = headings
                    
                    # Set Tree Columns
                    # tree["columns"] = ["one", "two", "three"]
                    tree["columns"] = tree_col

                    # ===================================================== #
                    # Dynamically Define Tree Column Definition and Header  #
                    # ===================================================== #

                    # Define Tree Columns
                    #   By defining stretch=tk.NO, the user cannot modify the width of the column
                    # tree.column("#0", width=270, minwidth=270, stretch=tk.NO)
                    # tree.column("one", width=150, minwidth=150, stretch=tk.NO)
                    # tree.column("two", width=400, minwidth=200)
                    # tree.column("three", width=80, minwidth=50, stretch=tk.NO)
                    for defn_ID in range(len(tree_definitions)):
                        curr_definition = tree_definitions[defn_ID]
                        col_id = curr_definition["column_id"]
                        col_def_width = curr_definition["width"],
                        col_def_minwidth = curr_definition["minwidth"]
                        col_other_params = curr_definition["others"]
                        tree.column(col_id, width=col_def_width, minwidth=col_def_minwidth, **col_other_params)

                    # Define Tree Headings
                    # tree.heading("#0",text="Name",anchor=tk.W)
                    # tree.heading("one", text="Date modified",anchor=tk.W)
                    # tree.heading("two", text="Type",anchor=tk.W)
                    # tree.heading("three", text="Size",anchor=tk.W)
                    for header_ID in range(len(tree_headers)):
                        curr_headings = tree_headers[header_ID]
                        col_id = curr_headings["column_id"]
                        col_text = curr_headings["text"],
                        col_anchor = curr_headings["anchor"]
                        col_other_params = curr_headings["others"]

                        # Create tree heading
                        tree.heading(col_id, text=col_text[0], anchor=col_anchor, **col_other_params) # col_text[0] : To bypass bug where curr_headings["text"] produces a tuple --> causes a column name with space to have '{}' surrounding it; Bypass : Take element 0 of the tuple (column text)
                    return tree
        class Custom():
            """
            Custom GUI Utilities / Windows wrappers
            """
            def inputbox(self, input_msg="Please enter an input: ", line="single", read_start="1.0", read_end='end-1c', root_init_params=None, root_configs=None):
                """
                InputBox (Window For User Input using tkinter)
                """

                #####################
                # Input Functions   #
                #####################

                def submit(window, tb, read_start="1.0", read_end='end-1c'):
                    """
                    Submit reply
                    
                    - Take input from TextBox
                    - write to global variable 'tmp_input'
                    
                    :: Params
                        tb :
                            Description: TextBox where user will input the reply
                            Type: tk.Text()
                    """  
                    global inputbox_value

                    # Reset
                    inputbox_value = ""

                    # Get value from TextBox
                    inputbox_value = tb.get(read_start, read_end)

                    print("Submit: {}".format(inputbox_value))

                    # Destroy window
                    window.destroy()


                #####################
                #  End Functions    #
                #####################

                if root_init_params == None:
                    root = tk.Tk()
                else:
                    root = tk.Tk(**root_init_params)

                # Design Root window object (if any)
                if root_configs == None:
                    tk_widget_windows_util.design_root(root)
                else:
                    tk_widget_windows_util.design_root(root, root_configs)

                # Create other Widgets
                lb_user_input = tk_util.create_widget_info(1, "lb_user_input", {"text" : input_msg}, {"side" : tk.LEFT})
                tb_uInput = tk_util.create_widget_info(1, "tb_uInput", {}, {"side" : tk.LEFT, "fill" : "x", "expand" : True})
                btn_submit = tk_util.create_widget_info(1, "btn_submit", {"text" : "Submit", "command" : gen_utils.map_func_arg(submit, [root, tb_uInput, read_start, read_end])}, {"side" : tk.RIGHT})

                # Append Widget Objects
                tv_widget_params = {
                    "label" : [
                        lb_user_input
                    ],
                    "button" : [
                        btn_submit
                    ]
                }

                # Add TextBox for User Input
                if line == "single":
                    # Single Line
                    tv_widget_params["entry"] = [
                        tb_uInput
                    ]
                elif line == "multi":
                    # Multi Line
                    tv_widget_params["text"] = [
                        tb_uInput
                    ]

                for k,v in tv_widget_params.items():
                    tk_util.set_widget(root, f"{k}", tv_widget_params)

                # Start Window
                root.mainloop()

######################
# MODULE / CLASS END #
######################

class ClassRoom():
    """ 
    This is a education-focused class which contains all the functions to test, learn and practice various topics im trying to read on
    """
    def __init__(self):
        # Initializer here
        print("Activating Class Room")

    def Designer(self):
        """
        A DesignerCorner / DesignTable for users to make designs
            - i.e.
                thinking of project ideas & creating them for testing
        """
        print("Design Corner")

        def filemanager():
            """
            A Simple File Manager GUI
            """
            # Functions
            def test_click(msg="Hello World"):
                print(msg)

            def select_path():
                """
                Open File Dialog & Choose a Path to view

                Search: 
                    Python TKinter file dialog choose a path
                        https://www.google.com/search?q=Python+TKinter+file+dialog+choose+a+path&oq=Python+TKinter+file+dialog+choose+a+path&aqs=chrome..69i57.3232j0j7&sourceid=chrome&ie=UTF-8

                References:
                    How to select a directory and store the location using tkinter in Python
                        https://stackoverflow.com/questions/11295917/how-to-select-a-directory-and-store-the-location-using-tkinter-in-python
                """
                fdir = filedialog.askdirectory()
                return fdir

            ##################
            # Test Functions #
            ##################
                
            def create_file(tv):
                """
                File Manager Function in {
                    C : Create,
                    R : Read,
                    U : Update,
                    D : Delete
                ]
                - Create file
                """
                new_files = {}  # To store all new files; syntax: { "file-name" : "file-path" }
                curr_filename = ""
                curr_filepath = ""

                # Create New File
                print("Creating new file...")

                inputbox_params = {
                    "label" : {
                        "text" : "File Name: ",
                    },
                    "root" : {
                        "init" : {},
                        "configs" : {"title" : "Input", "geometry" : {"width" : 200, "height" : 200, "x" : 0, "y" : 0}}
                    }
                }
                tk_customs_GUI.inputbox(input_msg=inputbox_params["label"]["text"], root_init_params=inputbox_params["root"]["init"], root_configs=inputbox_params["root"]["configs"])
                print("File name: {}".format(inputbox_value))

                # Append file to new_files
                new_files[curr_filename] = curr_filepath

                return new_files

            def read_file(tv):
                """
                File Manager Function in {
                    C : Create,
                    R : Read,
                    U : Update,
                    D : Delete
                ]
                - Read file
                """

                # Intrernal Functions 
                
                contents = []   # Content of File
                selected_row_Items = tv_util.get_item(tv)
                if len(selected_row_Items) != 0:
                    # Have Items
                    print("Selected Row items: {}".format(selected_row_Items))
                    selected_fname = selected_row_Items[3]
                    selected_fpath = selected_row_Items[4]

                    print("Reading file...")

                    fopen_params={
                        "mode" : "r+"
                    }
                    # Open file to read
                    # with open("{}/{}".format(selected_fpath, selected_fname), **fopen_params) as fread:
                    with open(selected_fpath, **fopen_params) as fread:
                        # Read file to content
                        line = fread.readline()
                        while line:
                            contents.append(line)
                            line = fread.readline()
                        fread.close()

                    msg = ""
                    number_of_lines = len(contents)
                    print("Number of Lines: {}".format(number_of_lines))
                    for line in contents:
                        msg+=line

                    # Display contents in new window with labels
                    returns = tk_widget_windows_util.generate_window(
                        {}, 
                        {
                            "title" : "File Contents", 
                            "geometry" : {
                                "width" : 720, 
                                "height" : 360, 
                                "x" : 0, 
                                "y" : 0
                            }
                        }, 
                        {
                            "label" : [
                                tk_util.create_widget_info(1, "lb_Header", {"text" : selected_fname}, {"fill" : "x", "expand" : False}),
                                tk_util.create_widget_info(2, "lb_fname", {"text" : "File Name: "}, {"side" : tk.TOP, "anchor" : tk.NW}),
                            ],
                            "entry" : [
                                tk_util.create_widget_info(1, "tb_fname", {}, {"side" : tk.TOP, "anchor" : tk.NW, "fill" : "x", "expand" : True}),
                            ],
                            "button" : [
                                tk_util.create_widget_info(1, "btn_save_changes", {"text" : "Save Changes"}, {"side" : "top"})
                            ],
                            "text" : [
                                tk_util.create_widget_info(2, "tb_contents", {}, {"fill" : "both", "expand" : True})
                            ]
                        }
                    )

                    ws_display_Contents = returns["window"]
                    widgets = returns["widgets"]

                    for k,v in widgets.items():
                        print("Widget: {} | {}".format(k,v))

                    # Retrieve Widgets
                    # lb_headers = widgets["lb_Header"]
                    btn_save_changes = widgets["button"]["btn_save_changes"]
                    tb_fname = widgets["entry"]["tb_fname"]
                    tb_contents = widgets["text"]["tb_contents"]

                    # Get Value of textbox
                    fname = tb_fname.get()

                    if fname == "":
                        # Default
                        fname = "New_file"

                    #################################
                    #   Set Features to Widgets     #
                    #################################

                    # Set Command for Button                    
                    tk_util.widget_config(
                        btn_save_changes, 
                        {
                            "command" : gen_utils.map_func_arg(
                                tk_widget_text_util.save_file, 
                                [
                                    tb_contents, 
                                    os.path.join(
                                        selected_fpath, 
                                        fname
                                    )
                                ]
                            )
                        }
                    )

                    # Set text
                    tk_widget_text_util.add_text(tb_contents, tk.INSERT, msg)

                    #################################
                    #   Set ScrollBar to tk.Text()  #
                    #################################

                    # Set widget
                    text_scrollbar_param = {
                        "text" : {
                            "object" : tb_contents,
                            "params" : {
                                "scrollbar" : [
                                    tk_util.create_widget_info(0, "sb_text", {"orient" : tk.VERTICAL, "command" : tb_contents.yview}, {"side" : tk.RIGHT, "fill" : tk.BOTH})
                                ]
                            }
                        }
                    }
                    widgets = tk_util.multiset_widget(text_scrollbar_param)

                    # Get Required Objects
                    scrollbar = widgets["scrollbar"]["sb_text"]

                    # Set Scrollbar configuration to Text
                    text_config_params = {
                        "yscroll" : scrollbar.set
                    }
                    tk_util.widget_config(tb_contents, text_config_params)

                    # Start Window
                    tk_util.start(ws_display_Contents)
                else:
                    print("No row selected.")

                return contents     

            def update_file(tv):
                """
                File Manager Function in {
                    C : Create,
                    R : Read,
                    U : Update,
                    D : Delete
                ]
                - Update file
                """

                # Get path of selected file
                selected_row_Items = tv_util.get_item(tv)
                selected_fname = selected_row_Items[3]
                selected_fpath = selected_row_Items[4]

                # Update Selected File
                print("Updating selected files...")

                # Get new values
                new_values = tk_customs_GUI.inputbox()
                print("New Values: {new_values}")

                # write contents into file


            def delete_file(tv):
                """
                File Manager Function in {
                    C : Create,
                    R : Read,
                    U : Update,
                    D : Delete
                ]
                - Delete file
                """
                print("Delete selected file...")

                # Get path of selected file
                selected_row_Items = tv_util.get_item(tv)
                selected_fname = selected_row_Items[3]
                selected_fpath = selected_row_Items[4]

                print("File Path: {}".format(selected_fpath))

                # Delete selected file


            def open_path_in_treeview(window):
                """
                Opens the selected path and all its files in TreeView
                """
                fdir = select_path()
                print(f"File Directory: {fdir}")

                #############################
                # GUI Page #2 : TreeView    #
                #############################
                tree_columns = {
                    "columns" : ["one", "two", "three", "four", "five"],
                    "definitions" : [
                        {"column_id" : "one" ,"width" : 60,"minwidth" : 60,"others" : {"stretch" : tk.NO}},
                        {"column_id" : "two","width" : 150,"minwidth" : 10,"others" : {"stretch" : tk.NO}},
                        {"column_id" : "three","width" : 60,"minwidth" : 10,"others" : {"stretch" : tk.NO}},
                        {"column_id" : "four","width" : 150,"minwidth" : 10,"others" : {"stretch" : tk.NO}},
                        {"column_id" : "five","width" : 250,"minwidth" : 10,"others" : {"stretch" : tk.YES}},
                    ],
                    "headings" : [
                        {"column_id" : "one" ,      "text" : "ROW_ID",      "anchor" : tk.W,    "others" : {}},
                        {"column_id" : "two",       "text" : "Type",        "anchor" : tk.W,    "others" : {}},
                        {"column_id" : "three",     "text" : "Extension",   "anchor" : tk.W,    "others" : {}},
                        {"column_id" : "four",      "text" : "Name",        "anchor" : tk.W,    "others" : {}},
                        {"column_id" : "five",      "text" : "Path",        "anchor" : tk.W,    "others" : {}},
                    ]
                }
                tree_param = {"columns" : tree_columns["columns"],  "show" : "headings"}
                tree = tv_util.def_col(root, None, tree_param, **tree_columns)

                # Populate Tree
                """
                - Get all files and folders in directory
                """
                tree_values = []
                files = os.listdir(fdir)    # List
                number_of_files = len(files)
                for f_ID in range(number_of_files):
                    # Populate Rows
                    f = files[f_ID]
                    full_path = os.path.join(fdir, f)                       # Get full path of the file - selected file directory joint with the file name
                    f_type = path_utils.get_pathtype(full_path)             # Check if path is file or folder
                    f_ext = path_utils.get_extension(full_path)             # Get File extension
                    new_row = [f_ID, f_type, f_ext, f, full_path]           # Design new row
                    tree_values.append(new_row)                             # Append List because each row is a tuple / list

                    # Insert data to TreeView
                    number_of_values = len(tree_values)
                    for v_ID in range(number_of_values):
                        curr_val = tree_values[v_ID]
                        print("Current Value: {}".format(curr_val))
                        tree.insert("", index=tk.END, values=curr_val)

                    # Reset Tree Values
                    tree_values = []


                # Pack Tree Object
                tree_pack = {"fill" : tk.BOTH,"expand" : True}
                tree.pack(**tree_pack)

                # Create other Widgets
                root_widget_params = {
                    "label" : [
                        tk_util.create_widget_info(1, "lb_fname", {"text" : "Path: "}, {"side" : tk.LEFT, "anchor" : tk.NW}),
                        tk_util.create_widget_info(2, "lb_fname", {"text" : fdir}, {"side" : tk.LEFT, "anchor" : tk.NW})  
                    ],
                    "button" : [
                        tk_util.create_widget_info(1, "btn_create_file", {"text" : "Add New Files", "command" : gen_utils.map_func_arg(create_file, [tree])}, {"side" : tk.LEFT, "anchor" : tk.SW,}),
                        tk_util.create_widget_info(2, "btn_read_file", {"text" : "Read File", "command" : gen_utils.map_func_arg(read_file, [tree])}, {"side" : tk.LEFT, "anchor" : tk.SW}),
                        tk_util.create_widget_info(3, "btn_update_file", {"text" : "Update File", "command" : gen_utils.map_func_arg(update_file, [tree])}, {"side" : tk.LEFT, "anchor" : tk.SW}),
                        tk_util.create_widget_info(4, "btn_delete_file", {"text" : "Delete File", "command" : gen_utils.map_func_arg(delete_file, [tree])}, {"side" : tk.LEFT, "anchor" : tk.SW}),
                    ],
                }

                # Create Tree-linked widgets
                tv_widget_params = {
                    "scrollbar" : [
                        tk_util.create_widget_info(1, "scroll_tree_main", {"orient" : tk.VERTICAL, "command" : tree.yview}, {"side" : tk.RIGHT, "fill" : tk.BOTH})
                    ]
                }

                # Set widgets
                widgets = {}
                windows = {
                    "root" : {
                        "object" : root, 
                        "params" : root_widget_params
                    },
                    "tree" : {
                        "object" : tree, 
                        "params" : tv_widget_params
                    },
                }
                number_of_windows = len(windows)
                
                ### MANUAL SET ###
                # for k,v in root_widget_params.items():
                #     widgets[k] = tk_util.set_widget(root, f"{k}", root_widget_params)

                # # Set Tree-linked widgets
                # for k,v in tv_widget_params.items():
                #     widgets[k] = tk_util.set_widget(tree, f"{k}", tv_widget_params)
                ##################

                ### Automated set ###
                widgets = tk_util.multiset_widget(windows)

                # Get Required Objects
                scrollbar = widgets["scrollbar"]["scroll_tree_main"]

                # Set Scrollbar configuration to Tree
                tree_config_params = {
                    "yscroll" : scrollbar.set
                }
                tk_util.widget_config(tree, tree_config_params)


            #########################
            # GUI Page #1 : Root    #
            #########################
            # Create Root Window
            root_params = {"screenName" : "Hello World"}
            root = tk_util.create_root(root_params)

            # Design Root Window
            root_design = {
                "title" : "File Manager",
                "geometry" : {
                    "width" : 800,
                    "height" : 800,
                    "x" : 300,
                    "y" : 300
                },
            }
            tk_widget_windows_util.design_root(root, root_design)

            # Design Individual Widget Parameters

            ### Labels ###  
            lb_hello_world_Params = {
                0 : {
                    "ROW_ID" : 0,
                    "id" : "lb_hello_world",
                    "widget_params" : {"text" : "Welcome! To start the file manager, please press the button to begin choosing a directory"},
                    "pack_params" : {"side" : tk.TOP, "anchor" : tk.NW}, 
                }
            }

            # Create Widgets and Pack (Dynamically)
            widget_params = {
                "label" : [
                    tk_util.create_widget_info(**lb_hello_world_Params[0]),
                ],
                "button" : [
                    tk_util.create_widget_info(0, "btn_Click", {"text" : "Choose Directory!", "command" : gen_utils.map_func_arg(open_path_in_treeview, [root])}, {"fill" : "y", "expand" : False}),
                ],
                "frame" : [
                    tk_util.create_widget_info(0, "frame_Main", None, {"fill" : "both", "expand" : True})
                ]
            }
            # tk_util.set_widget(root, "label", widget_params)
            # tk_util.set_widget(root, "frame", widget_params)
            for k,v in widget_params.items():
                tk_util.set_widget(root, f"{k}", widget_params)

            # Start GUI main window
            tk_util.start(root)


        def run(RUN_ID=0):
            """
            Run Learning Room
            """
            RUN_ID = int(RUN_ID)    # Convert String input to integer
            if RUN_ID == 1:
                filemanager()
            else:
                print("Invalid Run ID")

        run(sys.argv[1])

    def LearningRoom(self):
        print("Learning Room")
        
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
            root = tk_util.create_root()

            # Create Widgets
            # lb_HelloWorld = tk.Label(root, text="Hello World")  
            lb_HelloWorld = tk_util.create_Label(root, lb_HelloWorld_params)    # Create a Text Label Widget

            # Pack Widgets into the Window
            # lb_HelloWorld.pack(padx=20, pady=20)          
            tk_util.set_Label(root, lb_HelloWorld, pack_params)

            # Start Window
            tk_util.start(root)

        def tk_2():
            """
            TK GUI Test 2 : tk.Frame GUI Class

            - Testing dictionary-initialization system
            """

            # --- Input
            # [Variables]

            # Initialize
            label_obj = []      # empty container to hold all lists obtained in widget_params ["label"]
            frame_obj = []      # empty container to hold all lists obtained in widget_params ["frame"]
            tree_parents = {}   # container to hold all parents created

            # Local Variables
            root_params = {}
            widget_params = {
                # Place your Widget Parameters Here
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
                    tk_util.create_widget_info(0, "lb_HelloWorld", {"text" : 720}, {"fill" : "x"}),
                    tk_util.create_widget_info(1, "lb_Test", {"text" : 480}, {"fill" : "y"})
                ],
                "frame" : [
                    tk_util.create_widget_info(0, "frame_Main", None, {"fill" : "both", "expand" : True})
                ]
            }
            root = tk_util.create_root(root_params)

            # Tree Column Information
            # - used to make TreeView dynamic modification
            """
            - This design is for the tree column size, definitions and headers
            [Syntax]
            {
                "columns" : ["column_1", "column_2", ... "column_n"],
                "definitions" : [
                    {
                        "column_id" : "<column_name>",
                        "width" : x1,
                        "minwidth" : x2,
                        "others" : {
                            # "stretch" : tk.NO
                        }
                    },
                ],
                "headings" : [
                    {
                        "column_id" : "<column_name>",
                        "text" : "Column Text",
                        "anchor" : {tk.W|tk.N|tk.S|tk.E},
                        "others" : {

                        }
                    },
                ]
            }
            """
            tree_columns = {
                "columns" : ["one", "two", "three"],
                "definitions" : [
                    {
                        "column_id" : "#0",
                        "width" : 270,
                        "minwidth" : 270,
                        "others" : {
                            "stretch" : tk.NO
                        }
                    },
                    {
                        "column_id" : "one",
                        "width" : 150,
                        "minwidth" : 150,
                        "others" : {
                            "stretch" : tk.NO
                        }
                    },
                    {
                        "column_id" : "two",
                        "width" : 400,
                        "minwidth" : 200,
                        "others" : {

                        }
                    },
                    {
                        "column_id" : "three",
                        "width" : 80,
                        "minwidth" : 50,
                        "others" : {
                            "stretch" : tk.NO
                        }
                    },
                ],
                "headings" : [
                    {
                        "column_id" : "#0",
                        "text" : "Name",
                        "anchor" : tk.W,
                        "others" : {

                        }
                    },
                    {
                        "column_id" : "one",
                        "text" : "Date modified",
                        "anchor" : tk.W,
                        "others" : {

                        }
                    },
                    {
                        "column_id" : "two",
                        "text" : "Type",
                        "anchor" : tk.W,
                        "others" : {

                        }
                    },
                    {
                        "column_id" : "three",
                        "text" : "Size",
                        "anchor" : tk.W,
                        "others" : {

                        }
                    },
                ]
            }

            # Tree Value Information
            # - used to make inserting of rows dynamic
            """
            - This design is for the tree values / records
            [Syntax]
            {
                "id" : "<variable_name>",
                "type" : "nest",    # nest | single
                "parent" : "",
                "index" : 1,
                "text" : "Folder 1",
                "values" : (
                    "yyyy-mm-dd HHMMH",
                    "file-type",
                    "size"
                ),
                "others" : {
                    
                }
            }
            """
            tree_values = [
                {
                    "id" : "folder1",
                    "type" : "nest",
                    "parent" : "",
                    "index" : 1,
                    "text" : "Folder 1",
                    "values" : (
                        "{}".format("2017-06-23 1105H"),
                        "{}".format("Folder"),
                        "{}".format("NIL")
                    ),
                    "others" : {

                    }
                },
                {
                    "id" : "file_myNotepad",
                    "type" : "nest",
                    "parent" : "folder1",
                    "index" : 1,
                    "text" : "File 1",
                    "values" : (
                        "{}".format("2021-07-24 1147H"),
                        "{}".format("File"),
                        "{}".format("NIL")
                    ),
                    "others" : {

                    }
                },
                {
                    "id" : "file_rootNote",
                    "type" : "single",    # nest | single
                    "parent" : "",
                    "index" : 1,
                    "text" : "Root File 1",
                    "values" : (
                        "{}".format("2021-07-24 1151H"),
                        "{}".format("File"),
                        "{}".format("NIL")
                    ),
                    "others" : {
                        
                    }
                }
            ]

            # --- Processing

            # Widget Lists
            # labels = widget_params["label"]
            # number_of_Labels = len(labels)
            # frames = widget_params["frame"]
            # number_of_Frames = len(frames)

            # Loop and create widgets
            # for i in range(number_of_Labels):
            #     # Get Current Widget object (List)
            #     curr_Label = labels[i]
                
            #     # Get Params (Dictionary)
            #     curr_widget_param = curr_Label["widget_params"]
            #     curr_pack_param = curr_Label["pack_params"]

            #     # Create Label Object
            #     curr_obj_Label = tk_util.create_Label(root, curr_widget_param)

            #     # Set Label Object
            #     tk_util.set_Label(root, curr_obj_Label, curr_pack_param)

            #     # Append new label to list
            #     label_obj.append(curr_obj_Label)

            # for i in range(number_of_Frames):
            #     # Get Current Widget object (List)
            #     curr_Frame = frames[i]
                
            #     # Get Params (Dictionary)
            #     curr_widget_param = curr_Frame["widget_params"]
            #     curr_pack_param = curr_Frame["pack_params"]

            #     # Create new Object
            #     curr_obj_Frame = tk_util.create_Frame(root, curr_widget_param)

            #     # Set Object
            #     tk_util.set_Frame(curr_obj_Frame, curr_pack_param)

            #     # Append new widget to list
            #     frame_obj.append(curr_obj_Frame)
            tk_util.set_widget(root, "label", widget_params)
            tk_util.set_widget(root, "frame", widget_params)

            """ Tree 
            # Manual Method
            # Level 1
            # Create Folder
            folder1 = tree.insert("", 1, text="Folder 1", values=("23-Jun-17 11:05","File folder",""))
            # Next Row in the root folder
            tree.insert("", 2, text="text_file.txt", values=("23-Jun-17 11:25","TXT file","1 KB"))
            
            # Level 2
            # Place inside folder [folder_1]
            # [Syntax]
            #   tree_obj.insert(parent (leave "" for root), position_index (type 'end' for last position), text="Text to display", values=("Column_2", "Column_3", "Column4",... "Column(n)")))
            # [Notes]
            #   eval("<name_of_variable>") allows you to get the variable name based off the string
            tree.insert(eval("folder1"), "end", text="photo1.png", values=("23-Jun-17 11:28","PNG file","2.6 KB"))
            tree.insert(eval("folder1"), "end", text="photo2.png", values=("23-Jun-17 11:29","PNG file","3.2 KB"))
            tree.insert(eval("folder1"), "end", text="photo3.png", values=("23-Jun-17 11:30","PNG file","3.1 KB"))
            """

            # ========================== #
            # Generate Tree(view) widget #
            # ========================== #

            # Create Tree(view) widget
            tree = ttk.Treeview(root)

            # Get Tree Information
            tree_col = tree_columns["columns"]
            tree_definitions = tree_columns["definitions"]
            tree_headers = tree_columns["headings"]
            
            # Set Tree Columns
            # tree["columns"] = ["one", "two", "three"]
            tree["columns"] = tree_col

            # ===================================================== #
            # Dynamically Define Tree Column Definition and Header  #
            # ===================================================== #

            # Define Tree Columns
            #   By defining stretch=tk.NO, the user cannot modify the width of the column
            # tree.column("#0", width=270, minwidth=270, stretch=tk.NO)
            # tree.column("one", width=150, minwidth=150, stretch=tk.NO)
            # tree.column("two", width=400, minwidth=200)
            # tree.column("three", width=80, minwidth=50, stretch=tk.NO)
            for defn_ID in range(len(tree_definitions)):
                curr_definition = tree_definitions[defn_ID]
                col_id = curr_definition["column_id"]
                col_def_width = curr_definition["width"],
                col_def_minwidth = curr_definition["minwidth"]
                col_other_params = curr_definition["others"]
                tree.column(col_id, width=col_def_width, minwidth=col_def_minwidth, **col_other_params)

            # Define Tree Headings
            # tree.heading("#0",text="Name",anchor=tk.W)
            # tree.heading("one", text="Date modified",anchor=tk.W)
            # tree.heading("two", text="Type",anchor=tk.W)
            # tree.heading("three", text="Size",anchor=tk.W)
            for header_ID in range(len(tree_headers)):
                curr_headings = tree_headers[header_ID]
                col_id = curr_headings["column_id"]
                col_text = curr_headings["text"],
                col_anchor = curr_headings["anchor"]
                col_other_params = curr_headings["others"]

                # Create tree heading
                tree.heading(col_id, text=col_text[0], anchor=col_anchor, **col_other_params) # col_text[0] : To bypass bug where curr_headings["text"] produces a tuple --> causes a column name with space to have '{}' surrounding it; Bypass : Take element 0 of the tuple (column text)

            # ============================ #
            # Dynamically Insert some Rows #
            # ============================ #

            # Loop through tree_values and insert to tree object
            # if parent == "" : The tree is a folder, append to dictionary 'tree_parents'
            for row_id in range(len(tree_values)):
                curr_row = tree_values[row_id]  # Get current row
                var_ID = curr_row["id"]      # Get variable name
                item_type = curr_row["type"]
                parent = curr_row["parent"]
                index = curr_row["index"]
                text = curr_row["text"]
                values = curr_row["values"]
                other_params = curr_row["others"]

                # ========== For Debugging ==========
                # print("Row ID: {}".format(row_id))
                # print("Current Row: {}".format(curr_row))
                # print("Item Type: {}".format(item_type))
                # print("Parent: {}".format(parent))
                # print("Index: {}".format(index))
                # print("Text: {}".format(text))
                # print("Values: {}".format(values))
                # print("Tree Parents: {}".format(tree_parents))
                # print("")

                # Insert Trees
                if item_type == "single":
                    # Single Files in its row
                    if parent == "":
                        tree.insert("", index, text=text, values=values, **other_params)
                    else:
                        tree.insert(eval(parent), index, text=text, values=values, **other_params)
                elif item_type == "nest":
                    # Nested Files (under folders / folder roots) in its row
                    if parent == "":
                        # Is a folder under 'root'
                        new_folder = tree.insert("", index, text=text, values=values, **other_params)
                        tree_parents[var_ID] = new_folder   # Set the variable's ID to the key and the variable contents to the value of the parents dictionary
                    else:
                        if parent in tree_parents.keys():
                            # If parent is in tree_parents list
                            # eval(parent) : Using eval() to get the variable that has the same name as the string
                            parent = tree_parents[parent]
                            tree.insert(parent, index, text=text, values=values, **other_params)  # tree_parents's keys are the var_ID of the parent variables while the values are the variables itself
                    
            # Pack Tree Widget
            # tree.pack(side=tk.TOP, fill=tk.X)
            tree_pack_params = {
                "side" : tk.TOP,
                "fill" : tk.X
            }
            tk_pos_util.pack_Widget(tree, tree_pack_params)

            # Bind action to Tree
            # tree.bind("<<{}>>".format(action_set["select"]), tv_util.get_item(tree))
            
            """
            Search:
            Python tree.bind() how to use a function with arguments
                https://www.google.com/search?q=Python+tree.bind()+how+to+use+a+function+with+arguments&oq=Python+tree.bind()+how+to+use+a+function+with+arguments&aqs=chrome..69i57.7640j0j7&sourceid=chrome&ie=UTF-8

            python lambda function
                https://www.google.com/search?q=python+lambda+function&oq=Python+lambda&aqs=chrome.1.0i433j0l9.4535j0j7&sourceid=chrome&ie=UTF-8
                
            Resources:
            Tkinter binding a function with arguments to a widget
                https://stackoverflow.com/questions/7299955/tkinter-binding-a-function-with-arguments-to-a-widget

            How to Use Python Lambda Functions
                https://realpython.com/python-lambda/
            """

            # tree.bind(tk_util.widget_action_set["double-left-click"], gen_utils.map_func_arg(tv_util.on_tree_select, [tree]))  # use lambda to map functions with parameters; lambda tv=tree : tv_util.on_tree_select(tv)
            tv_event_bind = {
                tk_util.widget_action_set["double-left-click"] : [tv_util.on_tree_select, tree]
            }
            tv_util.set_action(tree, tv_event_bind)

            tk_util.start(root)
            # root.mainloop()

            # --- Output

        def tk_3():
            """
            TK GUI Test 3 : ScrollBar Test

            - Testing dictionary-initialization system
            """
            root = tk.Tk()
            root.title("Treeview with ScrolBar Demo")
            root.geometry("620x200")

            """ Tree """

            # Define Columns
            columns = ('#1', '#2', '#3')
            
            # Create Trees
            tree = ttk.Treeview(root, columns=columns, show='headings')

            # Define Headings
            tree.heading('#1', text="First Name")
            tree.heading('#2', text="Last Name")
            tree.heading('#3', text="Email")

            # Generate Sample Data
            contacts = []
            min = 1
            size = 100
            for i in range(min, size):
                new_data = ["User [{}]".format(i), "Name [{}]".format(i), "email_1{}@email.com".format(i)]
                contacts.append(new_data)   # Append List because each row is a tuple / list

            # Insert data to TreeView
            number_of_contacts = len(contacts)
            for c in range(number_of_contacts):
                curr_contact = contacts[c]
                tree.insert("", index=tk.END, values=curr_contact)

            # Bind event
            tree.bind(
                tk_util.widget_action_set["double-left-click"], 
                gen_utils.map_func_arg(tv_util.on_tree_select, [tree])
            )          

            # Set widget to grid position with {tree_grid_params} parameters
            tree_grid_params = {
                "row" : 0,
                "column" : 0,
                "sticky" : "nsew"
            }
            tk_pos_util.set_grid(tree, tree_grid_params)

            # =============== #
            # Add a scrollbar #
            # =============== #

            # Create Scrollbar
            scrollbar_params = {
                "orient" : tk.VERTICAL,
                "command" : tree.yview
            }
            scrollbar_grid_params = {
                "row" : 0,
                "column" : 1,
                "sticky" : 'ns'
            }
            scrollbar = ttk_util.get_scrollbar(root, scrollbar_params)  # Hook scrollbar to 'root' and return scrollbar object

            # Set Scrollbar configuration to Tree
            tree_config_params = {
                "yscroll" : scrollbar.set
            }
            tk_util.widget_config(tree, tree_config_params)

            # Set the Scrollbar into the grid position with {scrollbar_grid_params} parameters
            tk_pos_util.set_grid(scrollbar, scrollbar_grid_params)

            # Run app
            tk_util.start(root)

        def run(RUN_ID=0):
            """
            Run Learning Room
            """
            RUN_ID = int(RUN_ID)    # Convert String input to integer
            if RUN_ID == 1:
                tk_1()
            elif RUN_ID == 2:
                tk_2()
            elif RUN_ID == 3:
                tk_3()
            else:
                print("Invalid Run ID")

        run(sys.argv[1])

    def PracticeGround(self):
        print("Practice Ground")

    def TestBench(self):
        print("Test Bench")

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
    classroom = ClassRoom()
    gen_utils = GeneralUtils()
    path_utils = PathUtils()
    gui_utils = GUIUtils()
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
    print("Setting up...")
    # Setting / Getting command line arguments
    gen_utils.get_argv()

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

