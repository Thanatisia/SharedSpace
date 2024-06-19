# Rust - operators

+ ! : Macro

- ? : An analog of the "try!" macro which . 
	- The "try!" Macro will perform a try-catch on the attached function. 
	- "try!" also extends to the "Option" class object/type which is used to unwrap a value or return None from the function
	+ `function_name(arguments, ...)? = try!(function_name(arguments, ...))`
	
- as : cast operator 
    - Used to convert/cast the value on the LHS as the data type specified on the RHS
       + Similar to using `(data-type)Value;` in the C-family
