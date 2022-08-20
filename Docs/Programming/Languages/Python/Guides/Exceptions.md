# Python - Exceptions

## Documentation 
### Synopsis/Syntax 
- Implementation 
    ```python
    import os
    import sys

    def main():
        try:
            # Statements to try
        except [Exception] as e:
            print("Caught Exception {}".format(e))
    ```

### Objects
- Exception
    + .what() : Get the Exception message caught

### Notes:
+ Use the 'as' keyword to assume the Exception as an alias/Exception variable object 

## Wiki 
### Exceptions List
+ Exception : General exception capture, the lowest point when the caught error isn't identifiable
+ ValueError : Raised when too many arguments are parsed in
