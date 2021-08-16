"""
Unit Testing 
"""

def unittest(tests=None):
	"""
	A Unit Test wrapper that will return the return code and an error message ( if any )
	- Return
		Syntax: 
		{
			0 : [return_code_1, error_message_1],
			1 : [return-code_2, error_message_2],
		}
		Type: Dictionary

	:: Syntax

		tests
			Description: The function and arguments you want to test mapped to the result
			Syntax:
				{
					0 : {
						"function" : func_name,
						"args" : [args],
						"result" : result
					}
				}

				function : Your function variable
				args : List of arguments to put into function (if any)
				result : Your expected output of type variable
			Type: Dictionary
	"""
	ret_code = 0	# 0 : No Error, 1 : Error
	err_msg = ""	# Error Message
	ret = {}

	# Process
	for k,v in tests.items():
		test_id = k
		curr_test_val = v

		test_func = curr_test_val["function"]
		test_args = curr_test_val["args"]
		test_expected_res = curr_test_val["result"]

		try:
			if not(test_args == []):
				print(f"Test function: {test_func}")
				print(f"Test arguments: {test_args}")
				print(f"Test results: {test_expected_res}")
				assert test_func(test_args) == test_expected_res
			else:
				print(f"Test function: {test_func}")
				print(f"Test results: {test_expected_res}")
				assert test_func() == test_expected_res, "Error"
			ret[test_id] = [ret_code, ""]
		except Exception as ex:
			ret_code = 1
			err_msg = str(ex)
			print(f"Exception: {ex}")
			ret[test_id] = [ret_code, err_msg]

		# Reset
		ret_code = 0
	
	# Return
	print(f"Result: {ret}")
	return ret

def	design_test(functions=None, args=None, results=None):
	"""
	Design Testing syntax (JSON Format) by
		1. Taking all functions, arguments and results provided
		2. Parsing into dictionary
	- Please put 
		- 'None' (for non-list/dictionary variables), 
		- '[]' for list variables and 
		- '{}' for dictionary variables for all empty arguments

	:: Params

		functions
			Description: This contains all functions 
			Type: List
		
		args
			Description: This contains all arguments to pass into the function
			Type: List

		results
			Description: This contains the intended output string / result to pass into the function
			Type: List
	"""
	res_dict = {}
	number_of_functions = len(functions)
	number_of_arguments = len(args)
	number_of_results = len(results)

	# If equals
	for i in range(number_of_functions):
		# Append values to dictionary
		curr_func = functions[i]
		curr_args = args[i]
		curr_exp_res = results[i]

		# Generate new variable
		res_dict[i] = {
			"function" : None,
			"args" : [],
			"result" : None
		}

		if not (curr_func == None):
			res_dict[i]["function"] = curr_func
		else:
			res_dict[i]["function"] = None
		
		if not (curr_args == None):
			res_dict[i]["args"] = args[i]
		else:
			res_dict[i]["args"] = []

		if not (curr_exp_res == None):
			res_dict[i]["result"] = results[i]
		else:
			res_dict[i]["result"] = None

	return res_dict

def run_test(tests):
	"""
	Run Submitted test designs

	:: Params
		tests
			Description: This is the test in json format
			Syntax: 
			tests = {
				0 : {
					"function" : test_1,		# Type Function
					"args" : [],				# Type List
					"result" : "Hello world"	# Type String
				},
				n : {
					"function" : <func_var>,		# Type Function
					"args" : [arg1, arg2,... argn],	# Type List
					"result" : "<output_result>"	# Type String
				},
			}

			Type: Dictionary
	"""
	number_of_tests = len(tests)
	# Errors
	number_of_errors = 0
	errors = []

	# --- Processing
	
	# Program Testing
	ret = unittest(tests)

	# Error Scanning
	for i in range(number_of_tests):
		curr_test_res = ret[i]
		err_msg = curr_test_res[1]
		if not (err_msg == ""):
			# Populate Error List
			number_of_errors+=1
			errors.append(err_msg)
			# break

	if number_of_errors == 0:
		print("No Errors Found!")
	else:
		for err_id in range(number_of_errors):
			print("Error Found: {}".format(errors[err_id]))

def main():
	print("Begin Test")
	
	# --- Internal Functions
	def test_1():
		print("Hello world")

	def test_2(msg):
		print("Hello!".format(msg))

	# --- Input
	# Local Variables	
	testspecs = {
		"functions" : [test_1, test_2],
		"args" : [None, "World"],
		"results" : ["Hello world", "Hello! World"]
	}
	tests = design_test(**testspecs)
	run_test(tests)
	# assert test_2("World") == "Hello! World"

if __name__ == "__main__":
	main()