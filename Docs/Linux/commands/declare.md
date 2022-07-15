# Documentation - Declare

## Table of Contents
* [Information](#information)
* [Setup](#setup)
* [Documentation](#documentation)
* [Remarks](#remarks)

## Background

## Setup

### Pre-Requisites

### Installing

## Documentation

### Synopsis/Syntax

declare {options} var_name="values"

### Parameters

- -A : To declare an associative array
- -g : To declare and global variables from within a function
- -n : To define named references; The references works the same way as C/C++'s Pass-by Reference (*pointer) whereby
	+ The address of the variable is completely passed to the function
	+ any operations changing the values of the reference variable will affect the caller

### Usage

- Creating Array/List
	```sh
	declare arr=(
		values
	)
	```

- Creating Key-Value Array (Associative Array/HashMap/Dictionary) (Local)
	```sh
	declare -A aarr=(
		[key]=value
	)
	```

- Creating a global variable (using Associative Array) in function
	```sh
	func_name()
	{
		declare -gA aarr=(
			[key]="value"
		)
	}

	func_name

	echo -e "${aarr[@]}"
	```

- Return Array with Named References
    ```console
    func_name()
    {
        # Function to return List via Named References
        declare -n ref_arr="$2" # Named Reference passed by function caller; Any changes made to this reference variable will be modified
        ref_arr=(`command-to-get-list`) # Arbituary command to get a list result
    }
    
    main()
    {
        : "
        Main Function call
        "
        func_name "$list_arr"
        for element_ID in "${!list_arr[@]}"; do
            curr_element="${list_arr[$element_ID]}"
            
            # Display returned element
            printf "%d : %s" $element_ID "$curr_element"
        done
    }
    ```
    
- Return Associative Array with Named References
    - Via seperate lists
        ```console
        # Function to return Associative Array via Named References
        # using 2 seperate lists

        func_name()
        {
            declare -A lines=(`command-to-get-key-value`) # Arbituary command to get a key-value result (eg. x=y)
            # Array Variable to return that stores the key of the associative array
            declare -n ref_assoc_Key="$2" 
            declare -n ref_assoc_Value="$3"

            # Loop through associative array and retrieve key and value
            for line in "${lines[@]}"; do 
                key=${line%%=*}  # regex %%=* : Get all values before the equal sign (Key)
                value=${line#*=} # regex #*=  : Get all values after the equal sign
                
                # Write results into the Named References to return back to the Reference calls
                ref_assoc_Key+=("$key")
                ref_assoc_Value+=("$value")
            done
        }
        
        # Main function
        main()
        {
            # Get Key and Values from the command return via Named References
            # The references works the same way as C/C++'s Pass-by Reference (*pointer) whereby 
            # the address of the variable (in this case, the container storing the array elements) is completely passed to the function
            #   - any operations changing the values of the reference variable will affect the caller
            func_name keys values
            
            for i in "${!keys[@]}"
                # Loop through the indexes instead of the element because
                # the index should be the same order as the values
                key="${keys[$i]}"       # Get Current Key
                value="${values[$i]}"   # Get Current value
                
                # Show Key-Value relationship
                printf "%s:%s" "$key" "$value"
        }
        
        ```

## Remarks

### Design Documents



### Resources
+ [StackOverflow - Associative Arrays are local by default](https://stackoverflow.com/questions/10806357/associative-arrays-are-local-by-default)

