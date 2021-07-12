#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias startx="startx ~/.xinitrc"
alias dir="dir --all"
alias xtop="pkill xinit"
