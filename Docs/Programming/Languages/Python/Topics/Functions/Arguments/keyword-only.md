# Python - Keyword "Optional" Arguments

## Information
### DESCRIPTION
- Generally, when using '*' with a variable like *args will eat up all remaining positional arguments pass that point, 
- however when '*' is used on its own without a variable assigned to it
     + this will seperate the positional arguments with the keyword optional arguments

## Documentation
### Synopsis/Syntax
- Declaration
    ```python
    import os
    import sys

    def kwfunc(arg1, arg2, *, kw="default"):
        print(f"{arg1}, {arg2}, {kw}") 
    ```
- Implementation
    ```python
    def main():
        kwfunc(1, 2, kw="Hello World")

    if __name__ == "__main__":
        main()
    ```

## Resources
+ [YouTube | mCoding | Positional-Only Arguments vs Keyword-Only Arguments](https://youtu.be/R8-oAqCgHag)
