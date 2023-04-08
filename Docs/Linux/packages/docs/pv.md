# Documentation - package : pv

## Information
### Description
```
pv - also known as 'Pipe Viewer' - is a Terminal-based/Command Line Utility that is basically a standalone Progress Bar/Progress View implementation
for users to pipe command standard output into to get a progress bar.

pv monitors data sent through the pipe, afterwhich, gives the user a visual display of the following details
	1. Time Elapsed
	2. Completed Progress (Percentage Bar)
	3. Current Data Transfer Speed (also referred to as throughput rate)
	4. Data Transferred
	5. ETA (Estimated/Remaining time)
```

## Setup
### Pre-Requisites

### Dependencies

### Installation
- install 'pv'
	- Using Package Manager
		- apt-based
			```console
			sudo apt install pv
			```
		- pacman-based
			```console
			sudo pacman -S pv
			```

## Documentation
### Synopsis/Syntax
- Standalone
	```console
	pv {options} [filename]
	```

- Redirection
	- To a file
		```console
		pv {options} [filename] > output-file-name
		```

- With pipe
	- Output-Process-Input
		```console
		[command-standard-output] | pv {options} | [command-to-execute]
		```

- Pipe and redirection
	- To command
		```console
		pv {options} [filename] | command > output-file-name
		```

### Parameters
- Positional
	+ `NIL`
- Optional
	- With Arguments
		- Output Modifiers
			+ -i [seconds] | -interval [seconds] : Specifies the time interval between updates
			+ -n [name]    | -name [name]        : Prefixes the output information with the specified name
			+ -s [size]    | -size [size]        : Assume that the total data to be transferred is the specified size-bytes for calculating the ETA percentage
		- Data Transfer Modifier
			+ -B [bytes]   | -buffer-size [bytes] : Uses transfer buffer size of the specified bytes-byte
			+ -L [rate]    | -rate-limit [rate]   : Limits the transfer rate to a maximum of the specified rate-byte per second.
			+ -R [PID]     | -remote [PID]        : If a Process ID (PID) is an instance of pv, that process's pv instance will be used instead.
	- Flags
		- General Options
			+ -h | -help    : Displays this usage information
			+ -v | -version : Displays the version information
		- Display Modifiers
			+ -b | -bytes    : (Default); Displays the total amount of data transferred till now
			+ -e | -eta      : (Default); Displays the estimated time of completion for the operation; Guesses the time based on the previous data transfer rate and the size of data to be transferred.
			+ -n | -numeric  : Displays integer percentage instead of the visual representation
			+ -p | -progress : (Default); Displays the progress bar
			+ -q | -quiet    : Turn off output display
			+ -r | -rate     : (Default); Turns on the transfer rate counter for the operation
			+ -t | -timer    : (Default); Displays the elapsed time
		- Output Modifiers
			+ -c | -cursor    : Uses cursor positioning escape sequence instead of carriage returns (CR/newline)
			+ -F | -force     : Forces an operation/the transfer; i.e. forces pv to display visuals even when standard err (stderr) is not a terminal
			+ -L | -line-mode : Count lines; Instead of counting size, progess bar will move if a new line is found.
			+ -W | -wait      : Wait for transfer of first byte before displaying progress

### Usage
- Standalone
	- Create a progress bar with the `copy` command
		```console
		pv [filename] > /path/to/output/[output-file-name]
		```
	- Compress and making a zip file with a progress bar
		```console
		pv [filename] | zip > /path/to/output/[output-file-name]
		```
	- Counting number of lines, words and bytes
		- Word count
			```console
			pv -p [filename] | wc
			```
		- Line count
			```console
			pv -p [filename] | wc -l
			```

- Pipe
	- Structure
		- Standard
			```console
			[command] | pv
			```
		- Show only display bar
			```console
			[command] | pv -p
			```
		- Show only Elapsed time
			```console
			[command] | pv --timer
			```
		- Show only ETA
			```console
			[command] | pv --eta
			```
		- Show only Rate
			```console
			[command] | pv --rate
			```
		- Show only transferred data size
			```console
			[command] | pv --bytes
			```
		- Refresh specified interval
			```console
			[command] | pv -i 2
			```
	- Monitor tar progress
		- Compressing
			```console
			tar -cvzf - [archive-files...] | (pv -p --timer --rate --bytes > [output-tar-file.tar.gz])
			```
		- Extracting
			```console
			tar -xvzf [target-file-name] | pv -p --timer --rate --bytes
			```
	- Copying files
		```console
		cp [source-file] [destination-filepath] | pv {options}
		```


### Snippets and Examples

## Wiki

## Resources

## References
+ [GeeksForGeeks - pv command in linux with examples](https://www.geeksforgeeks.org/pv-command-in-linux-with-examples/)
+ [SuperUser - Is there a way to see any tar progress per file?](https://superuser.com/questions/168749/is-there-a-way-to-see-any-tar-progress-per-file)
+ [poftut - Linux pv command tutorial and examples](https://www.poftut.com/linux-pv-command-tutorial-examples-monitor-progress-copybackupcompress/)

## Remarks

