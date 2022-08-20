# Java - Classes

## Basics

### Java Fundamentals
- Object Oriented Programming (OOP)
	+ The OOP Paradigm follows the idea that everything is an object and should operate like an object
	- OOP Core Pillars
		+ Polymorphism	: The ability to change/convert an object's typing to another type when required
		+ Inheritance	: Following a parent-child model, Inheritance basically allows another class to utilize the functionality of a inherited class; usually uses the 'extend' keyword
		+ Encapsulation : Hiding information (attributes, functions etc) from those that do not require access to it
		+ Security	: Ensuring that the code is as secure as possible to outside attacks
- Java is a full Object Oriented Programming model
	+ This means that Java utilizes classes in their Data Structures


### Keywords
- static : Static in the context of nested classes means that you can access the attributes or functions within the nested class without creating an object of the outer class
	- A nested class doesnt need to be static, however
		+ If you want to initialize a nested class without initializing the outer/parent class first, you need to set the static keyword to the nested class
- extends : The *extend* keyword allows an external class to perform the Object Oriented Programming concept of *Inheritance* by inheriting another class as a dependency

## Documentation
### Synopsis/Syntax
- Creating a general 'parent' class
	- Declaration
		```java
		class OuterClass {
			// Attributes/Variables
	
			// Functions
		}
		```
	- Implementation
		- Initializing class object
			```java
			// Initializing class name
			OuterClass class_name = new OuterClass();
			```
		- Calling class object
			```java
			// Using attribute/variable
			class_name.attribute;

			// Using functions
			class_name.func_name(arguments...);
			```

- Creating a *non-static* nested class with Parent-Child relationships
	- Benefits
		+ The inner classes have access to attributes and methods of the Outer class
	- Declaration
		```java
		class OuterClass {
			// Attributes/Variables
	
			// Functions

			// Classes
			{public|private} class InnerClass {
				// Attributes

				// Functions
			}
		}
		```
	- Implementation
		- Initializing parent class object
			```java
			// Initializing parent/outer class name
			OuterClass parent_class_name = new OuterClass();
			```
		- Initializing Child Class object using Parent Class object
			```java
			// Initializing child/inner class name
			OuterClass.InnerClass child_class_name = parent_class_name.new InnerClass();
			```
		- Calling class objects
			```java
			// Using parent attribute/variables
			parent_class_name.attribute;

			// Using parent functions
			parent_class_name.func_name(arguments...);

			// Using child attribute/variables
			child_class_name.attribute;

			// Using child functions
			child_class_name.func_name(arguments...);
			```

- Creating a static nested class with Parent-Child relationships
	- Pre-Requisites
		+ Adding a 'static' keyword in the Inner/Child class
	- Benefits
		+ Allows you to access the child object without creating an object of the outer class
	- Declaration
		```java
		class OuterClass {
			// Attributes/Variables
	
			// Functions

			// Classes
			{public|private} static class InnerClass {
				// Attributes

				// Functions
			}
		}
		```
	- Implementation
		- Initializing Child Class object *without* using Parent Class object
			```java
			// Initializing child/inner class name
			OuterClass.InnerClass child_class_name = new OuterClass.InnerClass()
			```
		- Calling class objects
			```java
			// Using child attribute/variables
			child_class_name.attribute;

			// Using child functions
			child_class_name.func_name(arguments...);
			```


### Structure
```
		Outer/Parent Class
			|
			|
		Inner/Child Class
			|
			|-- Attributes/
			|-- Functions/
```