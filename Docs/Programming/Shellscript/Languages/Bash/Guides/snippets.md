# Linux shellscripting: Bash 

## Snippets
- Using Named References (nameref) to perform Pass-by References
    + Keyword: `local -n`
    - Explanation
        - Parameters
            + local : Initialize a local variable
            + `-n`  : Declare a nameref (Named Reference) to the assigned/provided variable '$1'
            + assoc : The name of the reference variable to create
        - Use 'local -n assoc=$1' to initialize a pass-by-reference local variable and 
            + declare a nameref (Named Reference) to that assigned/provided variable '$1'
            + Effectively, this means that 'assoc' is holding the name of whichever associative array '$1' contains
            + This is also used for passing and 'returning' Associative Arrays to and from functions
        - To pass-by-reference an associative array from the caller into the function
            + Just enter the object as though it is a string, you do not need to expand it via "${assoc[@]}" nor "${!assoc[@]}"
    - Synopsis/Syntax
        - Function
            ```bash
            function fn_name()
            {
                 # Initialize a local named reference to the object you want to pass in
                 local -n ref=$1

                 # Perform some operation to the reference object
                 ref="new"
            }
            ```
        - Caller
            ```
            main()
            {
                # Initialize Variables
                var_obj=value

                # Pass-by-reference the associative array into the function via Named Reference
                fn_name var_obj
            }
            ```
   - Use-Cases
       - Pass an Associative Array argument into a function (and returning it)
           - Function
               ```bash
               function fn_name()
               {
                   # Initialize a local named reference to the object you want to pass in
                   local -n ref=$1

                   # Perform some operation to the reference object
                   ref="new"
               }
               ```
           - Caller
               ```
               main()
               {
                   # Initialize Variables
                   declare -A assoc=(key=value)

                   # Pass-by-reference the associative array into the function via Named Reference
                   fn_name ref
               }
               ```

## Documentations

## Wiki

## Resources

## References
+ [StackOverflow - Questions - 540298 - Passing arguments by reference](https://stackoverflow.com/questions/540298/passing-arguments-by-reference)

## Remarks
