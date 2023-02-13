#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


#
# For Personal Dotfiles
#
files_to_Src=(
	"personal/dotfiles/bash/.bashrc-personal" 
	"personal/dotfiles/bash/.custom-scripts"
	"personal/dotfiles/bash/.installers"
    "personal/dotfiles/bash/customs/.custom-aliases"
	"personal/dotfiles/bash/customs/.custom-variables"
    "personal/dotfiles/bash/customs/.edit-aliases"
    "personal/dotfiles/bash/customs/progs/.compilers"
    "personal/dotfiles/bash/customs/progs/.runner"
)
# echo "Files to import: "
for files in "${files_to_Src[@]}"; do
	if [ -f $files ]; then
		# echo "	File: $files"
		. $files
	fi
done


source "$HOME/.cargo/env"
