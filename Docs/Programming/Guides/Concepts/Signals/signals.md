# Signals

```
The following are a list of Signal codes that are parsed into the Operating System when
certain keyboard actions or events are performed.

These events can range from user requests which may be useful, to errors such as illegal memory accessing
```

## List of Signals
```
Note: There are alot of signal traps, these are some of the more widely used traps
```
- SIGHUP	: Process 'Hang'-up or death signal
	+ When a process stop/hang up is detected on controlling terminal or death of controlling process
	+ Signal Number/Code : 1
- SIGINT	: Interrupt Signal
	+ Issued if the user sends an interrupt signal 
	+ Keybind : Ctrl + C
	+ Signal Number/Code : 2
- SIGQUIT 	: Quit Signal
	+ Issued if the user sends a Quit signal
	+ Keybind : Ctrl + D
	+ Signal Number/Code : 3
- SIGFPE	: Floating-point Exception/error
	+ Issued if an illegal mathematical operation is attempted
	+ Signal Number/Code : 8
- SIGKILL	: Kill Process 
	+ Signal to kill the process and quit immediately
	+ Will not perform any clean-up operations
	+ Signal Number/Code : 9
- SIGALRM	: Alarm Clock Signal
	+ Used for timers
	+ Signal Number/Code : 14
- SIGTERM	: Software Termination Signal
	+ Default : Sent by kill 
	+ Signal Number/Code : 15
- USR1		: User-defined Signal 1
	+ alias of SIGUSR1
	+ Define your own signal

## References
+ [Tutorialspoint - UNIX Signals Traps](https://www.tutorialspoint.com/unix/unix-signals-traps.htm)

## Resources

## Remarks