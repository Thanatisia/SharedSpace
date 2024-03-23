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
    - Format:
        ```
        extra-keys = [
            [ row-1, keys ], \
            [ row-2, keys ], \
            [ ... ], \
            [ row-N, keys ] \
        ]
        ```
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
        + Custom : You can put whatever you want, what you type will be printed if pressed
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

## Resources

## References
+ [Termux Wiki - Terminal Settings](https://wiki.termux.com/wiki/Terminal_Settings)

## Remarks

