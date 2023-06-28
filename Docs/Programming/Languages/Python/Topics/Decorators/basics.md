# Python - Decorators

## Information

### Basics
+ Decorators is like an alias that when assigned, will allow the object/variable/function or class to obtain the functionality or attributes of the decorator

### Execution Structure
+ The Decorator function and the inner wrapper functions will be called first before the assigned object is executed

### Notes
+ Unless used with args and kwargs, the decorator function must contain the same number of parameters
- A decorator function must return a nested function to ensure that it meets the correct structure
    - When `caller_function()` is called,
        + `result = outer(caller_function)` will be executed first
        + then `result()` will be executed

## Documentation
### Synopsis/Syntax

- Decorator Declaration
    - Decorator Functions
        ```python
        def decorator_function(object):
            def inner_functions(*args, **kwargs):
                # Statements
                return object(*args, **kwargs)
        ```
    - Declarator Class
        ```python
        class decorator_class(object):
            def __init__(self, original_function):
                # Tie the assigned function to the instance of this class
                self.original_function = original_function

            def __call__(self, *args, **kwargs):
                # Call the assigned function and map the parameters to the original function passed
                return self.original_function(*args, **kwargs)
        ```

- Decorator Implementation
    ```python
    @decorator_object
    object/function/variable/class
    ```

### Usage
- To use declarator function with any number of positional arguments and keyword optional arguments
    ```python
    """
    Decorator Declaration 
    """
    def decorator_function(object):
        def inner_functions(*args, **kwargs):
            # Statements
            return object(*args, **kwargs)

    """
     Decorator Implementation 
    """
    @decorator_function
    def display():
        print("Hello World")

    @decorator_function
    def display_info(arg1, arg2):
        print("display_info ran with arguments ({}) ({})".format(arg1, arg2))

    """
    Function Usage
    """
    display()
    display_info("Hello", "World")
    ```


## Wiki

### Compilation
> Masterlist of useful Decorator modules/libraries
- dataclass : Sets an assigned class with data variables as a "data class"
    + import **dataclasses** module
        ```python
        from dataclasses import dataclass

        @dataclass
        class ClassName:
            object: type = value

        # Initialize dataclass class object 
        class_Obj = ClassName(params...)

        # Get dataclass object value
        class_Obj.object

        # Set dataclass Object value
        class_Obj.object = new_Value
        ```

### Snippets
- Nested Functions vs Decorator using '@'
    - Nested Function
        - The function 'outer' will take in an argument called 'func' of type callable (represented by '__call__') that is effectively a function object
            + The function contains a nested 'inner function' called 'inner' that executes the 'func' object that is passed in by the caller
            + The function 'outer' will then return the function 'inner' to the caller 'ordinary'
        - As such, the line `inner = outer(ordinary)` is equivalent to using `@outer` on top of `def ordinary()`
        ```python
        def outer(func):
            def inner():
                print("Decorator")
                func()
            return inner

        def ordinary():
            print("I am ordinary")

        # decorate the ordinary function
        inner = outer(ordinary)

        # call the decorated function
        inner()
        ```
    - Decorator Assignment
        - When 'decorated' (aka assigned) the decorator function 'outer', 
            - the function assigned - in this case, 'ordinary' - will be automatically passed into the parameter of the decorator as an argument.
                + Basically, this is the same as `result = outer(ordinary)`, and
            - When `ordinary()` is called,
                + `result = outer(ordinary)` will be executed first
                + then `result()` will be executed
        ```python
        def outer(func):
            def inner():
                print("Decorator")
                func()
            return inner

        @outer
        def ordinary():
            print("I am ordinary")
        ```

## References
+ YouTube | Corey Shafer | Python Tutorial: Decorators -  Dynamically Alter the Functionality of your Functions](https://youtu.be/FsAPt_9Bf3U)
+ programiz | [Python Decorators](https://www.programiz.com/python-programming/decorator)

## Resources

## Remarks
