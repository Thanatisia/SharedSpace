"""
Project LIFESTYLE main program for [PersonalDBMS]
- Contains the startup and validation logic for the program
"""

# In-built Modules
import os
import sys

# External Modules
import modules.programs.personal_db as personalDB


def main():
    print("Hello World")
    personal_db = personalDB.PersonalDBMS()
    personaldb_gui = personal_db.ProgramGUI()
    personaldb_gui.app()

if __name__ == "__main__":
    main()