#
# <Your project name here>
# Author: <Your Name>
# Created by: yyyy-mm-dd HHMMH, <Author>
# Modified by: 
#	yyyy-mm-dd HHMMH, <Author> [1]
#	yyyy-mm-dd HHMMH, <Author> [n]
# Background Info:
#	- A basic summary of the program here
# Features:
#	- <Feature 1>
#	- <Feature n>
#

func_name()
{
	# [Input]

	# - Command Line Arguments
	argv=("$@")
	argc=${#argv[@]}

	# [Processing]

	# [Output]
}

main()
{
	# Main Body Here
}

if "${BASH_SOURCE[0]}" == "${0}" ]]; then
	# Equivalent to 'if_main'
	main $@
fi