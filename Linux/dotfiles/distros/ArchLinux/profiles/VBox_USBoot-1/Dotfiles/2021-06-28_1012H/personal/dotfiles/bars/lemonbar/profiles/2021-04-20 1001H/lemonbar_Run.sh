#
# Lemonbar statusbar Runner file
# Author: ME
# Created: 2021-04-15 12:54H
# Modified: 
#   2021-04-15 12:54H
#   2021-04-18 09:04H
#   2021-04-20 09:11H
# Features: 
# Background Information: 
# Changelog:
#   2021-04-20 0911H : Seperated echo to Update function
#

# Import Libraries
. widgets.sh
. bspwm-widgets.sh

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

Update()
{
    pos_Left="%{l}$(Workspaces)"
    pos_Center="%{c}$(ActiveWindow)"
    pos_Right="%{r}$(Battery)   $(Sound)    $(Clock)    $(Cal)"
    # echo -e "%{c}$(ActiveWindow)" "%{r}$(Battery)      $(Clock)    $(Cal)"
    # echo -e "%{c}$(ActiveWindow)" "%{r}$(Battery)       $(Sound)    $(Clock)    $(Cal)"
    # echo -e "%{l}$(Workspaces)" "%{c}$(ActiveWindow)" "%{r}$(Battery)   $(Sound)    $(Clock)    $(Cal)"
    echo -e $pos_Left $pos_Center $pos_Right
}

while true; do
    Update
    sleep 0.1s
done

#echo ""

#line=""
#read -p "Pause" line


