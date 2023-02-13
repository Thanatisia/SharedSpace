"""
SQLite Utilities Library

Author: Asura
Created By: 2021-07-31 1831H, Asura
Modified By:
	- 2021-07-31 1831H, Asura
Changelogs:
	- 2021-07-31 1831H, Asura
		- Created Script File

OOP Concept:
	Polymorphism
	Inheritance
	Encapsulation
	Security / Obfuscation
"""

import os
import sys
import subprocess as sp
import sqlite3 as sqlite

class SQLiteUtils():
	"""
	SQLite Utilities Class 
	- contains all SQLite tools

	:: Parameters
		db_path
			Description: 
				- The Path to store the database
				- Default to current working directory if empty
			Type: String

		db_name
			Description:
				- The Database file name
				- Default to "data.db"
			Type: String		
	"""
	def __init__(self, db_path=os.getcwd(), db_name="data.db"):
		"""
		Initialize
		"""
		self.db_path = db_path	# Database Path - default to current working directory
		self.db_name = db_name	# Database Name - default to "data.db"

	# Getter Functions - for Security
	def get_db_path(self):
		return self.db_path

	def get_db_name(self):
		return self.db_name

	def get_db_details(self, param):
		"""
		Return Database Details according to parsed parameter
		
		:: Parameters

			param
				Description: 
					- The Type of detail you want to retrieve
				Syntax:
					path : To get the path of the database file
					name : To get the name of the database file
				Type: String
		"""
		ret_value = ""
		if param == "path":
			# Return Database Path
			ret_value = self.db_path
		elif param == "name":
			# Return Database Name
			ret_value = self.db_name
		else:
			# Return Empty / Undefined
			ret_value = "undef"
		return ret_value

	# Setter Functions
	def set_db_path(self, new_db_path):
		"""
		Set a new database path
		
		:: Parameters

			new_db_path
				Description:
					- The new database path to follow
				Type: String
		"""
		self.db_path = new_db_path

	def set_db_name(self, new_db_name):
		"""
		Set a new database path
		
		:: Parameters

			new_db_name
				Description:
					- The new database name to open
				Type: String
		"""
		self.db_name = new_db_name

	def set_db_param(self, param, new_db_value):
		"""
		Set a new database value to the specified parameter
		
		:: Parameters

			param
				Description:
					- The new database parameter you want to change
				Type: String
				Syntax:
					path : Database path
					name : Database name

			new_db_value
				Description:
					- The new database value to set
				Type: String
		"""
		# --- Input
		changes = []

		# --- Processing
		if not (new_db_value == ""):
			# If not empty
			if param == "path":
				self.db_path = new_db_value
				changes.append[0] = param
				changes.append[1] = new_db_value
			elif param == "name":
				self.db_name = new_db_value
				changes.append[0] = param
				changes.append[1] = new_db_value
		
		# --- Output
		return changes