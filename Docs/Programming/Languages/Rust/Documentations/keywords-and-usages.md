# Rust - Keywords and Usages

## Table of Contents  
- Classes  
    + String  
- Data Types  
    + Floats  
    + Integers  
- Keywords  
    + enum  
    + fn  
    + impl  
    + let  
    + mod  
    + mut  
    + pub  
    + struct  
    + trait  
    + type  
- Usages  
- Resources  
- References  
- Remarks

## Classes  
+ String : Built-in string data class

## Data Types

### Floats  
+ f8 : 8-bit Signed Float

### Integers  
+ i8 : 8-bit Signed Integer  
+ i16 : 16-bit Signed Integer  
+ i32 : 32-bit Signed Integer  
+ i64 : 64-bit Signed Integer  
+ u8 : 8-bit unsigned integer  
+ u16 : 16-bit unsigned integer  
+ u32 : 32-bit unsigned integer  
+ u64 : 64-bit unsigned integer

## Keywords  
- enum : Create an enumeration (Array/Mapping of values that can be selected from)  
    ```rust  
    enum EnumName {  
        variable = value,  
        variable = value,  
        /// ...  
    }  
    ```  
- fn : Declare and initialize a new function  
    ```rust  
    fn func_name(parameter_signature/header) -> return_type {  
        /*  
          * Statements  
          */  
    }  
    ```  
- impl : Implement some functionality/a specific trait for a given type/object/struct  
    - Particular Type  
        ```rust  
        impl <type> {  
            // Define functions available only for this type/structure  
            fn func_name(parameter_sig/header) -> <return_type> {  
                // Statements  
            }

            // Define function with a global implementation variable  
            fn func_name(&mut self) -> <return_type> {  
                self.var = value;  
            }  
        }  
        ```  
   - Trait (Prototype Function Definition)  
        ```rust  
        impl <trait_name> for <type> {  
            // Define functions available only for this type/structure  
            fn func_name(parameter_sig/header) -> <return_type> {  
                // Statements  
            }

            // Define function with a global implementation variable  
            fn func_name(&mut self) -> <return_type> {  
                self.var = value;  
            }  
        }  
        ```  
    - Structure (Implementing functions in a struc  
        - Declare the public struct object  
            ```rust  
            pub struct StructName;  
            ```  
        - Implement your struct function attribute and logics  
             ```rust  
            impl StructName {  
                pub fn func_name(parameter-signature/header:<data-type>) {  
                    // Function statements  
                }  
            }  
            ```  
        - Calling the function from a struct  
            ```rust  
            StructName::func_name(arguments, ...);  
            ```  
- let : Declare a new variable (Immutable by default)  
    ```rust  
    let var_name:<data-type> = "value";  
    ```  
- mod : Declare and define a new module (Similar to a function with different properties)  
    ```rust  
    mod module_name {  
        /*  
          * Module function  
          */  
    }  
    ```  
- mut : Define a variable as mutable (In Rust - All variables are immutable/read-only by default)  
    ```rust  
    let mut var_name:<data-type> = "value";  
    ```  
- pub : Define the assigned object as a publicly-accessible object  
   ```rust  
    pub <object> {

    }  
    ```  
- struct : Declare and initialize a new structure that will be used as a "Class", namespaces or data structure to hold common attributes  
    ```rust  
    struct struct_name {  
        attribute: type,  
        /// ...  
    }  
    ```  
- trait : Define the prototype functions within the trait that will be initialized by an impl (Implementation) of a type and provided with the function's statements  
    ```rust  
    trait <trait-name> {  
        fn function_name(parameter_signature);  
    }  
    ```  
- type : Create a new Type alias to be used as a mirror of the original type. The variable declared with this type will inherit the properties and attributes assigned/defined in this Type  
    ```rust  
    type alias_type = target_type;  
    ```
- use : Import an external crate/package and its modules/libraries into the application
    ```rust
    use <package|crate>::<module>;
    ```

## Usages

### struct  
- Create a new instance of a struct  
    ```rust  
    fn main() {  
        let struct_obj = struct_name {  
            attribute: new-value,  
            /// ...  
        };  
    }  
    ```

- Accessing an attribute from a struct  
    ```rust  
    let struct_attr = struct_obj.attribute  
    ```

- Modify a value from a struct  
    ```rust  
    struct_obj.attribute = String::from("new-value");  
    ```

- Implementing functions in a struct  
    - Declare the public struct object  
        ```rust  
        pub struct StructName;  
        ```  
    - Implement your struct function attribute and logics  
        ```rust  
        impl StructName {  
            pub fn func_name(parameter-signature/header:<data-type>) {  
                // Function statements  
            }  
        }  
        ```  
    - Calling the function from a struct  
        ```rust  
        StructName::func_name(arguments, ...);  
        ```

### Prototype function declaration and definition  
- Declare your prototype functions in a trait  
    ```rust  
    trait YourTrait {  
        fn function_name(&mut self);  
    }  
    ```

- Implement this trait for a specific type  
    ```rust  
    impl YourTrait for <target-type> {  
        fn function_name(&mut self) {  
            self.var = value;  
        }  
    }  
    ```

## Resources

## References

## Remarks
