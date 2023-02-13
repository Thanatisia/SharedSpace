"""
Finance DB: An Accountancy Financial Statement - Trading, Profit & Loss, Balance Sheet Database Management System powered by SQLite) 
	- Previously standalone, this is converted as a feature of the project 'PersonalDBMS'
- Contains the 'FinanceDB' feature of the program

:: Database Design

"""

# In-built Libraries
import os
import sys

# GUI Libraries
import tkinter as tk
from tkinter import Entry, YView, filedialog, ttk, messagebox

# External Libraries
import modules.db.db_utils as db_utils

class FinanceDB():
	"""
	Class for the FinanceDB accounancy financial statement Database Logic
	"""
	def __init__(self, db_name, db_path=os.getcwd()):
		# Initialize SQLite Utilities
		self.sqlite_utils = db_utils.DB_Utilities.SQLite(db_name, db_path)

	def print_db_details(self):
		"""
		Print Database Details
		"""
		print(f"DB Path   : {self.sqlite_utils.db_path}")
		print(f"DB Name   : {self.sqlite_utils.db_name}")
		print(f"DB Object : {self.sqlite_utils.db}")

	def read_db(self, tv):
		"""
		Read Database and place contents into TreeView
		"""
		contents = ""
		
		# Populate contents
		if not (tv == None):
			contents = ""

class FinanceApp():
	"""
	Class for the FinanceDB accounancy financial statement GUI 
	"""
	def design_app(self, new_window=False, window=None, widgets=None):
		"""
		Design app and return

		:: Params

			new_window
				Description: Create app in new window / assign a widget
				Type: Bool
				Option:
					True : Create a new tk.Tk() window
					False : use a pre-existing window / widget

			window
				Description: The Window / Widget to mount this app design on
				Type: Widget
				Default: None (If new_window == True)

			widgets
				Description: All widgets and the parameters you want to add into app
				Type: Dictionary
				Syntax:
				widgets = {
					"widget-type" : [
						{
							"row_id" : 0,
							"id" : <widget-id>,
							"variable" : <widget-object>
							"window" : <widget/window to place on>	# If specific == None and new window is created : Default link to speciic window
							"widget_parameters" : {<parameters>},
							"position" : {
								"position-type" : "pack|grid|place"
								"parameters" : {<parameters>}
							}
						}
					]
				}
				Default: None
		"""
		if new_window:
			window = tk.Tk()	# Create Application Window

		# tv = ttk.Treeview(window)
		# self.read_db(tv)

		# treeview_pack_params = {"fill" : tk.BOTH, "expand" : True}
		# tv.pack(**treeview_pack_params)

		new_widget = None

		# Create Widget
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

		if not (widgets == None):
			# Only proceed if widgets are provided
			for k,v in widgets.items():
				"""
				key : Widget Types ( label | tree etc. )
				value : All widgets in that widget type
				"""
				curr_widget_type = k
				curr_widgets_group = v	# Type List
				number_of_widgets_in_group = len(curr_widgets_group)

				for i in range(number_of_widgets_in_group):
					curr_widget = curr_widgets_group[i]

					### Widget information
					curr_row_id = curr_widget["row_id"]
					curr_widget_id = curr_widget["id"]
					curr_widget_var = curr_widget["variable"]
					curr_widget_master = curr_widget["window"]
					curr_widget_params = curr_widget["widget_parameters"]

					if curr_widget_var == None:
						curr_widget_var = create_widget_obj(curr_widget_type, window, curr_widget_params)

					### Positioning
					curr_widget_positions = curr_widget["position"]
					curr_position_type = curr_widget_positions["position-type"]
					curr_position_params = curr_widget_positions["parameters"]

					if curr_position_type == "pack":
						# .pack()
						curr_widget_var.pack(**curr_position_params)
					elif curr_position_type == "grid":
						# .grid()
						curr_widget_var.grid(**curr_position_params)
					elif curr_position_type == "place":
						# .place()
						curr_widget_var.place(**curr_position_params)

		return window

	def app(self):
		"""
		Application
		"""

		# Generate App Design
		app = self.design_app()

		app.mainloop()	# Start Application / Window

def debug():
	"""
	Main Function
	"""
	print("Finance Database Debugger")

if __name__ == "__main__":
	debug()