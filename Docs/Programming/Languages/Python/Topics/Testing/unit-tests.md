# Python - Unit Testing

```
Unit Testing is an important and very widely used concept in Programming

The idea is that:
- For every feature, function, class you implement, implement a unit test to test
- This is to ensure that the function does exactly what you want it to do

Python has various ways of performing unit testing
- using the 'assert' keyword
    - This is a built-in keyword that tests a given statement, and throws an error message if it doesnt match the intended result
- using the 'unittest' package
    - This is a unit testing package designed to make Unit Testing accessible for a large scale codebase
```

## Using assert
### Synopsis/Syntax
```python
assert [statement] == [target-result], [error-message]
```

### Explanation
- The idea is that
    - if the statement matches the 'target-result' provided, no error will be thrown
        + else: The assert will throw an error message
    - You can specify an alternate [error-message] parameter that will allow you overwrite the default error message with a custom message

### Usage
```
assert class.function(arguments,...) == target, "Invalid Result"
```

