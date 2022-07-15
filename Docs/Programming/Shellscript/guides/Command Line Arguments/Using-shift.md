# Command Line Options and Argument Handling with shift and case-esac

## Structure

```sh
if [[ "$#" -gt 0 ]]; done
	# Check that there are arguments parsed
	while [[ "$1" != "" ]]; do
		# While '$1' is not empty
		arg="$1"
		case "$arg" in
			# Check for the option/argument in $1
			"-s" | "--set")
				# Setter, usually get user input
				if [[ "$2" != "" ]]; then
					# best practice to check for data input
					value="$2"
					shift 2
				else
					# shift 1 by default
					shift 1
				fi
				;;
			"-V" | "--verbose")
				# Set verbose flag to True; Display verbose messages with detailed standard output
				shift 1
				;;
			"-h" | "--help")
				# Help menu/display usage
				shift 1
				;;
			"-v" | "--version")
				# Display current system version information
				shift 1
				;;
			*)
				# Default Option
				shift 1
				;;
		esac
	done
fi
```

## General Explanation

- Note the following
```sh
if [[ "$#" -gt 0 ]]; done
	# Check that there are arguments parsed
	while [[ "$1" != "" ]]; do
		# While '$1' is not empty
		arg="$1"
		case "$arg" in
			# Check for the option/argument in $1
			*)
				# Default Option
				shift 1
				;;
		esac
	done
fi
```

### Explanation
+ The basic idea of the 'shift' command is to rotate the next command line option/argument parsed in by the user by the specific amount of spaces to the left
- So given the following command execution

	```
		   1    2    3
	./command arg1 arg2 arg3
	```

	+ arg1 is currently in position $1, which is the first argument
	- After the first argument is completed, you use shift '1' to shift $2 to $1 to be executed
		+ Repeat this process until '$1' is not empty ("")

	+ But what do you do if you have multiple additional command line arguments to the option?
		- You shift by n times, depending on the number of arguments is required
		- Note that shift 1 is by default as long as an argument for the command option ($1)
			+ If you require 1 argument  ($2) 	: shift 2
			+ If you require 2 arguments ($2, $3) 	: shift 3
			+ If you require n arguments ($2, $3...): shift n

