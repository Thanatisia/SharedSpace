# Bash - Settings

```
The linux shells - i.e. Bash, Zsh, Xonsh, Fish etc. - all have individual settings and configs that makes them extremely customizable and extensible.

This is a compilation for the usage of Linux bash settings 
```

## Setup
- To Add settings
    - Change behaviours of bash as if it had been invoked with different command line options
        + Use the *set -o* keyword in your .bashrc file
            ```console
            set -o {settings}
            ```
    - Enabled/disabled options for the current shell session
        + Use the *shopt* command in your .bashrc file
            ```console
            shopt {options} [settings]
            ```
        
## Masterlist
> List of Bash settings
+ vi : Enable Vim Mode

## Settings

### Vim Mode
> Bash by default uses Emacs Keybindings, but it has built-in Vim Mode that allows you to use vimbindings as well as the Modal system

- To Enable Vim Mode
	+ Add *set -o vi* to your .bashrc file
		```console
		# ~/
		# Set the keybindings to vi mode
		set -o vi
		```

	+ Source the .bashrc file and refresh the configs
		```console
		source ~/.bashrc
		```

- Modes
	+ Normal Mode (N) - aka Movement Mode
	+ Editing Mode (E) - aka Insert Mode
	+ Searching Mode (S) - aka Visual Mode

- Emacs vs Vim Keybinding 
	- Differences
		- By default : Bash uses Emacs keybindings
			+ Ctrl + A : Go to the beginning
			+ Ctrl + E : Go to the End-of-Line

	- Comparison
		- Move cursor to beginning of line
			+ Emacs : Ctrl + A
			+ Vim : 0
		- Move cursor to end of line
			+ Emacs : Ctrl + E
			+ Vim : $
		- Move cursor back (left) one word
			+ Emacs : Alt + B
			+ Vim : b
		- Move cursor forward (right) one word
			+ Emacs : Alt + F
			+ Vim : w
		- Move cursor back (left) one character
			+ Emacs : Ctrl + B
			+ Vim : h
		- Move cursor forward (right) one character
			+ Emacs : Ctrl + F
			+ Vim : l
		- Move up in Bash command history
			+ Emacs : Ctrl + P
			+ Vim : k
		- Move down in Bash command history
			+ Emacs : Ctrl + R
			+ Vim : j

- Movements
	- 0 : Move cursor to beginning of line
	- ^ : Move to the first non-blank character at the beginning of the line
	- $ : Move cursor to end of line
	- b : Move cursor back (left) one word
	- B : Move cursor back (left) one word using the space-delimiter
	- f[character] : Find the next occurence of the specified character
		+ Press semi-colon (';') to move to the next occurence of the character
	- F[character] : Performs a backward search for the specified character
		+ Press semi-colon (';') to move to the next occurence of the character
	- w : Move cursor forward (right) one word/special character
	- W : Move cursor forward (right) one word using the space-delimiter
	- h : Move cursor back (left) one character
	- l : Move cursor forward (right) one character
	- k : Move up in Bash command history
	- j : Move down in Bash command history
	
- Editing
	- . : Repeat the last command
	- ~ : Toggle the case of the letter under the cursor (lowercase <--> uppercase)
	- A : Enter *Insert Mode* at the end of the line to append text
	- cc : Change the whole line
		+ The whole line is deleted and puts you into *Insert* Mode*
		+ Mnemonics : Clear cursor
	- c(n)w : Change n number of words. This deletes (n) words and puts you into *Insert Mode*
		+ Mnemonics : Change Words
		+ n = Number of words to change, by default is not used (Deletes 1 word and puts you into Insert mode)
	- C : Change text from the cursor to the end of the line
	- dd : Delete the whole line
		+ Mnemonics : Delete Delete
	- d(n)w : Delete current word under the cursor
		+ Mnemonics : Delete Word
		+ n = Number of words to delete, by default is not used (Delete 1/current word)
	- D : Delete the whole line
	- ea : Move cursor the end of the word and Enter *Insert Mode* to append text
	- I : Enter *Insert Mode* with the cursor at the start of the line
	- p : Paste the text you copied
	- P : Paste the text you copied
	- r : replace the single character under the cursor
	- R : Replace the characters under the cursor as you type
		+ effectively like a "Replace Mode"
	- u : Undo last command. You can press this key multiple times to go back in history
	- x : Delete a single character under the cursor
	- xp : Transport letters
		+ Reverse the order of the letter on the right of the character under the cursor
	- X : Delete the previous character before the cursor
	- y : Yank (Copy) word under the cursor
	- y(n)w : Yank (copy) n number of words.
		+ Mnemonics : Yank (Copy) Words
		+ n = Number of words to copy, by default is not used (Copy 1 word)
	- Y : Yank (Copy) from the cursor to the end of the line

- Searching
	- / : Search for commands and typing a part of a command you ran
		+ It will find the last command you ran with the matching string

## References
+ [Dev.to - How to use vim mode on the command line in Bash](https://dev.to/brandonwallace/how-to-use-vim-mode-on-the-command-line-in-bash-fnn)

## Resources
+ [GitHub - Brandon Wallace - VimRC](https://github.com/brandon-wallace/vimrc)

## Remarks
