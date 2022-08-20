# Python - Decorators

## Information

### Basics
+ Decorators is like an alias that when assigned, will allow the object/variable/function or class to obtain the functionality or attributes of the decorator

### Execution Structure
+ The Decorator function and the inner wrapper functions will be called first before the assigned object is executed

### Notes
+ Unless used with args and kwargs, the decorator function must contain the same number of parameters

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

## References
- YouTube | Corey Shafer | 
    + [Python Tutorial: Decorators -  Dynamically Alter the Functionality of your Functions](https://youtu.be/FsAPt_9Bf3U)

## Resources

## Remarks