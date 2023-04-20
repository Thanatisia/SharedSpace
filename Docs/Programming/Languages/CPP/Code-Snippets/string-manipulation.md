# C++ Snippets and Examples : String Manipulation

## Snippets and Examples
- Finding if a string contains a substring
    - Use 'std::string::npos'
        + 'std::string::npos' returns '-1' if not found, else found
    - Syntax
        ```cpp
        if(string_variable.find(substring_variable) != std::string::npos)
        {
            // If .find() is not '-1' : Found  
        }
        else
        {
            // If .find() is -1 : Not Found
        }
        ```
    - Usage
        ```cpp
        string str = "hello world";
        string substr = "ello";

        if(str.find(substr) != std::string::npos)
        {
            // Found
            cout << substr << " exists in " << str << endl;
        }
        ```