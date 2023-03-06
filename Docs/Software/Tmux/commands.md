# Tmux List of commands and their keybinding equivalents

## General/Miscellenous
### Settings
- set | set-option : Set tmux settings
    - Synopsis/Syntax
        ```console
        tmux {set|set-option} {options} [setting] <arguments>
        ```
    - Parameters
        - Positionals
            + setting : Your settings
        - Options
            + -g : Set the settings globally
    - Usage
        - Enable status bar
            ```console
            tmux set -g pane-border-status {top|bottom}
            ```
        - Disable status bar
            ```console
            tmux set -g pane-border-status
            ```

### Lists
- list : List all list types
    ```console
    tmux list
    ```
- list-commands : List all commands
    - Synopsis/Syntax
        ```console
        tmux list-commands {options} <arguments> [command]
        ```
    - Positionals
        + command : Specify command to search in the list
    - Options
        - With Arguments
            + -F [format] : Specify format to use when listing; Refer to ``man tmux`` in the  '# FORMAT' section

### Keybindings
- list-keys : List all keybindings
    - Synopsis/Syntax
        ```console
        tmux list-keys {options} <arguments> [key]
        ```
    - Parameters
        - Positionals
            + key : Specify key to search for in the list of keybindings
        - Options
            - -a : List all keybindings
    - Usage

## Sessions
### Lists
- list-sessions : List all sessions
    - Synopsis/Syntax
        ```console
        tmux list-sessions {options} <arguments>
        ```
    - Parameters
        + -F [format] : Specify format to use when listing; Refer to ``man tmux`` in the  '# FORMAT' section
    - Usage

### Movements

## Windows
### Lists
- list-windows : List all windows
    - Synopsis/Syntax
        ```console
        tmux list-windows {options} <arguments>
        ```
    - Parameters
        - With Arguments
            + -F [format] : Specify format to use when listing; Refer to ``man tmux`` in the  '# FORMAT' section
        - Flags
            - -a : List all window panes in all sessions
            - -t [target-session] : Specify a target session to list all windows
    - Usage
### Movements

## Panes
### Lists
- list-panes : List all window panes
    - Synopsis/Syntax
        ```console
        tmux list-pane {options} <arguments>
        ```
    - Options
        - With Arguments
            - -F [format] : Specify format to use when listing; Refer to ``man tmux`` in the  '# FORMAT' section
            - -t [target-window] : Specify a target window to list all session panes
        - Flags
            - -a : List all window panes in all sessions
            - -s : Specify that target is a session; List all window panes in current session
### Splits
- split-window : Split panes horizontally (downwards) or vertically (sideways)
    - Synopsis/Syntax 
        ```console
        tmux split-window {options} <arguments>
        ```
    - Options
        - With Arguments
            + -c [start-directory] : Open the new split pane in the specified working directory
            + -l [number-of-lines] : Specify number of lines the new pane will occupy on splitting
            + -t [target-pane]     : Specify which pane to split with; Specify pane number
        - Flags
            - Important
                + -d : Split window panes as a background process; Do not automatically switch to it after splitting; Start window pane as a daemon
                + -h : Split window panes with horizontal layout; Corresponds/Equivalent to keybinding 'Ctrl+b "'
                + -v : Split window panes with vertical layout; Corresponds/Equivalent to keybinding 'Ctrl+b %'
    - Usage
        - If you have more than 1 panes
            - Split pane number 0
                ```console
                tmux split-window -t 0
                ```
            - Split pane number 1
                ```console
                tmux split-window -t 1
                ```
### Movements
- select-pane : Select a window pane in the window via the pane number
    - Synopsis/Syntax 
        ```console
        tmux select-pane {options} <arguments>
        ```
    - Options
        - With Arguments
            + -t [target-pane]     : Specify which pane to jump to; Specify pane number; You can add a '+' or '-' prefix behind the number to move to the next pane or the previous pane respectively.
        - Flags
            - Important
                + -L : Move to the Left pane; Equivalent to vim-bind 'h'
                + -D : Move to the Down pane; Equivalent to vim-bind 'j'
                + -U : Move to the Up pane; Equivalent to vim-bind 'k'
                + -R : Move to the Right pane; Equivalent to vim-bind 'l'
    - Usage
        - If you have more than 1 panes
            - Split pane number 0
                ```console
                tmux split-window -t 0
                ```
            - Split pane number 1
                ```console
                tmux split-window -t 1
                ```

