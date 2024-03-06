# C programming - Strings

## Introduction
- In C, and the C family - i.e. C++, C# as well as many other languages
    - Strings are effectively an array of characters
        - i.e.
            + "Hello World" = ['H', 'e', 'l', 'l', 'o', ' ', 'W', 'o', 'r', 'l', 'd']
        - This means that to access a character, 
            + you can just take a string and access the index of the character

## C Strings
- C does not have a 'string' type to easily create string variables
    + Therefore, you must use the 'char' data type and create an array of characters of undefined size (ArrayList) to make a string
    - To create a string using an ArrayList
        ```c
        char string[] = "Your string";
        ```
    - To create a string using memory address pointers
        ```c
        char *string = "Your string";
        ```
    - To define and initialize a string directly
        - Explanation
            - The '\0' character added to the end is known as the "null terminating character"
                + This must be included when creating strings like this as it tells C that this is the end of the string
        ```c
        char string[] = {'Y', 'o', 'u', 'r', ' ', 's', 't', 'r', 'i', 'n', 'g', '\0'};
        ```

- Print a string to standard output
    ```c
    char string[] = "Hello World!";
    printf("%s", string);
    ```

- Accessing strings 
    + Referring to its index number
    - Note
        + To print a character, you need to use the format specifier '%c'
    - First character
        + This will print 'H'
        ```c
        char string[] = "Hello World!";
        printf("%c", string[0]);
        ```

- Modify strings
    - To change the value of a specific character in a string
        + Refer to the index number and set the new character
        - Notes
            + Use single quotes ('') for characters
    ```c
    char string[] = "Hello World!";
    string[0] = 'J';
    printf("%s", string);
    ```

- Looping through a string
    - Using the length of a string
        - To obtain the size/length of a string, 
            - You can calculate the length by calculating the size of the array itself dividing by the size of the first element:
                + `sizeof(array_name) / sizeof(array_name[0]);`
                - Notes
                    + sizeof includes the '\0' character when counting
                    + sizeof will always return the memory size (in bytes) and not the actual string length
        ```c
        char string[] = "Hello World";
        int strlen = sizeof(string) / sizeof(string[0]);
        for (int i=0; i < strlen; i++) {
            printf("%c\n", string[i]);
        }
        ```

- Set strings
    - Use 'strcpy'
        + Please refer to the function in [Functions](#functions)

## String functions
### Setup
#### Pre-Requisites
- Include the '<string.h>' header file
    ```c
    #include <string.h>
    ```

### Functions
- strlen : String length
    - Information
        + Find the length of a string
    - Syntax
        ```c
        strlen(
            // string-array
        );
        ```
    - Parameters
        - string-array : The target string you want to find the length of
            + Type: String
    - Return
        + Type: Integer
        + Value: string length
    - Usage
        - Alphabet
            ```c
            char alphabet[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            printf("%d", strlen(alphabet));
            ```

- strcat : String concatenate
    - Information
        + Concatenate 2 strings together
        + Result is stored in the destination target variable
    - Syntax
        ```c
        char *strcat(char *destination, const char *source);
        ```
    - Parameters
        - destination : This is the target variable you want to concatenate the source string with
            + Type: char array (string)
        - source : This is the target string you want to concatenate with the destination variable
            + Type: string
    - Return
        + Type: Integer
        + Value: string length
    - Usage
        - Concatenating string 2 to string 1
            + This will print out 'Hello World'
            ```c
            #include <stdio.h>
            #include <string.h>

            int main() {
                char *str1 = "Hello";
                char str2[] = "World";

                // Concatenate str2 string into str1 array
                strcat(str1, str2);

                // Print str1 character array
                printf("%s", str1);
            }
            ```

- strcpy
    - Information
        + Stands for 'string copy'
        - This function will copy the string value to the memory address of the string (character arraylist) variable and
            + Set the characters of the target string into the values of the array
        - Note
            - When using strcpy, the size of the destination container should be large enough to store the target string
                + Otherwise, it may result in undefined behaviour
    - Prototype
        ```c
        char *strcpy(char *destination, const char *source);
        ```
    - Parameters
        - destination : This is the target variable you want to copy the source string into
            + Type: char array (string)
        - source : This is the target string you want to copy into the destination variable
            + Type: string
    - Usage
        - Copying string 1 to string 2
            ```c
            #include <stdio.h>
            #include <string.h>

            int main() {
                char *str1 = "C programming";
                char str2[];

                // Copy str1 string into str2 array
                strcpy(str2, str1);

                // Print str2 character array
                printf("%s", str2);
            }
            ```

- strcmp
    - Information
        + Stands for 'string compare'
        - This function will compare 2 strings
            - It will return 
                + 0 : if the 2 strings are equal
                + > 0 : If are not equal
    - Prototype
        ```c
        char *strcpy(char *destination, const char *source);
        ```
    - Parameters
        - destination : This is the target variable you want to compare the source string with
            + Type: char array (string)
        - source : This is the target string you want to compare to the destination variable
            + Type: string
    - Usage
        - Copying string 1 to string 2
            ```c
            #include <stdio.h>
            #include <string.h>

            int main() {
                char *str1 = "Hello";
                char str2[] = "Hello";
                char str3[] =  "Hi";

                // Compare str1 and str2
                int retcode = strcmp(str1, str2);

                // Print result
                // This should return 0 (Both strings are equal)
                printf("%d\n", retcode);

                // Compare str1 and str3
                int retcode = strcmp(str1, str3);

                // Print result
                // This should return -4 (The strings are not equal)
                printf("%d\n", retcode);
            }
            ```

## Wiki

## Resources

## References
+ [Programiz - C programming - library functions - string.h - strcpy](https://www.programiz.com/c-programming/library-function/string.h/strcpy)
+ [w3schools - C - Strings](https://www.w3schools.com/c/c_strings.php)
+ [w3schools - C - String Functions](https://www.w3schools.com/c/c_strings_functions.php)

## Remarks

