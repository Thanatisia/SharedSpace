Termux Customization and Configuration
======================================

*Information*
-------------
- Termux Filesystem Structure
    - $HOME/
        - .termux : this is the termux emulator application configuration directory
            + termux.properties : This is the main configuration file; This is where the keybinding/keymappings, settings are all set


*Edit/Configure Termux Configuration File*
------------------------------------------

> Configuration File Setting Key and Values

- `extra-keys = [ keys... ]` : Set the keymapping/keybinding of the Terminal emulator (the quick-touch buttons above the keyboard)
    - Notes
        - Every list in the master list represents 1 row
            + Each row list has to be separated by a comma
            + If a row is in a new row, you need to separate with a '\' delimiter
    + Default Keys: `[ [ESC, TAB, CTRL, ALT, {key: '-', popup: '|'}, DOWN, UP] ]`
    - Supported Key characters
        + ESC : Escape
        + TAB : Tab
        + CTRL : Control
        + ALT : Alternate
        + ENTER : Press the Enter/Return/Carriage Return key
        + SPACE : Add a space
        + Custom : You can put whatever you want, what you type will be printed if pressed
    - Formats:
        - Standard Keymappings
            ```
            extra-keys = [ \
                [ row-1, keys ], \
                [ row-2, keys ], \
                [ ... ], \
                [ row-N, keys ] \
            ]
            ```
        - Macros
            - Dictionary (Key-Value Mapping) keywords
                - macro   : Specify the special key combinations (aka 'macros') to execute when the attached button is pressed; Note: You can use special keywords such as ENTER, SPACE or BACKSPACE or TAB to perform special operations according to the keyword used
                    + Type: String
                - display : Specify the text to display on the button
                    + Type: String
                - popup   : Special Buttons which will perform an additional "popup" when pressed with other options
                    + Type: Dictionary (Key-Value) mappings
                    - Popup Options and Values
                        - macro   : Specify the special key combinations (aka 'macros') to execute when the attached button is pressed; Note: You can use special keywords such as ENTER, SPACE or BACKSPACE or TAB to perform special operations according to the keyword used
                            + Type: String
                        - display : Specify the text to display on the button
                            + Type: String
            ```
            extra-keys = [ \
                { \
                    macro: "keys|commands|special-keywords", display: "button-text", \
                    popup: {macro: "keys|commands|special-keywords", display: "button-text"} \
                }, \
            ]
            ```
    - Recommended Examples
        - Base
            ```
            extra-keys = [
                ['ESC', '/', '-', 'HOME', 'UP', 'END', 'PGUP'], \
                ['TAB', 'CTRL', 'ALT', 'LEFT', 'DOWN', 'RIGHT', 'PGDN'] \
            ]
            ```
        - Vim Key 3rd Row
            ```
            extra-keys = [
                ['ESC', '/', '-', 'HOME', 'UP', 'END', 'PGUP'], \
                ['TAB', 'CTRL', 'ALT', 'LEFT', 'DOWN', 'RIGHT', 'PGDN'], \
                [':wq'] \
            ]
            ```
        - Macros
            - Keyboard Structure
                + Row 1: ['ESC','/','-','HOME','UP','END','PGUP']
                + Row 2: ['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']
                + Row 3: ['ENTER', 'KEYBOARD', 'termux-reload-settings', 'termux cfg edit']
                + ROW 4: ['tmux scroll', 'tmux new', 'tmux prev', 'tmux next', 'tmux kill', 'tmux attach', 'tmux detach']
                + ROW 5: [':w', ':q!', 'wq', '<C-d>', '<C-r>', '<C-u>']
            ```
            extra-keys = [ \
                ['ESC','/','-','HOME','UP','END','PGUP'], \
                ['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN'], \
                [ \
                    ENTER,KEYBOARD, \
                    {macro: "termux-reload-settings ENTER", display: termux-reload-settings}, \
                    {macro: "vim SPACE $HOME/.termux/termux.properties ENTER", display: "termux cfg edit"} \
                ], \
                [ \
                    {macro: "CTRL b [", display: "tmux scroll"}, \
                    {macro: "CTRL b c", display: "tmux new"}, \
                    {macro: "CTRL b p", display: "tmux prev"}, \
                    {macro: "CTRL b n", display: "tmux next"}, \
                    {macro: "CTRL b x", display: "tmux kill"}, \
                    {macro: "tmux SPACE attach ENTER", display: "tmux attach"}, \
                    {macro: "CTRL b d", display: "tmux detach"} \
                ], \
                [ \
                    {macro: ":w ENTER", display: ":w", popup: {macro: ":w ENTER", display: ":w"}}, \
                    {macro: ":q! ENTER", display: ":q!", popup: {macro: ":q! ENTER", display: ":q!"}}, \
                    {macro: ":wq ENTER", display: ":wq", popup: {macro: ":wq ENTER", display: ":wq"}}, \
                    {macro: "CTRL d", display: "<C-d>"}, \
                    {macro: "CTRL r", display: "<C-r>"}, \
                    {macro: "CTRL u", display: "<C-u>"} \
                ] \
            ]
            ```

## Resources

## References
+ [Termux Wiki - Terminal Settings](https://wiki.termux.com/wiki/Terminal_Settings)

## Remarks

