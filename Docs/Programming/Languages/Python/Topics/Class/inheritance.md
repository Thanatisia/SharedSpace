# Python class inheritance

```
Implementation and usage of OOP Inheritance in Python classes
```

## Information

### DESCRIPTON

## Basics

### Method Resolution Order (MRO)

## Documentation
### Structure
```python
class ClassName(Class-Objects, ...):
    """
    The 'Class-Objects' are Parent/Classes that you add to inherit that bare/parent class into the child class
    
    Similar to C/C++'s concept of
        public class class_name(param) : static class class_name
        {
            // Statements...
        }
    """
```

### Usage


### Implementations
- Nested Inheritance
    ```python
    
    ```
    
- Seperate Inheritance
    ```python
    class Base:
        """
        This is equivalent to a 'Parent' Class
        """
        def __init__(self, x):
            self.x = x 
        
        def start_func(self):
            print("Base/Parent : {} {}".format(self, self.x))
            
    class Derived(Base):
        def __init__(self, y):
            self.y = y 
            start_func()
            
        def start_func(self):
            print("Derived/Child : {} {}".format(self, self.y))
            super().start_func() # Call the function specified in the inherited class 'Base'
            
    class MultiInheritance(Base, Derived):
        """
        Inheriting multiple parents
        """
        def __init__(self, z):
            self.z = z
            start_func()
            
        def start_func(self):
            print("Multiple Inheritance : {} {}".format(self, self.y))
            super().start_func()
            
    def main():
        """
        Class Implementations
        """
        
        # Initialize Class Objects
        child = Derived() # Will run the __init__
        multi_child = MultiInheritance() # Will initialize both the parent and child
        
        # Run Inherited child functions
        multi_child.start_func()
    ```
    
## Resources

## References

## Remarks

