# Tmux settings and formatting

## Basics
- Formats
    + Formats are defined by the syntax ``#<your-format-here>``

## Settings
+ pane-border-status {top|bottom} : Set the pane border statusbar position; Leave out the position to enable/disable the status bar

## Formats
> Used in various tmux commands that supports the '-F' format CLI argument
+ #{pane_index} : Get the pane current position; index number
+ #{pane_current_command} : 
