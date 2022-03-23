# Start Python Virtual Environment (venv)

# [Variables]

# Local Variables
VENV_FLDR_NAME="env"
VENV_PATH="$PWD\$VENV_FLDR_NAME"

:: Python Variables
SET PY_VERS=3.10

:: Program Variables
SET VENV_SCRIPTS_PATH="$VENV_PATH\Scripts"

:: Environment Variables
SET OTHER_PATH="$VENV_PATH:$VENV_SCRIPTS_PATH
SET PATH="$PATH:$OTHER_PATH"

# [Alias]

# PIP
download_pip="curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python get-pip.py && rm $PWD/get-pip.py"

# Start venv
SET activate="$VENV_SCRIPTS_PATH\activate"
SET deactivate="$VENV_SCRIPTS_PATH\deactivate"
SET install="pip install"
SET upgrade="pip install --upgrade pip"
SET freeze="pip freeze"
SET backup_pkgs="pip freeze > requirements.txt"
SET recover_pkgs="pip install -r requirements.txt"

# [Body]

# Processing : Create Virtual Environment - If doesnt exist
if [[ ! -d %VENV_PATH% ]]; then
	# if folder does not exist
	echo -e "[C] => Virtual Environment folder $VENV_FLDR_NAME does not exist, creating..."

	# Check python version
	if [[ "$PY_VERS" == "2.7" ]]; then
		# Python 2.7
		virtualenv $VENV_PATH
	else
		# Python >= 3.7
		python -m venv $VENV_PATH
	fi
fi

motd()
{
	echo "============================================================================================================
	echo "Usage"
	echo "	- Run 'activate' to enter the Virtual Environment"
	echo "	- Run 'deactivate' to exit from the Virtual Environment"

	echo\

	echo "Notes"
	echo "	- Please place your 'requirements.txt' if you have a custom requirements file to install into python PIP "
	echo "============================================================================================================"

	echo\
}

main()
{
	# Display Message Banner
	motd

	# Start Virtual Environment
	`activate` && \
		echo -e "Virtual Environment ran successfully" || \
		echo -e "Error detected while running Virtual Environment"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	# Equivalent to if-main
	main $@
fi