"""
Main program function for [Project LIFESTYLE] program PersonalDB
- contains Class 'PersonalDBMS' which will contain the GUI and Database logic for the program
"""

# In-built modules
import os
import sys
import tkinter as tk
from tkinter import Entry, YView, filedialog, ttk, messagebox

# External modules
import modules.programs.FinanceDB.finance_db as financeDB

class PersonalDBMS():
	"""
	Main program class
	"""
	def __init__(self):
		"""
		Initialize
		"""
		finance_dbms = financeDB.FinanceDB("finance.db")
		print("FinancialDB initialized")
	
	class ProgramGUI():
		"""
		Program GUI class
		"""
		def __init__(self):
			"""
			Initialize
				- Classes
			"""
			self.finance_dbgui = financeDB.FinanceApp()

		def design_tab(self, tab_widget, widget_type, widget_params=None, position_params=None, position_type="pack"):
			"""
			Design a Tab

			:: Params

				tab_widget
					Description: The Tab you want to design
					Type: Widget

				widget_type
					Description: 
						- The type of widget you want to place in the tab 
						- i.e.
							- label : ttk.Label()
							- frame : ttk.Frame()
					Type: String

				position_type
					Description:
						- The position you want to use
						- i.e.
							- pack : .pack()
							- grid : .grid()
							- place : .place()
					Type: String
					Default: pack

				widget_params
					Description: All parameters you want to place in the widget
					Type: Dictionary
					Default: None

				position_params
					Description: All parameters you want to use in the position function (.pack(), .grid(), .place())
					Type: Dictionary
					Default: None
			"""
			tab = None
			
			# Design Tab
			if not (widget_type == ""):
				# if widget_type is provided
				
				# Switch-case widget_type
				if widget_type == "label":
					if not (widget_params == None):
						# If widget_params is not empty
						tab = ttk.Label(tab_widget, **widget_params)
					else:
						tab = ttk.Label(tab_widget)

			# Position Tab
			# Switch-case position type
			if position_type == "pack":
				tab.pack(**position_params)
			elif position_type == "grid":
				tab.grid(**position_params)
			elif position_type == "place":
				tab.place(**position_params)

			return tab				

		def app(self):
			"""
			Main Application
			- Open GUI
				- Widgets:
					- Tab Controls
			"""
			root = tk.Tk()

			# Design Window
			root.title("Personal DBMS")
			root.geometry("720x680+30+30")

			# Create Tab Control
			tabctrl = ttk.Notebook(root)

			# Create Tab Widgets
			tab_1 = ttk.Frame(tabctrl)
			tab_2 = ttk.Frame(tabctrl)

			# Add Tab Widgets to Tab Control
			tabctrl.add(tab_1, text="Tab 1")
			# tabctrl.add(tab_2, text="Tab 2")
			tabctrl.add(self.finance_dbgui.design_app(False, None, {
				"frame" : [
					{
						"row_id" : 0,
						"id" : "lb_Hello_world",
						"variable" : tab_2,
						"widget_parameters" : {},
						"position" : {
							"position-type" : "pack",
							"parameters" : {}
						}
					}
				]
			}))

			# Pack Tab Controls to Window
			tabctrl.pack(expand=True, fill=tk.BOTH)

			# Design Tab 1
			self.design_tab(tab_1, "label", {"text" : "Hello World"}, {"column" : 0, "row" : 0, "padx" : 30, "pady" : 30}, "grid")

			# Design Tab 2
			self.design_tab(tab_2, "label", {"text" : "Hello World 2"}, {"column" : 0, "row" : 0, "padx" : 30, "pady" : 30}, "grid")

			root.mainloop()

def main():
    print("Hello World")

if __name__ == "__main__":
    main()