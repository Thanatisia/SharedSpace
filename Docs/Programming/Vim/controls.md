# Basics : Vim Controls 

## Information
### Basics
+ Delimiter/Seperator: ':'
+ Structure -> keybind : Description : Examples

## Basic Controls
### Normal Mode
#### Movements
+ [n]h : Left; Leave n empty to go left 1 space; enter <n> to go left <n> times : 5h - 5 spaces left etc.
+ [n]j : Down; Leave n empty to move 1 space; enter <n> to move <n> times : 5h -> move 5 spaces etc.
+ [n>k : Up; Leave n empty to move 1 space; enter <n> to move <n> times : 5h -> move 5 spaces etc.
+ [n]l : Right; Leave n empty to move 1 space; enter <n> to move <n> times : 5h -> move 5 spaces etc.
+ [n]G : Leave n empty to Go to bottom of file; enter <n> to down to line <n> : Escape, 50G to down to line 50
+ [n]gg : Leave n empty to Go to top of file; enter <n> to go up to line <n> : Escape, 50gg to go up to line 50
+ <Shift>h : Go to top of screen
+ <Shift>m : Go to middle of screen
+ <Shift>l : Go to bottom of screen
+ <Ctrl>u : Go directly to bottom of page
+ <Ctrl>d : Go directly to top of page

#### Editing
+ gi : Starts Insert mode in the last place where you have inserted text before : Escape, move to other places, 'gi', you are back at the original place

#### Mode
+ i : Start Insert Mode
+ v : Start Visual Mode
+ <Ctrl>Q : Start Visual Block Mode; You can select by cell (Entire Vertical/Horizontal); use this if conflict with other keymappings
+ <Ctrl>V : Start Visual Block Mode; You can select by cell (Entire Vertical/Horizontal);
+ <Shift>v : Start Visual Line Mode; You can select by entire Line

#### Selection
+ <C-Q>G : Start Visual Block Mode and Select entire column

### Visual Mode
#### Mode
+ <Esc> : Exit back to Normal Mode
+ <Shift>v : Start Visual Line Mode and Select by entire Line

## Useful Controls

