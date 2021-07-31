'''
Project Info:
    1. After clicking a button
        - user choose a csv file
    2. window pops up and 
        -   [ the columns of the CSV ] and 
            [ the columns from database table ] 
            are visible
    3. User maps the fields by 
        -   entering numbers next to the column name 
            of csv file.

Database 
Database Name: csv_file
Table Name: Contact
Column_Name         |   Data Type   |       Key     | AutoIncrement | NULL |
ContactID               AutoNumber                            
FirstName               Short Text
LastName                Short Text
Title                   Short Text
Email                   Short Text
Mobile                  Short Text
Phone                   Short Text
ProductID               Number          Foreign Key
CompanyID               Zahl            Foreign Key
GroupID                 Zahl            Foreign Key
EntityStatusID          Zahl            Foreign Key
ContactDescription      Short Text

CSV File Columns:
Customer Name           String
Customer Email          String
Zip Code                String
State                   String
Telephone               Int
'''
import os
import sys

### Required Modules ###
import tkinter as tk            # TK GUI Framework
import tkinter.filedialog as fd # For File Dialog
import sqlite3 as sqlite        # SQLite Database Framework 
import csv                      # CSV Module

class DB_Mgr():
    """
    SQLite Database Manager
    """
    def __init__(self):
        """
        Initialize Variables
        """
        self.db_fpath = ""
        self.db_fname = ""

    ###################### 
    # Database Functions #
    ######################
    def read_from_db(self, db_fname):
        """
        Read Database file and take the contents
        """
        contents = []

        return contents
    
    def get_db_headers(self, db_fname):
        """
        Get Headers from Database
        """
        contents = self.read_from_db(db_fname)
        headers = contents[0]
        return headers

class CSVReader():
    """
    CSV Database Reader
    """
    def __init__(self):
        """
        Initialize Variables
        """
        self.csv_fpath = ""
        self.csv_fname = ""

    ################# 
    # CSV Functions #
    #################
    def read_from_csv(self, csv_fname):
        """
        Read CSV file and take the columns
        """
        contents = []
        with open(csv_fname, "r") as f_read:
            reader = csv.reader(f_read)

            # Get Contents
            for row in reader:
                contents.append(row)
            f_read.close()
        return contents
    
    def get_csv_headers(self, csv_fname):
        """
        Get Headers from csv
        """
        contents = self.read_from_csv(csv_fname)
        headers = contents[0]
        return headers
        
class GUI_Utils():
    """
    GUI utilities
    """
    def choose_file(self):
        """
        After clicking a button
            - user choose a file
        """
        print("Choose File")

        # Open File Dialog
        # User will choose a csv file
        fname = fd.askopenfilename()
        return fname


class GUI():
    """
    Window GUI Opens
    """
    def gui_display_Comparison(self):
        """
        - Choose a csv file
        - Get contents of csv file
        - Get header of csv file
        """

        # Internal Functions
        def db_view():
            """
            Open a new GUI with a TreeView with both 
                - SQLite Database Columns and
                - CSV Columns

            :: Methods
                1. Get headers from csv files
                2. Get headers from SQLite table
                3. Create a new GUI with 2 TreeViews side-by-side
                    -   Left TreeView : CSV Headers
                    -   Right TreeView : SQLite Headers
            """


        # --- Input

        # --- Processing

        # Get CSV file
        csv_fname = gui_utils.choose_file() # Get File Name

        # Get CSV contents
        csv_contents = csv_util.read_from_csv(csv_fname)
        csv_headers = csv_util.get_csv_headers(csv_fname)

        # Get SQLite file
        db_fname = gui_utils.choose_file()  # Get File Name

        # Get SQLite contents
        db_contents = sqlite_util.read_from_db(db_fname)
        db_headers = sqlite_util.get_db_headers(db_fname)
        

        # --- Output

    def gui_Main(self):
        """
        Create Program GUI
        """
        root_params = {

        }
        root = tk.Tk(**root_params)

        # Set Window Parameters
        root.title("CSV DB Manager")
        root.geometry("720x680")
        root.minsize(200,200)
        
        # Create Button to open CSV
        btn_open_csv_Params = {
            # Widget parameters
            "text" : "Open CSV",
            "command" : lambda window=root : self.gui_display_Comparison()
        }
        btn_open_CSV = tk.Button(root, **btn_open_csv_Params)

        # Pack Widgets
        btn_open_csv_Pack = {
            # Widget packing parameters
        }
        btn_open_CSV.pack(**btn_open_csv_Pack)

        # Start Window
        root.mainloop()

def init_classes():
    """
    Initialize classes
    """
    global sqlite_util, csv_util, gui, gui_utils
    sqlite_util = DB_Mgr()
    csv_util = CSVReader()
    gui = GUI()
    gui_utils = GUI_Utils()


def init():
    """
    Initialize on bootup
    """
    init_classes()

def bootup():
    init()
    
def main():
    print("Hello World")

    # Run GUI
    gui.gui_Main()

if __name__ == "__main__":
    """
    Only run these functions if you are running this directly
    - Do not run this if you are importing this as module (library)
    """
    bootup()
    main()