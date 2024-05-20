# JQ - Json Query

## Information
### Summary

jq (JSON Query) is a JSON Parser CLI utility that will take a JSON string as input into a JSON object and format the JSON object, then output the object

### Project
+ Author: jqlang
+ Name: jq
+ Website: https://jqlang.github.io/jq/
- Repository: 
    + [GitHub - jqlang/jq](https://github.com/jqlang/jq)

### Basics
- JSON is a Key-Value mapping object, also known as a Dictionary
    + JSON is not ordered, it does not have an order index position (Array, ArrayList, List), but instead, has a 'key' mapped to a value

## Setup
### Dependencies
+ git

### Pre-Requisites


## Documentations
### Synopsis/Syntax
- Standalone
    ```console
    jq {options} [action|format]
    ```

- Piping a JSON result standard output into jq as a standard input
    ```console
    [command] | jq {options} [action|format]
    ```

- Stream/Pipe a file into jq as a standard input
    ```console
    jq {global-options} [action|format] < [file-name]
    ```

### Parameters
- Action
    + keys : List all keys in the JSON file
- Format:
    + .[key] : To obtain a value correlating to the specified key in the JSON (Key-Value Dictionary) file
    - '{key: values, ...}' : Select and replace the given contents with the specified key-value objects
        - You can format the values using jq features as well
            + Select from an existing key '.key'
    - 'function(arguments)' : Execute a jq function with the arguments provided and filter the values provided
        - operators
            + | : with-condition operator; Add-on conditional statements to the key
            + + : Arithmetic Plus operator; Adds the numerical values of a key-1 to the numerical values of a key-2
            + > : Greater-than operator; Checks if value on Left-hand Side (LHS) is greater than the value on Right-hand Side (RHS)
            + < : Less-than operator; Checks if value on Left-hand Side (LHS) is smaller than the value on Right-hand Side (RHS)
        - keywords
            + and : Add additional conditionals unrelated to the previous key on the LHS
        - jq filters conditions
            + `length > [size]` : Filter out all values with length more than a minimum value/size
        - jq Functions
            - any(.key-list) : Checks and returns any occurences of the specified key that is a list
                - Notes
                    + You can use 'any(.[])' to list all key-values where the value is a list
            - contains("string") : Checks for any key-values containing the specified string
            - has("key-name") : Conditional function - Checks the JSON string for existence of the provided key; To be used in a function for printing
            - select(function|key_name) : Select function; Parsing a key will list all values of a specified key in a JSON string, Parsing a function will execute the function to filter the JSON string
                - Snippets
                    + select(key_name | length > 0) : Select and list all values within the provided key that has value more than 0
                    + select(has("key-name")) : Checks for all key-values with the specified key and prints those to standard output
                    + select(.key-1.value-1 + .key-1.value-2 > N) : Add .key-1.value-1 with .key-1.value-2 together and print all results where the sum is greater than N
- Global Optionals
    + -c : Collapse and minimize
    + -r : As raw string

### Usage
- Piping a JSON string as standard output to jq as a standard input
    - Maximized (Default)
        ```console
        echo {"key": [{"key-1": "value-1"}, {"key-2": "value-2"}, {"key-1": "value-2"}, {"key-2": "value-3"}]} | jq
        ```
    - Collapsed/Minimized
        ```console
        echo {"key": [{"key-1": "value-1"}, {"key-2": "value-2"}, {"key-1": "value-2"}, {"key-2": "value-3"}]} | jq -c
        ```

- To maximize a JSON file
    ```console
    jq [file-name]
    ```

- To minimize and collapse a JSON file
    ```console
    jq -c < [file-name]
    ```

- To select a specific value of a key from a JSON (Key-Value) entry
    ```console
    jq .[key] < [file-name]
    ```

- To list all elements/items in an array/arraylist/list
    ```bash
    jq '.key[]'
    ```

- To select a specific value of a key from a JSON (Key-Value) entry without the raw string quotes
    ```console
    jq -r .[key] < [file-name]
    ```

- To list all keys in a file
    ```console
    jq keys < [file-name]
    ```

- To select only specific key-values in a file and print it to standard output
    ```console
    jq '{key: value, ...}' < [file-name]
    ```

- To filter and select only specific keys and map them to an existing value in a file and print it to standard output
    - Explanation
         - The format '{}' allows you to use jq select query features within, 
             - in this case
                  + .[key] will return the value of that selected key, mapping it to itself
                  + This will let you retrieve a JSON full of only the specified keys
    ```console
    jq '{key-1: .key-1, key-2: .key-2, ...}' < [file-name]
    ```

- Select keys with 'dash'
    ```console
    jq '."key-name"' < [file-name]
    ```

- To filter and select keys and print out only the values
    - Explanation
        - Note the '.subkey_name' at the end
            - Similar to SQL and NoSQL (i.e. MongoDB)
                + You are effectively specifying filtering and working with the standard output of the select function
                - This typically is the final columns (key-value) mappings you want to extract the values from
                    + As such, you can extract the values of keys by pulling the key you want to print as standard output
    ```console
    jq '.key_name | select(.subkey_name) | .subkey_name
    ```

- Piping the contents of a JSON file printed out as standard output using 'cat' to jq as a standard input
    - Maximized (Default)
        ```console
        cat [file-name] | jq
        ```
    - Collapsed/Minimized
        ```console
        cat [file-name] | jq -c
        ```

- Query list values
    - List all list keys
        ```console
        jq '.key_name[]'
        ```
    - Select/Query all rows in the list that contains the specified key name
        ```console
        jq '.key_name[] | select(.subkey)'
        ```
    - Select/Query all rows in the list that contains the specified key name and print out only values
        ```console
        jq '.key_name[] | select(.subkey) | .subkey'
        ```
    - Select/Query all rows in the list that contains the specified key name with a specific value mapped to it
        ```console
        jq '.key_name[] | select(.subkey=="query-filter-value")'
        ```

- Filter Conditions
    - Select only keys with values (length > 0)
        ```console
        jq 'select(.key_name | length > 0)' < [file-name]
        ```
    - Checks for all key-values with the specified key and prints those to standard output
        ```console
        jq 'select(has("key-name"))' < [file-name]
        ```
    - Concatenate and Join values together with a value check
        - Explanation
            - Select all values where
                + Adding subkey_1 and subkey_2 belonging to key_1, and 
                + the sum is greater than a value N
        ```console
        jq 'select(.key_1.subkey_1 + .key_1.subkey_2 > N)' < [file-name]
        ```
    - Select only specific keys which is a list, and in the list, contains a string
        - Explanation
            - Select all values of a specific key that has value
                 - and
                     - Check for any list values within the key
                         - Check for any lists with elements containing the specified string
                             + Print out all results to standard output
        ```console
        jq 'select(.key | length > 0 and any(.[]; contains("string")
        ```

- Usage with (Neo)vim
    - Visual Mode
        - Highlight a specific row
            - Collapse/De-midify the JSON selection
                ```console
                :'<,'>!jq
                ```
            - Re-midify the JSON selection
                ```console
                :'<,'>!jq -c
                ```

    - Maximize the entire JSON file
        ```console
        :%!jq
        ```

    - Minimize/Collapse the entire JSON file
        ```console
        :%!jq -c
        ```

    - In-Editor
        - Notes
            + ':%' means the entire file
            - '%!' means take the entire file's content, and pipe it into the standard input of a command
                + `%!jq {global-options} '[format]'` : means take the entire file's content, and pipe it into jq, then jq will process the JSON strings then pipe the output back up the stream into (neo)vim
        - Query
            - Select a specific key with values (length greater than 0), 
                + and replace the file with the results
                ```console
                :%!jq 'select(.key_name | length > 0)'
                ```

            - Select all results where, 
                + the sum of multiple numerical values in a key is greater than a value N
                + and replace the file with the results
                ```console
                :%!jq 'select(.key_name.value_1 + .key_name.value_2 + .key_name.value_3 > N)'
                ```


## Wiki

## Resources
+ [StackOverflow - Questions - 45523425 - Getting all the values of an array with jq](https://stackoverflow.com/questions/45523425/getting-all-the-values-of-an-array-with-jq)

## References
+ [YouTube - ThePrimeTime - The BEST CLI Tool](https://www.youtube.com/watch?v=n8sOmEe2SDg)

## Remarks

