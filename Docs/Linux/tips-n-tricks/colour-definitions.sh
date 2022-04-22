: "
List of color definitions for shell formatting

Usage:
	# Source library/script
	. colour-definitions.sh

	# Use in echo
	echo -e \"${color-of-choice}\"

	# Echo:
	echo -e "${RED} red ${GREEN} blue"

Notes:
	x1b == \033
"

NONE='\033[00m'
RED='\033[01;31m'
BLUE='\033[01;34m'
GREEN='\033[01;32m'
YELLOW='\033[01;33m'
PURPLE='\033[01;35m'
CYAN='\033[01;36m'
WHITE='\033[01;37m'
BOLD='\033[1m'
UNDERLINE='\033[4m'