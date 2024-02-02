# JavaScript snippets and examples: Benchmark

## Information
### Explanation

## Documentations
### Components
- Parameter/Argument Signature
    - func : List of dictionaries containing information regarding the function to benchmark
        + Type: Array/List of Dictionaries (Key-Value mappings)
        - Format:
            ```
            func=[
                {"name" : "function-name", "object" : function_obj, "params" : ["function-params", ..."], ...},
                ...
            ]
            ```
        - Object (Key-Value) Properties
            - name : The name of the function (for printing during debugging)
                + Type: String
            - object : The function object you want to execute
                + Type: Object (Function)
            - params : List of all parameters you want to parse into the function header signature
                + Type: List

## Snippet
### Implementation
```javascript
function benchmark_run(
    func=[
        /*
        * [
        *   {"name" : "function-name", "object" : function, "params" : ["function-params", ...] },
        *   ...
        * ]
        */
    ], 
    ) 
{
    // Loop through function list
    for (var i=0; i < func.length; i++) {
        // Obtain dictionary
        var curr_func_defn = func[i]

        // Get function name, object and parameters
        var func_name = curr_func_defn["name"]
        var func_obj = curr_func_defn["object"]
        var func_params = curr_func_defn["params"]

        // Start counter
        console.log(`Starting timer for : ${func_name}`);
        // Initialize a starting point
        var time_Start = new Date();

        // Apply the parameter list to the function you want to execute and 
        // Start execution
        let result = func_obj.apply(this, func_params);

        // Initialize ending time
        var time_End = new Date();
        
        // Calculate time taken
        var time_lapsed = time_End.getTime() - time_Start.getTime();

        // Output result
        console.log("===================================================");
        console.log("");
        console.log(`Result:\n${result}`);
        console.log("");
        console.log(`Timer for: ${func_name}`);
        console.log(`Timer Start: ${time_Start}`);
        console.log(`Timer Stop: ${time_End}`);
        console.log(`finished in: ${time_lapsed} ms`);
        console.log("");
        console.log("===================================================");
    }
}
```

### Usage
```javascript
function main() {
    benchmark_run([
        {"name" : "func-name", "object" : func_obj, "params" : [parameters, ...]},
        // ...
    ]);
}

if (require.main === module) {
    main();
}
```

## Wiki

## Resources

## References

## Remarks
