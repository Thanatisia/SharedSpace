:"
Unit Test Implementation and Library for Shellscript

- Aims to make unit testing during software development and testing easier with a unit tester

:: Program Information
	Name: unittest.sh
	File Type: Shellscript

:: Setup Steps
	1. (OPTIONAL) Change permission to use
		chmod +x unittest.sh
	2. (OPTIONAL) Add Library Folder location into your PATH
		PATH+=/path/to/library
	3. Import Library in your script/terminal
		. unittest.sh
	4. Use Functions in Library
		Assert Equals : assertEquals [message] [expected] [actual]
"

: "
Unit Testing Functions
"
assertEquals()
{
	: "
		Assert Implementation
	"
	msg=$1; shift
	expected=$1; shift
	actual=$1; shift

	if [[ "$expected" != "$actual" ]]; then
		echo "$msg EXPECTED=$expected ACTUAL=$actual"
		exit 2
	fi
}

test()
{
	: "
		Unit Testing for Shellscript
	"
	assertEquals ""
}

main()
{
	: "
		Main entry
	"
	test
}

if [[ "${BASH_SOURCE[@]}" == "" ]]; then
	main
fi
