### In-built Modules ###
import os
import sys
import subprocess
import math

### External Modules ###
import modules.general as general
from modules.general import *
import modules.paths as paths
import modules.db.sqlite_util as db_sqlite
from modules.db.sqlite_util import *
import modules.gui.tkwrap as tkwrap
from modules.gui.tkwrap import *

class ClassRoom():
    """ 
    This is a education-focused class which contains all the functions to test, learn and practice various topics im trying to read on
    """
    def __init__(self):
        # Initializer here
        print("Activating Class Room")
        self.gen_utils = general.GeneralUtils()
        self.path_utils = paths.PathUtils()
        self.gui_utils = tkwrap.GUIUtils()
        self.tk_util = self.gui_utils.TKGUI()
        self.tk_pos_util = self.tk_util.Positions()
        self.tk_widget_util = self.tk_util.Widgets()
        self.tk_widget_entry_util = self.tk_widget_util.Entry()
        self.tk_widget_text_util = self.tk_widget_util.Text()
        self.tk_widget_windows_util = self.tk_widget_util.Window()
        self.ttk_util = self.tk_util.TTKUtil()
        self.tv_util = self.ttk_util.Tree()
        self.tk_customs_GUI = self.tk_util.Custom()
		
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
                self.tk_customs_GUI.inputbox(input_msg=inputbox_params["label"]["text"], root_init_params=inputbox_params["root"]["init"], root_configs=inputbox_params["root"]["configs"])
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
                selected_row_Items = self.tv_util.get_item(tv)
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
                    returns = self.tk_widget_windows_util.generate_window(
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
                                self.tk_util.create_widget_info(1, "lb_Header", {"text" : selected_fname}, {"fill" : "x", "expand" : False}),
                                self.tk_util.create_widget_info(2, "lb_fname", {"text" : "File Name: "}, {"side" : tk.TOP, "anchor" : tk.NW}),
                            ],
                            "entry" : [
                                self.tk_util.create_widget_info(1, "tb_fname", {}, {"side" : tk.TOP, "anchor" : tk.NW, "fill" : "x", "expand" : True}),
                            ],
                            "button" : [
                                self.tk_util.create_widget_info(1, "btn_save_changes", {"text" : "Save Changes"}, {"side" : "top"})
                            ],
                            "text" : [
                                self.tk_util.create_widget_info(2, "tb_contents", {}, {"fill" : "both", "expand" : True})
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
                    self.tk_util.widget_config(
                        btn_save_changes, 
                        {
                            "command" : self.gen_utils.map_func_arg(
                                self.tk_widget_text_util.save_file, 
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
                    self.tk_widget_text_util.add_text(tb_contents, tk.INSERT, msg)

                    #################################
                    #   Set ScrollBar to tk.Text()  #
                    #################################

                    # Set widget
                    text_scrollbar_param = {
                        "text" : {
                            "object" : tb_contents,
                            "params" : {
                                "scrollbar" : [
                                    self.tk_util.create_widget_info(0, "sb_text", {"orient" : tk.VERTICAL, "command" : tb_contents.yview}, {"side" : tk.RIGHT, "fill" : tk.BOTH})
                                ]
                            }
                        }
                    }
                    widgets = self.tk_util.multiset_widget(text_scrollbar_param)

                    # Get Required Objects
                    scrollbar = widgets["scrollbar"]["sb_text"]

                    # Set Scrollbar configuration to Text
                    text_config_params = {
                        "yscroll" : scrollbar.set
                    }
                    self.tk_util.widget_config(tb_contents, text_config_params)

                    # Start Window
                    self.tk_util.start(ws_display_Contents)
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
                selected_row_Items = self.tv_util.get_item(tv)
                selected_fname = selected_row_Items[3]
                selected_fpath = selected_row_Items[4]

                # Update Selected File
                print("Updating selected files...")

                # Get new values
                new_values = self.tk_customs_GUI.inputbox()
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
                selected_row_Items = self.tv_util.get_item(tv)
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
                tree = self.tv_util.def_col(root, None, tree_param, **tree_columns)

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
                    f_type = self.path_utils.get_pathtype(full_path)             # Check if path is file or folder
                    f_ext = self.path_utils.get_extension(full_path)             # Get File extension
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
                        self.tk_util.create_widget_info(1, "lb_fname", {"text" : "Path: "}, {"side" : tk.LEFT, "anchor" : tk.NW}),
                        self.tk_util.create_widget_info(2, "lb_fname", {"text" : fdir}, {"side" : tk.LEFT, "anchor" : tk.NW})  
                    ],
                    "button" : [
                        self.tk_util.create_widget_info(1, "btn_create_file", {"text" : "Add New Files", "command" : self.gen_utils.map_func_arg(create_file, [tree])}, {"side" : tk.LEFT, "anchor" : tk.SW,}),
                        self.tk_util.create_widget_info(2, "btn_read_file", {"text" : "Read File", "command" : self.gen_utils.map_func_arg(read_file, [tree])}, {"side" : tk.LEFT, "anchor" : tk.SW}),
                        self.tk_util.create_widget_info(3, "btn_update_file", {"text" : "Update File", "command" : self.gen_utils.map_func_arg(update_file, [tree])}, {"side" : tk.LEFT, "anchor" : tk.SW}),
                        self.tk_util.create_widget_info(4, "btn_delete_file", {"text" : "Delete File", "command" : self.gen_utils.map_func_arg(delete_file, [tree])}, {"side" : tk.LEFT, "anchor" : tk.SW}),
                    ],
                }

                # Create Tree-linked widgets
                tv_widget_params = {
                    "scrollbar" : [
                        self.tk_util.create_widget_info(1, "scroll_tree_main", {"orient" : tk.VERTICAL, "command" : tree.yview}, {"side" : tk.RIGHT, "fill" : tk.BOTH})
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
                widgets = self.tk_util.multiset_widget(windows)

                # Get Required Objects
                scrollbar = widgets["scrollbar"]["scroll_tree_main"]

                # Set Scrollbar configuration to Tree
                tree_config_params = {
                    "yscroll" : scrollbar.set
                }
                self.tk_util.widget_config(tree, tree_config_params)


            #########################
            # GUI Page #1 : Root    #
            #########################
            # Create Root Window
            root_params = {"screenName" : "Hello World"}
            root = self.tk_util.create_root(root_params)

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
            self.tk_widget_windows_util.design_root(root, root_design)

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
                    self.tk_util.create_widget_info(**lb_hello_world_Params[0]),
                ],
                "button" : [
                    self.tk_util.create_widget_info(0, "btn_Click", {"text" : "Choose Directory!", "command" : self.gen_utils.map_func_arg(open_path_in_treeview, [root])}, {"fill" : "y", "expand" : False}),
                ],
                "frame" : [
                    self.tk_util.create_widget_info(0, "frame_Main", None, {"fill" : "both", "expand" : True})
                ]
            }
            # tk_util.set_widget(root, "label", widget_params)
            # tk_util.set_widget(root, "frame", widget_params)
            for k,v in widget_params.items():
                self.tk_util.set_widget(root, f"{k}", widget_params)

            # Start GUI main window
            self.tk_util.start(root)


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
            root = self.tk_util.create_root()

            # Create Widgets
            # lb_HelloWorld = tk.Label(root, text="Hello World")  
            lb_HelloWorld = self.tk_util.create_Label(root, lb_HelloWorld_params)    # Create a Text Label Widget

            # Pack Widgets into the Window
            # lb_HelloWorld.pack(padx=20, pady=20)          
            self.tk_util.set_Label(root, lb_HelloWorld, pack_params)

            # Start Window
            self.tk_util.start(root)

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
                    self.tk_util.create_widget_info(0, "lb_HelloWorld", {"text" : 720}, {"fill" : "x"}),
                    self.tk_util.create_widget_info(1, "lb_Test", {"text" : 480}, {"fill" : "y"})
                ],
                "frame" : [
                    self.tk_util.create_widget_info(0, "frame_Main", None, {"fill" : "both", "expand" : True})
                ]
            }
            root = self.tk_util.create_root(root_params)

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
            self.tk_util.set_widget(root, "label", widget_params)
            self.tk_util.set_widget(root, "frame", widget_params)

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
            self.tk_pos_util.pack_Widget(tree, tree_pack_params)

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
                self.tk_util.widget_action_set["double-left-click"] : [self.tv_util.on_tree_select, tree]
            }
            self.tv_util.set_action(tree, tv_event_bind)

            self.tk_util.start(root)
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
                self.tk_util.widget_action_set["double-left-click"], 
                self.gen_utils.map_func_arg(self.tv_util.on_tree_select, [tree])
            )          

            # Set widget to grid position with {tree_grid_params} parameters
            tree_grid_params = {
                "row" : 0,
                "column" : 0,
                "sticky" : "nsew"
            }
            self.tk_pos_util.set_grid(tree, tree_grid_params)

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
            scrollbar = self.ttk_util.get_scrollbar(root, scrollbar_params)  # Hook scrollbar to 'root' and return scrollbar object

            # Set Scrollbar configuration to Tree
            tree_config_params = {
                "yscroll" : scrollbar.set
            }
            self.tk_util.widget_config(tree, tree_config_params)

            # Set the Scrollbar into the grid position with {scrollbar_grid_params} parameters
            self.tk_pos_util.set_grid(scrollbar, scrollbar_grid_params)

            # Run app
            self.tk_util.start(root)

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