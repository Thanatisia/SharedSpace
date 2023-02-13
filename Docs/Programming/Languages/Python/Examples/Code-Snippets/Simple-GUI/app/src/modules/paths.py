### In-built Modules ###
import os
import sys
import subprocess
import math

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