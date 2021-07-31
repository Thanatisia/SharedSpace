### In-built Modules ###
import os
import sys
import subprocess
import math

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