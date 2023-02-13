#
# Lemonbar statusbar Runner file
# Author: ME
# Created: 2021-04-15 12:54H
# Modified: 
#   2021-04-15 12:54H
#   2021-04-18 09:04H
# Features: 
# Background Information: 
# Changelog:
#

# Import Libraries
. widgets.sh

#echo -e -n " \uf017 "
#Clock
#echo -e -n " \uf073 "
#Cal
#echo -e -n " \uf073 "
#ActiveWindow
#echo -e -n " \uf073 "
#Battery
#echo -e -n " \uf073 "
#Wifi "enp0s3"
#echo -e -n " \uf073 "
#Sound
#echo -e -n " \uf073 "

while true; do
    # echo -e "%{c}$(ActiveWindow)" "%{r}$(Battery)      $(Clock)    $(Cal)"
    echo -e "%{c}$(ActiveWindow)" "%{r}$(Battery)       $(Sound)    $(Clock)    $(Cal)"
    sleep 0.1s
done

#echo ""

#line=""
#read -p "Pause" line


