"""
Main Database Utilities
	- contains utilities for various database tools like
		- SQLite
		- CSV
"""

# In-built Modules
import os
import sys
import sqlite3 as sqlite

class DB_Utilities():
	"""
	Main Database Utilities class
	- will contain other class containing methods like SQLite or CSV etc.
	"""
	class SQLite():
		"""
		SQLite Database utilities class

		:: SQLite File Structure
		Root directory
		|
		|--> dbfile.db						# The Database File
				|
				|--> Tables					# Tables can be created in a database - They are basically partitions in a database file for specific uses
						|
						|--> Columns		# Each Table can have multiple columns defined that will determine what value each row should contain
								|
								|--> Rows	# Each Row represents a record added by the user
		"""
		def __init__(self, db_name, db_path=os.getcwd()):
			"""
			Initialize Database
			"""
			self.db_path = db_path
			self.db_name = db_name
			if not (db_name == None):
				self.db = self.connect_db(db_name)
			else:
				self.db = None


		def connect_db(self, db_name):
			"""
			Open and Connect the database file

			:: Params

				db_name
					Description: The file's full path/name you want to open
					Type: String
			"""
			if not (db_name == ""):
				conn = sqlite.connect(db_name)
			return conn

		def create_cursor(self, conn=None):
			"""
			Create a cursor object from a current connection
				- To perform SQL commands
			"""
			if not (conn == None):
				cur = conn.cursor()
			return cur

		def cmdexec(self, cursor=None, cmdstr=""):
			"""
			Execute SQLite3 commands
			
			:: Params
				cmdstr
					Description: The command you want to execute
					Type: String
			"""
			if not (cmdstr == ""):
				if not (cursor == None):
					# Execute command
					cursor.execute(cmdstr)
		
		def save_changes(self, conn=None):
			"""
			Save (commit) the changes
				- SQLite works like Git(hub) whereby you need to commit before it saves
			
			:: Params

				conn
					Description: The SQLite Database Connection object
					Type: sqlite3.connect('<dbfilename>')
			"""
			if not (conn == None):
				conn.commit()

		def retrieve_data(self, cursor, matching_rows="list"):
			"""
			Retrieve data from a QUERY statement and store into a variable

			:: Params

				matching_rows 
					Description: The number of rows you want to retrieve
					Type: String
					Options:
						"single" => To get a single matching row
						"list" => To get a list of the matching rows
			"""
			if not (cursor == None):
				if matching_rows == "single":
					rows = cursor.fetchone()
				elif matching_rows == "list":
					rows = cursor.fetchall()
				else:
					rows = ""
			return rows

		def close_db(self, conn=None):
			"""
			Close the Database

			:: Params

				conn
					Description: The SQLite Database Connection object
					Type: sqlite3.connect('<dbfilename>')				
			"""
			conn.close()

		########################
		# Statements & Queries #
		########################
		class Queries():
			"""
			Queries and Statement functions
			"""
			def generate(self, table_name, query_action="SELECT", columns="*", row_values="", where_options="", other_options=""):
				"""
				Generate Queries
				- Please seperate all values with delimiter ','

				:: Params
				
					table_name
						Description: This will be the table you want to use

					query_action
						Description: This refers to the action you want to take in the query
						Options:
							CREATE
							SELECT
							INSERT
							UPDATE
							DELETE
						Default: SELECT

					columns
						Description: This refers to all the columns you are using in the table
						Default: "*" = Wildcard = All

					row_values
						Description: This is the VALUES you want to work with (OPTIONAL)
							- NOTE:
								- if your query_action == UPDATE:
									- Please follow the syntax 
										column1 = new_value_1, column2 = new_value_2....., column(n) = new_value_n
						Syntax: column_1_value, column_2_value, column_3_value ....

					where_options
						Description: This is the WHERE filter condition to filter out stuff

					other_options
						Description: Any other options to use
				
				"""
				query_str = ""

				query_subactions = {
					# Actions: "INSERT", "SELECT"
					# Subactions: "INTO", "FROM"
					"SELECT" : "FROM",
					"INSERT" : "INTO",
					"DELETE" : "FROM"
				}

				# Get Query String
				# Switch-case query_action
				if not (table_name == ""):
					if query_action == "SELECT":
						# If is select 
						query_str = f"{query_action} {columns} {query_subactions[query_action]} {table_name}"
					
						# Get additional options
						if not (where_options == ""):
							# WHERE condition
							query_str += " WHERE {} ".format(where_options)

						if not (other_options == ""):
							# Other optional conditions
							query_str += " {}; ".format(other_options)
						else:
							query_str += ";"

					elif query_action == "CREATE":
						# If is create
						query_str = f"CREATE TABLE {other_options} {table_name};"
					
					elif query_action == "INSERT":
						# If is INSERT
						query_str = f"INSERT INTO {table_name} ({columns}) VALUES ({row_values});"

					elif query_action == "UPDATE":
						# If is UPDATE
						query_str = f"UPDATE {table_name} SET {row_values}"

						# Get additional options
						if not (where_options == ""):
							# WHERE condition
							query_str += " WHERE {} ".format(where_options)

						if not (other_options == ""):
							# Other optional conditions
							query_str += " {}; ".format(other_options)
						else:
							query_str += ";"


					elif query_action == "DELETE":
						# If is delete 
						if not (where_options == ""):
							# Must have 'WHERE' option
							query_str = f"{query_action} {query_subactions[query_action]} {table_name} WHERE {where_options}"

							if not (other_options == ""):
								# Other optional conditions
								query_str += " {}; ".format(other_options)
							else:
								query_str += ";"

				return query_str


			def select(self, cursor, table_name, select_target="row", columns="*", where_options="", other_options="", get_output=False):
				"""
				SELECT query

				:: Params

					table_name
						Description: The name of the table you want to search
						Type: String

					select_target
						Description: The type of selection you want to retrieve
						Type: String
						Options:
							"row" : (DEFAULT) To SELECT a row

					columns
						Description: The columns you want to choose
						Type: String
						Default: "*" => Wildcard, represents 'all'

					where_options
						Description: Additional Filters to use in the search
						Type: String
						Default: NIL

					other_options
						Description: Any other strings to use
						Type: String
						Default: NIL

					get_output
						Description: Retrieve the record / result of the query into variable
						Type: Bool
						Options:
							True : To Retrieve
							False : Dont tretrieve
						Default: False (Dont retrieve)
				"""
				records = []
				query_str = ""
				action = "SELECT"

				# # Get Query String
				# if not (table_name == ""):
				# 	if select_target == "row":
				# 		query_str = "SELECT {} FROM {}".format(columns, table_name)
				# 	elif select_target == "columns":
				# 		query_str = ""
				# 	elif select_target == "tables":
				# 		query_str = ""
				# 	else:
				# 		query_str = ""

				# # Get additional options
				# if not (where_options == ""):
				# 	# WHERE condition
				# 	query_str += " WHERE {} ".format(where_options)

				# if not (other_options == ""):
				# 	# Other optional conditions
				# 	query_str += " {} ".format(other_options)

				query_str = self.generate(table_name, action, columns, "", where_options, other_options)
				print(query_str)

				# Execute Command String
				if not (cursor == None):
					cursor.execute(query_str)
				
				# Get result of command string
				if get_output:
					# True : Get result
					records = cursor.fetchall()

				return records

		################### 
		# C.R.U.D classes #
		###################
		class CREATE():
			"""
			C.R.U.D
			(C)REATE utilities
			"""
			def create_table(self, table_name, ):
				"""
				Create a table in the database
				"""
				sql_cmd="""
				CREATE TABLE 
				"""

				# Create Table
				
			def add_column(self):
				"""
				Add Column to a table
				"""
			def add_row(self):
				"""
				Add Row/Record to a table
				"""

		class READ():
			"""
			C.R.U.D
			Read utilities
			"""
			def open_db(self):
				"""
				Open the database
				"""
			def read_db(self):
				"""
				Read the database
				"""
			def read_table(self):
				"""
				Read a table in the database
				"""
			def get_column(self):
				"""
				Retrieve all/specified column(s) from a table
				"""
			def get_column_value(self, row_id, column_name):
				"""
				Retrieve a specified column value from a table and row
				"""
			def read_row(self):
				"""
				Read a row in the table
				"""

		class UPDATE():
			"""
			C.R.U.D
			Update/Modify/Edit utilities
			"""
			def edit_row(self, row_id, columns=None, new_values=None):
				"""
				Edit the specified row's values according to the specified columns

				:: Params
					row_id
						Description: The row you want to edit
						Type: Integer
						
					columns
						Description: All the columns thats found in the database table
						Type: List
						Default: None

					new_values
						Description: All the values you want to replace
						Type: List
						Default: None
				"""

		class DELETE():
			"""
			C.R.U.D
			Delete utilities
			"""
			def delete_row(self, table_name, row_id):
				"""
				Delete a row from a table
				
				:: Params

					table_name
						Description: The table you want to delete the row from
						Type: String

					row_id
						Description: The row you want to delete
						Type: Integer
				"""



def debug():
	"""
	For Debugging any functions
	"""

if __name__ == "__main__":
	debug()
