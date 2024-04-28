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

### Decorator Types
- Decorator (standalone)
    - Decorator function
        - Components
            - decorator (outer function) : This is the main decorator function which will take in the decorated function (if there are no arguments) or argument key-value mappings (if there are arguments)
                - wrapper (inner/nested function) : This is the inner wrapper function that will take in the argument passed into the function and expand into the function when executed
                    + return wrapper function object to the decorator
        ```python
        def decorator(fn):
            """
            Decorator to apply to a function to execute
            """
            def wrapper(*args, **kwargs):
                """
                Internal function that takes in the arguments to pass into the function
                """
                result = fn(*args, **kwargs)

            return wrapper
        ```
    - Decorate function
        - Notes
            + This is equivalent to `decorated_function = (decorator())(decorated_function)`
        ```python
        @decorator
        def decorated_function():
            print("Executed inside 'wrapper'")
        ```
    - This is how the execution looks like when called
        - Notes
            - When this function returns a value, it is None
                + This is because you didnt return the result in the decorater's wrapper function
        ```python
        result = decorator(decorated_function)()
        ```

- Decorator with variable-length and keyword arguments
    - Decorator function
        - Components
            - decorator (outer function) : This is the main decorator function which will take in the decorated function (if there are no arguments) or argument key-value mappings (if there are arguments)
                - wrapper (inner/nested function) : This is the inner wrapper function that will take in the argument passed into the function and expand into the function when executed
                    + return the function object to the wrapper
                + Return the wrapper function object to the decorator
        ```python
        def decorator(*args, **kwargs):
            """
            Decorator to take in the arguments to pass into the function inside the wrapper
            """
            def wrapper(fn):
                """
                Internal function that takes in the arguments provided at the decorator by the caller and pass into the function
                """
                result = func(*args, **kwargs)
            return wrapper
        ```
    - Decorate function
        - Notes
            + This is equivalent to `decorated_function = (decorator(key=value))(decorated_function)`
        ```python
        @decorator(key=value)
        def decorated_function():
            print("Executed inside 'wrapper'")
        ```
    - This is how the execution looks like when called
        - Notes
            + When this function returns a value, it is None
            + This is because you didnt return the result in the decorater's wrapper function
        ```python
        result = outer_function(decorated_function)(arguments, passed, here)
        ```

- Decorator with static arguments
    - Decorator function
        - Components
            - outer_function : This is the outer decorator function that will take in the static parameters to pass into the decorator inner function and wrappers
                - decorator : This is the main decorator function which will take in the decorated function (if there are no arguments) or argument key-value mappings (if there are arguments)
                    - wrapper (inner/nested function) : This is the inner wrapper function that will take in the argument passed into the function and expand into the function when executed
                        + return the function object to the wrapper
                    + Return the wrapper function object to the decorator
                + Return the decorator function object to the outer function and the caller
        ```python
        def outer_function(key_1=value, key_2=value_2):
            """
            Outer function to take in the arguments to pass into the function inside the wrapper
            """
            def decorator(fn):
                """
                Decorator function that will take the decorated function and pass it to the wrapper to execute
                """
                def wrapper(*args, **kwargs):
                    """
                    Internal function that takes in the arguments provided at the decorator by the caller and pass into the function
                    """
                    result = func(*args, **kwargs)
                return wrapper
            return decorator
        ```
    - Decorate function
        - Notes
            - This is equivalent to 
                + `outer_function(key_1, key_2)(decorated_function)(arguments1, argument2, argument3)`
        ```python
        @outer_function(key=value)
        def decorated_function():
            print("Executed inside 'wrapper'")
        ```
    - This is how the execution looks like when called
        - Notes
            + When this function returns a value, it is None
            + This is because you didnt return the result in the decorater's wrapper function
        ```python
        result = outer_function(decorated_function)(arguments, passed, here)
        ```

- Decorator with return values
    - Decorator function
        - Components
            - outer_function : This is the outer decorator function that will take in the static parameters to pass into the decorator inner function and wrappers
                - decorator : This is the main decorator function which will take in the decorated function (if there are no arguments) or argument key-value mappings (if there are arguments)
                    - wrapper (inner/nested function) : This is the inner wrapper function that will take in the argument passed into the function and expand into the function when executed
                        + return the result
                    + Return the wrapper function object to the decorator
                + Return the decorator function object to the outer function and the caller
        ```python
        def outer_function(key_1=value, key_2=value_2):
            """
            Outer function to take in the arguments to pass into the function inside the wrapper
            """
            def decorator(fn):
                """
                Decorator function that will take the decorated function and pass it to the wrapper to execute
                """
                def wrapper(*args, **kwargs):
                    """
                    Internal function that takes in the arguments provided at the decorator by the caller and pass into the function
                    """
                    result = func(*args, **kwargs)
                    return result
                return wrapper
            return decorator
        ```
    - Decorate function
        - Notes
            - This is equivalent to 
                + `result = outer_function(key_1, key_2)(decorated_function)(arguments1, argument2, argument3)`
        ```python
        @outer_function(key=value)
        def decorated_function():
            return "Executed inside 'wrapper'"
        ```
    - This is how the execution looks like when called
        - Notes
            + When this function returns a value, it will be the result from calling the function
        - Format 1
            ```python
            result = outer_function(decorated_function)(arguments, passed, here)
            ```
        - Format 2
            ```python
            result = outer_function(decorated_function(arguments, passed, here))
            ```

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
