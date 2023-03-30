# Linux package manual/documentation: fzf

## Documentation
### Introduction
+ Generally, fzf will open all files in the current working directory in an interactive terminal finder if no arguments nor results are parsed in
- However, fzf has a secondary effect where it works by taking the command output from the result of the previous command and piped into fzf
	+ This is because fzf will read the list from STDIN

### Synopsis/Syntax
- Default
	```console
	fzf {options} <arguments>
	```

- Using piped command-output
	+ This will take the standard output of the command executed and pipe it into fzf standard input
	```console
	[command-output(s)] | fzf {options} <arguments>
	```

### Parameters
- Positionals
- Optionals
	- With Arguments
		- --height [height] : Set the height of the fzf startup interactive finder to not start in fullscreen mode
			- Notes
				+ You can use percentages as your height to get approximate positioning/sizes
			- Syntax
				- Percentages
					```console
					fzf --height n%
					```
		- --prompt="NAME" : Specify a name to give the prompt
			- Syntax
				```console
				fzf --prompt="prompt-name"
				```
		- --query "keyword" : Specify and fill a query string to automatically search for the specified keyword on open
			- Syntax
				```console
				fzf --query "string"
				```
	- Flags
		+ -e | --exact : Starts fzf with search for exact results; If you dont prefer fuzzy matching and do not wish to "quote" every word
		+ --reverse : Reverse the specified layout

### Usage
- By itself
	- (Default) Startup fzf interactive menu with no arguments
		+ Will look for all files in the $HOME directory recursively
		+ Will print the selected item as standard output
		```console
		fzf
		```

- Search without manual input
	- using find command
		```console
		find * -type f | fzf
		```
	- print line number instead of contents of the chosen line
		+ Parse the standard output of the previous command into `nl` to display result with line numbers
		+ Afterwhich, parse the new results into fzf to display in reverse (so that the lines are displaying downwards)
		+ Get the first parameter in the selected line which is the line number
		```console
		[command] | nl | fzf --reverse | awk '{print $1}'
		```

- Taking in standard input pipe
	- Simple example
		- printf
			```console
			printf '%s\n' "options1" "options2" ... | fzf
			```
	- Using xargs
		- printf and creating a new file using touch
			+ execute touch using xargs to parse in the selected filename selected from fzf
			```console
			printf '%s\n' "options1" "options2" ... | fzf | xargs touch
			```
		- printf and removing a selected file using rm
			```console
			printf '%s\n' "options1" "options2" ... | fzf | xargs rm
			```
		- printf and removing a selected folder using rm -r
			```console
			printf '%s\n' "options1" "options2" ... | fzf | xargs rm -r
			```

- Using it as a file picker
	- Open with vim
		```console
		vim $(fzf)
		```
	- Open with emacs
		```console
		emacs $(fzf)
		```

- Using as a system/process monitor
	- Use 'ps aux' as a system monitor to search for a process and get the selected process
		```console
		ps aux | fzf
		```
	- Use 'ps aux' to select a process to kill
		+ Filter out and get the process ID of the selected process
		+ and parse it into 'xargs kill' to kill the selected process
		```console
		ps aux | fzf | awk '{print $2}' | xargs kill
		```

- Useful dmenu/rofi use-cases
	- Copy to clipboard
		+ also usable in dmenu and rofi
		+ Copy the selection to the clipboard
		```console
		printf '%s\n' "options1" "options2" ... | fzf | xclip -r -selection clipboard
		```
	- Wallpaper picker
		+ prefixing command with 'ls' makes ls run without any aliases, just the command itself
		+ `ls -d` will tell ls to not do any recursive searching, just the current directory
		+ list everything in this current working directory
		- example wallpaper setters
			+ xwallpaper : `xwallpaper --stretch`
		```console
		command ls -d $PWD/* | fzf [target-extension] | xargs [your-wallpaper-setter]
		```
	- Read file and select a line
		+ --reverse will display the result in descending order (top to bottom) instead of the default (bottom to top)
		+ by default, parsing the cat result to fzf will display the lines from bottom upward
		```console
		cat [file-name] | fzf --reverse
		```
	- print line number instead of contents of the chosen line
		+ Parse the contents of the file into `nl` to display result with line numbers
		+ Afterwhich, parse the new results into fzf to display in reverse (so that the lines are displaying downwards)
		+ Get the first parameter in the selected line which is the line number
		```console
		cat [file-name] | nl | fzf --reverse | awk '{print $1}'
		```

- dmenu and rofi equivalent usage
	- Setting prompt name
		- fzf
			```console
			fzf --prompt="prompt-name"
			```
		- dmenu
			```console
			dmenu -p "prompt-name"
			```

## Wiki
### Environment Variabkles
+ FZF_DEFAULT_COMMAND : Default command to use when input is tty
+ FZF_DEFAULT_OPTS    : Default options

### Options
- For a full list of options
	+ See the man page
		```console
		man fzf
		```

### Search Syntax
```
These are regex patterns used by fzf to search for

Syntax:
[token] : [match-type] : [description]
```
+ string    : fuzzy-match                : Returns items that matches with the provided string
+ 'string   : exact-match (quoted)       : Returns items that includes the provided string
+ ^string   : prefix-exact-match         : Returns items that start with the provided string
+ .string$  : suffix-exact-match         : Returns items that ends with the provided string
+ !string   : inverse-exact-match        : returns items that **do not** include the provided string; similar to 'NOT' in programming
+ !^string  : inverse-prefix-exact-match : Returns items that **do not** start with the provided string
+ !.string$ : inverse-suffix-exact-match : Returns items that **do not** end with the provided string

## Resources
+ [fzf releases](https://github.com/junegunn/fzf/releases)
+ [fzf VIM extra installation options](https://github.com/junegunn/fzf/blob/master/README-VIM.md)
+ [fzf wiki - Examples](https://github.com/junegunn/fzf/wiki/examples)
+ [fzf wiki - Advanced Examples](https://github.com/junegunn/fzf/blob/master/ADVANCED.md)
+ [YouTube - DistroTube - The Amazing Interactive Command Line Fuzzy Finder (fzf)](https://youtube.com/watch?v=Ab6cWN9ZrXo)

## References
+ [Building FZF](https://github.com/junegunn/fzf/blob/master/BUILD.md)
+ [GitHub - junegunn/fzf - Print line number instead of contents of chosen line](https://github.com/junegunn/fzf/issues/1014)

## Remarks

