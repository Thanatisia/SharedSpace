# Javascript cheatsheet references

## Table of Contents
- [Javascript](#javascript)
    + [Basics](#basics)
    + [Variables](#variables)
    + [Object Types](#object-types)
    + [Functions](#functions)
- [Frontend](#frontend)
    + [DOM](#dom)
- [Using server-side](#server-side)

## Javascript
### Basics
- Javascript is a dynamic-typed language
    - Unlike a static-typed language, which requires the developer to explicitly specify the data type of the variable and/or the return type of the function
        + A dynamic-typed language will automatically guess what data type that object is and process accordingly

### Operators
#### Comparison
- == : Loose Equality checking
    + This checks the value if it is equal
    - Perform type coercion if necessary to make the comparison possible
        + This means that it will perform a polymorphism/data type conversion on any object that requires so that both variables have the same data type
- === : Strict Equality checking
    + Recommended
    + Does not perform type coercion
    + Requires the operands to have the same type and the same value

### Variables
#### Declaration
- let : Declare a variable object
    + Prefix the variable with the 'let' keyword
    + Basically, saying "let this object be a variable"

- const : Declare a constant object
    + Prefix the variable with the 'const' keyword
    + A constant object cannot be changed during runtime after initialization

- using the 'new' keyword : Declare a new variable as an object of a specific data type
    + Declares and initializes a variable as an instance of a user-defined object type/built-in data type that has a constructor function
    - Summary
        + This is like initializing a class/struct (structure) object in other languages
    - Similarities
        - C#'s
            ```cs
            String obj = new String();
            ```
    - Synopsis/Syntax
        ```js
        function Object(param_1, param_2, ...) {
            this.param_1 = param_1;
            this.param_2 = param_2;
        }

        obj = new Object(param_1, param_2, ...);

        console.log(obj.param_1);
        ```
    - Using built-in data classes
        - String
            ```js
            obj = new String();
            ```
        - Number
            ```js
            obj = new Number();
            ```
        - Boolean
            ```js
            obj = new Boolean();
            ```

### Object types
#### Simple value (aka standard variable)
+ Format: 1-to-1 value mapping
- Synopsis/Syntax
    ```js
    let var = value;
    ```

#### Lists : Index-based ordered mappings (i.e. Array, ArrayLists)
+ Format: 1-to-many container value
- Synopsis/Syntax
    ```js
    let var = [element-1, element-2, ..., element-N];
    ```

#### Dictionary : Key-Value Mappings
+ Format: 1-to-many name:value pair mappings
+ Properties: name:value pairs
- Synopsis/Syntax
    ```js
    let var = {key:value, ...};
    ```

### Accessing Object Properties
- Access as a variable of the object
    + [object-name].[property-name]
    ```js
    let value = variable.key;
    ```
- Access as a string element
    + `value = [object-name]["property-name"]`
    - Similarities to other languages
        - Python
            ```python
            value = variable["key"]
            ```
    ```js
    let value = variable["key"];
    ```

### Keywords
#### new
- When a variable is declared with the keyword 'new'
    + The variable is created as an instance of a user-defined object type/built-in data type that has a constructor function

- Declaring and Initializing an object
    - String : arraylist of characters
        ```js
        val_str = new String();
        ```
    - Number : Numerical values (i.e. integer, floats)
        ```js
        val_num = new Number();
        ```
    - Boolean : True/False, 0/1 values
        ```js
        val_bool = new Boolean();
        ```

#### this
- In JavaScript (and various other languages), 'this' keyword is used to refer to an object
    - In certain languages such as C/C++/C#,
        + 'this' keyword is used in class objects to point to an object specifically within the class structure's memory address within the stack
    + However, which object 'this' is referring to depends on how 'this' is being invoked, used or called

- When 'this' is used
    - In an object method: refers to the local object itself
        - i.e.
            - Given the following unnamed function
                - 'this' refers to the 'person' constant object
                    + 'this.object_key' refers to the property (key) "object_key" of the constant object 'person'
                    + 'this.func_name' refers to the property (key) "func_name" of the constant object 'person'
                ```js
                const person = {
                    object_key : "object_value",
                    // ...
                    func_name : function() {
                        return this.object;
                    }
                };
                ```
    + Alone: refers to the global object
    - In a function: refers to the global object (i.e. "owner" of the function)
        - i.e.
            - Given the following unnamed function
                - 'this' refers to the 'person' constant object that "owns" the function                   
                   + To retrieve/return the value of the function call: `func_result = person.func_name();`
                   - If you accessed a method without the parentheses '()': `func_result = person.func_name;`
                       + It will return the function definition
                ```js
                const person = {
                    object_key : "object_value",
                    // ...
                    func_name : function() {
                        return this.object;
                    }
                };
                ```
    + In a function in strict mode: is undefined
    + In an event: refers to the element that received the event
    + Methods like 'call()', 'apply()', 'bind()' : refer to any object

### Functions
- Initializing functions
    - Named function
        + This function syntax is the default function definition
        ```js
        function func_name(parameter|argument-signature, ...) {
            // statements
        }
        ```
    - Unnamed function
        + This function syntax is used to be mapped to an object to be its "function name"
        - Similar to
            + lambda functions
        ```js
        func_name = function(parameter|argument-signature, ...) {
            // statements
        }
        ```

- To return a value from a function call
    - Named function
        ```js
        function func_name(parameter|argument-signature, ...) {
            // Initialize Variables
            let out = val;

            // statements
   
            // Return
            return out;
        }

        let result = func_name(arguments, ...);
        ```
    - Unnamed function
        ```js
        let func_name = function(parameter|argument-signature, ...) {
            // Initialize Variables
            let out = val;

            // statements
   
            // Return
            return out;
        }

        let result = func_name(arguments, ...);
        ```

### Strings
- Text Formatting using Template literals
    - Template literals in string formattings allows you to use substitutions 
        - Synopsis/Syntax
            - To use string formatting: 
                - Enclose the string with backtick quotes '``' to initialize the Template literal string
                    + Specify the variables to set in the inline using '${variable}'
        - This is similar to
            - Python's
                - In-line formatting
                    ```python
                    world:str = "World"
                    text:str = f"Hello {world}"
                    ```
                - format function
                    ```python
                    world:str = "World"
                    text:str = "Hello {}".format(world)
                    ```
    ```js
    let world = "world";
    let msg = `Hello ${world}`;
    ```

## Frontend
### DOM

## server-side
### Using NodeJS
- Information
    - NodeJS is generally used for server-side rendering, which may or may not require a frontend (DOM) to exist
        + You can also use NodeJS for web server routing and application development for both backend or fullstack web development

- Javascript runtime
    + To startup a javascript application without a DOM
    ```console
    node [javascript-file]
    ```

## Wiki
### Terminologies
- variable = object-name
- Dictionary: Key-Value mappings
    - key   = property-name
    - value = property-value

## Resources

## References
+ [MDN Web Docs (Mozilla Dev Docs) - Javascript - Reference - Operators - new](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/new)
+ [MDN Web Docs (Mozilla Dev Docs) - Javascript - Guide - Text Formatting](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Text_formatting)
+ [w3schools - Javascript - Javascript Objects](https://www.w3schools.com/js/js_objects.asp)

## Remarks

