# C programming - Structures

## Information

## Structures
### Synopsis/Syntax
- When you are creating a structure
    - The body of a structure consists of 'properties'
        + Basically attributes and variable that you can access, set or get
        + Think of this like a early 'class'

- To create/declare a structure variable
    + Use the `struct` keyword
    ```c
    struct [structure-name] {
        // Properties here
        // [data-type] variable_name;
    };
    ```

- To initialize a structure container variable
    - There are 2 methods
        - Within the struct itself
            ```c
            struct structure_Name {
                // Properties and variables here
            } structure_variable_1, structure_variable_2, ..., structure_variable_N;
            ```
        - Seperately outside
            ```c
            struct structure_Name {
                // Properties and variables here
            };

            int main() {
                // Initialize structure variable
                struct structure_Name structure_variable_1, structure_variable_2, ..., structure_variable_N

                return 0;
            }
            ```
    - Initialize an array of structures
        - Create structure variable
            ```c
            struct Structure {
                // Properties and variables here
            };
            ```
        - Initialize structure array
            - Explanation
                + N = Size of the array (Starting from 0 and ending at N-1)
            ```c
            int main() {
                // Initialize structure variable
                struct Structure structure_Array[N];

                return 0;
            }
            ```

- To access a structure property/attribute
    - Declare and create structure variable
        - Information
            - Let the following example use a Person for the structure
        ```c
        struct Person {
            char *name;
            float salary;
        };
        ```
    - Initialize structure variable
        ```c
        int main() {
            // Initialize structure variable
            struct Person person_1;

            return 0;
        }
        ```
    - Access structure property/variables
        - Getter
            - Software Development Principle
                - Getter functions/attributes:
                    + Basically, you are retrieving/getting a value from the function/object
            ```c
            int main() {
                // get structure variable/property
                string person_Name = person_1.name;
                float person_Salary = person_1.salary;
                return 0;
            }
            ```
        - Setter
            - Software Development Principle
                - Setter functions/attributes:
                    + Basically, you are setting a value into a function (via argument signature/parameter) or into an attribute/object
            ```c
            int main() {
                // set structure variable/property
                person_1.name = "New Name";
                person_2.salary = 5000f;
                return 0;
            }
            ```

### Usage

## Using the 'typedef' keyword
### Information
+ The 'typedef' keyword is used to create an alias name for data types
+ It is commonly used with structures to simplify the syntax of declaring variables

### Synopsis/Syntax
- To create/declare a structure variable as an alias
    ```c
    typedef struct [structure-name] {
        // Properties here
        // [data-type] variable_name;
    } [type-alias-name];
    ```

- To initialize a structure container variable
    + With 'typedef', you can write an equivalent code as the previous example, but with a streamlined, simplified syntax
    ```c
    int main() {
        [type-alias-name] structure_variable_1, structure_variable_2, ..., structure_variable_N;
    }
    ```

- To access structure property/variables
    - Declare and create structure variable with typedef alias
        - Information
            - Let the following example use 
                + a Person for the structure
                + typedef alias 'person'
        ```c
        typedef struct Person {
            char *name;
            float salary;
        } person;
        ```
    - Initialize structure variable
        ```c
        int main() {
            // Initialize structure variable
            person person_1;

            return 0;
        }
        ```
    - Access property
        - Getter
            ```c
            int main() {
                // get structure variable/property
                string person_Name = person_1.name;
                float person_Salary = person_1.salary;
                return 0;
            }
            ```
        - Setter
            ```c
            int main() {
                // set structure variable/property
                strcpy(person_1.name, "New Name");
                person_2.salary = 5000f;
                return 0;
            }
            ```

### Usage

## Wiki

## Resources

## References
+ [Programiz - C programming - Structures](https://www.programiz.com/c-programming/c-structures)

## Remarks

