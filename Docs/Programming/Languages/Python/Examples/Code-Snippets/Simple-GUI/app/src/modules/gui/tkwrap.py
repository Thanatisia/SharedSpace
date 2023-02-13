### In-built Modules ###
import os
import sys
import subprocess
import math

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
from tkinter import Entry, YView, filedialog, ttk, messagebox
from tkinter.constants import NW, SW, VERTICAL

# Others
import modules.general as general
import modules.paths as paths



########################
# MODULE / CLASS START #
########################

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
                    Syntax: {'label' : Label, 'frame' : Frame, 'canvas' : Canvas, 'button' : Button, 'treeview' : TreeView, 'notebook' : Notebook} etc.
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
                    Options:
                        - .pack():
                            expand
                            fill
                        - .grid():
                            column
                            columnspan
                            in
                            ipadx
                            ipady
                            padx
                            pady
                            row
                            rowspan
                            sticky
                        - .place()
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
                def create_widget_obj(widget, window, curr_widget_param=None):
                    curr_obj = ""
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
                    elif widget == "notebook":  # For Notebook (aka TabControl)
                        curr_obj = ttk.Notebook(window, **curr_widget_param)
                    return curr_obj
                curr_obj = create_widget_obj(widget, window, curr_widget_param)

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
                        widgets[k_widget_type] = self.set_widget(curr_window_object, "{}".format(k_widget_type), curr_widget_params)
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
                def __init__(self):
                    self.gui_utils = GUIUtils()
                    self.tk_util = self.gui_utils.TKGUI()

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
                                self.set_geometry(root, **curr_param) # Geometry takes Dictionary
                            elif k == "title":
                                self.set_title(root, curr_param)      # Title is a string
                                
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
                        self.design_root(ws)
                    else:
                        self.design_root(ws, root_design)

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
                            curr_widgets = self.tk_util.set_widget(ws, f"{k}", widget_params)
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

            class Notebook():
                """ 
                TKinter TTK Notebook (aka Tab Controls) Functions here 
                
                    - Tab Controls in TKinter are known as Tab Controls
                """
                def create_tabcontrol(self, window, tabcontrol_params=None):
                    """
                    Create a new TabControl (Notebook) object

                    - Return Type: ttk.Notebook()
                    """
                    if not (tabcontrol_params == None):
                        # If tabcontrol_params is not empty
                        new_tabcontrol = ttk.Notebook(window, **tabcontrol_params)
                    else:
                        new_tabcontrol = ttk.Notebook(window)
                    return new_tabcontrol


                def create_tab(self, window, tab_control, tab_widget, tab_add_Params=None):
                    """
                    Create a tab in the Notebook (Tab Control)

                    - Return Type: None

                    :: Params

                        window
                            Description: The Window/Root of the Application
                            Type: tk.Tk()
                        
                        tab_control
                            Description: The Tab Control (Notebook) object you want to add tabs to
                            Type: ttk.Notebook()
                        
                        tab_widget
                            Description: The Tab widget you want to add to the tab
                            Syntax: ttk.Frame() etc.
                            Type: Widget

                        tab_add_Params
                            Description: The options supported by add() method
                            Options:
                                sticky
                                state
                                padding
                                text
                                image
                                compound
                                underline
                            Type: Dictionary
                    """
                    if not (window == None):
                        # If Window is not Empty
                        if not (tab_control == None):
                            # If tab_control is not Empty
                            if not (tab_widget == None) and not (tab_add_Params == None):
                                # If Tab you want to add is not Empty
                                tab_control.add(tab_widget, **tab_add_Params)

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
            def __init__(self):
                self.gen_utils = general.GeneralUtils()
                self.path_utils = paths.PathUtils()
                self.gui_utils = GUIUtils()
                self.tk_util = self.gui_utils.TKGUI()
                self.tk_widget_windows_util = self.tk_util.Widgets.Window()

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
                    self.tk_widget_windows_util.design_root(root)
                else:
                    self.tk_widget_windows_util.design_root(root, root_configs)

                # Create other Widgets
                lb_user_input = self.tk_util.create_widget_info(1, "lb_user_input", {"text" : input_msg}, {"side" : tk.LEFT})
                tb_uInput = self.tk_util.create_widget_info(1, "tb_uInput", {}, {"side" : tk.LEFT, "fill" : "x", "expand" : True})
                btn_submit = self.tk_util.create_widget_info(1, "btn_submit", {"text" : "Submit", "command" : self.gen_utils.map_func_arg(submit, [root, tb_uInput, read_start, read_end])}, {"side" : tk.RIGHT})

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
                    self.tk_util.set_widget(root, f"{k}", tv_widget_params)

                # Start Window
                root.mainloop()

######################
# MODULE / CLASS END #
######################

