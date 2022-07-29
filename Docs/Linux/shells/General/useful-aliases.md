# Useful aliases to source

```
You can alias commands to a shorter command by using the 'alias' keyword

By aliasing a command, you can effectively remember a longer command just by its shorter "alias", 
	- like a shortcut

Do note that aliases are not functions but just copies the name of the aliased command, they do not return a value.
	- aliased-command == command
```

## Setup

### To add an alias

+ Add the following line in your shellscript / shell .rc file
	```console
	alias [alias]="commands"
	```

## Useful Aliases
### General
+ alias ls="ls -la"
+ alias mem="free -h"
+ alias storage="df -h"

### Python
+ alias gen_venv="python -m venv"


