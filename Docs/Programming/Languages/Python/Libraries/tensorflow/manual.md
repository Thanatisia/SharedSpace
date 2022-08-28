# Python - tensorflow

## Information
### Package 
+ Package Name: tensorflow

### Basics
- Tensors

## Setup 
### Pre-Requisites
+ python
+ pip

### Dependencies 

### Installing
- Using Python PIP Package Manager
    ```console
    python -m pip install tensorflow
    ```

## Documentation

### Importing 
```python
import tensorflow
```
### Modules
+ tensorflow

### Classes
+ tensorflow

### Objects 
- tfConstant : Tensorflow Constant Object
- tfSession : Tensorflow Session Object
    - Functions
        + .run(constant_obj) : Run the constant for the target session
        
### Functions
- tensorflow
    - .constant(message) : Generate a constant message
        - Parameters
             - message : The constant object to generate
                 + Type : String
        + Return Type : tfConstant
    - .Session() : Create a Session object
        + Return Type : tfSession

### Usage
- Basic
    - Create a constant
        ```python
        constant_obj = tf.constant(‘Hello, Tensorflow!’)
        ```
    - Create a new Session
        ```python
        sess = tf.Session()
    - Run Session with the constant
        ```python
       res = tfSession.run(constant_obj)
       print(f"Result : {res}")
       ```

