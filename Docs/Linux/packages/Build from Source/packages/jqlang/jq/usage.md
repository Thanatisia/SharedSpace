# jq - Documentation, Usage and Snippets

## Information
### Program Operations Flow
- jq can take input from either a file (<<) or a pipe (|) as standard input.
    + and it will process the JSON data from the input and 
    + output as a JSON key-value mapping (ala Dictionary) to standard output

### Terminologies
- Identity Operation: aka Identity, this is effectively a 'filter' that describes the exact transformation you would like to do to the JSON data; similar to a delimiter
    - Filter Types
        - Data Extraction and Manipulation
            + `'.'` : Obtain all
            + `'.[]'` : The 'array value iterator'; Used to tell JQ to operate on the values of the new array instead of main JQ array itself
            + `'.[] | .{property-name}'` : To specify the attribute/property/key you wish to access/obtain
            + `'[.[] | .{property-name}]'` : To wrap the array values (string) in an array
            - `'map(.{property-name})'` : The 'map' filter; Improves the readability of your command which will also make it easier to maintain; 
                - This basically 
                    + iterates over an array, 
                    + applying a filter to each one of those items and 
                    + then wrapping the results in an array
            - `'... array | add'` : The 'add' filter; Add all values of the array into a sum/total
            - `'select(condition)'` : The 'select' filter; To select/filter a specific condition for the result to be
                - Condition syntax
                    + `select(.{property-name} == "target-attribute/value")`
        - Data Transformation
            - `'{ key: value, ...}'` : Specify all the key names and value mappings to create a new JSON object and attributes

- Property: aka the key in a JSON key-value mapping (i.e. key in a dictionary/HashMap/Associative Array)
    + this can also be called 'attribute'

## Documentation
### Synopsis/Syntax
- Basic Syntax
    ```console
    jq [identity/delimiter] [file-name]
    ```

- Input through file
    ```console

    ```

- Input through pipe
    - Input through xargs
        ```console

        ```
    - Take JSON input from curl
        + To prettyify/pretty print it
        - i.e.
            + API output
        ```console
        curl [api-link] | jq '[identity]'
        ```

### Parameters
- Positionals
    - Identity : The Identity Operation; aka a delimiter
        + Data Type: String
    - file-name : The name of the JSON file to read from; can be omitted if the standard input stream is coming from a pipe, or a file redirect (<<)
        + Data Type: String
- Optionals
    - With Arguments
    - Flags
        + -r : To enable raw output

### Usage

#### Data Extraction and Manipulation
- Default/Basic Use-case
    ```console
    jq '.' file.json
    ```

- Take JSON input from curl
    + To prettyify/pretty print it
    - i.e.
        + API output
    ```console
    curl [api-link] | jq '.'
    ```

- Retrieve a key value from JSON into a list
    - Generating a list requires extracting the values required and then merging them into an array
        - You will need to refine the filter to get all values in all occurences of the specified key and 
            + discard everything else since you're working on an array
    - To tell jq to operate on the values of that array instead of the array itself
        + Use the 'array value iterator' (.[])
        ```console
        jq '.[]' file.json
        ```
    - To access/obtain all occurences of a specific key (property)
        - This will remove all other attributes except the specified property from the output
            ```console
            jq '.[] | .{property-name}' file.json
            ```
        - By default., jq outputs valid JSON, so strings will appear in double quotation marks ("")
            + To remove the double quotes, add the '-r' flag to enable raw output
            ```console
            jq -r '.[] | .{property-name}' file.json
            ```

- Aggregation of values in a JSON output
    - Obtain the numerical attribute/properties used to aggregate
        ```console
        jq '.[] | .{property-name}' file.json
        ```
    - To find the sum of individual values
        - You need the 'add' filter
            - The 'add' filter works on arrays
                - However, you are currently outputting array values, so you must wrap them in an array first
                    ```console
                    jq '[.[] | .{property-name}]' file.json
                    ```
            - Before applying the add filter, you can improve the readability of your command 
                + with the 'map' function which also makes it easier to maintain
                ```console
                jq 'map(.{property-name})' file.json
                ```
            - Now that you have an array, you can pipe it into the 'add' filter
                ```console
                jq 'map(.{property-name}) | add' file.json
                ```

- Select condition
    - To select specific fields/keys
        + Use the 'select' function to select a specific condition
        + The map() will basically take all results of the select filter and place them into an array
        ```console
        jq 'map(select(condition))' file.json
        ```
    - To retain only a specific attribute/field
        ```console
        jq 'map(select(condition).{property-name})' file.json
        ```
    - To aggregate/sum all numerical attributes
        ```console
        jq 'map(select(condition).{property-name}) | add' file.json
        ```

### Data Transformation
- Transforming data and results to a new data structure
    - To create a new JSON object containing various attributes
        - Value Types
            - Lists: []
                + Can be the result of a array/list output method
            - Numerical Values: 0-9
                + Can be the result of an aggregate/sum
        ```console
        jq '{key:value, ...}' file.json
        ```

## Wiki
### Snippets and Examples

## Resources

## References
+ [DigitalOcean - How to transform JSON data with jq](https://www.digitalocean.com/community/tutorials/how-to-transform-json-data-with-jq)

## Remarks
